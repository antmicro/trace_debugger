/*
 * Copyright (C) 2018 ETH Zurich and University of Bologna
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: Robert Balas (balasr@student.ethz.ch)
 * Description: Driver for the trace debugger unit
 */


#include "rt/rt_api.h"

void rt_trace_debugger_conf_init(rt_trace_debugger_conf_t *conf);
rt_trace_debugger_t* rt_trace_debugger_open();
void rt_trace_debugger_control(rt_trace_debugger_t *handle);
void rt_trace_debugger_close(rt_trace_debugger_t *handle, rt_event_t *event);
