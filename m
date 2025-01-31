Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC03CC02193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeW7OzaxjVMicPl3OoEn58LA3cfkF615oS67GkKAOiI=; b=1OcCS1FK8Z/cYrxwYnPsiIOSSk
	NNYqwHcNfEosTja7O2XdgDVyzlhmjQx18MJoecUkXejVRykqj4esVg65Yx+cJwz88obkXHQjqQUNx
	kAwOgQdQ2a/yejZdL7RyJXBmXav5l6lLL14+mHd8qe/VbQTbqyqCxmtCQGEBAZtGNBBzoqQJ9Kc17
	QTYKMLV0l7gG91EAB5+pu/otezRXPZYzgn1LbZn+EmYrty/R1AVIjYWjwnI9C6BDFaJVMLci1kY+m
	b2Xyc+JXC7uqo/Gbj0VVkbSaE4y4ZILxyvrTBu+v6wBCrvryzO4eYPYCl7jUkaVHgxwr3hKqCujeu
	sbqWsFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvkZ-0000000BCtY-28dv;
	Fri, 31 Jan 2025 18:28:19 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdviO-0000000BCWk-02no
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:26:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50VIPxaT1709913
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:25:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738347959;
	bh=QeW7OzaxjVMicPl3OoEn58LA3cfkF615oS67GkKAOiI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KdJOymT1PgcvvIC6RprKEToSc33IG9pN6+wckktn3M6wKY617/V181+34vgG3fUWz
	 wcdPSurnYvFjI3bW5UCsMOTaUpiflcc1rTpM8fVyGgs3EqAUPhU1L2ym3nC6zg0zHU
	 N63R4V118ZBFstOjWEMiSXTAHOp4ZG9r3J4M9z0Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50VIPxiw045233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jan 2025 12:25:59 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 Jan 2025 12:25:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 Jan 2025 12:25:58 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VIPwBL111109;
	Fri, 31 Jan 2025 12:25:58 -0600
Message-ID: <0b7cbf66-0c95-4ced-9cf7-cc5b953eebfe@ti.com>
Date: Fri, 31 Jan 2025 12:25:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc
 node
To: Judith Mendez <jm@ti.com>, Hari Nagalla <hnagalla@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Devarsh Thakkar <devarsht@ti.com>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-3-jm@ti.com>
 <8b152f81-0848-4f34-adcb-fee9b4f2fd7f@ti.com>
 <76f9e9e8-dd7c-e783-fccc-0b6f913ce753@ti.com>
 <390aa52e-e9f2-4ce3-ad1b-eac71f4a211c@ti.com>
 <6ab56868-b2d2-4b8a-ac06-d0d35a5e8998@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <6ab56868-b2d2-4b8a-ac06-d0d35a5e8998@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_102604_137144_6D2BBD6F 
X-CRM114-Status: GOOD (  16.42  )
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

On 1/30/25 4:40 PM, Judith Mendez wrote:
> On 1/28/25 11:48 AM, Judith Mendez wrote:
>> Hi Andrew,
>>
>> On 1/28/25 10:52 AM, Hari Nagalla wrote:
>>> On 1/28/25 10:27, Andrew Davis wrote:
>>>>> +    mcu_r5fss0: r5fss@79000000 {
>>>>> +        compatible = "ti,am62-r5fss";
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <1>;
>>>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>>>
>>>> Newline here.
>>>>
>>>> Also this should be default "disabled". It can be set to "okay"
>>>> in the board DTS file when the needed mboxes and memory-region
>>>> are set. Speaking of that, where are those patches? This is
>>>> incomplete without them and these nodes will not function.
>>>> Same for the DSP patch.
>>>>
>>>> Andrew
>>> Yes, by default needs to set the node state to "disabled". This is HW description of the wake-up domain components. Memory carve outs and mailbox assignments for IPC are a separate patch as it is configurable and distro dependent.
>>
>> Yes I plan to disable the nodes in each domain .dtsi file.
>>
>> Also yes, my understanding is that the memory carveouts could
>> be a separate series if at all. Not sure if those patches can be
>> sent upstream since they are distro dependent. Can anyone clarify
>> if this is the case?
>>
> 
> As per offline discussion, I will include the memory carveouts in this
> same series.

It's usually good to fill in some details of "offline discussion" for
folks on the list not in that conversation.

By "distro dependent" we really mean firmware dependent. The carveouts
are set in DT and then most firmware follows the same and hardcode
these addresses. For example[0].

This works well as long as all the firmware uses these standard
addresses. Problem is some legacy firmware did not, and so to use
those firmware the DT would need modified.

For AM62 and AM62A I'm not aware of any such firmware. So this
is a bit of a non-issue and we can safely add the carveouts
like we already do for all other K3 devices.

Andrew

[0] https://github.com/zephyrproject-rtos/zephyr/blob/main/boards/beagle/beaglebone_ai64/beaglebone_ai64_j721e_main_r5f0_0.dts#L30

> ~ Judith
> 
>> ~ Judith
>>
> 

