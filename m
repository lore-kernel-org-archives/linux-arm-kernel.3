Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7445CEF5862
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3tE8kWmbA8+HuECRAxNUnEs+baIzsLs6gDVRrcxMdQ=; b=L5akOo+rGAF4ioHL420JRcKkP0
	3OFlc56S6GHE1nMBmwPEKt6hqhSBbtB9yEFjdAFYrJ1kpQxwBkkXsJ1vdLCkM/mRDaoLqROLxFvHC
	rrhbOeVL29TVxCWaBcIWzB9JQT5YYmz56hQRkr7rW0X4R6AuLHbc1MfG8A99xomfViEuHyfxSMFY/
	Z2Lf1vTt1hPBs3zYj8Hbim4T3iseqLmNHlXWkAFl0QmNk9R3Zkt/H73eWcwgq5Bwpsyxzd71/SfLY
	Rg90r7xDEkBu1+7kmpFZOrFgT5WIOgBS58Ck+cXgHoKNhy6yaNGB1JPyj+sudkKoOtG7JNeFvttkZ
	T41hccFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvkZ-00000002RAj-4AGV;
	Tue, 24 Feb 2026 16:59:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvkX-00000002RAL-14B5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 16:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E015644144;
	Tue, 24 Feb 2026 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7778C116D0;
	Tue, 24 Feb 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771952343;
	bh=Hez4a6ZsLmJ2R8GrP7plPDfk6dAJSevBjLWGIHh7duY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JbiZooh16J1Z0IvVJBbKcJWAsxRgRR0x2fV2mBV6Rqc3/JXd1rVnDxqp0JK5yeNqA
	 jXVyQwx3JILpWKj299aCwx6ZcIEHg2dIB3doYJC1EW+it73gpI6WSNLSSgOp6+PLdr
	 o2+JNMY4iS3JGOpIc95N+bMEe6QWBItJSUDnrcFtvr/vN/2qk89kURbJWsthFQapVC
	 /Zey5SUdW8v+GukQkgKwwEDcaW3zWfivTD6fxzGWgRh4imWSs/oUuUKw48MU5OdJ1Z
	 ClRxrH1CFtUDOc0HubpZY71yu1Q758ShOJGTyWBTaM5Z4TY5cCsikiwvlCYmFYCsZs
	 4f3LAKAL0AAyA==
Date: Tue, 24 Feb 2026 10:59:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Claudiu Beznea <claudiu@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
 <20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com>
Message-Id: <177195234272.3091471.2975392920179397433.robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert
 to DT schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_085905_325639_CDC41084 
X-CRM114-Status: UNSURE (   9.92  )
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


On Tue, 24 Feb 2026 14:46:49 +0000, Akhila YS wrote:
> Convert System Timer binding to YAML format.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.example.dtb: watchdog (atmel,at91rm9200-wdt): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/watchdog/atmel,at91rm9200-wdt.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


