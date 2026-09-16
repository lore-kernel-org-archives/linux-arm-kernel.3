Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07690C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tD6Xr9J2ucQ5/OOmstOBkaQazxoKsfY0YaWI5fIV5g=; b=AocXSoBOJ8PDB1mZmmoZUggtoU
	b36w3hJ71PTNpbhbFMF990ANTyYqp1StKGhZJYS0ZEBPZdjIgSSoscEx8SKIwqLypQLhS26NVLf+D
	69drgAGAwV/DJI8MwgQYYdHVsnN3HxSkhn1W8VHZadYqwUwca7uBxF5O1eEKllaF2tHT8PAOBsZQo
	n4NrSx1EnAgm8TCAcvDv/j/LgLImvMrL3dXvotGoYKY6w2gcA98iAS0AGE38FWtLcTD1ILe/UliZU
	suPhw+8uOp6P+rrOaYjsYLlHCgL8BFfZ+amzpZOYuq9vaS7UGTG8DgpoAfM87TuG/7kPr3X8GsaGR
	1HMUsVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rSi-00000009Z9M-2IrY;
	Wed, 16 Sep 2026 15:22:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rSa-00000009Z7D-1Jvw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:22:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F36DC4360D;
	Wed, 16 Sep 2026 15:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D191F00893;
	Wed, 16 Sep 2026 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572127;
	bh=8tD6Xr9J2ucQ5/OOmstOBkaQazxoKsfY0YaWI5fIV5g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ghwDoUYQfT6LqJhAL5A6kG9TMoaCptirC39o32HGg7XG01YipLD+Lk2WqNjipGxu2
	 UKAFVY7SM+TOQWwPrJgXEvQOvqs6JKOWjehSZwPJAzTDkMB++EOtdb0iGGllqiGulf
	 gseRWbN+//EfJXylS6lTsAwveesUkZnK6LcsR4mwkQT8ASC5ZXJ3MXAdVLIHuQZWtg
	 Qz4sxNxJT4QPrAq2dK6cFfeIalrHwUHttgOwxiVv0TAmiP7dafVn7XziOAezZ1mHAW
	 Z2mvSIUHiLaR78mhPW2rym4XtHu+ntuK+mzekWfWRhwmLqgJT9Zg9ntdgDO5I5Zyez
	 1V7i3im/MJ1Gw==
Date: Wed, 16 Sep 2026 10:22:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
To: Alastair D'Silva <alastair@d-silva.org>
In-Reply-To: <20260916044119.475666-4-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-4-alastair@d-silva.org>
Message-Id: <178957206885.228671.2262343816324087676.robh@kernel.org>
Subject: Re: [PATCH net-next 3/4] dt-bindings: net:
 allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1 and syscon index
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


On Wed, 16 Sep 2026 14:41:18 +1000, Alastair D'Silva wrote:
> Document the Allwinner H616 EMAC1 and internal EMAC compatible strings
> ("allwinner,sun50i-h616-emac1" and "allwinner,sun50i-h616-internal-emac").
> Update the syscon property schema to support an optional register index
> offset argument, allowing boards to reference the secondary EMAC clock
> register on H616/H618 SoCs.
> 
> Assisted-by: LLM
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
> 
> Notes:
>     Tested against Allwinner H616/H618 device trees in Armbian, verifying
>     schema validation with dt_binding_check.
> 
>  .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml: properties:syscon:items:0: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Phandle to the device containing the EMAC or GMAC clock register'}, {'description': 'Register index offset (0 for EMAC0, 1 for EMAC1)'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260916044119.475666-4-alastair@d-silva.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


