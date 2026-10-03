Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEEDCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BuU7jC4i69chPY01RNYqlbIN9dzYHsP3HeLG1L5754=; b=TWtMZWERk2ScLuIOn5LSm5Ljtk
	raDpiIX2qTl4HpI0YwFcMd90Lr+Vfq5zimsRb0O4IzuYirLAJnG36gSfI3gLfhdPsSc+NB6PDvuu4
	RP68xEVxDO6qCvhZV3fVpLQkMgTutfosWesRpTaAoiOsAd9JZdIRViJNOgV5qYc7fZKIqYmGWKPDm
	EWn/a/Fuu8AsvCU6mc94k1DCkqskU0QuaLa4R1tgSK51s9Z4gLtZ1GslRHDXs9j8q4iHyCm5gNlnr
	09KNfDXNuGUZD+03GUtAZZZCsgNrHzmrZSLCsUWQWOlSUp3GjjeHKDZc2/dR3Uuo7Gx/o1gMCI9Yw
	0yUF36xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD6g1-0000000E25X-1Hqd;
	Sat, 03 Oct 2026 20:49:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD6fz-0000000E25J-29xD;
	Sat, 03 Oct 2026 20:49:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D17114027E;
	Sat,  3 Oct 2026 20:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9AA1F0089B;
	Sat,  3 Oct 2026 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791060586;
	bh=1BuU7jC4i69chPY01RNYqlbIN9dzYHsP3HeLG1L5754=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GM3ziYP9DJpdpqyZUdsiOItfTiwlDIV53YabQDxNKLKY6JpkOms/6aC9WNsXAc85A
	 ijv6PbGX04i93Vu8W0mWkMuzDrJpy+A1k58fCuYuwqbgsxIMrZQ64rlQGukUtbZrnX
	 KX1mUDuQ2BNtOKdU5C1ZsI5QhzeGYH0C8cQbVQrUur3uMLkDBzcotnk4sdPuo7GZkl
	 HrJs6d9bGceDMMIuCx2eJ/5UaYb2NyYfnodkBJ6lF/tChW7qqXp+Fugy5vS58zJQeu
	 plRpQUFpk709ZQbPlv805TmwWB2rSIGtr3yAkC/YMZlXzyLErCI3W5um9I88z1yL2E
	 e/EYllVn/5DLA==
From: Vinod Koul <vkoul@kernel.org>
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
Subject: Re: [PATCH 0/2] phy: mediatek: xsphy: add eUSB2 repeater support
 for USB2 ports
Message-Id: <179106058316.240943.4391434773392918237.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 22:49:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 26 Aug 2026 14:38:34 +0200, Julien Massot wrote:
> Some USB2 PHY ports are connected to an external eUSB2 repeater chip
> that sits between the PHY and the USB connector. To support such
> configurations, this series adds an optional phys property to the
> MediaTek xsphy port sub-node and integrates the repeater into the USB2
> PHY init, exit and mode handling.
> 
> The binding follows the same pattern as the Synopsys eUSB2 PHY, which
> already uses a phys property at the sub-node level to reference an
> external repeater. The driver change similarly manages the repeater PHY
> alongside the MediaTek USB2 PHY.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,xsphy: add optional repeater phys property
      commit: e95b476302852ac1fb5bffaa824ac2cd35178e58
[2/2] phy: mediatek: xsphy: add optional repeater support for USB2 ports
      commit: bda1af7b177a94f6d169f0b359c61e7a7d39a36e

Best regards,
-- 
~Vinod



