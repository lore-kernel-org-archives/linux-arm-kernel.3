Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C9ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXmLwUY9C7bldWxXkdv6SGUaN80t+rG6y4XBjFWYAXI=; b=smpYufixEI2q3FOdwhVXaezcMm
	OVXf/cZkEVYBlfPSrbsGT0WVCE625OdKxxlZpqlAliLuxX8jUYAqJCChEYWYHjAQjBC9dqaiE8mJK
	sPteht6+0V97m/V8qm+wFTw14uLwDjjOdi70DG3ooD+IA4kpIydQ8uCxjIgno0YvYnpNzzLVrlLxb
	XiYXMzjPZMr+jSmgwuaCNM6EhtGuYGSIOdtIDiaJ5GGl2oxc4tdNYtZPKI/A8PuQYKqLyS4SDKk6E
	5qC2N52WTBjewyNbRzfH0wBdHjxbcgAZIBy84id18O1kMcWAsOPi+M9/aKfE+80Xne5N2rlJ8gPag
	Tt2rHh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPh-00000001aqw-31HP;
	Fri, 22 Aug 2025 05:34:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwn-00000000p7I-2I9a;
	Thu, 21 Aug 2025 22:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E5D144C5F;
	Thu, 21 Aug 2025 22:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6D8C116C6;
	Thu, 21 Aug 2025 22:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755815992;
	bh=6+cneP8xDnuU5FHp6ZE4wpE6pWPQvWdqGAQj+wxVZj8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JWroQvBlvJj3n3GQj85XFCVw1RomjL3x/nkCU4RTbgYO65e9E7eN8T3+QPp8VPUDi
	 5rUdQz4i7YpZV3cCkF7fVvd7pwkI3tNbYHvFIXRy6kzneXEeRzPwmgcq9Izgv+1Oin
	 DYtwhazNI783UY+RndJ8i50KtG02lJ9LORgbBg4URyKshly+QMkwzjoku368tF3oaZ
	 PV3k43WFiYPE7Y++y+OTu+0uMBSP/3l5S9OJPdkyW4Abcy/2DT/Pf4bj95pe5H6liF
	 DiK8e+cKE+CBABkBpqThiec+t13OK8+NseaAbugSa7K8jOzA6hreQ1LeUfYpPCllxW
	 aST3CoSeeDmUA==
Date: Thu, 21 Aug 2025 17:39:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neal Gompa <neal@gompa.dev>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
 Felipe Balbi <balbi@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Janne Grunau <j@jannau.net>, devicetree@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
To: Sven Peter <sven@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-2-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-2-172beda182b8@kernel.org>
Message-Id: <175581575858.1136316.14856911628324128636.robh@kernel.org>
Subject: Re: [PATCH RFC 02/22] dt-bindings: usb: Add Apple dwc3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_153953_749163_762B52BF 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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


On Thu, 21 Aug 2025 15:38:54 +0000, Sven Peter wrote:
> Apple Silicon uses Synopsys DesignWare dwc3 based USB controllers for
> their Type-C ports.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../devicetree/bindings/usb/apple,dwc3.yaml        | 82 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/apple,dwc3.yaml:33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/usb/apple,dwc3.yaml:40:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/apple,dwc3.example.dtb: usb@82280000 (apple,t8103-dwc3): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/apple,dwc3.example.dtb: usb@82280000 (apple,t8103-dwc3): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250821-atcphy-6-17-v1-2-172beda182b8@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


