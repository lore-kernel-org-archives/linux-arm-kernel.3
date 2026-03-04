Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E025EB7ED9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdvVYQIVoTLNl+w1XTkCkwbXX4VGybyO5gJC3hLS1L4=; b=xefQcqrxJxCUMlzJNmHweN9Ilp
	39fzSrnsuIHGgcGMR+OBLxew5RpjA+fAy9vNDpwRssZEOgvhowL+ywjq6PWpDE+pkMACWX/0Xo4b5
	HxwY4u6gEoz+ZSndB27Ehtqy3gMwZ4zwq3GpJE6V4gb4ip8C05rvZ0p1MyAp9uIKIpfBXJFNiCHQw
	gFgtyGDIej9oXT4rPXo7Hgw4yOeZ8rhoqRnhph90iVn5gwTM/rmBhMDO3yWkpQIEXcwxBdkBlP1L4
	2sbY9vyoPWZK1d/gxZMYnOJ6aIpc6a1C5gG9kbLc40otyUl1hIRKHkTtqa+ON3p0F4n5v3Ttj7aNY
	mN9XDeWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl8N-0000000HAJ1-1doh;
	Wed, 04 Mar 2026 12:15:23 +0000
Received: from [2a07:2ec0:3002::65] (helo=pidgin.makrotopia.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl8K-0000000HAHs-3Zhx;
	Wed, 04 Mar 2026 12:15:21 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vxl84-000000002yZ-1O0K;
	Wed, 04 Mar 2026 12:15:04 +0000
Date: Wed, 4 Mar 2026 12:14:52 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <aagiPIgoosVqsA0t@makrotopia.org>
References: <04622e0bc917aed4145a9a3b50b61f343fc89312.1772585683.git.daniel@makrotopia.org>
 <20260304-defiant-echidna-of-examination-b1e798@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-defiant-echidna-of-examination-b1e798@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_041520_888365_A6392F78 
X-CRM114-Status: GOOD (  18.44  )
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

On Wed, Mar 04, 2026 at 12:34:45PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 04, 2026 at 12:55:27AM +0000, Daniel Golle wrote:
> > diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> > index 7e8dc62e5d3a6..6074758552ac3 100644
> > --- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> > +++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> > @@ -11,12 +11,15 @@ maintainers:
> >  
> >  properties:
> >    $nodename:
> > -    pattern: "^rng@[0-9a-f]+$"
> > +    pattern: "^rng(@[0-9a-f]+)?$"
> >  
> >    compatible:
> >      oneOf:
> >        - enum:
> >            - mediatek,mt7623-rng
> > +          - mediatek,mt7981-rng
> > +          - mediatek,mt7987-rng
> > +          - mediatek,mt7988-rng
> 
> Not compatible with each other?

MT7623 is the original hardware first supported in Linux. It can be
accessed via MMIO and requires the clock to be enabled by Linux.

Starting with MT7981 and followed by MT7988 and MT7987 it is
technically the same hardware, but on those ARMv8 SoCs TF-A assigns
the MMIO range of the TRNG to only be accessible from within the
secure/trusted land, and TF-A provides a (vendor-specific) API
allowing non-trusted land (ie. Linux) to acquire random bytes.

With MT7986 they made the unlucky choice to initially allow direct
access to the MMIO range, but later updates to TF-A then also locked
it to secure/trusted land, offering the same API as on the newer SoCs.
So for MT7986 the driver has to try and figure out which convention to
use.


> 
> >        - items:
> >            - enum:
> >                - mediatek,mt7622-rng
> > @@ -38,9 +41,22 @@ properties:
> >  
> >  required:
> >    - compatible
> > -  - reg
> > -  - clocks
> > -  - clock-names
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> 
> Use rather positive list, so drop "not:" and use cntains for only one
> compatible - mediatek,mt7623-rng.

Ack.

> 
> > +            contains:
> > +              enum:
> > +                - mediatek,mt7981-rng
> > +                - mediatek,mt7987-rng
> > +                - mediatek,mt7988-rng
> > +    then:
> > +      required:
> > +        - reg
> > +        - clocks
> > +        - clock-names
> >  
> >  additionalProperties: false
> >  
> > @@ -53,3 +69,7 @@ examples:
> >              clocks = <&infracfg CLK_INFRA_TRNG>;
> >              clock-names = "rng";
> >      };
> > +  - |
> > +    rng {
> > +            compatible = "mediatek,mt7981-rng";
> 
> Use four spaces for indentation.

Oh sorry, I knew that actually but forgot...


