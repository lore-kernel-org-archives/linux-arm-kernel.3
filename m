Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982BBCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3nv8kuR0QO3c8o3uV+VNFEBVqAjCUW0v+ASZcuSBdo=; b=D3c87d7rL5tykQ8GfVFUVrIUDs
	WiIK7ga0xZD+ztQwPPrtHc/ubBIb/dnbydSqNniHShrvrOTCOYd6lFg6eg3M7Chc4Xin7e+aXW3w6
	ZpdKoggcrbhJ0VTO617Wh05naebDeX9TNWsXO4A83JKOPpwtvU1BFA3e6yYabjkbBNX+5/9+Qqiel
	eFzPI47Lp/Xg5jNQYjKoauQsv4M6xIONC4Ho83SgadymZdfrzBlay0xAtz1OcBhI9NdgaV/cS7ZYC
	zG3/CmKj+8elH50DB2t4M/LvRfko+Mt9DlQkNt4ZFsRXZ+CZ4Zfz7i4GDzPIUDg/9r/I4Hxhoqcfh
	tGB2f+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5A6-0000000AwJZ-0U5g;
	Sun, 10 May 2026 14:29:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5A3-0000000AwIk-0nJA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FF85405AA;
	Sun, 10 May 2026 14:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D56C2BCB8;
	Sun, 10 May 2026 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778423378;
	bh=J9x5Zq1feVMCz1e9blpo9bKtXjLvRhT6RXenXzKJpf8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fsNoK5JfADw841vdnXE/g+KKIiFiOXAKlxi9AuHUdkXsjaQ/j8lxfVEAbKdf833qW
	 bBdqvL1tKquII/vyO5XfBwD2uYKLFDuaQWCGKT2aEU8fmN91zKponkZfFz2W4eSAa+
	 kmt1a4lJ3JyxLqMrn4buMFyHKUvbtjidRElrrpKR0Yn9doEYlUjXiUJQHfT2A49gsu
	 E+0a6rRVYGS3FU8hya851KL2vcZKrGfiFEh30g0jAIOQxi/gex7ToTIh9q48mTQwH9
	 gd6LaQi4gsTYROFNhgINY9PnhwC2CAGsWQZEX63RHCHDhOxGj+08uApiameLjOvFZu
	 eDos1MjST5rqw==
Date: Sun, 10 May 2026 09:29:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, Maksim Kiselev <bigunclemax@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-iio@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 devicetree@vger.kernel.org
To: Michal Piekos <michal.piekos@mmpsystems.pl>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
Message-Id: <177842337581.2778271.6474369403443019233.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner
 A523
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_072939_268395_6DDFADAA 
X-CRM114-Status: GOOD (  12.25  )
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


On Sun, 10 May 2026 14:57:22 +0200, Michal Piekos wrote:
> Add support for the GPADC for the Allwinner A523. It differs from the
> D1/T113s/R329/T507 by having two clocks.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 +++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clocks: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'Bus clock'}, {'description': 'Module clock'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clocks: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 2
	[{'description': 'Bus clock'}, {'description': 'Module clock'}] is too long
	[{'description': 'Bus clock'}, {'description': 'Module clock'}] is too short
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clock-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'bus'}, {'const': 'mod'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 2
	[{'const': 'bus'}, {'const': 'mod'}] is too long
	[{'const': 'bus'}, {'const': 'mod'}] is too short
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


