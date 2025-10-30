Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C27CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReARPUNSeKIo4mFdxTXdOFWz13PTGwK87SRIQryhXfg=; b=T///i7hbz0ocbYCO+xLCWAoqEP
	Qe9VgnsYU9KVFnVXgWh+noU9LGkMZd+8MI8zubRNstaSMyLczAUwsrSPVrZj5F/00U8Par2MOZSRX
	XfA8Qi31/4Q3cigK7qFCYzU4SRjJLmTwsfejHv17mumsf8iFGaeqTxWJHVEgOusAhbe951Lj9XlB0
	uR7NQFxWhh40AmGVoA5pDq2mBTZ0aS5mW1+Ci0iZf3dFLwTZdPSEmUThAPznS8P+83Vt8TjTr2g2j
	mTQD7uelJ5LV/Z6Mc6AhciiKA2BKG8CM2yBauGHQwClLN0JRPzs5HDdlEK/S3FJvMigFcqvgWmyku
	eUZKTKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOuM-00000003rDH-44Im;
	Thu, 30 Oct 2025 09:25:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOuK-00000003rCi-2W6s;
	Thu, 30 Oct 2025 09:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816321;
	bh=oyf7HAZO8RhL2RYtja/zt16B8f/+ajKY5V1IZi5p/7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mebfPC6+ymHZgokou0mpiUmD8p686JTQjEDu75rd+pL+LpKCWjd48Ch2AAA950haV
	 TWOfzi/K4glYJ1oQ1TvxGNLUaHEOP6QeWjt9ZkB5tw2ovvaa25lx3vuqLtofUWPf3A
	 P1t4Tbt8yFmDPyTf19i8OeMaljQJRqCYdBCvOIleSmYMCKPFpJg5oh5cSVfTmEha9Y
	 dje1pBQkscbg8C4IyJuhU/E+jGYq0JZNNiK08nlZsYQCfi/nG4+VU3uYDmq4wq5FeK
	 SoDpTtPyZl3MujcNxuUZyQVpyiM0U/M6vp827NqrfrawngPW++4gU8CckiSrU0gMtD
	 7LCpu2jN9Zl+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 148AB17E009B;
	Thu, 30 Oct 2025 10:25:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
References: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
Subject: Re: [PATCH] dt-bindings: soc: mediatek: pwrap: Add compatible for
 MT8189 SoC
Message-Id: <176181632103.13078.15754462536677524202.b4-ty@collabora.com>
Date: Thu, 30 Oct 2025 10:25:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022524_809633_6BE05F5D 
X-CRM114-Status: UNSURE (   7.11  )
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

On Wed, 29 Oct 2025 14:25:57 +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the PWRAP block on MT8189 SoC, which is
> compatible with the one used on MT8195.
> 
> 

Applied to v6.18-next/soc, thanks!

[1/1] dt-bindings: soc: mediatek: pwrap: Add compatible for MT8189 SoC
      commit: 4459d667a3d7001d1c1703dc79c87db1808cdde2

Cheers,
Angelo



