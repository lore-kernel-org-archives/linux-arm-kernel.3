Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FC9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL0ahKHpf9ACh+d0cvaqcwnoJdIKRiqLgLV8f1UErxE=; b=xBW+JtogAxI750Ujr5yeYbzfRF
	qXUu6ovCdE3bf4MiHYZD03NE5oag341i9DQjp7w6obH3xlQiWLjEOwgdFq4u3BWZml6mWT+nc8vvV
	V/vhxdyIbQs8a03EGSPQOVvzyvKub4NA3nBrrQ6/ThE7tV0lvu8Cm5bQNEqgDAJm+vqdAdmIovYDE
	A8yknXtTD3ql0LlwhX4rZtQ/TZC9xaJUvRH2+qmiu81K+7QvyYfGjEHEMg53cqZ321OFwF+jdO1Jc
	TsuHUHdFImYjcuCjh+wWFi5YA26cmE1Ww/tTm/VOhd4Ez0ue+chj9dVhaIbcf34OFR3Q+7hv4keD6
	t/Zik5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAk0-000000078uz-2vDF;
	Wed, 12 Feb 2025 11:17:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAia-000000078bZ-24vp;
	Wed, 12 Feb 2025 11:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739358946;
	bh=YKDYw4EgJ1J5b/WF+gfNmcPIuyPdAY3GNHs6SNyZAFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K7oHOn+zn3EE8LPVGFyRSAMjIWrVt7o1s38DJhLtiSgGb7LPbrWXP5jeCfm8foiAJ
	 D5oViv6VPCYNh7KtLmUxhS8ZQ9kZkqhZx1iIo+THiMdYv9r8fkrszbpsslUYvEft1y
	 iXqButssceRsGWaKkDrCT4ljpzX/1LeoOt1JShZtcZYksetScIECZn4QJBnF3nFkaR
	 aB4xkjXNYFjOOA0d4VYlw5UED+DVEAbdRqYKrWokox39rPEwkL3A2+ul8HI9pxZw0B
	 +CYxbwKS/KKFEbEDTEpRLGhsBYYXjuD3PB+mwKwZCAOcM8fxIaB+TYrre6AIiAOBlH
	 ZP1wcP/4NcbYg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19DF917E0F8B;
	Wed, 12 Feb 2025 12:15:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, macpaul.lin@mediatek.com
In-Reply-To: <20241218105356.39111-1-angelogioacchino.delregno@collabora.com>
References: <20241218105356.39111-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE
 block nodes
Message-Id: <173935894602.45655.9401418712379275131.b4-ty@collabora.com>
Date: Wed, 12 Feb 2025 12:15:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_031548_732162_595EC8F4 
X-CRM114-Status: UNSURE (   6.66  )
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

On Wed, 18 Dec 2024 11:53:56 +0100, AngeloGioacchino Del Regno wrote:
> Add nodes for the DSC0 and MERGE0 blocks, located in VDOSYS0 and
> necessary to add support for Display Stream Compression with a
> display pipeline that looks like:
> 
>     [other components] -> DSC0 -> MERGE0 -> Display Interface
> 
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE block nodes
      commit: 449d7d1dcea3ff5bc454c586bbdf9eb4c8ecb0b9

Cheers,
Angelo



