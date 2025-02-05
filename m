Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3DAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75ewEXokXSxAyGpCdHtnkZznZR1QsucrTnumqtyr1tw=; b=3CmaqkDQx7YLi+d06AA6cfuYvB
	K5YeEm50OfQGL+UC6HDtDWoB2FdqOMigO86Gt7qyu1wi8SGl130+tFMpcVGu2+v/FYAHLoCkFAAEg
	13OddqYMtdLNRppzNFYHqblbFeF7zcXCenwM9HcYdxNwp1LI+rAvAOZd200xHAfGY65vE71ZsiUgm
	WuG204CLQEOac4wvH+b8iPPwHogkZAdry7SRirMkKMssgI4JBqz9cWYj1RcFwMUat9eNwpshdzt8/
	aFzxbQSFlyFXxM7kLIWwnaMEOK8kHYnZdUlEZiTPDHdN4M7HTe3cKIqWM0AZB/ILxaij4qCmCRWHl
	kF5hBa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflD2-00000004Qz3-3GFQ;
	Wed, 05 Feb 2025 19:37:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tflBf-00000004QoI-2zIh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43A925C6E63;
	Wed,  5 Feb 2025 19:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB51C4CED1;
	Wed,  5 Feb 2025 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738784150;
	bh=l94FF8P1w7MiX05RA/T0pW7/kmfbGvyA+LpwGszjAyI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pw1dD3d7zc2mhC3xcYMdVVtX4RuGi8Q7yZ9KJwmM7NNNxgehlcKJy/lhUniUr/tfa
	 SyPp/unMH5ghf3VJvcG/4PQ9C/ZTdMezQKEIwTboFQlOo+xs72JZjmAOCb5ZBlR9Ih
	 ANq0Uz20Aqwg8yGtXrup/P8b8BGGDcprYYMiwl5W5JE+vERN0Du6nq4n3Wh/gje5f6
	 egDN45KaqBJ6srcCU58p4C8QXogMx1fPRVpEhpaXljP0u8j0VdcHnMMSoegpWUfTqq
	 /Ov8udZwMclLhWBTSDkdQRkgUhsfEGA4AL0NsPYZkGBwfPCXn/ZMsQACcTsnMCbPl7
	 oIAb9S2Wn/EDQ==
Date: Wed, 05 Feb 2025 13:35:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-pwm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Daniel Mack <daniel@zonque.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <266765abb8251bd60796a3c4270e3809bfff952e.1738777221.git.u.kleine-koenig@baylibre.com>
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
 <266765abb8251bd60796a3c4270e3809bfff952e.1738777221.git.u.kleine-koenig@baylibre.com>
Message-Id: <173878414916.2733923.916545149543480294.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: pwm: marvell,pxa-pwm: Update to use
 #pwm-cells = <3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_113551_794062_E625F3A2 
X-CRM114-Status: GOOD (  13.65  )
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


On Wed, 05 Feb 2025 18:54:01 +0100, Uwe Kleine-König wrote:
> The PXA PWM binding is the only one that doesn't pass the PWM line index
> as first parameter of the parameter cells. However this can be upgraded
> to the mandatory binding for all new PWM drivers without breaking
> compatibility for old device trees using #pwm-cells = <1>.
> 
> So bump #pwm-cells to 3 with the (undocumented) promise to keep the old
> behaviour for #pwm-cells = <1>.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.example.dtb: pwm@40b00000: #pwm-cells: 3 was expected
	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/266765abb8251bd60796a3c4270e3809bfff952e.1738777221.git.u.kleine-koenig@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


