Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A2AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1W9mftwbolHHmlTfjC6lOdNljrRQ0/SgyP7qtHrY8k=; b=AysQdhv11V5WVBBHUE2U1mkWmm
	CJ9ot3AxM8fkNqid62F00udpOkiWcFfxJerGtHTQ0BipLAF25Ch3ayPh/e5EHeghElOVkwHtnfhgy
	vJ2iN3jTCMPjCcFhbof6RV5CUkxqrPZZW91afKDA3NSagMGMD/P8G9wrQmvm6m2XMfpYw4xBg+6qD
	CKwulNxbuKyxkSqdmWOr33Hebmrt9abZz9lXfE0yELA8XZmjZ2Oo8qVTIjs62f2kpmRG89CDxivZN
	9SyoLVUxZdTda8VxOG6gDUREQgP7S4bGFmsAc222sVDdNHrDx4zYpOS5eOp1aJ3OQsC88a0GwlWnT
	jnnzLE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sI3-00000004Tof-1HHz;
	Mon, 21 Apr 2025 14:38:31 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sGB-00000004Tas-0TRq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 14:36:36 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEaT6M1579788
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745246189;
	bh=o1W9mftwbolHHmlTfjC6lOdNljrRQ0/SgyP7qtHrY8k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GL3NzM2I9vO6IZMJJIEmDlwM7rLfulOcXStPtQUGNVa1g09vqHXC2edRC05P2q/r7
	 s47Er1z1ZK/dZ5MLMxhBKr4LxpZlX8T173Ou3toeGhtKW6BLRMs9QzG5AsrzS0Q0Lf
	 QFe7Kjs/RMr+VZ8MGc3obGS3FwVHC2bo+WNzWh50=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEaTkr030349
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 09:36:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 09:36:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 09:36:29 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LEaSsx074451;
	Mon, 21 Apr 2025 09:36:28 -0500
Message-ID: <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
Date: Mon, 21 Apr 2025 09:36:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_073635_345605_4102562F 
X-CRM114-Status: GOOD (  17.67  )
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

On 4/19/25 10:00 AM, Kumar, Udit wrote:
> 
> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
>> for eMMC. This change is necessary since DM is not implementing the
>> correct procedure to switch PLL clock source for eMMC and we have a
>> non-glich-free mux. To remove any potential issues, lets switch back to
>> the defaults.
> 
> IMO, we need to fix DM  if not then documentation [0] .

DM cannot be fixed for only one IP and documentation says what clock
parents are supported, it does not have to say what are the issues
that come with using a specific clock parent.

> 
> Then only this patch is ok because as per document [0]
> 
> removed clock by this patch is valid parent for eMMC.

The clock parent currently set is a valid parent, but we have non-
glitch-free muxes and to avoid any potential issues with these, we
should switch back to the defaults. It seems like we randomly switched
from the default for no good reason and it has been copy paste per
platforms since then, so we are switching back to the defaults now.

~ Judith

> 
> [0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html
> 
> Thanks
> 
> Udit
> 
>>
>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral 
>> nodes")
>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 
>> instance")
>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>   3 files changed, 6 deletions(-)
>>
>> [..]


