Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF62BC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 02:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itmgVer1pnntM4cqZXszMDwWecgomg7t2KeCE23xoug=; b=ZMQ2aFmbfQU/4teVPIk4yB+ri5
	MzPNuPVKoKpwDohL8eu/GQeg7v/puPzCJgELqEK4yUu8Vz+nU6nYiM14LzpcoJrFlPqVSCG8tZ12R
	Ic085tWQUszraRqxPZbQW/8R6lPEpXsSW5cXneOGJa560GRGiAfIkqMkvlOOG2mdKR7+VY6YVJUUz
	mHtoaEFwr7zd0HCFYP0ymGubko0UCVgDKDYtogyCb1PRFytmMbMmJkhjRy2fHL2SrbPFHz3izmt3k
	KYmTXgTZcsZjMOWdvyME+pWTJsvQQUtSrbbvdvn7rGL5BByjACmnSxPwZs74XmbzCNyJ7lU1/+A0s
	h0wfP5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vL6-0000000CWpt-17S5;
	Fri, 25 Sep 2026 02:07:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vL4-0000000CWpi-303x;
	Fri, 25 Sep 2026 02:07:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56FAD43974;
	Fri, 25 Sep 2026 02:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4F31F000FF;
	Fri, 25 Sep 2026 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302022;
	bh=itmgVer1pnntM4cqZXszMDwWecgomg7t2KeCE23xoug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGoprwx/vtepSfIQrcnapGrbZz8FYS2/amIZnv3D+B8Gw3qsPl1MbaFGs9Or14yun
	 ijv3BIr+IhYUu3343vhWKYRBJOzOn7KPnud6tY0AiPIC8IvOVG4giAo8v2wfYCI81H
	 Cgv6gbAykkik/jY/5vG9XyHB6DXgcpFl/jUtql9I4BT0Kv9chFW01QzNmuWMAQrtbP
	 U5tYKT5d/gMFA/hLBLLu28nRtFt7rOxoyUj2+HLO/4LIbGV/dqb/xKH37NyZC8Lp8t
	 b0XlB5tsdUgNFqcUuaNelf/zaRq//3YlP7iE75CxOY6qy29EYlkZIYfWtZ6ImcU+TS
	 lyjLlOzbZUYBw==
Date: Thu, 24 Sep 2026 21:07:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Eugen Hristev <ehristev@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
Message-ID: <179030201789.2925774.7508536046130679968.robh@kernel.org>
References: <20260921232819.3137721-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232819.3137721-1-robh@kernel.org>
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


On Mon, 21 Sep 2026 18:28:18 -0500, Rob Herring (Arm) wrote:
> The correct name for the MediaTek MT6779 audsys compatible is
> "mediatek,mt6779-audio", not "mediatek,mt6779-audsys". The original .txt
> binding was correct.
> 
> Fixes: e97c618234d9 ("dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml")
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,audsys.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


