/**
 * Z PL/SQL Analyzer
 * Copyright (C) 2015-2023 Felipe Zorzo
 * mailto:felipe AT felipezorzo DOT com DOT br
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
package org.sonar.plugins.plsqlopen.api.declarations

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.sonar.plugins.plsqlopen.api.PlSqlGrammar
import org.sonar.plugins.plsqlopen.api.RuleTest
import com.felipebz.flr.tests.Assertions.assertThat

class VarrayDeclarationTest : RuleTest() {

    @BeforeEach
    fun init() {
        setRootRule(PlSqlGrammar.VARRAY_DECLARATION)
    }

    @Test
    fun matchesSimpleVarray() {
        assertThat(p).matches("type foo is varray(5) of number(2);")
    }

    @Test
    fun matchesSimpleVarrayNotNull() {
        assertThat(p).matches("type foo is varray(5) of number(2) not null;")
    }

    @Test
    fun matchesVaryingArray() {
        assertThat(p).matches("type foo is varying array(5) of number(2);")
    }

    @Test
    fun matchesArray() {
        assertThat(p).matches("type foo is array(5) of number(2);")
    }

}
