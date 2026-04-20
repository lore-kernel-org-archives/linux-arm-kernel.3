Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CE7F588DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2Unb6GK6md4OGjrnkLRL94RrbSHlKTAYXjF4os9vis=; b=4EdtySgm4LWzBwEiWqNN+akGO9
	Icn22CAfYUGJ94Ny17ER35JNjpiR+JWBgFM3Ikr9s5G1xsXBRyvEWOLbNUMRS6aPJKEGOVD8TQQtl
	WG68kwSVmJ4A6CqqIX2RoWxFzG4gRw30y1DGw9kIJd0RJHcYjqdKComg5nykoOtpNiuzCq8qRGYXw
	59AIn6F27oIJHsD6xeuB5bGYeCWOf+E5WIHe7EsPORvqQdhDuLDCtJ6GPbNXDCHIUNAM3jWFPaKM/
	cQHlHKYfytfPE+91uan1qDfHOQAGQMHAlJChqJ2lK5c+LBl0zYO+ITxs+GTStHsrymg+cCahaCv2Q
	/rfnSwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpYV-00000007Abz-3OWa;
	Mon, 20 Apr 2026 14:24:55 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpYU-00000007AbL-0qbX;
	Mon, 20 Apr 2026 14:24:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEpY9-000000008Uq-2UVl;
	Mon, 20 Apr 2026 14:24:33 +0000
Date: Mon, 20 Apr 2026 15:24:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <aeY3HuP01VYl5x6X@makrotopia.org>
References: <585fc832e4e5d3656bd25ecee6bafb636993104a.1776600269.git.daniel@makrotopia.org>
 <20260420-flat-rook-of-hail-bbede5@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-flat-rook-of-hail-bbede5@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_072454_264440_212D463A 
X-CRM114-Status: GOOD (  12.24  )
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

On Mon, Apr 20, 2026 at 04:07:33PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Apr 19, 2026 at 01:05:01PM +0100, Daniel Golle wrote:
> > +    rng {
> > +            compatible = "mediatek,mt7981-rng";
> 
> I asked at v1. Reminded at v2. Nothing serious, but repeating myself is
> pointless and kind of waste of time.

Replying *once* telling what you would actually want, or replying to
me asking back would have helped enormously:
https://patchwork.kernel.org/comment/26880354/

All I can see is that you concluded "no improvements" without telling
*what it is you would like to see improved*.

You want me to drop the whole example? Drop the compatible?
I did drop (and replace) the negative list with a positive list, and
thought that was what you have asked me for
https://patchwork.kernel.org/comment/26817847/

This binding is dead simple: It's a compatible, describing the identical
hardware now hidden behind and SMC call.

