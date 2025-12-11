Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF5D41D66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWNcghzwvuVYfrQNEdy3WyZPj72HXtm2nUYg3b1P7Ss=; b=cZ+LTu8zqozG+Gus/8ym8fJrOJ
	1SFikj2WNh4Vy02o2yc+LvTAivaM7OwUv5PvrJ1Sw1o25CzAN4/otz9Jrssu2uiZKhWYciYra8jLm
	fW64wrHSdToEc9G3trzlisF2iDyyrxKeq8eexPLVxp6xBDzex1PK6HMRU1BiU0DwMVCLw1OkOoyIX
	NrRY9ihjxajWRCGhSDcsfAys6EzM6g4PyvOSkVb9v4ep4eUlMsqwzAUaahJ0RiYoaIMbS7I4BKXDm
	fAY7PVO20Ssaly3aXjz33ANbvua8epPdyqWPV0QmG+dBqCM/+ss/DFccuC+fI8+gUoyYHYGskuNK/
	GXNLnRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj3B-0000000GnTE-2hoH;
	Thu, 11 Dec 2025 15:57:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj39-0000000GnSp-0rmN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 15:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3598A6013A;
	Thu, 11 Dec 2025 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB4CC4CEF7;
	Thu, 11 Dec 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765468669;
	bh=pFsCSVV25XloLK9Jvu2/qNTgDEC1TPVYRi3qn4jGraI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tDBGKf2Wb8Cl6lzG5cx4vBkzWJr4i/qgbwkSv5JcKhhDLKt4RMd8zBcl8z00VKYK7
	 yfmdbPecn1pr7ynoRhjMU+wNVgUlQx+MK9oEoymM+KMpk80lJadHVtxBjD8+VyPGhy
	 lpgOJx28AznF++QhBe31bMUER/pB9aITcDTVhqkJESwIs1waTYRPjBnghQhdqUbafb
	 XZBeilKLe+y5nt3/Ii8lhjLHe7i8Dk0ldvFavx/oNoq4N6kLcYogdKi3dH8NNqjlAk
	 FiGUG728GtdRqfsleYVeKxM60PgNHtr852oAkaKTYOPmN8O9Zn3rjEfHfNVB7H1Pen
	 t6gnGiv7kyXug==
Date: Thu, 11 Dec 2025 09:57:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
 Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
Message-Id: <176546866607.1487115.6798113196659439308.robh@kernel.org>
Subject: Re: [PATCH RFC 06/16] dt-bindings: mmc: Switch ref to
 sdhci-common.yaml
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


On Thu, 11 Dec 2025 17:45:48 +0900, Andrew Jeffery wrote:
> Enable use of common SDHCI-related properties such as sdhci-caps-mask as
> found in the AST2600 EVB DTS.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.example.dtb: fan-controller@1e786000 (aspeed,ast2500-pwm-tacho): #cooling-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/thermal/thermal-cooling-devices.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


