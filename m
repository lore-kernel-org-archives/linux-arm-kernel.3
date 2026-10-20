Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9380F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qi89E6pE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13Yuoyae55wiKNqti/LOAEL9RI5niDoBeik6pXc0Zx4=; b=Qi89E6pEdusKA2FL/p57Fnz96O
	HAJS9VwzkeQ2mI2nrUCU1RZ42n1jltRUux6wuXSwac+2hMF7lZX5CDmWYnlG7rw/NgS7zIKX5WmTz
	UpCbZmkAzY/HO1wCiJzCWth1fLbwfhFR4HbfOUjUTZSICaoIbwn5G98GUEUYC2NMT1UypcAVsCIcc
	DhdrDgJRiTkxKazV3FDl/8PmgsShO1SR7NTvSfzHCbe40iqTsHzmwlOHHrtBnH3l6+unl3SiDrqy5
	l1vma1DuAdB7JxcU1TPSBR+IkijLE4XrRRr9j9882DSI9/xOSdF7JGG244E1XpH5aWXEc9nfkj/1e
	0KXGomLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBWB-0000000A2N4-3Glz;
	Tue, 20 Oct 2026 15:12:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBW9-0000000A2Me-2qO6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:12:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7644E600AA;
	Tue, 20 Oct 2026 15:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1188E1F000C4;
	Tue, 20 Oct 2026 15:12:44 +0000 (UTC)
Date: Tue, 20 Oct 2026 10:12:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, edumazet@kernel.org, 
 devicetree@vger.kernel.org, mohd.anwar@oss.qualcomm.com, 
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, 
 alexandre.torgue@foss.st.com, daniel@riscstar.com, joabreu@synopsys.com, 
 pabeni@redhat.com, davem@davemloft.net, maxime.chevallier@bootlin.com, 
 netdev@vger.kernel.org, linux@armlinux.org.uk, richardcochran@gmail.com, 
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, 
 kuba@kernel.org, hkallweit1@gmail.com, krzk+dt@kernel.org, 
 p.zabel@pengutronix.de, andrew+netdev@lunn.ch, conor+dt@kernel.org, 
 lorenzo.bianconi@oss.qualcomm.com
To: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261019030129.1470307-2-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-2-elder@riscstar.com>
Message-Id: <179250894164.3309593.6302141090126438838.robh@kernel.org>
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: add support for Toshiba
 TC9564
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 18 Oct 2026 22:01:24 -0500, Alex Elder wrote:
> The Toshiba TC9564 is an SoC that exposes two XGMAC 10 Gbps Ethernet
> interfaces, each of which is attached to an embedded PCIe function.
> 
> These XGMAC interfaces have three resets, for the MAC, PMA, and XPCS
> layers.  These resets differ from the standard two resets defined
> in "snps,dwmac.yaml".
> 
> To permit these other resets to be used, modify the way resets are
> defined in "snps,dwmac.yaml" to be similar to the way interrupts and
> their names are defined earlier in the file.  That is, rather than
> adding descriptions with the resets property values, just specify the
> maximum number of items.  Then, in the reset-names property, provide
> a list of description/constant value pairs, indicating which renames
> may be used among the (three) reset items specified.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  26 +-
>  .../bindings/net/toshiba,tc9564-xgmac.yaml    | 327 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  3 files changed, 351 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:reset-names: {'maxItems': 3, 'items': [{'oneOf': [{'description': 'GMAC stmmaceth reset', 'const': 'stmmaceth'}, {'description': 'AHB reset', 'const': 'ahb'}, {'description': 'MAC reset', 'const': 'mac-reset'}, {'description': 'PMA (Physical Medium Attachment) reset', 'const': 'pma-reset'}, {'description': 'XPCS reset', 'const': 'xpcs-reset'}, {'description': 'OCP reset (deprecated)', 'const': 'stmmaceth-ocp'}]}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:reset-names:items:0: 'oneOf' is not one of ['const', 'deprecated', 'description', 'enum', 'not', 'pattern']
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.example.dtb: ethernet@48000 (toshiba,tc9564-xgmac): False schema does not allow True
	from schema $id: http://devicetree.org/schemas/net/toshiba,tc9564-xgmac.yaml
Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.example.dtb: ethernet-phy@1c (ethernet-phy-id004d.d101): Unevaluated properties are not allowed ('vdd18-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/qca,qca808x.yaml

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml

See https://patchwork.kernel.org/project/devicetree/patch/20261019030129.1470307-2-elder@riscstar.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


