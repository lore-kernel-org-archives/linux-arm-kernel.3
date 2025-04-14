Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95CEC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoqXrtJBdP+wl7piwv+xJnM7uthmTaWpxUyS8wptGUw=; b=AjB4h2UoLgtdunuC657l1qy41v
	WoOabmlaOeTMppjPoWGCDQXrp5gwSILh+eNxBA0RqNM5ijW3yesrRs4aZgiQJMLbCkiSl4zp8rEGi
	OYfTZ9N2moXPfauFc+wyimfBwzszDGfb6rvS/bW7eW4u98ovKsuUAXs++gWlaI1NCFW6w7mPYUXsB
	PLArRJaKgHBYBOhyUF+IcEKZT5GP1so0W6+Vt+VXvNRIKWkZtNzIDVoXIyENvw5po6Dhho3bSWYjk
	oNKIYI7AHeL+jHTP5fV5sGEpAwKfB4hf8M/6iVsfKEDoxXRWzqOvgo/XKNhyFjZFhM5YsX1xvp7Tk
	3uoagmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Pqp-00000003ONz-3JFH;
	Mon, 14 Apr 2025 19:52:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Pow-00000003OFP-3vOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 19:50:20 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3121125DAC;
	Mon, 14 Apr 2025 21:50:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9FkhobHa6Ut; Mon, 14 Apr 2025 21:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744660210; bh=dcR7kDT88f2BjMAzrV0CEFOH3VQYsiVxkmdWN9CU5NM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=R/qqRnXA/7LIcaoUZcttO7OYB2QWkbzAUYtZVZ0RCtvMPFukx1KCicdSN42BdMyWl
	 PPadXTuvAiQOE4UWFuTs8iS3WqcG3CAg7nzbe/YoGDN7k8Ke9kWWUCviGa0Nawpgja
	 F4adTiq8pct/uJkvEBJ/s6acYH3R5UmwquYLw2hkn+nS0ZfJxGM0slDRIWNgCm4Nqi
	 wqRyNqplFO9CXGfNv1qP8z2wtwvA3zo+kehpIe1nuizRK0+S69RlsBlo/2gXAo8DGZ
	 mgCzRsHmaOxHfsqTn7jTCxH7OItjfUUE7XT9408HAI76z9ZYiWZ6tUKNLDVp8H2Flz
	 A726QuDyBy9cw==
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 19:50:10 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, devicetree@vger.kernel.org, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, linux-arm-kernel@lists.infradead.org, Kees
 Cook <kees@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Tony Luck
 <tony.luck@intel.com>, linux-hardening@vger.kernel.org, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v6 0/5] Add support for the Exynos7870 SoC, along with
 three devices
In-Reply-To: <174463433283.154575.16025374701126076484.robh@kernel.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
 <174463433283.154575.16025374701126076484.robh@kernel.org>
Message-ID: <524e47208a69616d700642857d37bd57@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_125019_392389_727636C9 
X-CRM114-Status: GOOD (  13.93  )
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

On 2025-04-14 12:42, Rob Herring (Arm) wrote:
[...]
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250414-exynos7870-v6-0-039bd5385411@disroot.org:
> 
> arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']
> arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']
> arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']

Note: These have been accepted and are currently residing in vkoul/phy.

