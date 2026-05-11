Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F69BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzkP1cbo3uhDiI8RTWfPuOLr+m/6pu1/TS22Ej5vuK4=; b=IEExgN85xpzFuUVgpTTx/aWUyv
	qC05rdm89t7/OZG19OMEjHgqvmHs3PgPYy8Oy1KkAlLso+Qa6pprTeadQClHA+BFhXsyvmhI2Dq2E
	jBNKyZvJo/e6qy+YPAkSxBRXv4Zh+Pe0m0kRGFapSgKaX1QoJ/qolu+AeKYYvzbZ9scRXa568ZIKZ
	BIj3ptMwsfpC00DaDjQe3yXn9F2Q9GseI9CuwzgVT8uBfp0Y81FQpWV/UHPLk9FOFmC6w587qXuBL
	PCSdIIqswZwjA8U/FSACukEf/cSk7L05dDLx2xuL9qSQUqDJHv+g/z8WlalAsCyqweK8oCtrXnvuc
	+g+c05mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4D-0000000Cx0n-3xVK;
	Mon, 11 May 2026 09:36:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN45-0000000Cww8-0Oe5;
	Mon, 11 May 2026 09:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492198;
	bh=nJVhaxXXmDzSLSMXB0xDuXEWi+DbP7+9iPgK6noFTxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BMQtbLmtYmzRVJQj0ueFEwb9UqXJwYhbuP8LgxRTDoc3mLRVdxPPzO5mPXcDPCgb4
	 juEZHmA5wZnRq1K+EWjF5DYmIRYq/WeCO91Rx1dyIeh2X3AGC89xWx06f8oPk7R6eF
	 YJXpCcfGKaMV++I8VjUu8M0HL18amlSXpHx1cftNojRa/ehk3SdB0nlLzaWTaTyH6n
	 BgR5d/1AF2Kpv1BSQklkArpOOR6RS+ZswH7mkrDUOtCHBLuB0VLbdtCS802JQHoZuo
	 A7BRO7PWms7rc/cMugvhtHfbn3D9OsnBKcX5LtMJ0+KrPWg7jOwsTxoVWpMKKPSW2x
	 DcLC+2GZiAS0g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18B2E17E139E;
	Mon, 11 May 2026 11:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
Subject: Re: (subset) [PATCH 0/3] Mediatek Genio 1200-EVK: MT6315/MT6360
 PMIC regulator supply cleanup
Message-Id: <177849219804.115964.16914242540907037927.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023641_310165_FD2800BE 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, 14 Apr 2026 13:44:09 +0200, Louis-Alexis Eyraud wrote:
> This series goal is to cleanup the power supplies of MT6315 and MT6360
> PMIC regulators, that are either missing or incorrect in the Mediatek
> Genio 1200-EVK board devicetree.
> 
> Patch 1 completes the MT6360 dt-bindings by adding the missing power
> supply descriptions for its buck regulators, that already handled by
> the mt6360 regulator driver.
> Patch 2 adds for the board the MT6315 regulator supply properties, that
> were added in the dt-bindings by [1].
> Patch 3 adds for the board the MT6360 regulator supply properties and
> fixes the existing one.
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      commit: 96d997e13892479b5bb852e42ac65bbaef86ba9a
[3/3] arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies
      commit: 2585bab2cdf4331068c5bf626f6625c38c8d299e

Cheers,
Angelo



