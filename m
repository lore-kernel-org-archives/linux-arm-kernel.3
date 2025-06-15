Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48135C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 02:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXkFvsPINkT0vgOjuXsXfshvBzjNYf2e8uSneeQYZ8Y=; b=JCFE3vODhcNn5gXaKt/NjjPmj1
	R+HU8y32DB2mO4JAtzgTiibPzAFVq/PIbY8nhY2+FGNEIb/8Epf+eFGsk82HN6D/lzaR25LsG9lao
	VL+sW75S4QnFLuDme1tvxJVRbRA0Ac4dMQySdxCZzqo5Npq3/0FEur4lsLIVPdCwqbPecCgTWwB9H
	p1LibIHnVEHeySPBdtL0sj9gMjU+c+gCsV+wNGblzQMbFWo+VSG8Z47XrwF8Znr7AmwZvoLsKYfzz
	Q++lCx0HxFQeaNSM/0X2GgqjIUGjKmRsMwMqN3ZOQNn8ZRVvTL20c+d0aTydszzp6piC9/mALT1SD
	GFsYOw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQdYh-000000029hD-1l9n;
	Sun, 15 Jun 2025 02:57:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQdWV-000000029Zw-0TrU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 02:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A7F944339;
	Sun, 15 Jun 2025 02:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA2EC4CEEB;
	Sun, 15 Jun 2025 02:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749956105;
	bh=Zd7fTt9VFyH1MjewTq6Q2zFD1dm/dKoqPPU2XlbqW0Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Bu2iLWLZO5mEr+yaHH1IxnDeEo014StFzRApEYUc5voiE1tCHJ11Qb23gIppjSgAE
	 ADM0yJdn4TBsUl+PdGmqRy8b6Hkc3S2wOGh6e7mBynlHmGdSWZ9v+GBsY0thOz1CHD
	 5NRPDDhsFHS6f0In3cEcgtldvxGSc4nZPBYT6msic2ITyFNRhH4Oaqj7AWR1O9tNJf
	 K3zRsEj4/ebNgGoYcPWE908T1MKY/j3QacLZu9xHD5xPERxBgLvCRxcG7iHmB8OxgQ
	 tWdP7Oq/zEPG8z+PNsKVP/Ix5qcLKiSd12HdH5sdqf5+kwaUSuG53gr680bqj0oN/X
	 I8l63XXkyFknw==
Date: Sat, 14 Jun 2025 21:55:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>
To: Harshit Shah <hshah@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com>
Message-Id: <174995610354.3364317.17258718728761199104.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_195507_196827_976AAEA4 
X-CRM114-Status: GOOD (  11.86  )
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


On Sat, 14 Jun 2025 18:12:48 -0700, Harshit Shah wrote:
> Add device tree binding schema for Axiado platforms, specifically the
> AX3000 SoC and its associated evaluation board. This binding will be
> used for the board-level DTS files that support the AX3000 platforms.
> 
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  .../devicetree/bindings/arm/axiado/axiado.yaml     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/axiado/axiado.yaml:20:34: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/axiado/axiado.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/arm/axiado/axiado.yaml:20:34: found character '\t' that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/arm/axiado/axiado.example.dts'
Documentation/devicetree/bindings/arm/axiado/axiado.yaml:20:34: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/arm/axiado/axiado.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


