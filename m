Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1E4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cXUi0aE0SCiT0sciUIn+4zCGK06tAj725xJIiKCIoI=; b=XOYIDdgSs5xRAoBTIvl92RtRsR
	mEAYaT/Rm6GG654fpU9uwHby43kV+oZ0jKH59id0rUP00D/6L9HBhI2s881oxFo3nlrpFTZ4LIwOK
	n8PvIovPIKzZcQaQgPtyOoboWpM2ClZg1qopCX5EGyn7USOGbR9iv52fvLm1BWSojPnq0QFcegilQ
	bjWrzWXcgeq8PZJ74V2BW70btp0MXTVMI4wk8EChuNxFWyqv8jkPb1heYtP7bMQGoJ31th4LH7l7B
	KULloPOjc2Yw/QXNPc6AJozostFhusv2GAru0jrM26fmGnapgamKD6kBk875mDN5Scfx68jJwmYRF
	qdQDmh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvge-0000000Aj16-46Mx;
	Tue, 10 Dec 2024 08:33:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbV-0000000Ahpp-2U4W;
	Tue, 10 Dec 2024 08:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819304;
	bh=HRLZCOLXzZDLz3g8rQ8lNljlgFguHhxc0j2pbJ/KQvM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kllvcoB4HA+uUXNH0OGc6bR9zZNvt8hneDdEAMCoHhKh5TfNgorEbbKEtIxvma8cw
	 ppDdSpcYynaPGzy99PiwbHu/enDy/I0EgTuyMefbsSREEEbcz9nN0hMO0NT/nkW0Zt
	 KZ8EsGlFWFx5kKHrrL/0t6rTmw0o67mEKVKStoIVhoIMI4Wl276ZC/llWbWrLDP32c
	 REWGyF2eF3fNKOCDCKII+UBdjwSZqrR4rE5Mu6W6R/y6IOTA8adccNcwHHnb8BB1zM
	 RmelxwDSGtD97eYbon4uCoZEteE0gotZljy4rR58o9AG06kYiGWptSfSl7VM6EPtNT
	 SKHWTuEE1H02A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1A4117E1543;
	Tue, 10 Dec 2024 09:28:23 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241204190524.21862-1-val@packett.cool>
References: <20241204190524.21862-1-val@packett.cool>
Subject: Re: (subset) [PATCH 0/5] MT8516/MT8167 dtsi fixes
Message-Id: <173381930371.18469.6086866397447453685.b4-ty@collabora.com>
Date: Tue, 10 Dec 2024 09:28:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002825_775961_D02B8671 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On Wed, 04 Dec 2024 16:05:03 -0300, Val Packett wrote:
> I've been working on mainline bringup on an MT8167 tablet I found at a
> junkyard sale (lenovo,tb7304f) for postmarketOS :3
> 
> This first series consists of basic device tree fixes for the MT8516
> dtsi that the MT8167 one inherits from.
> 
> The changes that follow add support for the MT6392 PMIC, and that's
> mostly been implemented by Fabien Parent back in 2020 and not merged:
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/5] arm64: dts: mediatek: mt8516: fix GICv2 range
      commit: e3ee31e4409f051c021a30122f3c470f093a7386
[2/5] arm64: dts: mediatek: mt8516: fix wdt irq type
      commit: 03a80442030e7147391738fb6cbe5fa0b3b91bb1
[3/5] arm64: dts: mediatek: mt8516: add i2c clock-div property
      commit: eb72341fd92b7af510d236e5a8554d855ed38d3c
[4/5] arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
      commit: 2561c7d5d497b988deccc36fe5eac7fd50b937f8

Cheers,
Angelo



