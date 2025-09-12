Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344FCCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADH8FDYrRpatlwYvW/M+NwyNbhxEnWImCCi3Ml66nFg=; b=lVo7MTB0fF5wBiBMWpDOpTOEUI
	1ceonSJ4iz3w6F/TblKHUbLIF0tzTAik+DjKNkjRT1TW25qXSW2Yc+u8vcUxRIw+K7V+irY8ml0JE
	V29/9P+p2JDzVFmWzPSXfMozs3DrRvW5aj0t7wyogX4sJN21hQ1UGT3ge4zzcP/4y9sRO7oACHR+0
	6US3gpYIyvHY1jpCaOQwt92Oq10EcAjalSydLWade+51TN79c4C9k9HaMV+4o6hbP07aNtJObaK7a
	2kwdJz+qT4Huc+r6aEb8J+W/RjLGTTrEXdJMpueoo8UiZy9lW3sr/NQT2OeHphwpYyFosVmIDa6ej
	ndHQVO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4h0-00000009rOx-0qtI;
	Fri, 12 Sep 2025 14:24:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gu-00000009rKK-0Y5K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0C764513D;
	Fri, 12 Sep 2025 14:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88439C4CEF1;
	Fri, 12 Sep 2025 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757687035;
	bh=NFv/yYr1KOxreJRPTaFPS6HpBuZ76BcfhaKQEMHG2H4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dwQWORoqLKX7hCzuvdQ6m1qIZ5eGYlNfV4cHStnVnbsoDt/iiQzrRVkbLyL1QExuU
	 699F7UYbQ9CypuGbnco47riN7D0rVCBBEQuQVNb9daHtErb5xnfxyTL02+vHLrAtcW
	 AdlUQpVqLeGTEFDYn3ywOQVT8O014qmNuqsFLym9EyONKxCOL05n2jqcxVLphWwGjp
	 DuhHoK2pFnqmrM+B41gnTHSBtBwVfaWYyo6CUG4nIsHVDM2bq+v/nIqhmhvfJIacIl
	 UwlSA8seNolE70FB/mLjtrRF2G5jXr22Fsk7MP5AW/lpBziBWe/uaKTLNFmSO6Vs/9
	 qPz+IPF6X8H4A==
Date: Fri, 12 Sep 2025 09:23:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org, 
 linux-arm-kernel@lists.infradead.org
To: Gary Yang <gary.yang@cixtech.com>
In-Reply-To: <20250912060650.2180691-3-gary.yang@cixtech.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-3-gary.yang@cixtech.com>
Message-Id: <175768614788.1334014.18023232974115676473.robh@kernel.org>
Subject: Re: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072356_191350_11143206 
X-CRM114-Status: GOOD (  11.97  )
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


On Fri, 12 Sep 2025 14:06:49 +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S5 state.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.example.dtb: wifi-vbat-gpio-pins: pins-wifi-vbat-gpio: {'pinmux': [2816], 'bias-pull-up': True, 'drive-strength': 4} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912060650.2180691-3-gary.yang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


