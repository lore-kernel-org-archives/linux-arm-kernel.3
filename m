Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CE4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YOpjUc3VqYqRM5TMUt3Hh4ijQEBYZXWNYalJVGOCaU=; b=YZZ2ZRvBFed5QOFkjHXZKzGAip
	h+VumB6s7NjkI/IYNB83GnJ7XJmGF+ucrJIMLb8pLI8D/6K/z4Y+R1KwMIlzMmQR1R5j4xBzkO9nD
	SGOKPb2m740rgWze0xM9S/dzWMU4jDhVfrniVYIyDOyex6IWcAgvnwLa8mxCCHSvWQvEiw2wenjbQ
	aKukYyZ6OuAfEOnQ9j0R5WOe+0TVvQ/YznnNux1gyBz6qeyJXw5I/iPG4AXXxwLznHWi+ZgZP/+fS
	nX+/xnis+GX9RsZhoJWo28KGMbsy5JLV/m6y3pFH8h/MHUwdC58Y93eEQa9tmdEcDA5SOz9uWvIsc
	o0nQ6vGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl8X-0000000DJ2Q-0hux;
	Wed, 19 Feb 2025 14:33:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl5c-0000000DIL8-1e2y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23D685C58AB;
	Wed, 19 Feb 2025 14:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E47C4CEDD;
	Wed, 19 Feb 2025 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739975415;
	bh=k4kfLM6UULYbT+Hl+/0hs1RZVm2znRy0PpE0Nf0I2eM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Gutt2v/UySArgzAiJKzZJu4KjpWJFaPBR9mE2R1u+cZ6pY1gWcPFS1tqzDqCuRITU
	 zk7n0N/SQBQCiHy7zo8cld8pardfpUrU1WOGKZQJBU/7x5C27T0N6MuMiYdhaSxzFr
	 9Se9ynf1zT7C9Tg+tSNrJa0zw6yW0lotDRiqII14amvsH4tpQnxLBfDUi+NmY69CCx
	 qmYHizwXdokMEEshV2e250pQpd6zGfv6UKPbmjVtTfb7RtsB5u4g0JShNPiLKhLB4b
	 kjeEVgaGvgRYd9GEY1QTn1B4zdpGxqVKfRWmv5l75Vn5y38TrXjWZhgCUKwc32dPCD
	 7C9yn8Fx63VTw==
Date: Wed, 19 Feb 2025 08:30:13 -0600
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, viorel.suman@nxp.com, 
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
 Florin Leotescu <florin.leotescu@nxp.com>, 
 Michael Shych <michaelsh@nvidia.com>, carlos.song@nxp.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: florin.leotescu@oss.nxp.com
In-Reply-To: <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
References: <20250219133221.2641041-1-florin.leotescu@oss.nxp.com>
 <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
Message-Id: <173997541394.2537392.7597733714820078670.robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: emc2305: Add YAML binding
 documentation for emc2305 driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_063016_516271_B18E7EE1 
X-CRM114-Status: GOOD (  12.41  )
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


On Wed, 19 Feb 2025 15:32:21 +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add yaml-based Device Tree bindings documentation for emc2305 driver
> The file provides the necessary structure, configuration
> and other parameters for Device Tree definition.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  .../devicetree/bindings/hwmon/emc2305.yaml    | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/emc2305.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/hwmon/emc2305.yaml:30:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/hwmon/emc2305.yaml:34:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/hwmon/emc2305.yaml:38:18: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/emc2305.yaml: pwm_output: missing type definition
Error: Documentation/devicetree/bindings/hwmon/emc2305.example.dts:59.9-17 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/hwmon/emc2305.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250219133221.2641041-4-florin.leotescu@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


