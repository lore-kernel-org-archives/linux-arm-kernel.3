Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0565FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgzVntF6KzzMR3V4Q+CcBzkSm5YqLod2dgAwatkHa6w=; b=Yr7otClhainElsEnOIpFPJrEMA
	eE7V335CW1ixH9p6RxfCFcp+aMmQlINKYaDUBjCD1rmb4sXDsLt2mZRXuqbSxfostyY34mF6UQpw6
	b3Vr4ao2b5QLkoyZu+yvqEpdPIdDlwVJZEQAtTLwWDzT83ALWpF9gYY+611g6iSn7NbKiD4MquJMs
	q6vZkfUh7bwane+51xBwDKF2GbBPkBJg5jsK5Ox6Q2wor9FLcDUPA1Kvk7PDfhXUzOUly0WCnbM5T
	AO68xeVoE9dBDVVYodMmL8DmTiheE2KgCGSloQQDhBxc7Xcp4PNoaJBKdW8oCpfhrEtkzSnolSJFf
	d2S4Lq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfz5O-00000005y3B-2ZSW;
	Thu, 06 Feb 2025 10:26:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfz40-00000005xvV-3Vzn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0561DA43FAB;
	Thu,  6 Feb 2025 10:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6924FC4CEDD;
	Thu,  6 Feb 2025 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738837491;
	bh=8NibMNg1KpbAk3gyqnaDTpTU/kJdok1+bj45BuBRHt4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lW4fVloVz9Io3J8oEN7v4cAKcg7dA4GPvPOKaTZAJwK5PjTxwESlWVLDPvcszxrDk
	 Rs8hatmSaIqc+Rztpi9gUHO0hgVBuQESqNpWC7l5xBNKg/ycmcsV2OnI2eOxm+eIrl
	 aadxYmUpzYn93Uljgk6s/jMnI7v6/P32GfVVicfFwQLcwZl+A1YP2SOSqyGNeo8Y12
	 Ne1J132begwnVpNk3ZgHbP66V28voQXTMoI5Ms8w60i8pk83nbIBpZMA/Lh658Ekhv
	 XJnI59/5yfStDblAYp/tG5czHQ9k9BNDnm/zH9TM9cK25GSOVaguqbykGq3Fh1GfPt
	 KbbKjdSxVD6MQ==
Date: Thu, 06 Feb 2025 04:24:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kamlesh Gurudasani <kamlesh@ti.com>, Will Deacon <will@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Praneeth Bajjuri <praneeth@ti.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manorit Chawdhry <m-chawdhry@ti.com>, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org
To: T Pratham <t-pratham@ti.com>
In-Reply-To: <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>
References: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
 <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>
Message-Id: <173883749024.411608.17744779894418319775.robh@kernel.org>
Subject: Re: [PATCH RFC 1/3] dt-bindings: crypto: Add binding for TI DTHE
 V2 driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_022453_001176_E14D87C2 
X-CRM114-Status: GOOD (  15.82  )
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


On Thu, 06 Feb 2025 14:44:30 +0530, T Pratham wrote:
> Add new DT binding for Texas Instruments DTHE V2 crypto driver.
> 
> DTHE V2 is introduced as a part of TI AM62L SoC and can currently be
> only found in it.
> 
> Signed-off-by: T Pratham <t-pratham@ti.com>
> ---
> PS: Please note that the dmas option in dt-bindings is subject to change in
> future as dma driver is not finalized yet. Any updated changes will be
> sent in the next version of the patch.
> 
>  .../devicetree/bindings/crypto/ti,dthev2.yaml      | 50 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 56 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/ti,dthev2.yaml:22:22: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/crypto/ti,dthev2.yaml:23:22: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/crypto/ti,dthev2.yaml:24:22: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/crypto/ti,dthev2.yaml:45:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/crypto/ti,dthev2.yaml:45:1: found character '\t' that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/crypto/ti,dthev2.example.dts'
Documentation/devicetree/bindings/crypto/ti,dthev2.yaml:45:1: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/crypto/ti,dthev2.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/crypto/ti,dthe-v2.yaml
MAINTAINERS: Documentation/devicetree/bindings/crypto/ti,dthe-v2.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


