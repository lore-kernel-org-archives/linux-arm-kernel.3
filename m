Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131CDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ5cl83cLGj3R08edsWekoKXBUx6VLHrojgsz62kMm4=; b=tj2eOTbhZPeK/Xkci9BTrRkQfN
	/IL5z5LAxQzJqyskLMkz2XODNaiv07tGbOKKvumNaSnQnSWK6zD9ahUrQtGRa+NErj7uB5m5VrG2L
	e4ZNMedj+CC6249Wx7KN+6mzsv00bAEOie+pQB5TW2ARH92E3XTlqpoFa1tYD33fZMsVSDRCfJZQp
	ZX5KSNmKyPUtTbJN2yvRA12JiPUqRFOJm7OyIR92x3rQsuWED3TAfCugPvg1YGsr74eknXsPPSzAC
	8jHhzXV+NUWSEp0YzMb2yV6SpblVVMKswUihPCO0K2NBJBMGwisZryPJSbhMrOyes2zrGtp+RxEoC
	I5vD4inA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOAK8-00000002PvT-1wfu;
	Sun, 08 Jun 2025 07:20:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOAI0-00000002Pr1-3HoA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 07:17:58 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5587Hie11734860;
	Sun, 8 Jun 2025 02:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749367064;
	bh=wZ5cl83cLGj3R08edsWekoKXBUx6VLHrojgsz62kMm4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iPfTy/NkX7N9/ieBuvPSlDwczGE92Vk1t1ojWjsPh0fFnnddqlG4PJ1scFHDzlDwB
	 chBCYjZ0MojgTCRBFAbpuRyXMDjt9hGQF63mTTmebCKlb/wuGxQPkm5HIFTY3ve2Ma
	 9lLKBNoTFC56WWSijHSac92zYkm+1wvG0uzxgW14=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5587HiZb3313839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 8 Jun 2025 02:17:44 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 8
 Jun 2025 02:17:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 8 Jun 2025 02:17:44 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5587He963701379;
	Sun, 8 Jun 2025 02:17:41 -0500
Message-ID: <51c56999-5f47-45fd-a4b2-4b79ecae0227@ti.com>
Date: Sun, 8 Jun 2025 12:47:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
References: <20250603042448.783956-1-u-kumar1@ti.com>
 <20250603160147.47orn74obh2lz3qm@rethink>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250603160147.47orn74obh2lz3qm@rethink>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_001756_967031_B05E208A 
X-CRM114-Status: GOOD (  10.49  )
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

Hello Nishanth

On 6/3/2025 9:31 PM, Nishanth Menon wrote:
> On 09:54-20250603, Udit Kumar wrote:
>> From: Bhavya Kapoor <b-kapoor@ti.com>
>>
>> This commit adds the assigned-clocks and assigned-clock-parents
>> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
>> property is set to reference the clock identified by
>> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
>> correct clock source.
>>
>> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
>> as the parent clock. This configuration is critical for establishing
>> the proper clocking hierarchy, enabling the UART device to function
>> reliably across different baud rates.
> Please fix the commit message - not clear what specifically in the clock
> hierarchy does permit the multiple baud rates.

need your advise here .

unlike other UART of main domain.  wkup_uart currently has two parents 
clock (clock-1 is at 96Mhz and clock-0 is at 19.2 Mhz).

By default, current fw selects clock-1 as parent.

Let me know, if explicitly we need to set parent as clock-1.

If yes then i will roll out v2 with current message , if no then please 
drop this patch

Thanks

Udit

>
>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> You need to add your SoB.
>> ---
>> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
> [..]

