Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4468DC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK3s4BAudz6qPd5+wddApMZzAhGiP8wN0SEQo2wVs3Q=; b=ROef/A23AEljAv8x1nyorCgnlD
	t/Y96tiPJDLMhkWtGp5ujqg9sadL5C7jKAT6PahV/INfsDzZP3meJ3QUzpSASlSpYxJ5QJNCUChjw
	/YEPPXegjlgthb7WW1etXO2YyRG1M6ouaoW7qtPW6dCEMXh99mgtaGiFsORNO7J0DSoltGKzeyUPd
	HqhZSjZ7VvrHxne1xfk6jwpXBNeGhXoUk1PETViJJbEz6SF5ORiYY5lQQht1YsGF/vIXTZRdUD7gZ
	yZ5dTRQUH8bEHl5ggiDieI55ZSaTafRlVtQ9XTPl6fCZI4sYFzARY1pCTDOY7S3m2cZ5T9ba2kix8
	gO0+X+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub0XX-00000000RgC-0Ox9;
	Sun, 13 Jul 2025 17:31:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub0V8-00000000RXE-429a;
	Sun, 13 Jul 2025 17:28:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 193636112D;
	Sun, 13 Jul 2025 17:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4A6C4CEE3;
	Sun, 13 Jul 2025 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752427713;
	bh=edVLvKXLku8AzoLHs3//yeBJLHTnb8ffMj79O9ITrPE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=azFdOneNcEqorhUiBpnudttXl7MMIFA0txH1bU29PeZOzlQ66foHezu/CS0XR4TUa
	 hPWUkYZrYC87PyzvFNM+5NE98UkEEQ0KHxqwWdsEeG1xdFz7UDx+2aFHVxLTk3MbUC
	 m5bs+BTeOaDogK0hivr+5fpjbZ1k2DTPN+/G0/AFr3OIudA5VeWybN1iQvu4mIl60j
	 dcXMxptXreplBFerTRtYOZz8k3l3Z1TcbUF/UcKu5QkL5Rjg4A4sGbScoJprkVzRiB
	 rd7B8gSYP0cKAxw0GnBcjDXZcorQ36Pw2VMtBS8xW4fZewuMQ+iEinLGfYB0ju3gyZ
	 WCuJcgxOMfLqg==
Date: Sun, 13 Jul 2025 12:28:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, heiko@sntech.de, naoki@radxa.com, 
 quentin.schulz@cherry.de, dsimic@manjaro.org
To: Jun Yan <jerrysteve1101@gmail.com>
In-Reply-To: <20250713163255.163669-2-jerrysteve1101@gmail.com>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
 <20250713163255.163669-2-jerrysteve1101@gmail.com>
Message-Id: <175242771243.3659205.1009205477863284849.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen
 OneThing Technologies Co., Ltd.
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


On Mon, 14 Jul 2025 00:32:53 +0800, Jun Yan wrote:
> OneThing is a company engaged in edge computing.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:^onething,.*: 'anyOf' conditional failed, one must be fixed:
	'descriotion' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250713163255.163669-2-jerrysteve1101@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


