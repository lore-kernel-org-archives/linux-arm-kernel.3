Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AACFD609B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIgAsiaq92RHSdMq2QoN92q3zPBWK/U76ZgrzdhJjbg=; b=CcFB1mqUD4GpOWqDNkT3zFJDbO
	VAGdP8qHt4zotxFGFVue0yJBYFNFbOeBQbJP6vMpKj0fMOh0Kdj278w8SrONX/SSoIpafifD6rDpW
	tF00xQkENQCkaKSIDn5E6tnpjhzG3dc8sZImstOgZtCUYz8qLapvLzh5oB/2JQPqLoteK8EnRYm05
	76Dt3TGTdDmQvwn3wvbH79aGjyNSVvj92E9+1PV6n/2UqafD1jSB6i5vMs/sUzKy4oiyZ8flikGfn
	qCEjaqrpjz0C2zgF6EfyHq6RCYdUg9JepSHc0pT1oaXUNBUELbGULf5zjbv9qulUd74Rg30qjwlTO
	0jleUIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXDn-00000005TDo-1fZs;
	Tue, 16 Dec 2025 15:44:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXDm-00000005TD8-00Yw;
	Tue, 16 Dec 2025 15:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 70D4F6017B;
	Tue, 16 Dec 2025 15:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04171C4CEF1;
	Tue, 16 Dec 2025 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765899857;
	bh=5FCtWKu4gSPyAonL0m0zznCMC+guvfyTLTTvXhmL8WA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tEpMjfb9GWfRRhPdxOIJMXHcRFAHwmC7zhL96Uu8qx+M2D5EHDd2u+y/zwoW74rGe
	 a+SfB0xzOdAeadMTQS8OpzypNzOht01ZAYy32TC/Iz6Zaggmb+SoUuUmjCoEb+V5GT
	 ujjHqPWYedSwPL8BzcEI5ld5JWY6+fNI5QudhFaFFaOeOlWkXWRJCUKtVR7ppwKjCa
	 4HFpl7pukWPYaakGCP1dm7fFBWJm0S/4IhrOlpi+5wRXoihqlmP57YKVLNI6EaFG8Z
	 7hRKt/L6PHHmmeGK04QfhfvKpJHt0vFmQlggIhNJRM0/pP7eofupAaJ5aJlXcsMih7
	 8f5OwD87pRvCg==
Date: Tue, 16 Dec 2025 09:44:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
 tao.huang@rock-chips.com, Linus Walleij <linus.walleij@linaro.org>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
Message-Id: <176589985437.2528677.5118158763336562885.robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
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


On Tue, 16 Dec 2025 19:20:52 +0800, Ye Zhang wrote:
> 1. Add header file with constants for RMIO function IDs for the Rockchip
> RK3506 SoC.
> 2. Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
> which is a sub-device of the main pinctrl on some Rockchip SoCs.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
>  .../bindings/pinctrl/rockchip,rmio.yaml       | 106 +++++++++++++++++
>  .../pinctrl/rockchip,rk3506-rmio.h            | 109 ++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml:88:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.example.dtb: rmio (rockchip,rk3506-rmio): compatible: ['rockchip,rk3506-rmio', 'rockchip,rmio'] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251216112053.1927852-7-ye.zhang@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


