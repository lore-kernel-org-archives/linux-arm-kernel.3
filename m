Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6135CF8DFFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntz/oKTV3YCcdhi0idjBTJxGMsRA7Je4Bb5Q2/ho+pI=; b=2fea1ionobw8PclsOzoIIDnDJD
	RtQNt/tj3ylkB6VU1QtSrmw9sj0XYtfHlVzEzXaJoCc5I7So63Xa/xKpAC1IuCpa7jhF2nBsMcr1w
	XcAt5Rbf026KlXpVhV+KUPD4mHm7l2mZUKS5PT8WuTHmOZ1p3WGIow4kEcsvaSiVF5V/SugzDJksY
	HelhZMux0nQcv2B0xTb7/MSAM4FfohYB15IAG4+KnQoCbo3Vf0o3Y/sPu5ThGGvFgs57vc7H+dhHK
	Ks5HiUBOmPl2YPNFBqS/Pgv/1GOI0XpVPFuVRHuMGIrbdN46h1Fy2tF+v4MRrKsFhVL7dK2/1IO2L
	xgxwroSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnPY-00000004L9e-3Byw;
	Fri, 17 Apr 2026 17:55:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnPW-00000004L9B-1adC;
	Fri, 17 Apr 2026 17:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776448518;
	bh=Q/GzuWIQEHuvkg9yZh9vcQC8AxPXoccLErnZodAciHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ud7SICimNN1HnVxsVZ3WfMCv8BI5OB7UvQ9beJebQtQmpu+coTXWZz8u7N0GISF5O
	 Oxdrr9Eczp15S4lJpmFXUQU2OZ15f43hE3z/CvimwKyeySfmkLQAlYYlUvKC0RUUes
	 mu7PLc6arQL9Um1iQErLyMZke9U2PRElA9D9fddK792XireuYepTaVW+5EyUfTM7tf
	 2PYtNFlkW6fwEIOUWFstvW2mXmVXhfWZ4VYzPKTlGAYavKcM8RMrcNU0rruRYJT1X7
	 yjc5xpzNKjI5rGsHXqSnYgMXQ13OjkCSv/BDX096cBXQHqEizTRnGJ/zALBlESGop1
	 X6cTELVcasb0Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67BBC17E131F;
	Fri, 17 Apr 2026 19:55:18 +0200 (CEST)
Message-ID: <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
Date: Fri, 17 Apr 2026 20:55:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2297365.1BCLMh4Saa@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2297365.1BCLMh4Saa@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_105522_630414_268DC8B1 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Heiko,

On 4/17/26 2:34 PM, Heiko Stuebner wrote:
> Hi Cristan,
> 
> Am Freitag, 17. April 2026, 11:24:34 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
> 
> [...]
> 
>> Cristian Ciocaltea (40):
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dshanpi-a1
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
> 
> I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
> sense, because these patches really are mostly identical :-)

Yeah, apologies for the large number of patches, I went this way to allow
per-board reviews.  As previously noted, I tried to identify the GPIO pins from
multiple sources, so I'm not entirely sure about the accuracy in every case.

Would it be preferable to squash the patches per SoC and board vendor, instead?

Thanks,
Cristian

