Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649CFD11184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNo2/9XxLj76NFFNAw5IPKpzYJ7DMZToyMamPUQ83A4=; b=gi/VV+JiwkBrQbGzRlBmB94KYp
	9Gf6sdiPXYAsspqWZrxJe+4PxAW9IRwkKV45EK9iGB60fSibzJhEMnLFW3MOiAz2YCH2YvtTzxGJW
	aeJvGglXLJtJO5a2TtqLGZ1XIYYvWR/iojHZ59AbPSmULMGmInu601+P5NkGSjwiPC9y+c+Szcp/H
	XPI9r47fqGp0JyQX7LC4aTfB8NLUMXOVQoV2h1T1RLk0TczbaZHgThSkZChZxZaw27asQRcIS/Hy5
	Y7ENyj/WUGMTFctV+PUYjGtcxvUX+6antUMVo5u7a7C4MDR1kWViqX2YGn6KXt6fqUcw5lLeAcCEX
	47aAJ7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOHR-0000000FjKg-0Yde;
	Wed, 26 Nov 2025 22:46:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOHP-0000000FjK6-0Mzd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAD2B41967;
	Wed, 26 Nov 2025 22:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C91C4CEF7;
	Wed, 26 Nov 2025 22:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764197189;
	bh=mpEgD7T+cSmzwIvW7UnTNgT/3UN7QoNuldwzSnsc2HQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=syayuq003B1hcNtLi7XKLgfkbkpv/Kp4m008QzM5IfJYeIoj0X187jotHnrw8BH8r
	 K2AsNyyel45bff58zaTtmJCEE/z4YNwcwYCZekfLiIJ9G+sVMcBMhg+fcjyAWlNjdG
	 3if1NVNo/R7+L7SzZZTUapkp7vhabn7YM+VCTzIQt5r08IOs5e7uUkh0s+afHf5D7n
	 D0WvcY7/JrXdMXK4PiYiMRi8h442VXVuIpXigl8w4KKXOEgdfco2StDFAmZKSDh+Og
	 dP4K/EMlQNk8QDuY/G2sbkH0raPB9blpXbpxCnMOnsO2kUKVOWZ2aqNnXqnxWjTEdT
	 Krj8Zubrg9PTQ==
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Nov 2025 16:46:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
To: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
Message-Id: <176419714377.2726224.15005423904347214785.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add support for exynos5250-manta (Google Nexus
 10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_144631_168068_7187FBD9 
X-CRM114-Status: GOOD (  25.99  )
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


On Tue, 25 Nov 2025 16:12:39 +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The notification led driver (as3668) is already
> (tho not applied) in the kernel mailing list and can be found here:
> https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/
> 
> The first two patches add the necessary device tree files and
> bindings, while the last patch makes a small modification to
> allow CPU1 to boot, as it requires a call to it's underlying firmware.
> 
> This first iteration only provides basic support to get the board
> up and running and usable via UART and with WiFi support. We will upstream additional
> features in future patches. All patches have been tested on real hardware.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
> Alexandre Marquet (3):
>       dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
>       ARM: dts: exynos: Add Google Manta (Nexus 10)
>       ARM: samsung: exynos5250: Allow CPU1 to boot
> 
>  .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
>  arch/arm/boot/dts/samsung/Makefile                 |   1 +
>  arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 516 +++++++++++++++++++++
>  arch/arm/mach-exynos/firmware.c                    |   4 +-
>  4 files changed, 520 insertions(+), 2 deletions(-)
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251125-google-manta-79545e179d10
> 
> Best regards,
> --
> Lukas Timmermann <linux@timmermann.space>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: 6a23ae0a96a600d1d12557add110e0bb6e32730c (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/samsung/' for 20251125-google-manta-v2-0-0f097cfff39c@timmermann.space:

arch/arm/boot/dts/samsung/exynos5250-manta.dtb: /soc/i2c@12c70000/led-controller@42: failed to match any schema with compatible: ['ams,as3668']
arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clock-names: ['rtc'] is too short
	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml
arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clocks: [[2, 337]] is too short
	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml






