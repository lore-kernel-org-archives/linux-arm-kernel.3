Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DB6C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBr6VkV85qxI/eaaoZQl1/8BXogm8ILkbKgicKhaQbE=; b=ZoYgSxRnc//ZVRm0UdssTGZz7V
	BDRW8WL3YHYZ++CKKn4OLsDfQkdlxDVbnINRC0QUvD8f1PH5U5SNesUALy6pt4DXfG2lOagcg1zBp
	rEVeXJgLhq4aRoh4o3aKuEvBwYKFnKCpz2kcHjtSA+l4ltlO5y4fdBxIYAheMR47gC+n/nD4VGaca
	iM/g5jAXpYxqhwc4x+7814zygH/E0zHa6ErmWHRLfy9hPdnUeBJ8Fk/GFaWaLxTzecvPq1kMwF8YG
	n6FZS38y1hrr5VQLbBJFXvZZISQtZRdTuqRA/9uIqwIpN67UJav6z8cuJCLiPfqv9Pq5sxeG2ZI/y
	I+7cH2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UN7-00000002I2x-2qfE;
	Fri, 04 Sep 2026 13:54:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UN6-00000002I2O-1pdS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:54:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3387B4064B;
	Fri,  4 Sep 2026 13:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BAA1F00A3F;
	Fri,  4 Sep 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530064;
	bh=WBr6VkV85qxI/eaaoZQl1/8BXogm8ILkbKgicKhaQbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DIy+NGL3PsMayLCrDWLRl7lxQEaR9TUzOlAmYm7P3HiGTeyrmYQKPtEYrKEuEwpsi
	 wGEa612IPundBT4fmCAafP2v3wW/FptVQZJgMuEsqAUw2VbHjGrvFU5Qi52+vf8OyX
	 r243hEoQgooig+fjU9jEg/DnsEystz8Eld7g2q21xJn8y804SkZBx0/IJt6H8ESmUr
	 +s/P3k5fShmBVPsF/vJ2v8xja6tLU5yy4EePTKBDJCBuSiceBk23QR14zS7kOWIif8
	 TaI6oAaAyQPZ0TkO+mLXLr/XkvWvwHnrzEpYB86dMKMHOV2z9ToJp1DybFrpoqSxLq
	 1gT15GYp2mDEw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Kevin Hilman <khilman@baylibre.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, Roger Quadros <rogerq@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
 imx@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH v3 0/7] ARM: dts: Replace clock-frequency in
 camera sensor nodes
Message-Id: <178853005570.24079.11001651675507374897.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:54:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Mon, 10 Aug 2026 21:05:57 +0300, Laurent Pinchart wrote:
> This patch series contains the leftovers from "[PATCH v2 00/72] media:
> i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
> DT changes for ARM platforms were postponed to the next kernel release
> and ended up being forgotten.
> 
> To refresh everybody's memory, a large number of camera sensor drivers
> directly use the "clock-frequency" property to retrieve the effective or
> desired external clock rate. This is standard behaviour on ACPI
> platforms that don't implement MIPI DisCo for Imaging, but usage of the
> property has leaked to OF-based platforms, due to a combination of
> historical reasons (using "clock-frequency" was initially considered
> right until before the introduction of "assigned-clock-rates") and plain
> cargo-cult.
> 
> [...]

Applied, thanks!

[1/7] ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
      https://git.kernel.org/krzk/linux/c/449cb9bcbabf4f862ec8d0107587fbdfde357ee5
[2/7] ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
      https://git.kernel.org/krzk/linux/c/9d33825126bd8908037be997a9b4cfde92b9c5a1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


