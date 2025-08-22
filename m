Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CFCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTnjIUy88MysrGcFmO7KCg/wbiZ4kQxZ42DLi+ANSIg=; b=kRrmk0Mx89BWhQv3F7cI6OLxlZ
	QotJpiOH7yU5tLLRqhALOJKIqdjKJHNgQHd/H9I/8Ghmd9YYLMnp1fN8qGdPjbZLUUUlq/9eUjhyj
	YMTV/6laZWxUwyGEkNQfoz2pxv/YC9svTZFzu8uAml9HAuuPMwSwvvaTRW2DzHl0zUVIH56sqwWC0
	QXbSPEV4X+ULHf3tjfqSUcoPQwJ/8LS6wltnLLZS095q9AYacnc9ctVthL5IGmkf0ro8p/aDPHJe5
	7Rgm1kQx3t5C9g0MJzzQawNOB7WrQP7/Jv1moT0G10PN0kYdohLMSKcJuGLZ5xv2EG1Dr9sCXhx7q
	sg3ktyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuh-00000004B5V-2Ws1;
	Sat, 23 Aug 2025 06:39:43 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUhB-00000003B2R-2UI6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:32:54 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MGWngF287782;
	Fri, 22 Aug 2025 11:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755880369;
	bh=NTnjIUy88MysrGcFmO7KCg/wbiZ4kQxZ42DLi+ANSIg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MQ4XfgrRIfp3DZoJlaa9zoJqSLZSWrtgmhkgWqI5oyM6R24LkFFXrTrHn61b7AlMt
	 1XK3bRBrwQ36O8plpKH5MbZau4gR0BvvSD/w7br3zMG6jhIjHKAHU+mPhe3s7qKru4
	 CWnZneP8rx6mTlotIeRdGdg5o1+rElCPZFOvB1uY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MGWnRw3403910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 11:32:49 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 11:32:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 11:32:49 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MGWd6e3822193;
	Fri, 22 Aug 2025 11:32:40 -0500
Message-ID: <c3e31030-4f4f-4235-84c7-93a62265bce5@ti.com>
Date: Fri, 22 Aug 2025 22:02:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] arm64: dts: ti: k3-j7200: Enable remote processors
 at board level
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-2-b-padhi@ti.com>
 <b257999d-df16-405c-830b-5397da37c6ed@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <b257999d-df16-405c-830b-5397da37c6ed@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_093253_717668_672DA1A5 
X-CRM114-Status: GOOD (  13.92  )
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

Hi Udit,

On 8/15/2025 8:00 AM, Kumar, Udit wrote:
> Hello Beleswar,
>
> On 8/15/2025 4:08 AM, Beleswar Padhi wrote:
>> Remote Processors defined in top-level J7200 SoC dtsi files are
>> incomplete without the memory carveouts and mailbox assignments which
>> are only known at board integration level.
>>
>> Therefore, disable the remote processors at SoC level and enable them at
>> board level where above information is available.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       | 3 +++
>>   arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi | 3 +++
>>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi     | 9 +++++++++
>>   3 files changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
>> index 5ce5f0a3d6f5..628ff89dd72f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
>> @@ -1516,6 +1516,7 @@ main_r5fss0: r5fss@5c00000 {
>>           ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
>>                <0x5d00000 0x00 0x5d00000 0x20000>;
>>           power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>;
>> +        status = "disabled";
>>             main_r5fss0_core0: r5f@5c00000 {
>>               compatible = "ti,j7200-r5f";
>> @@ -1530,6 +1531,7 @@ main_r5fss0_core0: r5f@5c00000 {
>>               ti,atcm-enable = <1>;
>>               ti,btcm-enable = <1>;
>>               ti,loczrama = <1>;
>> +            status = "disabled";
>>           };
>>             main_r5fss0_core1: r5f@5d00000 {
>> @@ -1545,6 +1547,7 @@ main_r5fss0_core1: r5f@5d00000 {
>>               ti,atcm-enable = <1>;
>>               ti,btcm-enable = <1>;
>>               ti,loczrama = <1>;
>> +            status = "disabled";
>>           };
>>       };
>>   diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
>> index 56ab144fea07..692c4745040e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
>> @@ -612,6 +612,7 @@ mcu_r5fss0: r5fss@41000000 {
>>           ranges = <0x41000000 0x00 0x41000000 0x20000>,
>>                <0x41400000 0x00 0x41400000 0x20000>;
>>           power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
>> +        status = "disabled";
>
> Please leave boot critical fw as is.


The nodes that are disabled here, are enabled back in the
board level files. So, it has no effective change on the boards.

>
> Here are my suggestions
>
>  create one boot-critical-fw-dtsi for mcu_r5fss0 , include this fw 
> files in all boards.


That is the plan for a future series :)

Thanks,
Beleswar

>
> other IPC optional firmware can reside in one dtsi or dtso,
>
>
>> [..]

