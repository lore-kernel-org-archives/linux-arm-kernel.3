Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E7CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPaxln2EBfuYN49brJhOaJT913pHIinxeWLCiPWa9ts=; b=aq0E/tBU8prRXkyw6CRccoozuO
	dKdN4RJLTeKlq88r7CpUM22UJn3SwXhBdYS+/7V9Ntcz3QGs3Sq9FM1ZFRHvHT2mp/80A72yy5ywb
	HQPKUeHLmsUNdQPQHj8PBK1mSK8CW4j5fLgO+KyaEEocqxpmddwuTM2GsQQKKEO0lyoZVHzbnx04F
	XbkdsXXQq6Gf93lBJgnGBw/ujL0txmf2FKrcf3rvbzID4v75woh2kYOTDAiBCKW6SpsXPN9Mvtr4u
	tRXZJBnblePjzYGumpNw61XBv47aDCIjptGMHSiaNd1zJ8PNKFVPZkIdzfaN6Scg2o+Ja54B7a8qZ
	H3eWhOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECAq-00000002f5C-0nN2;
	Wed, 29 Oct 2025 19:49:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECAo-00000002f4I-1duN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA72444198;
	Wed, 29 Oct 2025 19:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596C6C4CEF7;
	Wed, 29 Oct 2025 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761767373;
	bh=cgW3eaNa1qTxN0mCfqwnT+I4/Tb+epp984COA7HO+0E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eBTsrI1yyG/5IEBOvpulu2NhU99j0sEVLtdj8hbSkWDsiMAYCUJg4ULJKi8yRVk2D
	 wnHzaS7GDiEDzkSeW8qzXfrjrf989UcPqwvuaanih9J1yswudljclqy7geLsKf27bi
	 YJoEWXmdeqGFcMNpKog7EeL7YdvNghoVk48LDUuX0jg5hFhMVmwz1zfsLtdJwjIiZb
	 N16/SJNKr+BN3tcnk9I6U1MYcvl+CE5qvdrkf3mIYhNnXNr3OGCUMAJ/qbNU2Xn8rf
	 zONEsmd/lUy/EASyRwrpv0g5Jk+xl47waAewpAD/v+28gBwn06vC0MiSxxfZymkPl4
	 p2SzxTBjr8gRg==
Date: Wed, 29 Oct 2025 14:49:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20251029185448.2121857-1-robh@kernel.org>
References: <20251029185448.2121857-1-robh@kernel.org>
Message-Id: <176176737216.2539117.14470144508390937372.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho
 to DT schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_124934_452783_88CF501E 
X-CRM114-Status: GOOD (  13.88  )
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


On Wed, 29 Oct 2025 13:54:47 -0500, Rob Herring (Arm) wrote:
> Convert the ASpeed fan controller binding to DT schema format.
> 
> The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> rather 1.
> 
> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../hwmon/aspeed,ast2400-pwm-tacho.yaml       | 105 ++++++++++++++++++
>  .../bindings/hwmon/aspeed-pwm-tacho.txt       |  73 ------------
>  2 files changed, 105 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.example.dtb: fan-controller@1e786000 (aspeed,ast2500-pwm-tacho): #cooling-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/thermal/thermal-cooling-devices.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029185448.2121857-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


