Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D22C982CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EztYNQsdjLqlbOEDEsuqybbRRUCXbpkuwA/2dp5qRI=; b=1qdRS43Umj14AqFWCbe0Pz/rrg
	ze8k8/GhXMf0miObxW0KJdBHJb+3NON1+Qx+7QRH5iVwDdXnpHpxmEW7ri/20Iws+6XWXgwCj9h7H
	4HYrytfT98cZE4n9yeE5xJs3VYldSM+1JoAkZEYlr7bfdI52oGsl1ZicSu6XSis+nx7URhGz+b3qO
	OTh0sPsFHfw86CGqS023AAHHwqfVpKpTpcxNvlAfriKYwSDezMWa/el3V3u3MFueIBvpq8jJqW5MG
	uZxfirDZZNfvSDPyW5/6Rvg34iqrn2GXLExtXRICzrRrBcIJQyqS1Tuxw8MsiDT/kpGtNhlR0RmE9
	l4FPCfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rSh-00000009Z8i-40Ja;
	Wed, 16 Sep 2026 15:22:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rSZ-00000009Z6t-2DJL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:22:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2EDE60234;
	Wed, 16 Sep 2026 15:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A611F000FF;
	Wed, 16 Sep 2026 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572126;
	bh=8EztYNQsdjLqlbOEDEsuqybbRRUCXbpkuwA/2dp5qRI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=opLOvjeGosMppia9uO8Q/Y0ZFmvqlKZvofdW32/kTovLCJvHaJEayYOKbu4chKGNL
	 5hsNx+GTdLM7tS2SmzRggY9wFOz6uEM1hIyBzUxgWOyERkELVKd2hUfnyWJfIe6uLV
	 Rinjqu7DvXGC4BFwYD47POgPlE8TWZzzFv7DqKtt4Nbb82Iws037PyXZLt2geRDVXC
	 0bzPVRALj9OPpxmriQlotbjN6nD5oEYfMDXiwIAh53rVk+SBUuElHThnWULatSij7W
	 vpWIUtl8yA1g5KKxF98iEejoYgMd0+II91sTJIjVlbdskZ5y23NB7qY9KrvBZ/FZd4
	 8pfPsN5e/kgJw==
Date: Wed, 16 Sep 2026 10:22:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 linux-sunxi@lists.linux.dev, Russell King <linux@armlinux.org.uk>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>
In-Reply-To: <20260916044119.475666-2-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-2-alastair@d-silva.org>
Message-Id: <178957206753.228275.3543582001774069181.robh@kernel.org>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: phy: Add Allwinner
 AC300 EPHY binding
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


On Wed, 16 Sep 2026 14:41:16 +1000, Alastair D'Silva wrote:
> Add device tree binding documentation for the Allwinner AC300
> Fast Ethernet Physical Layer (EPHY) co-packaged on Allwinner
> H616 and H618 SoCs.
> 
> Assisted-by: LLM
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
> 
> Notes:
>     Tested on Mellow Fly-C5 (Allwinner H618) under Armbian with Linux 6.18 and
>     7.x kernels, verifying schema validation with dt_binding_check.
> 
>  .../net/allwinner,sun50i-h618-ac300-ephy.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.example.dtb: ethernet-phy@0 (ethernet-phy-id0044.1400): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-id0044.1400', 'allwinner,sun50i-h618-ac300-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
	'ethernet-phy-ieee802.3-c22' was expected
	'ethernet-phy-ieee802.3-c45' was expected
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun50i-h618-ac300-ephy.yaml
Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.example.dtb: ethernet-phy@0 (ethernet-phy-id0044.1400): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-id0044.1400', 'allwinner,sun50i-h618-ac300-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
	'ethernet-phy-ieee802.3-c22' was expected
	'ethernet-phy-ieee802.3-c45' was expected
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260916044119.475666-2-alastair@d-silva.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


