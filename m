Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843B4C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHK5fj5it0ggRVVrfULe+Lej5VCoYyidNCvzJIBQips=; b=2RPUQl6kP7Bg8fAaBjCBllNIO9
	6JEI3gDDMg7YdWK+/XY28cqLu6ThbR4oe6iFF7Yhjcq0ZRACSKRJTudzhAtPJ5A7IrkeQ7a891btN
	IUZMqhcxXTS1YNigFMETq8ZYwGj4V3kP0VJtbPUDAxdqPyo6P6eUmE7p7/t4wEtOViHgEO63TxKMB
	km4+v4OqywLXvnlmA7R9T9fhqBXZyvTH0G3TxsNE9+4lI97J0Lk0QCPK0tpgm4AiRCi4Mss/jlgV/
	fA1hnXgpn9yoOUKtQlMWFJ+ciabZkx2xZSwknnSULarXdXmQ654MQ1alo7lP9eOJk0NU4qPtsAYVj
	jzpTejCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYinm-000000026JE-1PDr;
	Mon, 07 Jul 2025 10:10:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiIX-000000020XU-3Gey;
	Mon, 07 Jul 2025 09:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881084;
	bh=h8H2ZMHQHU30reUhzjHIqiH0k5eiT46TVB5gv9mUqJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bea3c/SOhVOgHzaDQmR7oqYDcUhYqiuoihorPngopx/G2Veq/CBe2ifsTQjB/GDZ0
	 6f/tvFnz+rsAHXoK2NIzqmUwMxa+GFTdhyYH2Qz1fN1w5KhhCetm7YgLA3U6RAKoY9
	 Jk/lsdBt/53mOGoU9Om9YTkb85yhp8MqhiLzhKkaw3eIOItEwHiNgBLG5apThxaQ9H
	 YUtXcEynTuCWliloJvgXERthcoV4EaIl8I8PoXfSXgilc2G/63ldZrubfdeBTLT4yt
	 grPcQao4VdSkmtE1ucrSfP/Wib5ptLTtffo9O22BHrMMSZpDd6pkhovz4DVIA6izcG
	 Ri+CSyY62Icug==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B073617E07C9;
	Mon,  7 Jul 2025 11:38:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
Subject: Re: (subset) [PATCH 0/3] Mediatek Genio EVKs: add MT6359 PMIC keys
 support
Message-Id: <175188108365.72331.6601193991511899828.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:38:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023805_966185_5AD51AD8 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, 03 Jul 2025 17:41:02 +0200, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the MT6359 PMIC keys (Power and Home)
> that can be found on the Mediatek Genio 510, 700 and 1200 EVK boards
> by:
> - adding the MT6359 SoC support in the mtk-pmic-keys driver
> - completing the existing definitions (only the Power key
>   support was present) in Genio 510/700 EVK board common
>   devicetree include file (mt8390-genio-common.dtsi)
> - add the needed definitions in Genio 1200 EVK board devicetree
>   (mt8395-genio-1200-evk.dts)
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8390-genio-common: Add Home MT6359 PMIC key support
      commit: cf0cdde64b3246aca28961ec169ba1c5e9295d8d
[3/3] arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support
      commit: a9b906f15995e18b700a7e7791865ecf2f1cee65

Cheers,
Angelo



