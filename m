Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110FECD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mATrAA049ojUxpu8FJEZ1orL/4F5q0DIudqTZyeQu+Q=; b=sJlbWnEGIPoXbpTtGoTYYyIIza
	BMRGJvD9OqpfnljCHXF0Cjk8ADhikALjA5JMe1cWJJSE7xPv5Gwou/YyORhW7DgfEUGGsnqhb/TID
	/uhC3F1e+9LIR+40rJUSE7njE3au4kUqDCZZQoDaJqGlrlV7/b3e1XhSpbhMVBbvEyoF+AXrIWXC9
	rToXOeZEVJcSUd+X4KISOaebSQ9fZ9mbzqXggYeKNxVcJXLq2D9QwEFPX/QzoTvzlJvIi0IOrH+Di
	WhewfeypRw7Wr5lKNMxGel6EoQr5ntxsCbkXyQwhtOl8VLVWp0Dsujn4zJf+QKdKUqtA/MJdCmrY9
	iZHgBusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnIJ-00000009WrN-3oZC;
	Sat, 09 May 2026 19:24:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnII-00000009Wr0-2CMB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 858976057A;
	Sat,  9 May 2026 19:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD967C2BCB2;
	Sat,  9 May 2026 19:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778354697;
	bh=LrTQhZFqEFWlXldnpLp7nLpcr1oWJNc2yM8vCrm5ROg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WuAHpUaCjLsKG+MBTnlOKKFGcPC3zwTxnw2x3k0TEdeLGcHkZx9jGe9wjdDFe/33i
	 UTwDBbWrqvmlOcDgKcE2uKbfCl+g3OeQwZHfSBeulYnA37pfK1Ob5F2yY9Bwx2X2ue
	 2XWOTO4iTq12C2e3/GqfKWc59ACtDYBfThcjujsWIkUmtwBvFhUxSMpsyOKvtG7pHW
	 77Y35+HZ1e9lanNI+koozpdtIHH4f8wPLPG5va5N/V93S7XYUNChkKs76NNCLd6zgu
	 JSU8gR6BLY10tCBMzZDx9OfRFep4vKDDICcg5CFXvbrtBYVNo/iAGq02AzxngRVlVN
	 oRuBNGJQvGYYQ==
Date: Sat, 09 May 2026 14:24:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jic23@kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Michal Simek <michal.simek@amd.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
In-Reply-To: <20260509180719.53704-1-pramod.nexgen@gmail.com>
References: <20260509180719.53704-1-pramod.nexgen@gmail.com>
Message-Id: <177835469457.847221.7871315784536498346.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: iio: adc: Convert xilinx-xadc bindings
 to YAML schema
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


On Sat, 09 May 2026 14:07:14 -0400, Pramod Maurya wrote:
> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
> from the legacy plain-text format to a YAML schema, enabling automated
> validation with dt-schema.
> 
> The new binding covers the same hardware and compatible strings:
>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
> Changes in v2:
> - Fix patternProperties regex to use lowercase hex unit addresses
>   (channel@a through channel@f) instead of decimal; correct range
>   is now "^channel@([0-9a-f]|10)$"
> - Add allOf/if/then conditional to enforce xlnx,external-mux-channel
>   is required when xlnx,external-mux is "single" or "dual"
> 
>  .../bindings/iio/adc/xilinx-xadc.txt          | 141 ------------
>  .../bindings/iio/adc/xlnx,xadc.yaml           | 204 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  3 files changed, 211 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml: properties:xlnx,channels:type: 'boolean' was expected
	hint: A vendor boolean property can use "type: boolean"
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260509180719.53704-1-pramod.nexgen@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


