Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A39D31A29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSuHYOZPfmr7r22rCQUpgkUQYIlPGN3yg36KexB+19A=; b=AhfZuos4kdhEfuiZk1/qASEHUL
	2XgkdgYkESMgt7ezRZXHGHLZFTXowng2eKpS46ckU3efzWETb3uSJK50V9UwgWNodsjCrX6K1Vbyl
	jm479V7Gi6IKYCoCsN43j86jtvDcWPga1AonpbH5V1ztKYV3tvG32Jl3MWrbFS8u9OUT1FOggCh+C
	XweHBDJgBTvM3D/N/X6L1H3KXBGHvmtbz1EnDNIRGuw8OsCKa8ai8FDq9Jlb70wbV8ZeVbyZ6c7hP
	noRNFg2/Mvx0gtDdCXveNOQiNULHh+qvLy8JbgKgWBy4cx6CQ8WvOWMKLwZygfhO2ZQwZluW+qecP
	KOBF1JcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwJ9-00000008Lk2-0c06;
	Wed, 14 Jan 2026 08:32:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwJ5-00000008LhK-14jh;
	Wed, 14 Jan 2026 08:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768379564;
	bh=6+qWrmtEe5KQBvisLBZsta91oEBPrK8AirW4JBB7LyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hzgD7SyvgGbS/tl4+IohuHJDQfoJgwHdw5s07scxDXp5Lw6jB9V4Kla+pW4W8QxiF
	 3XdXkjyAiAGyWjdQOvB0e5943LNinneSN9NWQNIZA2Vv7UMXRKIHfJhHsclm5gTrC6
	 7pADv65jEe1olikyATQzxQH5xtzDnMYVJXJ6lC9ZrMGE4Q62Ck+CuLp3Dzhu/pO0nH
	 g1GS9pNv2dv4QL9uYil9952buTWsoRtyDkygGYTTfVRm+Z8yQ2GWf4TYKk2LyIjCMS
	 GA289INV4CQp7rHOSmiCSLo+E08iV5ouXdWcU/jvy+8jSnT9cXMMi8UWSRmbbzw3Oe
	 RH6EZa9IJ5BzA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50AF817E1513;
	Wed, 14 Jan 2026 09:32:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
 sebastian.hesselbarth@gmail.com, matthias.bgg@gmail.com, atenart@kernel.org, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v2 0/4] Fixes for EIP97/EIP197 binding and
 devicetrees
Message-Id: <176837956327.8998.5572106308125358940.b4-ty@collabora.com>
Date: Wed, 14 Jan 2026 09:32:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003247_453734_8EA0AF18 
X-CRM114-Status: UNSURE (   6.49  )
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

On Mon, 12 Jan 2026 15:55:54 +0100, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - Reorder commits
>  - Change to restrict interrupts/interrupt-names minItems to MediaTek only
> 
> This series adds SoC compatibles to the EIP97/EIP197 binding, and also
> fixes all of the devicetrees to actually declare those in their nodes.
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[4/4] arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto
      commit: 32c5491a8d73713578560f515cccd4e9460d156d

Cheers,
Angelo



