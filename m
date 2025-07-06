Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3EBC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 22:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPMhJpC0bXoNzxd7n1kUTivOhfnz4qEe6QVW5T825SY=; b=tdwzlKcVlR1TGsysKa+ND0KlcI
	LQ4sCdYEhsfMsqEPaEBilDloPfQ4YKZsXPaQPtpwfOEBixW3hW6XXh3hlg9Y8T86KlKFXLdpFww8T
	lP0jsnXuMt15vzZu5DnOsMICSj4eZdqNgC29jXvGuTutVHE0NeW8cI5M6PNR7C785ECdY/q1Po5jD
	dMP1LwCQigHAP4WdvTDbLyUgmclLozZc6BaV0ufHkJvQGKDNSkXVZxg/50I+YYvc1eTrW4Z0GZhce
	bseDwA4b2m/1DR/pTg/SVz12AniUJITTlxMr3yNGzy+91eZ+J1Yf6jD3mV1y27//Ne6G50ejgPN3Y
	XNeSebfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXuC-00000000tkm-0Mg6;
	Sun, 06 Jul 2025 22:32:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXrr-00000000tYo-2FlT;
	Sun, 06 Jul 2025 22:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 692D3A4019B;
	Sun,  6 Jul 2025 22:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD28C4CEED;
	Sun,  6 Jul 2025 22:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751840988;
	bh=+FqcxieyCSl/BmyJUx6uOpbHQwdGTCBbRvnIJVsyPnQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UaIqaj+bE2PNvlzxHFsU8bKx/TvQ3nxBydLq7fyxyT/z8TiiGRP9154ikYh0K54sb
	 Z4EZ6WP+xlLWwTRPFvI279+Mu0sNBBWRDyf93thd0x4XgRbRAi9/899cayp1axI3Qq
	 EX4yMhpZd/Sy8d7UosGDsR4TuLoxLRVpwwKSuDeFL1+akM2+E1ByWZ4LcnDzOzltDM
	 hTeuVRd+gUQpuOtJ8lda/i58I8WztFNzGk0pcu9nmY2i4NZ116tt+L4mOTB4wA4T13
	 B1BO2f0YH9Xirjm5Vwyc9JwduiRJwc5yaCwXeqfw6fTuID9y6HlDM1XEm5tFvl3eg0
	 U+xUMsY5ribCA==
Date: Sun, 06 Jul 2025 17:29:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mips@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ansuelsmth@gmail.com, 
 Conor Dooley <conor+dt@kernel.org>, Stanislaw Gruszka <stf_xl@wp.pl>, 
 linux-mediatek@lists.infradead.org, 
 Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, yangshiji66@qq.com
To: Rosen Penev <rosenp@gmail.com>
In-Reply-To: <20250706214111.45687-6-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
 <20250706214111.45687-6-rosenp@gmail.com>
Message-Id: <175184098772.672740.2328928098872646704.robh@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: net: wireless: rt2800: add
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_152951_727879_FA0DCAA2 
X-CRM114-Status: GOOD (  11.33  )
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


On Sun, 06 Jul 2025 14:41:10 -0700, Rosen Penev wrote:
> Add device-tree bindings for the RT2800 SOC wifi device found in older
> Ralink/Mediatek devices.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../bindings/net/wireless/ralink,rt2800.yaml  | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml:43:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml: ignoring, error in schema: examples
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml: examples: 'wifi@110180000 { compatible = "ralink,rt2880-wifi"; reg = <0x10180000 0x40000>; clocks = <&sysc 16>; interrupt-parent = <&cpuintc>; interrupts = <6>; };' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml: examples: 'wifi@110180000 { compatible = "ralink,rt2880-wifi"; reg = <0x10180000 0x40000>; clocks = <&sysc 16>; interrupt-parent = <&cpuintc>; interrupts = <6>; };' is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml: properties:interrupt-parent: False schema does not allow {'maxItems': 1}
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml#
Error: Documentation/devicetree/bindings/net/wireless/ralink,rt2800.example.dts:19.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/net/wireless/ralink,rt2800.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250706214111.45687-6-rosenp@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


