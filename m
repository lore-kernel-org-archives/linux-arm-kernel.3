Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E7AC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB/b1UwOtaJbSu+Pxa91MlG9Tvt3hYteyZAnxyw6gmc=; b=Xbdt+42hMeXvPHEsrnISCkLBbh
	lPOTn/C61Dd0bd9AHEpB3RlSYwwR2sip9Rb1JlB9kQVPrVsEKdR/vkiOMAb8PNQp/NR3mJZbW5eDc
	8Fr2qEgq4B31hfDn6uNSzVCuPbP6fasl5d2K3jc4ko5jHrAVj7O1VKLFcq5EWXn8EhuWvIABm2md3
	JYozGNs5Ls0AQCZx+0mFbFVLiEOmjnJxqwKo2wWWn2ZkNgBSplYq6qqAvGeHBDCt/R/TJ2qMF3fjV
	hZlbm87jHfHc+794LiOF+AzXpeOo0WNupmJNYEvt2mL2zY+wVh3Mly2J/refec/ye1+2qYvtIlF22
	wxJ9T0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmALl-00000009VCA-1tXu;
	Tue, 21 Jul 2026 13:17:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmALj-00000009VB4-15pa;
	Tue, 21 Jul 2026 13:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784639846;
	bh=R8nUNIgTuASw0mfyVytVdcuNkU/oD+Zh6pHVC1/b5gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qK7Pv3RBLBhBo2vXcfS4EkPcVoUCSfA4JqVkzR/9Ib1xqM2AxDJoHQ15tq2wzHm11
	 ZHEtoLUhjleO+j8oT1eUc8eI99pA17FCnIOIK2YeKpvQXGkvs7A+iRBrbWO7kxXHDk
	 2levvTtJb3tPEuL+vwoolSyewp6C1ofupQdCh8HbPgRb9mXvRFt2GrtKlJA11qNep3
	 pFeMABjGE04bSdUlr2d2DZ63r64ulGe9mgfRululaRhOxWedlZQBIqgkniO8ZV3x/B
	 0g3wc8qJV+5usCHYbHQnLsN4xsxwvST1hm1QYahG4NviKlB/HBsyiQo1ESXRjZSBmI
	 F7k7l6CotV8wA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F23EE17E0910;
	Tue, 21 Jul 2026 15:17:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
References: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
Subject: Re: [PATCH 0/3] Mediatek Genio EVK: add MT6365 PMIC supplies
Message-Id: <178463984593.189936.14763316551159324622.b4-ty@b4>
Date: Tue, 21 Jul 2026 15:17:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_061731_454911_8B08E9B1 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon, 01 Jun 2026 16:15:44 +0200, Louis-Alexis Eyraud wrote:
> Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
> SoC, integrate the MT6365 PMIC, that is a MT6359P variant.
> 
> This PMIC dt-bindings for recently gained property definitions for the
> power inputs for its various buck and LDO regulators ([1]).
> 
> The goal of this series is to add the supplies for this PMIC regulators
> in the following board devicetrees:
> - MTK Genio 510-EVK
> - MTK Genio 700-EVK
> - MTK Genio 1200-EVK
> - Radxa NIO-12L
> 
> [...]

Applied to v7.2-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8390-genio-common: Add MT6365 PMIC supplies
      commit: 917b5c98d768a47daff91f2d21a000bc3e24a7a4
[2/3] arm64: dts: mediatek: mt8395-genio-common: Add MT6365 PMIC supplies
      commit: cc90ec9b892061a3e4dbd4e944e18a81758da2ff
[3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365 PMIC supplies
      commit: 759e989b840b4c2ffdb74cf1e1da0cee66e89f4c

Cheers,
Angelo



