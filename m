Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D4CCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 04:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyUP00cWbb14rAirUBQRIORCjenMTRA6DeX7+PzevOE=; b=vqpJEdrYhYe2w8Syq2y20dgnZ+
	6NHITy3FPhAfjjjdI+w08LuVo5onNsWNAbhFLIz087G/2a35PcHrgIcp5nDmIkI8W1huYs6pCdIaO
	jx1ZBqkUiqSrQRSP3zToLYPujmB+zwWBCYKPiY5X6dF0fyRn0Vam9RCl89tMOnkM5IQ8mi1J/MKTN
	pusKd6MHRsQ2UNRwEgDvkWdd5ehGDwOqKDpbR6xYNy+2+baq4vyV3l5uqrQFFLwkv4j4tEgoVKwO8
	HzoYy8DnYIK0r+tNHgqmsb8CY/5C5sgI6gCNBjXVc7NI5/pd8GljoRt0dj2+kXpH7/MWTYmuVbQ3d
	uPvx5Qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqPDP-00000006wUM-0dmF;
	Mon, 25 Aug 2025 04:53:55 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOzi-00000006tml-2xbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 04:39:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57P4dQKX1195045;
	Sun, 24 Aug 2025 23:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756096766;
	bh=JyUP00cWbb14rAirUBQRIORCjenMTRA6DeX7+PzevOE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=zNfKKnm6hktqPhTyiEO8kv550jEw4hSHeQggowdjiX8sRLfYkdwXokFiB0VDq9WQI
	 WKuGaA87pYkkJjFl314qmptUkXxyg+XweHlWH9bwuqGCZnsseh62rTzGld45pH1ZNa
	 Z4735O329PTJJkmmWGNeJSe6UKacFoeQHJ+zoO2Y=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57P4dQbn609297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 24 Aug 2025 23:39:26 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 24
 Aug 2025 23:39:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 24 Aug 2025 23:39:25 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57P4dKiC3303762;
	Sun, 24 Aug 2025 23:39:21 -0500
Message-ID: <c56a779f-d4dc-49ce-874a-30ef96a0a1f0@ti.com>
Date: Mon, 25 Aug 2025 10:09:20 +0530
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
 <ecff956d-1019-41d0-9bfc-b0bdc30e87ba@ti.com>
 <aKnvrh2TSksb_39i@livingston.pivistrello.it>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <aKnvrh2TSksb_39i@livingston.pivistrello.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_213946_837893_86A95AB2 
X-CRM114-Status: GOOD (  20.38  )
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


On 23/08/25 22:13, Francesco Dolcini wrote:
> On Fri, Aug 22, 2025 at 10:09:48PM +0530, Beleswar Prasad Padhi wrote:
>> On 8/21/2025 11:36 AM, Francesco Dolcini wrote:
>>> On Fri, Aug 15, 2025 at 04:08:22AM +0530, Beleswar Padhi wrote:
>>>> The wkup_r5fss0_core0_memory_region is used to store the text/data
>>>> sections of the Device Manager (DM) firmware itself and is necessary for
>>>> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
>>>> for allocating the Virtio buffers needed for IPC with the DM core which
>>>> could be optional. The labels were incorrectly used in the
>>>> k3-am62p-verdin.dtsi file. Correct the firmware memory region label.
>>>>
>>>> Currently, only mailbox node is enabled with FIFO assignment. However,
>>>> there are no users of the enabled mailboxes. Add the missing carveouts
>>>> for WKUP and MCU R5F remote processors, and enable those by associating
>>>> to the above carveout and mailboxes. This config aligns with other AM62P
>>>> boards and can be refactored out later.
>>>>
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> ---
>>>> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>> Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>>> Cc: Parth Pancholi <parth.pancholi@toradex.com>
>>>> Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
>>>> Requesting for a review/test.
>>>>
>>>>   arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 42 ++++++++++++++++++++-
>>>>   1 file changed, 41 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>>>> index 6a04b370d149..0687debf3bbb 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>>>> @@ -162,7 +162,25 @@ secure_ddr: optee@9e800000 {
>>>>   			no-map;
>>>>   		};
>>>> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>> +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
>>>> +			compatible = "shared-dma-pool";
>>>> +			reg = <0x00 0x9b800000 0x00 0x100000>;
>>>> +			no-map;
>>>> +		};
>>>> +
>>>> +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
>>> Node name should be generic, `memory@9b900000` ?
>>
>> Humm, that memory is reserved and has the 'no-map' property. So it
>> technically is only used by the node which references it (a particular
>> rproc in this case), and never used by Linux for any allocations. So it
>> is not generic memory per say...
>>
>> So I was inclined for putting the specific node name which uses the
>> carveout in the label. What do you think?
> My understanding is that the node name must be generic, as required by
> the DT specification. What matters is that this is memory, not what is used
> for.


Sorry, I misinterpreted node name with label. I will fix this in v3
Will wait for any other comments on v2:
https://lore.kernel.org/all/20250823160901.2177841-1-b-padhi@ti.com/

Thanks,
Beleswar

>
>
> So it should be something like
>
>
> mcu_r5fss0_core0_dma_memory: memory@9c900000 {
> 	compatible = "shared-dma-pool";
> 	reg = <0x00 0x9b800000 0x00 0x100000>;
> 	no-map;
> };
>
>
> Francesco
>

