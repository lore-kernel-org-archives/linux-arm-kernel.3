Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E6C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+791UBzYyUhwHKOv7tOfFKyXATi5fExIF34q7nX4QA4=; b=mvA+VWmX5DhUkQV/GI0erwklbn
	s/aAB/xnvfkUCTkHraRC2+3vF0ZFpTvbnkO6nseT/TNHEdFyBK75asUJ7yLKBUcXaYr3I9Pjf4kGf
	E9vvXEyUVYQqVmECTgNk6qoSTMck6246xSyIfEcQvfI2PWC+GL/qgtxr3SHCrqY80dgze+XrGHR2D
	s1j3k442au9Q2ghtvqpB/WP5JZOEkownDpKOEb8q4BnmIojng3y86+CFq7PARiIZIoEOvCjOA+dly
	nx9N1shuqodqMOiRkj+vpzF7DEVAJrz/zal3QsYN0T83pMxv47Lx+7jHMn5DqVRhx0pFFBCayY3X9
	11PCFYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4esh-0000000ETVw-3Eae;
	Thu, 10 Sep 2026 13:31:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4esd-0000000ETTe-3BrT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:31:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAF2153B;
	Thu, 10 Sep 2026 06:31:48 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7201E3F528;
	Thu, 10 Sep 2026 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047112; bh=q2y1E+jfz+e2loPgk5uTMKvJJpPn2qFQADreOTA75TE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LH9up4Du6y4lg3MG2LYVykgQw0LKCGzFD7zHgyyrJrMa0ENvf0EYwGNnyn2inXtKw
	 jPfnW+q+TLHjAisKlgb1xbRyeNUguD1docHILvcFytT8kkTNw1e1N0AYWs7+xTAP1m
	 +tGr4x8OHatjQ5Kj1/wEKH3r9C8hDRgVcnc8z/2M=
Message-ID: <82b2541c-ea6b-41d0-89b1-ecf9a9920cd9@arm.com>
Date: Thu, 10 Sep 2026 15:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible
 string
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-9-andre.przywara@arm.com>
 <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063155_841669_0EED16A0 
X-CRM114-Status: GOOD (  18.58  )
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

Hi Julian,

I know this email is almost comically old, but still didn't want this 
left unanswered before sending a new revision:

On 8/24/25 01:09, Julian Calaby wrote:
> Hi Andre,
> 
> On Thu, Aug 21, 2025 at 10:46 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The secondary Allwinner A733 pincontroller ("-r") is interestingly not
>> using the same new MMIO frame layout as the main controller, but is in
>> fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
>> each. From the driver's perspective, this is all we care about, so we can
>> re-use the a523-r pinctrl driver for the a733-r, too.
>>
>> The individual pinmux settings are different, so we must not use the
>> a523-r compatible string as a fallback, but we can surely let the same
>> driver care for both the a523-r and a733-r IP, as the pinmux values will
>> be provided by the DT.
> 
> If the bank and pin counts are the same and the pinmux values are
> provided by the DT, that means they _are_ compatible, right?

I wouldn't say so: I would argue the devices are different, and not 
necessarily every driver written for the old device can cope with the 
new one. For instance U-Boot still goes with hardcoded pinmux tables 
(because that's simpler to implement there), which don't match between 
A523-R and A733-R.
And I would see a point if that would enable old kernels to use that new 
SoC, but because the main pinctrl is different anyway, that doesn't help us.

But it's not a very strong opinion, so if the maintainers disagree with 
me, I am happy to change that.

Cheers,
Andre


