Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E26C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 06:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsg46bluH4QDcw33HuNClbrQzsMqLKbe9LV+4+RubOU=; b=1oW8Rqe9nuOrMRTnnhAP7pTh6w
	2mgmRhkqpbLSZNStHc4BA43Sew7MGpk2QUxIC8LBq8n0vwOq+/WHKwON7pDXst4atzwihoRm4vimS
	tKND0rRW6B3Bn/ORYgU6c1Zl0rUgRWKaYh/cOojfuVZ9PLKjc/9fRatiVkyV+EZTeo895fe4vmhny
	K5Ez2gSXkNiiHpEYwzJOjyH7Vs7vbSPJ9Zh8RVo797NETy1OxlzeIwDdcWUufqCFQ9mymIzw3DBGD
	vmhNe7tvls6GMskbFYoyzNnTnOFgOWIAKlPJx0DU8H3sHpqKWaGPvNa6Ds54H2I8IBrfsAtPjBul5
	+RQs+EzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGtbJ-0000000844N-3Wea;
	Mon, 19 May 2025 06:03:49 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGtXU-000000083M9-3bhd;
	Mon, 19 May 2025 05:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rsg46bluH4QDcw33HuNClbrQzsMqLKbe9LV+4+RubOU=; b=A2pLHEp51/2cUbDYgAiVhZh8se
	pQZsy6oifO4wzubkwgWDJVWTmDXVAGmhOO8bxN62ORCHan/YuY3XJ2BTibimKZbEvtTeJtSVIJh2v
	FjQsvSsdipkS18ZLdiPVU6DcFdh2d+oElvrF02XrnQmo8bPVpGT7EDQ7r/lvMmx0fDnVAph2cxJKv
	SaciN9PKcZyX62kJDF0wW980pZtB+qI0+w4F9NrgNXT6mjkZ6H0PVRO+Uf/vBamPV01Tg9VYjLMJ2
	Eokn4xvRE4Iix9Fi1JQX6sZKLsw5W/w/P3322qr5UqT8m5/UUxjfB4zfGo9gmPAmRQxlJXBx6cEFS
	Ma1PkSrA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uGtXD-00783F-1N;
	Mon, 19 May 2025 13:59:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 19 May 2025 13:59:35 +0800
Date: Mon, 19 May 2025 13:59:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: crypto: Drop obsolete mediatek,eip97-crypto
Message-ID: <aCrIx0LSKFpG-kQj@gondor.apana.org.au>
References: <20250513184042.3051424-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513184042.3051424-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_225952_915172_DCC3B74B 
X-CRM114-Status: GOOD (  12.90  )
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

On Tue, May 13, 2025 at 01:40:41PM -0500, Rob Herring (Arm) wrote:
> The mediatek,eip97-crypto binding is half abandoned. The driver was
> dropped in 2020 as the Mediatek platforms use InsideSecure block and
> the driver for it. All the platforms except MT7623 were updated. A
> patch to update it was submitted, but never addressed the review
> comments.
> 
> Link: https://lore.kernel.org/all/20210303080923.16761-1-vic.wu@mediatek.com/
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/crypto/mediatek-crypto.txt       | 25 -------------------
>  1 file changed, 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

