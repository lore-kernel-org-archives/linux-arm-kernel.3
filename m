Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EDDEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofGVsD+0y9IyAQN5kTJHdEKS4RRA+QdEPBxusS+y7tA=; b=s9HkEtd5b2LAC1UFkD7QXc0tKN
	1RmLwvTeklMSfwA3csFLGX7ugt6jK4VZwF2nXlUSquRflP5SbunFqap+9ukc0v0gMIAhsEcI2HvIH
	ygFj/UsVdE3uec2/+c78SmQaHOA3lRj958BgviJIaINGppiuzHUupSdR3ao1KCha7Wd2032aCH9xz
	dKyISqaM/YVUCxbDbCNdb+ddBW52dyLJtmSnUXb5n4Kxzzp5FRRiY4lRe7kYo4KmP7WoanMk0k1oy
	i8Rp31EwR3LiiwAoeiPFqHiglPy217oiOygW0+iaaLruu+5kQJd9jxY80CyjygwMUvT5+unChJ+CQ
	U4tVKq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoo2-00000001lWN-0fRT;
	Tue, 24 Feb 2026 09:34:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuonr-00000001lOn-3DCS;
	Tue, 24 Feb 2026 09:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771925641;
	bh=T2apQorXFL/CfNepfTu/gWcSREoPjaSTYbtBLt0lHhI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DLI/UIIs+DtIpri6X+c1kaUkaN1DMnlbHxpNEuLr0rrZSLLk1PdZmjCmbaSd9AjcQ
	 Ktpmmg61L/PaH/Bmm2Geh0HlPbbnXPFLoDkUlpAPxVFkchnuOcRsiYuz456qUv/4Oo
	 T5QLfVsXNXsph1Le8DoN+lJM49h4oB2Pbr+yJkE7PcI+2a399OZ99wF3MBtFh0iOVT
	 h4IbhuWiNF6CunLgltV7rZyCN7aTl4+3xZtBrVAHDtNrVf5V8jc2BExBKDwbUhsYSz
	 AsL/riic+/gjY6nz6/LVBKAvEz7HWhduscRd8pd5PcjKWjGGurlEQ6WaJckgObvcCf
	 DyeT8cNSiD9tA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 037AC17E0C21;
	Tue, 24 Feb 2026 10:34:00 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: mediatek: mt6359: give
 regulators unique names
Message-Id: <177192564097.11826.16624284759603222093.b4-ty@collabora.com>
Date: Tue, 24 Feb 2026 10:34:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013403_952980_89112182 
X-CRM114-Status: UNSURE (   8.33  )
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

On Thu, 19 Feb 2026 16:55:28 -0600, David Lechner wrote:
> While working on this regulator in U-Boot, I noticed that the regulator
> names were not unique. This is considered an error in U-Boot and we get
> the following error messages:
> 
> mt6359_regulator ldo_vrfck_1: 'regulator-name' has nonunique value: 'vrfck
> mt6359_regulator ldo_vemc_1: 'regulator-name' has nonunique value: 'vemc
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt6359: give regulators unique names
      commit: d91639d0ab3223b61c00442021dc639c9ddc2b76

Cheers,
Angelo



