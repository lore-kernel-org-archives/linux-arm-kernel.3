Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48D3CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RPSsH3f3z2Vqavjrk93revEmME+1uytS0pwCHeGwAQ=; b=mm3zzj4xQhKVDvtG3VMFK81P+f
	XhvLnRRLMk6WjZkyrFNhgTFFyCE14RyUYxCHPj4BwToGCZrZe5fiVQvilyyJR5Kp9u3aPna5cgddC
	3FDhm6n7Bc7Ra6N2jeuJvjXrmWv9+CMDGntSg7BRZGlTfa8AtVJzpObb9Fdn0yf22xysYxk9DawH+
	yRKINaOJRWbGkfq+DUcJTli9ergAShOZEVstVPf3nhCmKPUQ63npCNPcRh1/cRjqoT25NGhu2joPi
	vaAzLB48gGNAH+V43LcMQYT3QuMq2X4ZfTO8Sd9IVwJdDvKwLJ3OPiz3bFSrZ+qba8i5bw+VfyzBu
	X7RTgLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphut-00000004BJc-1Rmt;
	Sat, 23 Aug 2025 06:39:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUo9-00000003BY8-0FzT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:40:06 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MGduNv291327;
	Fri, 22 Aug 2025 11:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755880796;
	bh=/RPSsH3f3z2Vqavjrk93revEmME+1uytS0pwCHeGwAQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CT+fJdAiV2ghPTF/zj9h11E/n3/x1ouiAYNoCz2tNiTuAe5TyskzJaPVae0gQWJVv
	 9BSeetRWCRfFIzZWikZlD7fn6+EGpAolqrFk/2q/BaHIDGR9WqwW1WgrmTO2ZZ1mLC
	 0ttzdyI/an2R5QihtrMhm7fyBlcpzfrxpwS4arSY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MGduAJ3039382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 11:39:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 11:39:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 11:39:56 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MGdn3B3828477;
	Fri, 22 Aug 2025 11:39:50 -0500
Message-ID: <ecff956d-1019-41d0-9bfc-b0bdc30e87ba@ti.com>
Date: Fri, 22 Aug 2025 22:09:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/33] arm64: dts: ti: k3-am62p-verdin: Add missing cfg
 for TI IPC Firmware
To: Francesco Dolcini <francesco@dolcini.it>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-17-b-padhi@ti.com>
 <20250821060629.GB7503@francesco-nb>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250821060629.GB7503@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_094005_195097_0C39142C 
X-CRM114-Status: GOOD (  21.00  )
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


On 8/21/2025 11:36 AM, Francesco Dolcini wrote:
> On Fri, Aug 15, 2025 at 04:08:22AM +0530, Beleswar Padhi wrote:
>> The wkup_r5fss0_core0_memory_region is used to store the text/data
>> sections of the Device Manager (DM) firmware itself and is necessary for
>> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
>> for allocating the Virtio buffers needed for IPC with the DM core which
>> could be optional. The labels were incorrectly used in the
>> k3-am62p-verdin.dtsi file. Correct the firmware memory region label.
>>
>> Currently, only mailbox node is enabled with FIFO assignment. However,
>> there are no users of the enabled mailboxes. Add the missing carveouts
>> for WKUP and MCU R5F remote processors, and enable those by associating
>> to the above carveout and mailboxes. This config aligns with other AM62P
>> boards and can be refactored out later.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
>> Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>> Cc: Parth Pancholi <parth.pancholi@toradex.com>
>> Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
>> Requesting for a review/test.
>>
>>   arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 42 ++++++++++++++++++++-
>>   1 file changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> index 6a04b370d149..0687debf3bbb 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> @@ -162,7 +162,25 @@ secure_ddr: optee@9e800000 {
>>   			no-map;
>>   		};
>>   
>> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x00 0x9b800000 0x00 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> Node name should be generic, `memory@9b900000` ?


Humm, that memory is reserved and has the 'no-map' property. So it
technically is only used by the node which references it (a particular
rproc in this case), and never used by Linux for any allocations. So it
is not generic memory per say...

So I was inclined for putting the specific node name which uses the
carveout in the label. What do you think?

>
> this applies in multiple patches in this series
>
>
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
>> +			no-map;
>> +		};
>> +
>> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x00 0x9c800000 0x00 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>>   			compatible = "shared-dma-pool";
>>   			reg = <0x00 0x9c900000 0x00 0x01e00000>;
>>   			no-map;
>> @@ -848,6 +866,28 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>   	};
>>   };
>>   
>> +&wkup_r5fss0 {
>> +	status = "okay";
>> +};
>> +
>> +&wkup_r5fss0_core0 {
>> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>> +			<&wkup_r5fss0_core0_memory_region>;
>> +	status = "okay";
>> +};
>> +
>> +&mcu_r5fss0 {
>> +	status = "okay";
>> +};
>> +
>> +&mcu_r5fss0_core0 {
>> +	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
>> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +			<&mcu_r5fss0_core0_memory_region>;
>> +	status = "okay";
>> +};
>> +
>>   &main0_alert {
>>   	temperature = <95000>;
>>   };
>> -- 
>> 2.34.1
>>

