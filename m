Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D738C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgEvng60eATnMI4BVnU7kV+KBHy0r5XgWKzSDSIdJKA=; b=gUuiboGhf6EXNX9XlchRJUjQAV
	cphn+fbAezE+zu8IeTkKOdzyt3wMvZxDFb/6Ugnmjy7Pd4bn9ijCLafPsRrHcRqTeUE9c5t6IKM62
	NGXz3FJ8fcBRrmLPwAa1T9V58F52wADARzwB1DzMiDyGDcddmudJNUmyPeCU5G1RhBp5+05HiQQjk
	wcA/d2Zq/7M/kf0tpyhBkuTIlIJi2WhlFnr3zaJw32trw6snhqzvdXRON5lcw3VWI/7XXUsHeXhkG
	0+nIg89GBrh0vTiCxrnlemrTdAIMrigLWMkAZ3Ja/beIh93Pggq5ooxlGlqu6iiVUKHHr5cr9FhuN
	MgGAOUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBhi-0000000F9CK-3jT8;
	Wed, 14 May 2025 12:59:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQE-0000000EuOY-2QHf;
	Wed, 14 May 2025 11:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C605560008;
	Wed, 14 May 2025 11:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1907C4CEE9;
	Wed, 14 May 2025 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222633;
	bh=t1bXaEu9EXQ94m0cdh4MSItJJeYMDzLla+FRFBaaVOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NwpkfIl6MZt3iRQolb75+B6HpoTZyfFuUyBOU3iCCdWyF2d3ukbkHyrA8zIFib9nc
	 EOHXQ7yVKndC1xfuBDcWhVcVzOVrhwiAPM3NNJ7jzA//MeUd8ZZIcpVIDb/GFpCwED
	 pbNpd+NMu5yoxzB18tUGerttcXQ2a1yO5VC4uJGUYaiAtMf/iNa53FZ+fmxhi1HcH4
	 HBydiR7YPq5TnLsV4f26kN1qn2853JpHGEcof10JzSLaUY/ke7xyTcZKX793Z70uM6
	 SKT6RyfToz9+K5wt2nSCKVyNtoz/OwuA/7bc29ll3fokyUQg+QlfOc0fknmmeQCV6m
	 CXvTdBKQ4rgqg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Message-Id: <174722262951.85510.8563581978956288115.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 22 Apr 2025 15:24:23 +0200, Frank Wunderlich wrote:
> With this series i continue the mt7988/bananapi-r4 dts upstream work
> 
> changes in v4:
> - changes based on review comments in v3 (mostly bindings)
> - changed topmisc unit address to match reg
> 
> Daniel Golle (1):
>   phy: mediatek: xsphy: support type switch by pericfg
> 
> [...]

Applied, thanks!

[3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
      commit: 117d09e2830d6ff6c1bb2dc5629f972504fde51e
[4/8] dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
      commit: b484b25a486962b568ada1f55c1b96dfd96b912d
[6/8] phy: mediatek: xsphy: support type switch by pericfg
      commit: f85eb659a48cc2f0c98a122e760552b69e56c06f

Best regards,
-- 
~Vinod



