Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CEAF9D0FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 01:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC6MRlGr/iQd9DeaYh75gYYz5nIjpQooEb9yVh4amqE=; b=lNiKPIbcUczBSVK3YHiUbC71TG
	8ruJW84UZLqjLk9x4qGPcn+Uk4AIzat+JniEdcXquOSNlSAWSKe/hNZwNVfMAliC21dgWcmaCS3qQ
	eN/zWXEwzdaExgLB5qfRBVk9ksqMHYcgnAGj/pFsu/QJ1jz8FcANYs6n37KqAu0n7yhjGxxLS3U70
	zobC51lzZFyrHW8XJ1+LH7zyZVEs9Sb+ttwiDOe6H3TeJlOUmc8RPWLw1xyjExhExc31yr7TMz2g8
	Md3lUM6F0ZvdvFpPXn6WqfZe8gOYSck8ANhZJS6BJAsjDfWtKsuCZiGdQwRKAwEcWB/GHOPY7WzfK
	Mvcl2W2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCozF-00000000QQl-3QEQ;
	Wed, 15 Apr 2026 01:24:13 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoz8-00000000QQ4-32vk;
	Wed, 15 Apr 2026 01:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776216233;
	bh=UC6MRlGr/iQd9DeaYh75gYYz5nIjpQooEb9yVh4amqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=REEbR3R+9BJCmYsHWC3LH/skb6AVTQQbz6zkRnFgOlkPDv0k4GGe5eJDzwkYfsD/C
	 gwrSwzUOiSrkXXmUJrDfqsK1unSZy86Qoue6L9ICfLq74Ukmhdu1P3t0CIgzTo8u5C
	 ROPQaugu+LJqkFkddMtLLhLSMxj1QY8UPEhh3t8o=
X-QQ-mid: esmtpgz12t1776216224tebe181bf
X-QQ-Originating-IP: 6C6ahSt8X9yOOK/gIMdQF3jc5PAFuyYqywvOYdmDxxE=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Apr 2026 09:23:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13236676882505536063
EX-QQ-RecipientCnt: 30
Message-ID: <278F53C66B586050+16211dc6-e2b5-4e44-a75a-98705af34c9b@linux.spacemit.com>
Date: Wed, 15 Apr 2026 09:23:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Add Linux RISC-V trace support via CoreSight
To: Bo Gan <ganboing@gmail.com>, Anup Patel <anup@brainfault.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 palmer@dabbelt.com, pjw@kernel.org, gregkh@linuxfoundation.org,
 alexander.shishkin@linux.intel.com, irogers@google.com,
 coresight@lists.linaro.org, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com, jolsa@kernel.org,
 adrian.hunter@intel.com, mchitale@gmail.com, atish.patra@linux.dev,
 andrew.jones@oss.qualcomm.com, sunilvl@oss.qualcomm.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 anup.patel@oss.qualcomm.com, mayuresh.chitale@oss.qualcomm.com,
 zhuangqiubin@linux.spacemit.com, suzuki.poulose@arm.com,
 mike.leach@linaro.org, james.clark@linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
 <CAAhSdy2Sx98qcCMBVF+_BV1G-syrO74Y_S298hMwkW+vgLtb5Q@mail.gmail.com>
 <7EFD9F2504326BD1+26395797-fbe8-491b-b651-701286fb5751@linux.spacemit.com>
 <1ced8f98-6ac5-4ffc-ac29-cef25937a920@gmail.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <1ced8f98-6ac5-4ffc-ac29-cef25937a920@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mv+tyGIfil93v8P+jzS2+d3WeNyDujhpr4Dt1vuiZvt5coZP7EsePRWA
	ZKVy2bShXF61GblYTPhI1P87RY8LbQFmQ8Jw62Ady/rTvgxCzTpT8FDaQibSyCtLALtXD48
	VBBQYfTPMysQSy9/VzeganFZB4cuphrrklDSrE78JXCqDJmCvxhVK1dVBKC/Jbf9gicNjKx
	Avc244OCMdybX4CdESTtCesOqhKcOKnAgPqF2TNd+MbFF7EChM0+Aezk0lv9FonAwVtpAax
	s+CNoJRsVnWxsV4y8MV6vxyHs/HWCFQ1R1rm2AmJgfUMOb2NSpq+07VQYHAvl6RswR+HaV9
	bW7jEZHrtJNCYeK5l/QACx/XhDiDuekPZ+nh+aIs9ePTFMa6aPNnvw6vhlNCy4TriQBGNH7
	uJ0Gr/OogXV/hhvqGs9VViEKEFSXYnhl03L+xcKvJxzBeI1qFf7qKD3yGxW+Scg0EP0CKRN
	HVmvq9UsGQAzM46hdS7W5vshfvCZa3i9saxD/GuNrQXapWJW20cTaeQyotmYw/TsNZBTlO5
	NwEFmgJLf0x8D3D9ybTMASLoq40GxyzUpmsTn169vuNe4bK7CY9q3jnTRCa/0HjtmgStP8C
	fGS5kOk1/qPue8b2yvJ8JGwv2IuBWb2kt+F+ZccRcbu+HITYniq5mcbFJfC/nWPloWpdu6C
	1pp386Sf9IHEQEExJqp8HOMQJc5hA6rT3qCrBzMzCKQa4ecc6Elx0Z25QjI9Zmw3PrdsBnm
	EV1H8ZmFeTGaNNUINNz191yFYyAxlciAnIhAN9aogfdmKLWyAUy78XolToa3lfptO+N+Njb
	pbkjKC1DZrFnVKhBiY8/7Iv0Ys9Yv8IiO7UKlF7otnLffp4pM81mT/8TvNBKB1vcY8RqwDD
	DY0ybt1a711GH4TkcQJdDW8Aybn24ZwhnF6dt817Ky0XNe/oGMIxbjOqQgwceKfCDegHf0/
	vC3sTZOCB7N5nn2/IhaT1NojKab1Py+MKaoGh2F2YkTfjvrv8UqZcjWlW0rvdNRAUW1k19o
	qHpPw1lNu30rvtdlBi4AmEQD5H0VqHzaDhnHrfcYBGdHkO9LMk
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_182407_716825_F0FAEC29 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Bo,

