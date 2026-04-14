Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76BFED7B8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKq8GR5ap0k8hzKoBGsodA1vc183gkvpdg3uuj+NV80=; b=R/PaVadIEw+hZ+HcEzqNVcJaWC
	WuVrGUvAG3QqwQIWSGR5zASCWvppmaSHG5AGyxyqObD8ZbuuUxy7vnl5m0+l3WlqhXhUsfIckMhKY
	bTfDGePsIVQy5YXzk7BYbP/orA0STCkoXwY/tTluhrxT0VffL04Xx+N0HKxTf8oyOUAMyyL2W3DRS
	X4bM6xVJhCcf5WFMrfvtZSunOXy6pjE1VnlTNaX9vxkcXhNh6b9hLNh9mqwmNYK1pWsAa/AA9owTt
	Q4yBNjH65MT6YxcfOucDvtZfE80mcDF+CJi+Wnv+FxhqpIKGTi3fDVWzBp+okOWr0899xocNvkeNz
	/4Ocdnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZhe-0000000H1xt-0qhv;
	Tue, 14 Apr 2026 09:05:02 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZhZ-0000000H1vB-31NY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776157484;
	bh=dKq8GR5ap0k8hzKoBGsodA1vc183gkvpdg3uuj+NV80=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HUoofrCSINl68NMf79PZPbEY7+eqqDXcyn1yz3dY37rfIC0PhP9OOBJxMFwO9j4sy
	 sLqmw1n9JFlmGn5q3dvkuDZqBKku+Srp8xyoeRnGoz07f+DADD+eMrrlag+J64fgCi
	 rRjh/4wS1sNiGFSOQv41J+jj/K6TSyYXP9y7z32c=
X-QQ-mid: esmtpgz14t1776157482tad73993c
X-QQ-Originating-IP: gW79XwohU7riN9BZdRWNqW2pRA4I6XO+I2C4gswJxmw=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 17:04:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1161964651524546658
EX-QQ-RecipientCnt: 29
Message-ID: <7EFD9F2504326BD1+26395797-fbe8-491b-b651-701286fb5751@linux.spacemit.com>
Date: Tue, 14 Apr 2026 17:04:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Add Linux RISC-V trace support via CoreSight
To: Anup Patel <anup@brainfault.org>
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
 alexander.shishkin@linux.intel.com, linux-arm-kernel@lists.infradead.org
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
 <CAAhSdy2Sx98qcCMBVF+_BV1G-syrO74Y_S298hMwkW+vgLtb5Q@mail.gmail.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <CAAhSdy2Sx98qcCMBVF+_BV1G-syrO74Y_S298hMwkW+vgLtb5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M0qzrJwwKu7ji5uitGQf7YXjsT0YyeWU161z/wWbeXXrwfhYq3uaqClL
	nHXD5zwPIUkdNguEajC/Q8Hv/RoD1g3WOEP4MNVfPw+tDCT+szbTmrVmdjpFVl6fR8Z4S75
	w49QZ4XWevtRMukKCrYqFZX5elJ05WhD85Ora97R4jl1Zizwg6AMagblI6gH6q3CN0TME/Y
	SA7GfpN2dMkzlUGmrHlvETNl8OQConvSKFTdiYudVP80U7N92zzoPueX5bgE3hTvnSw+Tz6
	Ltrmns/abQo3zbR8KdBhs5a8nDy06Eh3KpAUa2Kqc4/TwQmTumcNoJVt41gBbNbcspTZFzM
	2NKb0/nKhzM+6zcTiWVjbHzeOPiPJiwV9W5WD94iaeGhyAYjTQDk4qKlhWQufcu2f2KbA1S
	HoMQlVEi0T/xLC7rXx3tJECHnOqboVKU2HugQADArvihTJMWrgKQElfIDp55EbAuAY4ul3k
	oEx2m4AkUlQKsUWVP60f1tPrFaF2Piq2rfOQZZ7FZgWHI+IBf8uNnXYVZxbwKqF5lU9PXqz
	bAYqHjyMhhushDsNAf/4ZGYueYGNEY6O2wadpKeaNMxEL1SyweB/KTf4AtRZs+mBxiKRAns
	3B0rw6ZavmVLsCkeGfK1xjpUxs4yPITUPrw+tcZ8bMq1kMiFVxtcvo/DntepxC9+naq54xC
	sMvvcFBwDcqYjXESRn8wsVx8BbpVzOkCm5rmcYvI41UXZqPiQwEfAo3y5nxU0VYZvvWlQL/
	wrYJzaBvoCddyiiLyoRqcBgm5rF0IYMXaNCE7mcUgJxZsKj71XUcCiLHl2Igt6uBPooyi1X
	YLUoRD6G4151dyUv9/An0UfhkP81A1HtyfWKzRuo0DXetpS6S0Ffp5eYMnaMS1DBdG2IVnC
	8xPK5ooGJwzGjlj1W5ifoPZ0gFj+lH0KKppwStY3hfJ0Feb9oamARqrCjy198X+XW/vSlPZ
	YwpJEje9g5wq4E5bylqtO9k3GBGbSaQyAgg6T0179BYY3uaHd43m4JY4MURbh30qgNi3tr5
	e9OrlBTzZ2RGaF5mxO2jZd4iLdlfiVHQUHZI1sCXDxWzkjilRcCz6OkaKj7Xw/EUm4nb0jQ
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_020458_562043_91575F7E 
X-CRM114-Status: GOOD (  16.43  )
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


