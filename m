Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB42C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 04:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCR9027wx+fa73a2CKan1hN/qQLJy2DiiVy5PdCfoiA=; b=AnxLTdiN95e84RqLl2kKgW0mzQ
	vELTXTCNGiasLBAKreu7U0JRTKfchFrhTi3YqgMzTu8MJ3Rm1CP+HC/iErF0WuDDpKsUXyeEy6cxu
	KObGW6qK+oCO5hy6CkbIqcEHaL/+tTudAAZdkcaBgvv3lEIMqvfWVCvXvhy65uEkVVEMwMW8q9bGA
	OarjycVnl9MzcFvAZlhRLOAQu8h6US54f9/p/+H0ru6iBWNwVoQXYz+QsMraPKf/2KFZWU+0m+8Y0
	ROCIt+I+cOllj72gyDJcx/Reog4lSSxK9Zw14/zlZVRvaDL9Ph7fJ/bsa+Vh5JSNcRJrxyZubFj7y
	iseZNCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u74yN-00000005loU-3VY2;
	Tue, 22 Apr 2025 04:11:03 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u74wT-00000005lXI-2ed0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 04:09:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M490q01109644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 23:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745294940;
	bh=TCR9027wx+fa73a2CKan1hN/qQLJy2DiiVy5PdCfoiA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BnM8LZdeBhUvDtAJfzRmKJQzxmgTosYauVK1tXkeBXgkmLgDJ+IcgNZv9NgPYJcuv
	 VF73WhOTjixI19/obkdmQ0C8UbErGX3CuMEz1VE70CogcA/WDkr3hl5dJZgsERA4Tx
	 k7svP7MPvz2hM9Mle51oD7gTH2q7/iFfn4W4fkd4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M490lB006551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 23:09:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 23:09:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 23:09:00 -0500
Received: from [172.24.18.98] (lt5cd2489kgj.dhcp.ti.com [172.24.18.98])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M48udu066347;
	Mon, 21 Apr 2025 23:08:57 -0500
Message-ID: <6ae233c8-6401-4aba-b0f2-55468d375721@ti.com>
Date: Tue, 22 Apr 2025 09:38:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_210905_864463_AA0E44AC 
X-CRM114-Status: GOOD (  19.33  )
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

Thanks Judith

On 4/21/2025 8:06 PM, Judith Mendez wrote:
> Hi Udit,
>
> On 4/19/25 10:00 AM, Kumar, Udit wrote:
>>
>> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>>> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
>>> for eMMC. This change is necessary since DM is not implementing the
>>> correct procedure to switch PLL clock source for eMMC and we have a
>>> non-glich-free mux. To remove any potential issues, lets switch back to
>>> the defaults.
>>
>> IMO, we need to fix DM  if not then documentation [0] .
>
> DM cannot be fixed for only one IP and documentation says what clock
> parents are supported, it does not have to say what are the issues
> that come with using a specific clock parent.
>
>>
>> Then only this patch is ok because as per document [0]
>>
>> removed clock by this patch is valid parent for eMMC.
>
> The clock parent currently set is a valid parent, but we have non-
> glitch-free muxes and to avoid any potential issues with these, we
> should switch back to the defaults. It seems like we randomly switched
> from the default for no good reason and it has been copy paste per
> platforms since then, so we are switching back to the defaults now.
>
So, if you are saying parent 
3(DEV_MMCSD0_EMMCSS_XIN_CLK_PARENT_POSTDIV4_16FF_MAIN_0_HSDIVOUT5_CLK)
and 
4(DEV_MMCSD0_EMMCSS_XIN_CLK_PARENT_HSDIV4_16FFT_MAIN_2_HSDIVOUT2_CLK) 
can produce a glitch while
clock selection then we should document that in clocking section,
and with note, what care to be taken when above are selected as parent.
Thanks
Udit
> ~ Judith
>
>>
>> [0] 
>> https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html
>>
>> Thanks
>>
>> Udit
>>
>>>
>>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral 
>>> nodes")
>>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 
>>> instance")
>>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more 
>>> IPs")
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>>   3 files changed, 6 deletions(-)
>>>
>>> [..]
>

