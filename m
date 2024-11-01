Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DA7E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zc0pH5qn7Ug1zN/IqEc5jWQUcsCC6cD82CeNCMErNI=; b=tfoNdm4K4cMlKXS6x9EjDxApAG
	11K9KO0OA/Td/7haxri5s6zyVapnHkYNFLndqYVuwY9GoAtjOSJxVNrZZq+k8LEefAHcoboG9P3S5
	Wvc5tevmvkvKE3Is/KbZOVg72uYJ7BkILeTNw5oDl4vAyyCMCK9MatT7wxBr0DNWmrVdITU9XJLLt
	egmV2wWKd1Yc/mhCv9CRSuvoPwxymfG+gL2e4tzH9MazdTQ3irUKCaX2S02eS8/WkU5qK8LCEAH5O
	7/6MLql06TmgC7u2gxayhJfLP65FZrvVtfz94SAOwnwg3sDlq2TcC0213dVVntSdRz76RbkRvq/Dd
	3SuMsolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u4f-00000007aOF-3266;
	Fri, 01 Nov 2024 16:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tnw-00000007Y3U-1qsi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C00FE5C4A96;
	Fri,  1 Nov 2024 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277FEC4CECD;
	Fri,  1 Nov 2024 15:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475795;
	bh=irRgyaZNL3QbES2BKZpFC5HFrUeyLhBKBuQONdo5KOg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iGqhRb8jR4HXevjHc8GpzO5tk/iTgRBDJAhlmEszyFfNIfToCBXDMMpnPyx1YyG0G
	 UyT/L0bngIoQ19hvlGOS7ZBCE5FjRpbj0CfRO9K8+s2VyWd6qo4wJRZOGMgPEy0YvI
	 yTewADkihAH/QKVdQj2cTVDXG0FVQBpJqxwiPgIKRrhi0AD/LJeHHodQSnPvqtc4Gt
	 TCmm7BTfa9hJX3s5aZez/Hrh/9tbYXjLxrYtnKp3raOryFi12UlC0cjBAOhlTvI6hC
	 y/f19yAtUUem5jGZOqULHJMjj1vTJx81NUJh9Jzm95puOEwFeCib9t7BgSnFjhPhbd
	 1JvhK64JRtEmg==
Date: Fri, 01 Nov 2024 10:43:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241101-asahi-spi-v2-1-763a8a84d834@jannau.net>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
 <20241101-asahi-spi-v2-1-763a8a84d834@jannau.net>
Message-Id: <173047579349.3488175.222264580667894425.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: apple,spi: Add binding for
 Apple SPI controllers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_084316_544077_CB8674E6 
X-CRM114-Status: GOOD (  12.38  )
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


On Fri, 01 Nov 2024 15:25:03 +0100, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> The Apple SPI controller is present in SoCs such as the M1 (t8103) and
> M1 Pro/Max (t600x). This controller uses one IRQ and one clock, and
> doesn't need any special properties, so the binding is trivial.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../devicetree/bindings/spi/apple,spi.yaml         | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/apple,spi.yaml:10:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241101-asahi-spi-v2-1-763a8a84d834@jannau.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


