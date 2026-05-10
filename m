Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B8ECD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZGGb0k48YTdF5AnbwzcwUbU+FoBJX5pgV6kfpvQq5w=; b=FCVg0RMDYp9gIO1hZoQaclTWs7
	xRb0jB+uBw8tiF56rxvlwNOXpykl4R3jzNg0W85boxLyRT3Hkbl043iwU/YTQR7V1yClazkCkW6fY
	3uD6aqqOf1L9iltOJi26o8FuEPHx66aFftCcwiLRvf7OC0t/SUDudE2Dta5oRZ5nFHdeLd73DXnNZ
	7iz6CnQADZ5qhZfPCJ1t6fEqElYNxqiKnnPkoh5HudK2Vzi6NAgp938DIQMw0THsFmUuwpElFuZ3Z
	r7pSRTO0KTf+2699tpcfC1ruxCVP4k09OP1kUCKr9cJ+FW8nFndD/AIb1C1qvIV8oyfnn5TotNEPS
	Sn9pEI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0h8-0000000AVKr-2L5r;
	Sun, 10 May 2026 09:43:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0h6-0000000AVKG-0BEG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 09:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CD284323B;
	Sun, 10 May 2026 09:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10737C2BCB8;
	Sun, 10 May 2026 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778406206;
	bh=6T9RsFee+35Fv3yUGgy8bpfXlTZX9qPRAI1Cl6GHMRY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RksC4Wy4vawWBsBaSUB+WX9R5ImpO4RiREThlI1AArrJ+mjLTDmH7c6OgHs/t2fu5
	 1+uJTuhUnvpy2P0CNTSNrb2Hbz6quVKmPzXrRvHDJu7IBEnka38ruQiEf6fgBRTZmf
	 wFTazFwgJbly/IJywhqoTVhChZPHiTUYBqJWxX8bJ9Ei0U7DZo3NXe5Aix/khXKdrH
	 2Ll+Ic2gF1NJdIMj9FtIQ5/FOadRYNfGKukgkReQ9CfkHTmOe/r+s8EVOjvkPEKEql
	 8DkYOxkdO9EXVfePyutFgpl4SFCCYaj6FYEuxgeQqGhrw+Vm553quOrN2gESXDNulK
	 lGbLmgC4vdrpw==
Date: Sun, 10 May 2026 04:43:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, jic23@kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 devicetree@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 linux-iio@vger.kernel.org
To: Pramod Maurya <pramod.nexgen@gmail.com>
In-Reply-To: <20260510083219.70224-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
Message-Id: <177840620410.2231152.2719293513543946236.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings
 to YAML schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_024328_159867_5412B453 
X-CRM114-Status: GOOD (  16.03  )
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


On Sun, 10 May 2026 04:32:13 -0400, Pramod Maurya wrote:
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
> Changes in v3:
> - Move xlnx,channels from properties: to patternProperties: to satisfy
>   vendor-props.yaml meta-schema, which requires vendor-prefixed entries
>   in properties: to be type: boolean; xlnx,channels is a subnode (object)
>   so it belongs in patternProperties:
> 
> Changes in v2:
> - Fix patternProperties regex to use lowercase hex unit addresses
>   (channel@a through channel@f) instead of decimal; correct range
>   is now "^channel@([0-9a-f]|10)$"
> - Add allOf/if/then conditional to enforce xlnx,external-mux-channel
>   is required when xlnx,external-mux is "single" or "dual"
> 
>  .../bindings/iio/adc/xilinx-xadc.txt          | 141 ------------
>  .../bindings/iio/adc/xlnx,xadc.yaml           | 205 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  3 files changed, 212 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml: patternProperties: '^xlnx,channels$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260510083219.70224-1-pramod.nexgen@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