On 4/15/2026 8:10 AM, Bo Gan wrote:
> Hi Zane, Anup,
>
> On 4/14/26 02:04, Zane Leung wrote:
>>
>> On 4/14/2026 3:23 PM, Anup Patel wrote:
>>> On Tue, Apr 14, 2026 at 9:12 AM Zane Leung <liangzhen@linux.spacemit.com> wrote:
>>>> From: liangzhen <zhen.liang@spacemit.com>
>>>>
>>>> This series adds Linux RISC-V trace support via CoreSight, implementing RISC-V
>>>> trace drivers within the CoreSight framework and integrating them with perf tools.
>>>> The K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and CoreSight TMC
>>>> components, which can be directly leveraged through the existing CoreSight infrastructure.
>>>>
>>>> Linux RISC-V trace support form Anup Patel:
>>>> (https://patchwork.kernel.org/project/linux-riscv/cover/20260225062448.4027948-1-anup.patel@oss.qualcomm.com/)
>>>> which currently lacks ATB component support and guidance on reusing CoreSight components.
>>> What stops you from adding RISC-V trace funnel and ATB bridge drivers
>>> on top of this series ?
>>>
>> Firstly, my works started much earlier than this series. Secondly, it is difficult to add the coresight funnel and coresight tmc components to this series. Based on the coresight framework, I can directly reuse them.
>>
>>>
>>>> The series includes:
>>>> - RISC-V trace driver implementation within the CoreSight framework
>>> The RISC-V trace very different from the CoreSight framework in many ways:
>>> 1) Types of components supported
>>> 2) Trace packet formats
>>> 3) The way MMIO based components are discoverd
>>> 4) ... and more ...
>> 1) I believe that RISC-V tracing is coresight-alike, where have encoders/funnel/sink/bridge that are described through DT and controlled by MMIO.
>> 2) I think the difference in package format is nothing more than the coresight frame generated by the ATB component to distinguish the trace source. After removing it, it becomes riscv trace data.
>> 3) The current CoreSight framework code does not introduce this mechanism, it is described through DT.
>>>> - RISC-V Trace Encoder, Funnel, and ATB Bridge drivers as CoreSight devices
>>>> - RISC-V trace PMU record capabilities and parsing events in perf.
>>>> - RISC-V Nexus Trace decoder for perf tools
>>>>
>>>> Any comments or suggestions are welcome.
>>>>
>>>> Verification on K3 SoC:
>>>> To verify this patch series on K3 hardware, the following device tree are required:
>>>> 1. RISC-V Trace Encoder node (8)
>>>> 2. RISC-V ATB Bridge node (8)
>>>> 3. RISC-V Trace Funnel node (2)
>>>> 3. CoreSight Funnel configuration for RISC-V (1)
>>>> 4. CoreSight TMC configuration for trace buffer (1)
>>>>
>>>> /{
>>>>          dummy_clk: apb-pclk {
>>>>                  compatible = "fixed-clock";
>>>>                  #clock-cells = <0x0>;
>>>>                  clock-output-names = "clk14mhz";
>>>>                  clock-frequency = <14000000>;
>>>>          };
>>>>
>>>>
>>>>          soc: soc {
>>>>                  #address-cells = <2>;
>>>>                  #size-cells = <2>;
>>>>
>>>>                  encoder0: encoder@d9002000 {
>>>>                          compatible = "riscv,trace-encoder";
>>>>                          reg = <0x0 0xd9002000 0x0 0x1000>;
>>>>                          cpus = <&cpu_0>;
>>>>                          out-ports {
>>>>                                  port {
>>>>                                          cluster0_encoder0_out_port: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_bridge0_in_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>
>>>>                  bridge0: bridge@d9003000 {
>>>>                          compatible = "riscv,trace-atbbridge";
>>>>                          reg = <0x0 0xd9003000 0x0 0x1000>;
>>>>                          cpus = <&cpu_0>;
>>>>                          out-ports {
>>>>                                  port {
>>>>                                          cluster0_bridge0_out_port: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_funnel_in_port0>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                          in-ports {
>>>>                                  port {
>>>>                                          cluster0_bridge0_in_port: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_encoder0_out_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>
>>>> ...
>>>>
>>>>                  cluster0_funnel: funnel@d9000000 {
>>>>                          compatible = "riscv,trace-funnel";
>>>>                          reg = <0x0 0xd9000000 0x0 0x1000>;
>>>>                          cpus = <&cpu_0>, <&cpu_1>, <&cpu_2>, <&cpu_3>;
>>>>                          riscv,timestamp-present;
>>>>                          out-ports {
>>>>                                  port {
>>>>                                          cluster0_funnel_out_port: endpoint {
>>>>                                                  remote-endpoint = <&main_funnel_in_port0>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                          in-ports {
>>>>                                  #address-cells = <1>;
>>>>                                  #size-cells = <0>;
>>>>
>>>>                                  port@0 {
>>>>                                          reg = <0>;
>>>>                                          cluster0_funnel_in_port0: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_bridge0_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@1 {
>>>>                                          reg = <1>;
>>>>                                          cluster0_funnel_in_port1: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_bridge1_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@2 {
>>>>                                          reg = <2>;
>>>>                                          cluster0_funnel_in_port2: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_bridge2_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@3 {
>>>>                                          reg = <3>;
>>>>                                          cluster0_funnel_in_port3: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_bridge3_out_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>
>>>>                  cluster1_funnel: funnel@d9010000 {
>>>>                          compatible = "riscv,trace-funnel";
>>>>                          reg = <0x0 0xd9010000 0x0 0x1000>;
>>>>                          cpus = <&cpu_4>, <&cpu_5>, <&cpu_6>, <&cpu_7>;
>>>>                          riscv,timestamp-present;
>>>>                          out-ports {
>>>>                                  port {
>>>>                                          cluster1_funnel_out_port: endpoint {
>>>>                                                  remote-endpoint = <&main_funnel_in_port1>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                          in-ports {
>>>>                                  #address-cells = <1>;
>>>>                                  #size-cells = <0>;
>>>>
>>>>                                  port@0 {
>>>>                                          reg = <0>;
>>>>                                          cluster1_funnel_in_port0: endpoint {
>>>>                                                  remote-endpoint = <&cluster1_bridge0_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@1 {
>>>>                                          reg = <1>;
>>>>                                          cluster1_funnel_in_port1: endpoint {
>>>>                                                  remote-endpoint = <&cluster1_bridge1_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@2 {
>>>>                                          reg = <2>;
>>>>                                          cluster1_funnel_in_port2: endpoint {
>>>>                                                  remote-endpoint = <&cluster1_bridge2_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@3 {
>>>>                                          reg = <3>;
>>>>                                          cluster1_funnel_in_port3: endpoint {
>>>>                                                  remote-endpoint = <&cluster1_bridge3_out_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>
>>>>                  main_funnel: funnel@d9042000 {
>>>>                          compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>> Is it legally allowed to mix and match ARM coresight IPs with
>>> RISC-V trace components at hardware level ?
>> The ATB Bridge allows sending RISC-V trace to Arm CoreSight infrastructure (instead of RISC-V compliant sink defined in this document) as an ATB initiator.  see:
>> https://github.com/riscv-non-isa/riscv-nexus-trace/blob/105dc1c349556622e4d202d22b584a887ded462f/docs/RISC-V-Trace-Control-Interface.adoc#L184
>> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU). see:
>> https://github.com/riscv-non-isa/riscv-nexus-trace/blob/105dc1c349556622e4d202d22b584a887ded462f/docs/RISC-V-Trace-Control-Interface.adoc#L1684
>>>
>>>>                          reg = <0x0 0xd9042000 0x0 0x1000>;
>>>>                          clocks = <&dummy_clk>;
>>>>                          clock-names = "apb_pclk";
>>>>                          out-ports {
>>>>                                  port {
>>>>                                          main_funnel_out_port: endpoint {
>>>>                                                  remote-endpoint = <&etf_in_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                          in-ports {
>>>>                                  #address-cells = <1>;
>>>>                                  #size-cells = <0>;
>>>>
>>>>                                  port@0 {
>>>>                                          reg = <0>;
>>>>                                          main_funnel_in_port0: endpoint {
>>>>                                                  remote-endpoint = <&cluster0_funnel_out_port>;
>>>>                                          };
>>>>                                  };
>>>>
>>>>                                  port@1 {
>>>>                                          reg = <1>;
>>>>                                          main_funnel_in_port1: endpoint {
>>>>                                                  remote-endpoint = <&cluster1_funnel_out_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>
>>>>                  etf: etf@d9043000 {
>>>>                          compatible = "arm,coresight-tmc", "arm,primecell";
>>>>                          reg = <0x0 0xd9043000 0x0 0x1000>;
>>>>                          clocks = <&dummy_clk>;
>>>>                          clock-names = "apb_pclk";
>>>>                          out-ports {
>>>>                                  port {
>>>>                                          etf_out_port: endpoint {
>>>>                                                  remote-endpoint = <&etr_in_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                          in-ports {
>>>>                                  port {
>>>>                                          etf_in_port: endpoint {
>>>>                                                  remote-endpoint = <&main_funnel_out_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>
>>>>                  etr: etr@d9044000 {
>>>>                          compatible = "arm,coresight-tmc", "arm,primecell";
>>>>                          reg = <0x0 0xd9044000 0x0 0x1000>;
>>>>                          clocks = <&dummy_clk>;
>>>>                          clock-names = "apb_pclk";
>>>>                          arm,scatter-gather;
>>>>                          in-ports {
>>>>                                  port {
>>>>                                          etr_in_port: endpoint {
>>>>                                                  remote-endpoint = <&etf_out_port>;
>>>>                                          };
>>>>                                  };
>>>>                          };
>>>>                  };
>>>>          };
>>>> };
>>>>
>>>> Verification case:
>>>>
>>>> ~ # perf list pmu
>>>>    rvtrace//                                          [Kernel PMU event]
>>>>
>>>> ~ # perf record -e rvtrace/@tmc_etr0/ --per-thread uname
>>>> Linux
>>>> [ perf record: Woken up 1 times to write data ]
>>>> [ perf record: Captured and wrote 0.191 MB perf.data ]
>>>> ~ # perf script
>>>>             uname     137 [003]          1           branches:  ffffffff80931470 rvtrace_poll_bit+0x38 ([kernel.kallsyms]) => ffffffff80931492 rvtrace_poll_bit+0x5a ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff809328a6 encoder_enable_hw+0x252 ([kernel.kallsyms]) => ffffffff809328ba encoder_enable_hw+0x266 ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff80932c4a encoder_enable+0x82 ([kernel.kallsyms]) => ffffffff80932c36 encoder_enable+0x6e ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff80928198 etm_event_start+0xf0 ([kernel.kallsyms]) => ffffffff809281aa etm_event_start+0x102 ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff809281e6 etm_event_start+0x13e ([kernel.kallsyms]) => ffffffff8092755e coresight_get_sink_id+0x16 ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff8092820e etm_event_start+0x166 ([kernel.kallsyms]) => ffffffff80928226 etm_event_start+0x17e ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff801c3bb4 perf_report_aux_output_id+0x0 ([kernel.kallsyms]) => ffffffff801c3bd6 perf_report_aux_output_id+0x22 ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff801c3c5a perf_report_aux_output_id+0xa6 ([kernel.kallsyms]) => ffffffff801c3bf0 perf_report_aux_output_id+0x3c ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff801c3c40 perf_report_aux_output_id+0x8c ([kernel.kallsyms]) => ffffffff801c3aea __perf_event_header__init_id+0x2a ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff801c3b42 __perf_event_header__init_id+0x82 ([kernel.kallsyms]) => ffffffff801c3b4a __perf_event_header__init_id+0x8a ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff801c3bb0 __perf_event_header__init_id+0xf0 ([kernel.kallsyms]) => ffffffff801c3b58 __perf_event_header__init_id+0x98 ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff8004c658 __task_pid_nr_ns+0x0 ([kernel.kallsyms]) => ffffffff8004c696 __task_pid_nr_ns+0x3e ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff8004c71e __task_pid_nr_ns+0xc6 ([kernel.kallsyms]) => ffffffff8004c6a4 __task_pid_nr_ns+0x4c ([kernel.kallsyms])
>>>>             uname     137 [003]          1           branches:  ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms]) => ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms])
>>>> ...
>>>>
>>>> liangzhen (12):
>>>>    coresight: Add RISC-V support to CoreSight tracing
>>>>    coresight: Initial implementation of RISC-V trace driver
>>>>    coresight: Add RISC-V Trace Encoder driver
>>>>    coresight: Add RISC-V Trace Funnel driver
>>>>    coresight: Add RISC-V Trace ATB Bridge driver
>>>>    coresight rvtrace: Add timestamp component support for encoder and
>>>>      funnel
>>>>    coresight: Add RISC-V PMU name support
>>>>    perf tools: riscv: making rvtrace PMU listable
>>>>    perf tools: Add RISC-V trace PMU record capabilities
>>>>    perf tools: Add Nexus RISC-V Trace decoder
>>>>    perf symbols: Add RISC-V PLT entry sizes
>>>>    perf tools: Integrate RISC-V trace decoder into auxtrace
>>>>
>>>>   drivers/hwtracing/Kconfig                     |    2 +
>>>>   drivers/hwtracing/coresight/Kconfig           |   46 +-
>>>>   drivers/hwtracing/coresight/Makefile          |    6 +
>>>>   drivers/hwtracing/coresight/coresight-core.c  |    8 +
>>>>   .../hwtracing/coresight/coresight-etm-perf.c  |    1 -
>>>>   .../hwtracing/coresight/coresight-etm-perf.h  |   21 +
>>>>   .../hwtracing/coresight/coresight-platform.c  |    1 -
>>>>   .../hwtracing/coresight/coresight-tmc-etf.c   |    4 +
>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |    4 +
>>>>   .../hwtracing/coresight/rvtrace-atbbridge.c   |  239 +++
>>>>   drivers/hwtracing/coresight/rvtrace-core.c    |  135 ++
>>>>   .../coresight/rvtrace-encoder-core.c          |  562 +++++++
>>>>   .../coresight/rvtrace-encoder-sysfs.c         |  363 +++++
>>>>   drivers/hwtracing/coresight/rvtrace-encoder.h |  151 ++
>>>>   drivers/hwtracing/coresight/rvtrace-funnel.c  |  337 ++++
>>>>   drivers/hwtracing/coresight/rvtrace-funnel.h  |   39 +
>>>>   .../hwtracing/coresight/rvtrace-timestamp.c   |  278 ++++
>>>>   .../hwtracing/coresight/rvtrace-timestamp.h   |   64 +
>>>>   include/linux/coresight-pmu.h                 |    4 +
>>>>   include/linux/rvtrace.h                       |  116 ++
>>>>   tools/arch/riscv/include/asm/insn.h           |  645 ++++++++
>>>>   tools/perf/arch/riscv/util/Build              |    2 +
>>>>   tools/perf/arch/riscv/util/auxtrace.c         |  490 ++++++
>>>>   tools/perf/arch/riscv/util/pmu.c              |   20 +
>>>>   tools/perf/util/Build                         |    3 +
>>>>   tools/perf/util/auxtrace.c                    |    4 +
>>>>   tools/perf/util/auxtrace.h                    |    1 +
>>>>   tools/perf/util/nexus-rv-decoder/Build        |    1 +
>>>>   .../util/nexus-rv-decoder/nexus-rv-decoder.c  | 1364 +++++++++++++++++
>>>>   .../util/nexus-rv-decoder/nexus-rv-decoder.h  |  139 ++
>>>>   .../perf/util/nexus-rv-decoder/nexus-rv-msg.h |  190 +++
>>>>   tools/perf/util/rvtrace-decoder.c             | 1039 +++++++++++++
>>>>   tools/perf/util/rvtrace.h                     |   40 +
>>>>   tools/perf/util/symbol-elf.c                  |    4 +
>>>>   34 files changed, 6320 insertions(+), 3 deletions(-)
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-atbbridge.c
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-core.c
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-core.c
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder.h
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.c
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.h
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.c
>>>>   create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.h
>>>>   create mode 100644 include/linux/rvtrace.h
>>>>   create mode 100644 tools/arch/riscv/include/asm/insn.h
>>>>   create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>>>>   create mode 100644 tools/perf/arch/riscv/util/pmu.c
>>>>   create mode 100644 tools/perf/util/nexus-rv-decoder/Build
>>>>   create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
>>>>   create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
>>>>   create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h
>>>>   create mode 100644 tools/perf/util/rvtrace-decoder.c
>>>>   create mode 100644 tools/perf/util/rvtrace.h
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>> NACK to this approach of retrofitting RISC-V trace into ARM coresight.
>> I agree that integrating RISC-V trace directly into CoreSight is not a good approach, so I think we should abstract some of the logic of coresight and reuse it in RISC-V Trace.
>
> I think we should indeed abstract out some coresight logic so it can be
> reused by both coresight/rvtrace, especially the way of handling trace
> component topology. The generic logic of building a path from source ->
> sink should be common among coresight/rvtrace and for future architecture.
> To support ATB use case like the K3, I think the best way to approach this
> is to model the atb driver as a separate rvtrace-atb drive and let it
> drive the ARM coresight components. Don't treat risc-v trace as another
> type of coresight.
>
> @Zane, can you also clarify that only the 2 X100 clusters have trace
> encoders, and the A100 clusters do not? I don't see the 2 A100 clusters
> listed in your sample devicetree. If that's the case, then we'll be faced
> with heterogeneous trace setup, making it even more complicated.
>
The A100 clusters also have trace encoders, just like the X100 clusters. The reason I didn't include the two A100 clusters in the sample devicetree is to maintain consistency with the upstream k3.dtsi.


>>>
>>> Regards,
>>> Anup
>>
>> Thanks,
>> Zane
>
> Bo
>

Thanks,

Zane

