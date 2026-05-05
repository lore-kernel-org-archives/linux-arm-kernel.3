Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D31CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxODDZ2GZbzq+d7FoPshQ569sDsyOc2DnK+dDvAlqoY=; b=hTPsYnrixfRSnyEY0Owqr0I/zC
	cHnnOaRcCjsRaonxPJuHSX5Hns/J2g+abEJj3KmS+K5+m5sPGUGgjoy19a0ErPsaipqilDMjDQIHm
	K4iRtUWwwNfQomqRIluKqwJWz8nPIaQEssvIGiy+ksdQdy73WOSZtA4p93W+ZGKqZCkIkHSX4GkoO
	HvEgQHFr5fR9jTRNVzmTilsJ3JWnkeuczQscUHgdtHGeAKkFWAVSuSW8ypUV/qvpfCrPvH4eBwPKG
	0UmS02XGe8KcZibY5uWuksElpUiK8WEX+ae1GZILSDtXn2xBw8ssJQ7/mWImxRmJ8T2cGGOQvB21V
	SjCZx1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBVb-0000000FaAF-1r1h;
	Tue, 05 May 2026 08:52:03 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBVY-0000000Fa9Y-2ZhP;
	Tue, 05 May 2026 08:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=qxODDZ2GZbzq+d7FoPshQ569sDsyOc2DnK+dDvAlqoY=; 
	b=UbEbgyUsgu3bKepusTL0WwK3nDooQdLOIc7IFAHq+iwhX0pgbKnmOprymBIq6PeIxMUbv78nXQO
	+/2A2gLpgecZO44JRIwRIREAVr+ro0XfT4sZAKyhPZeodm1CaJkLZ5uVec90MPwSy/0faXRR4Jjvc
	702equrXyyFiTQjDEorlgafGLHlDJZmztwC3h3J6bl/Ih3cHaXH8+NwHceBlgeyLNHQLW0NmlZEUB
	Cj4dH4CPRQjAkih1hTTxUJO2anasN76hpmLs+QgRABVLISezjbBVQ7wFFyLo/G74eSg90yRZxA05W
	v2ES4YgtCXhJmESelEkR3dJULEU+OkllKe1g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKBVC-00BNB9-32;
	Tue, 05 May 2026 16:51:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 16:51:38 +0800
Date: Tue, 5 May 2026 16:51:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: rng: mtk-rng: fix style problems in
 example
Message-ID: <afmvmqI-4wQ0IvU7@gondor.apana.org.au>
References: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_015200_693587_2EEA2AAC 
X-CRM114-Status: GOOD (  11.97  )
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

On Mon, Apr 20, 2026 at 05:34:45PM +0100, Daniel Golle wrote:
> Use 4 spaces for each level indentation, remove unused label, and add
> missing empty line between header include and body.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4: new patch
> 
>  Documentation/devicetree/bindings/rng/mtk-rng.yaml | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