On 4/14/2026 3:23 PM, Anup Patel wrote:
> On Tue, Apr 14, 2026 at 9:12 AM Zane Leung <liangzhen@linux.spacemit.com> wrote:
>> From: liangzhen <zhen.liang@spacemit.com>
>>
>> This series adds Linux RISC-V trace support via CoreSight, implementing RISC-V
>> trace drivers within the CoreSight framework and integrating them with perf tools.
>> The K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and CoreSight TMC
>> components, which can be directly leveraged through the existing CoreSight infrastructure.
>>
>> Linux RISC-V trace support form Anup Patel:
>> (https://patchwork.kernel.org/project/linux-riscv/cover/20260225062448.4027948-1-anup.patel@oss.qualcomm.com/)
>> which currently lacks ATB component support and guidance on reusing CoreSight components.
> What stops you from adding RISC-V trace funnel and ATB bridge drivers
> on top of this series ?
>
Firstly, my works started much earlier than this series. Secondly, it is difficult to add the coresight funnel and coresight tmc components to this series. Based on the coresight framework, I can directly reuse them.

>
>> The series includes:
>> - RISC-V trace driver implementation within the CoreSight framework
> The RISC-V trace very different from the CoreSight framework in many ways:
> 1) Types of components supported
> 2) Trace packet formats
> 3) The way MMIO based components are discoverd
> 4) ... and more ...
1) I believe that RISC-V tracing is coresight-alike, where have encoders/funnel/sink/bridge that are described through DT and controlled by MMIO. 
2) I think the difference in package format is nothing more than the coresight frame generated by the ATB component to distinguish the trace source. After removing it, it becomes riscv trace data.
3) The current CoreSight framework code does not introduce this mechanism, it is described through DT.
>> - RISC-V Trace Encoder, Funnel, and ATB Bridge drivers as CoreSight devices
>> - RISC-V trace PMU record capabilities and parsing events in perf.
>> - RISC-V Nexus Trace decoder for perf tools
>>
>> Any comments or suggestions are welcome.
>>
>> Verification on K3 SoC:
>> To verify this patch series on K3 hardware, the following device tree are required:
>> 1. RISC-V Trace Encoder node (8)
>> 2. RISC-V ATB Bridge node (8)
>> 3. RISC-V Trace Funnel node (2)
>> 3. CoreSight Funnel configuration for RISC-V (1)
>> 4. CoreSight TMC configuration for trace buffer (1)
>>
>> /{
>>         dummy_clk: apb-pclk {
>>                 compatible = "fixed-clock";
>>                 #clock-cells = <0x0>;
>>                 clock-output-names = "clk14mhz";
>>                 clock-frequency = <14000000>;
>>         };
>>
>>
>>         soc: soc {
>>                 #address-cells = <2>;
>>                 #size-cells = <2>;
>>
>>                 encoder0: encoder@d9002000 {
>>                         compatible = "riscv,trace-encoder";
>>                         reg = <0x0 0xd9002000 0x0 0x1000>;
>>                         cpus = <&cpu_0>;
>>                         out-ports {
>>                                 port {
>>                                         cluster0_encoder0_out_port: endpoint {
>>                                                 remote-endpoint = <&cluster0_bridge0_in_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>
>>                 bridge0: bridge@d9003000 {
>>                         compatible = "riscv,trace-atbbridge";
>>                         reg = <0x0 0xd9003000 0x0 0x1000>;
>>                         cpus = <&cpu_0>;
>>                         out-ports {
>>                                 port {
>>                                         cluster0_bridge0_out_port: endpoint {
>>                                                 remote-endpoint = <&cluster0_funnel_in_port0>;
>>                                         };
>>                                 };
>>                         };
>>                         in-ports {
>>                                 port {
>>                                         cluster0_bridge0_in_port: endpoint {
>>                                                 remote-endpoint = <&cluster0_encoder0_out_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>
>> ...
>>
>>                 cluster0_funnel: funnel@d9000000 {
>>                         compatible = "riscv,trace-funnel";
>>                         reg = <0x0 0xd9000000 0x0 0x1000>;
>>                         cpus = <&cpu_0>, <&cpu_1>, <&cpu_2>, <&cpu_3>;
>>                         riscv,timestamp-present;
>>                         out-ports {
>>                                 port {
>>                                         cluster0_funnel_out_port: endpoint {
>>                                                 remote-endpoint = <&main_funnel_in_port0>;
>>                                         };
>>                                 };
>>                         };
>>                         in-ports {
>>                                 #address-cells = <1>;
>>                                 #size-cells = <0>;
>>
>>                                 port@0 {
>>                                         reg = <0>;
>>                                         cluster0_funnel_in_port0: endpoint {
>>                                                 remote-endpoint = <&cluster0_bridge0_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@1 {
>>                                         reg = <1>;
>>                                         cluster0_funnel_in_port1: endpoint {
>>                                                 remote-endpoint = <&cluster0_bridge1_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@2 {
>>                                         reg = <2>;
>>                                         cluster0_funnel_in_port2: endpoint {
>>                                                 remote-endpoint = <&cluster0_bridge2_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@3 {
>>                                         reg = <3>;
>>                                         cluster0_funnel_in_port3: endpoint {
>>                                                 remote-endpoint = <&cluster0_bridge3_out_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>
>>                 cluster1_funnel: funnel@d9010000 {
>>                         compatible = "riscv,trace-funnel";
>>                         reg = <0x0 0xd9010000 0x0 0x1000>;
>>                         cpus = <&cpu_4>, <&cpu_5>, <&cpu_6>, <&cpu_7>;
>>                         riscv,timestamp-present;
>>                         out-ports {
>>                                 port {
>>                                         cluster1_funnel_out_port: endpoint {
>>                                                 remote-endpoint = <&main_funnel_in_port1>;
>>                                         };
>>                                 };
>>                         };
>>                         in-ports {
>>                                 #address-cells = <1>;
>>                                 #size-cells = <0>;
>>
>>                                 port@0 {
>>                                         reg = <0>;
>>                                         cluster1_funnel_in_port0: endpoint {
>>                                                 remote-endpoint = <&cluster1_bridge0_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@1 {
>>                                         reg = <1>;
>>                                         cluster1_funnel_in_port1: endpoint {
>>                                                 remote-endpoint = <&cluster1_bridge1_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@2 {
>>                                         reg = <2>;
>>                                         cluster1_funnel_in_port2: endpoint {
>>                                                 remote-endpoint = <&cluster1_bridge2_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@3 {
>>                                         reg = <3>;
>>                                         cluster1_funnel_in_port3: endpoint {
>>                                                 remote-endpoint = <&cluster1_bridge3_out_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>
>>                 main_funnel: funnel@d9042000 {
>>                         compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> Is it legally allowed to mix and match ARM coresight IPs with
> RISC-V trace components at hardware level ?
The ATB Bridge allows sending RISC-V trace to Arm CoreSight infrastructure (instead of RISC-V compliant sink defined in this document) as an ATB initiator.  see: 
https://github.com/riscv-non-isa/riscv-nexus-trace/blob/105dc1c349556622e4d202d22b584a887ded462f/docs/RISC-V-Trace-Control-Interface.adoc#L184
For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU). see:
https://github.com/riscv-non-isa/riscv-nexus-trace/blob/105dc1c349556622e4d202d22b584a887ded462f/docs/RISC-V-Trace-Control-Interface.adoc#L1684
>
>>                         reg = <0x0 0xd9042000 0x0 0x1000>;
>>                         clocks = <&dummy_clk>;
>>                         clock-names = "apb_pclk";
>>                         out-ports {
>>                                 port {
>>                                         main_funnel_out_port: endpoint {
>>                                                 remote-endpoint = <&etf_in_port>;
>>                                         };
>>                                 };
>>                         };
>>                         in-ports {
>>                                 #address-cells = <1>;
>>                                 #size-cells = <0>;
>>
>>                                 port@0 {
>>                                         reg = <0>;
>>                                         main_funnel_in_port0: endpoint {
>>                                                 remote-endpoint = <&cluster0_funnel_out_port>;
>>                                         };
>>                                 };
>>
>>                                 port@1 {
>>                                         reg = <1>;
>>                                         main_funnel_in_port1: endpoint {
>>                                                 remote-endpoint = <&cluster1_funnel_out_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>
>>                 etf: etf@d9043000 {
>>                         compatible = "arm,coresight-tmc", "arm,primecell";
>>                         reg = <0x0 0xd9043000 0x0 0x1000>;
>>                         clocks = <&dummy_clk>;
>>                         clock-names = "apb_pclk";
>>                         out-ports {
>>                                 port {
>>                                         etf_out_port: endpoint {
>>                                                 remote-endpoint = <&etr_in_port>;
>>                                         };
>>                                 };
>>                         };
>>                         in-ports {
>>                                 port {
>>                                         etf_in_port: endpoint {
>>                                                 remote-endpoint = <&main_funnel_out_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>
>>                 etr: etr@d9044000 {
>>                         compatible = "arm,coresight-tmc", "arm,primecell";
>>                         reg = <0x0 0xd9044000 0x0 0x1000>;
>>                         clocks = <&dummy_clk>;
>>                         clock-names = "apb_pclk";
>>                         arm,scatter-gather;
>>                         in-ports {
>>                                 port {
>>                                         etr_in_port: endpoint {
>>                                                 remote-endpoint = <&etf_out_port>;
>>                                         };
>>                                 };
>>                         };
>>                 };
>>         };
>> };
>>
>> Verification case:
>>
>> ~ # perf list pmu
>>   rvtrace//                                          [Kernel PMU event]
>>
>> ~ # perf record -e rvtrace/@tmc_etr0/ --per-thread uname
>> Linux
>> [ perf record: Woken up 1 times to write data ]
>> [ perf record: Captured and wrote 0.191 MB perf.data ]
>> ~ # perf script
>>            uname     137 [003]          1           branches:  ffffffff80931470 rvtrace_poll_bit+0x38 ([kernel.kallsyms]) => ffffffff80931492 rvtrace_poll_bit+0x5a ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff809328a6 encoder_enable_hw+0x252 ([kernel.kallsyms]) => ffffffff809328ba encoder_enable_hw+0x266 ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff80932c4a encoder_enable+0x82 ([kernel.kallsyms]) => ffffffff80932c36 encoder_enable+0x6e ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff80928198 etm_event_start+0xf0 ([kernel.kallsyms]) => ffffffff809281aa etm_event_start+0x102 ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff809281e6 etm_event_start+0x13e ([kernel.kallsyms]) => ffffffff8092755e coresight_get_sink_id+0x16 ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff8092820e etm_event_start+0x166 ([kernel.kallsyms]) => ffffffff80928226 etm_event_start+0x17e ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff801c3bb4 perf_report_aux_output_id+0x0 ([kernel.kallsyms]) => ffffffff801c3bd6 perf_report_aux_output_id+0x22 ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff801c3c5a perf_report_aux_output_id+0xa6 ([kernel.kallsyms]) => ffffffff801c3bf0 perf_report_aux_output_id+0x3c ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff801c3c40 perf_report_aux_output_id+0x8c ([kernel.kallsyms]) => ffffffff801c3aea __perf_event_header__init_id+0x2a ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff801c3b42 __perf_event_header__init_id+0x82 ([kernel.kallsyms]) => ffffffff801c3b4a __perf_event_header__init_id+0x8a ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff801c3bb0 __perf_event_header__init_id+0xf0 ([kernel.kallsyms]) => ffffffff801c3b58 __perf_event_header__init_id+0x98 ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff8004c658 __task_pid_nr_ns+0x0 ([kernel.kallsyms]) => ffffffff8004c696 __task_pid_nr_ns+0x3e ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff8004c71e __task_pid_nr_ns+0xc6 ([kernel.kallsyms]) => ffffffff8004c6a4 __task_pid_nr_ns+0x4c ([kernel.kallsyms])
>>            uname     137 [003]          1           branches:  ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms]) => ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms])
>> ...
>>
>> liangzhen (12):
>>   coresight: Add RISC-V support to CoreSight tracing
>>   coresight: Initial implementation of RISC-V trace driver
>>   coresight: Add RISC-V Trace Encoder driver
>>   coresight: Add RISC-V Trace Funnel driver
>>   coresight: Add RISC-V Trace ATB Bridge driver
>>   coresight rvtrace: Add timestamp component support for encoder and
>>     funnel
>>   coresight: Add RISC-V PMU name support
>>   perf tools: riscv: making rvtrace PMU listable
>>   perf tools: Add RISC-V trace PMU record capabilities
>>   perf tools: Add Nexus RISC-V Trace decoder
>>   perf symbols: Add RISC-V PLT entry sizes
>>   perf tools: Integrate RISC-V trace decoder into auxtrace
>>
>>  drivers/hwtracing/Kconfig                     |    2 +
>>  drivers/hwtracing/coresight/Kconfig           |   46 +-
>>  drivers/hwtracing/coresight/Makefile          |    6 +
>>  drivers/hwtracing/coresight/coresight-core.c  |    8 +
>>  .../hwtracing/coresight/coresight-etm-perf.c  |    1 -
>>  .../hwtracing/coresight/coresight-etm-perf.h  |   21 +
>>  .../hwtracing/coresight/coresight-platform.c  |    1 -
>>  .../hwtracing/coresight/coresight-tmc-etf.c   |    4 +
>>  .../hwtracing/coresight/coresight-tmc-etr.c   |    4 +
>>  .../hwtracing/coresight/rvtrace-atbbridge.c   |  239 +++
>>  drivers/hwtracing/coresight/rvtrace-core.c    |  135 ++
>>  .../coresight/rvtrace-encoder-core.c          |  562 +++++++
>>  .../coresight/rvtrace-encoder-sysfs.c         |  363 +++++
>>  drivers/hwtracing/coresight/rvtrace-encoder.h |  151 ++
>>  drivers/hwtracing/coresight/rvtrace-funnel.c  |  337 ++++
>>  drivers/hwtracing/coresight/rvtrace-funnel.h  |   39 +
>>  .../hwtracing/coresight/rvtrace-timestamp.c   |  278 ++++
>>  .../hwtracing/coresight/rvtrace-timestamp.h   |   64 +
>>  include/linux/coresight-pmu.h                 |    4 +
>>  include/linux/rvtrace.h                       |  116 ++
>>  tools/arch/riscv/include/asm/insn.h           |  645 ++++++++
>>  tools/perf/arch/riscv/util/Build              |    2 +
>>  tools/perf/arch/riscv/util/auxtrace.c         |  490 ++++++
>>  tools/perf/arch/riscv/util/pmu.c              |   20 +
>>  tools/perf/util/Build                         |    3 +
>>  tools/perf/util/auxtrace.c                    |    4 +
>>  tools/perf/util/auxtrace.h                    |    1 +
>>  tools/perf/util/nexus-rv-decoder/Build        |    1 +
>>  .../util/nexus-rv-decoder/nexus-rv-decoder.c  | 1364 +++++++++++++++++
>>  .../util/nexus-rv-decoder/nexus-rv-decoder.h  |  139 ++
>>  .../perf/util/nexus-rv-decoder/nexus-rv-msg.h |  190 +++
>>  tools/perf/util/rvtrace-decoder.c             | 1039 +++++++++++++
>>  tools/perf/util/rvtrace.h                     |   40 +
>>  tools/perf/util/symbol-elf.c                  |    4 +
>>  34 files changed, 6320 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-atbbridge.c
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-core.c
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-core.c
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder.h
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.c
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.h
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.c
>>  create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.h
>>  create mode 100644 include/linux/rvtrace.h
>>  create mode 100644 tools/arch/riscv/include/asm/insn.h
>>  create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>>  create mode 100644 tools/perf/arch/riscv/util/pmu.c
>>  create mode 100644 tools/perf/util/nexus-rv-decoder/Build
>>  create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
>>  create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
>>  create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h
>>  create mode 100644 tools/perf/util/rvtrace-decoder.c
>>  create mode 100644 tools/perf/util/rvtrace.h
>>
>> --
>> 2.34.1
>>
> NACK to this approach of retrofitting RISC-V trace into ARM coresight.
I agree that integrating RISC-V trace directly into CoreSight is not a good approach, so I think we should abstract some of the logic of coresight and reuse it in RISC-V Trace.
>
> Regards,
> Anup

Thanks,
Zane

