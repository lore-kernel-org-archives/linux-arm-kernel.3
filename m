Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C83CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e83lrEIW3avB4qsniP1YuOsrntuQ181h3kAMmQsmlNw=; b=ezUUGWIO/atbS40gQqYg4kWDLl
	mxUqCJTfVQ2dhhe0SWxs+M5bk0UGHjIOnzcyGOr36UOPsnrH8CnX8YfCvhjHJoNG+dH4oVMLkVGe8
	7i1Yw2dUgorqBp8qielTDun42BpYeQD77vY2jXVedMEpN+yYUtWOdyoJ/FAxkOHXWnVqUW9jtqwDs
	4QIPUCQkD3Gd5n3S7Y+D3dx8fSRcQGmGoSQ/0gz81HjVWh0YRP4biLR9RAUo529C2xik7pkC9JRWn
	wm+iq0Xzdv9uhZNFAvAkOp8grzGpjDXOFviP/L7jMtLwubbDc9A34ynC+igk9AUsMiAJI/2TZMkYQ
	4Wz0Rguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zf-00000008tlN-0a5w;
	Tue, 09 Sep 2025 17:19:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyX6-00000007RGY-173E;
	Tue, 09 Sep 2025 13:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF5C0407C0;
	Tue,  9 Sep 2025 13:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEE4C4CEF4;
	Tue,  9 Sep 2025 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757425035;
	bh=31mOWd8+i/1YkiYaOgcvUkmjuR7GoBD5Ed0MeKEuOFo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BXVF3yf9YngGzwiQotWaE4Rx6byZFIleDiFn32GZnBJJycd+usgkvBcEjrfraU96O
	 OLTqsYuQ/7Ml956/i1KRFTRDv3ny65maB8g2Qe9iG1w94gWkJpNT2tofdbPoe2tXH7
	 opsMO0H97xnzvR7WoO7CbjNuFHu4L7lYCDl0vQEf4fIFRrRX5pXgXj6qyMEvJi35rf
	 DF9JVkUOLuzzd4k1pKuBWFVkqfOQpB4frNdfuxprHgWoaLw3EH4vIWgZC9Vp9SjlhZ
	 PV/YJisDuvITkYhqnPjVVPk0BAnO3xPs8gzW5kLJnw74J8pKUJwjCAajxeYcZSXdz0
	 HpfFO1hkpa2pg==
Date: Tue, 09 Sep 2025 08:37:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 Russell King <linux@armlinux.org.uk>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, devicetree@vger.kernel.org, 
 Sean Wang <sean.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-mediatek@lists.infradead.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Simon Horman <horms@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
 DENG Qingfang <dqfext@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Vladimir Oltean <olteanv@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250909004343.18790-5-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-5-ansuelsmth@gmail.com>
Message-Id: <175742464480.3063209.323009363144312411.robh@kernel.org>
Subject: Re: [net-next PATCH v16 04/10] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063716_341089_91539DAF 
X-CRM114-Status: GOOD (  13.17  )
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


On Tue, 09 Sep 2025 02:43:35 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/net/airoha,an8855-mdio.yaml

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): mdio: {'compatible': ['airoha,an8855-mdio'], '#address-cells': 1, '#size-cells': 0, 'ethernet-phy@1': {'compatible': ['ethernet-phy-idc0ff.0410', 'ethernet-phy-ieee802.3-c22'], 'reg': [[1]], 'nvmem-cells': [[3], [4], [5], [6]], 'nvmem-cell-names': ['tx_a', 'tx_b', 'tx_c', 'tx_d'], 'phandle': 1}, 'ethernet-phy@2': {'compatible': ['ethernet-phy-idc0ff.0410', 'ethernet-phy-ieee802.3-c22'], 'reg': [[2]], 'nvmem-cells': [[7], [8], [9], [10]], 'nvmem-cell-names': ['tx_a', 'tx_b', 'tx_c', 'tx_d'], 'phandle': 2}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/mdio: failed to match any schema with compatible: ['airoha,an8855-mdio']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250909004343.18790-5-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


