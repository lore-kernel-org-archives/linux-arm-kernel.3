Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175B7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmvSJoA4V9widGtTEXST3uDxkbKiOKmRYCx2G+QD7wc=; b=q3oNsIqAAskOyrRaeJvMpciJz5
	PftgO48FmYRCK75K0viAC4ljkEze772Q0tTtb7ybHUsGYYbsezQPz4KbD6ApC8J0duanIfelLzHdj
	1dWL8tlK0/NWRlcmgRpdOdlOATBYhV8zOgTa9pjtRpDGy9Iu9HrUaVIRckHFSzKb9R30Y2HWUdIwy
	XcymnHP0c/GW44VRt3k2ursDuu3ARFCImdMxNtWHO590Ga7KveG82azVQqKaUc77Sbwy8j/MU2DFr
	eXWwOUmJ284LGpN/Y8pNYieDW9uhQa9jJpWMxT76TffBacoJcyf4sEL8KKyi7FfhunY6ZU8prY9uL
	FlWwGIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSKh-00000005sWa-3r6s;
	Thu, 27 Feb 2025 01:04:59 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSJA-00000005sFx-3GLo;
	Thu, 27 Feb 2025 01:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E169E61223;
	Thu, 27 Feb 2025 01:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6D4C4CED6;
	Thu, 27 Feb 2025 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740618203;
	bh=UmvSJoA4V9widGtTEXST3uDxkbKiOKmRYCx2G+QD7wc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sSUlTSt1fdw9WDJk1UX25ffpH2sRCJeklA71dTRCMs7h07iGQ8N/dSx5B42GmA5Kr
	 orkaTDL3g8nJWkp8W5eaCBKh1vrDWfv6I9o3ODk88d2gCrEaKQUYRxoI6hRxXM5NdG
	 zBMP6U7mU+C4Kd0nnlky6+HJu6J+mU/NsLfx7vfQOBFgnbHL2BrXKgbl7SGWJ1GKOh
	 SyvzT1zLSiQzR9Kl2KMA1dfCV/3HkiscWmy2Q/lwETVD8tc6xkxQakfFGI0C8w+qEc
	 TRk7+mr3NWbm+xD/gA28rgZ8fcHVoNCGFNmlEcbIQbZeS54ltjSvjgP/PPTar+EE0g
	 0IZl2YcueDiwQ==
Message-ID: <714808f633d097b96082e1e418ad2205.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
References: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, amergnat@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, kernel@collabora.com, macpaul.lin@mediatek.com, pablo.sun@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Feb 2025 17:03:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting AngeloGioacchino Del Regno (2025-02-12 02:03:41)
> Add binding for the HDMI TX clock found in the VDO1 controller.
> While at it, also remove the unused CLK_VDO1_NR_CLK.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

