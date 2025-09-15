Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00D0CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OnU78tOuCsmUj7JhZ3ncDy5W2LHbjtL1orhVFVmg80=; b=BY9nuLap3VLb1Z8MVc28R0WOp5
	67enZKtRET/a2m1rbh227x0P9Jse6hUuuv/iYphQU5J8IizIYBe9XRBN0z5uHrstHH+GkV8lEB1MP
	28aff/R4o/Mw5xHn8InoHMMKrpnLtUsmg0GbaWm8RCaSt9EH69lznzoUsCU3qcNIYYfQwf60qp/2l
	SweDLPda8BvNqpTmtFWyjIHgIvG2ezPltrn2vOpxSmXBOT1wDf1HsVW9nRqF8PV4z3RI/pxLR6Idm
	TU3G9ZGvK7l8aXMiAfJ9xzpAfDVwQkpDgd8mbOxEVgmxOXQnLT8HsCBxGyN3bEvPkbRbH4cRx61OT
	Y0DCQuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaO-00000005CJd-0g0v;
	Mon, 15 Sep 2025 17:01:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaL-00000005CIB-3e6h;
	Mon, 15 Sep 2025 17:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB4DD4403F;
	Mon, 15 Sep 2025 17:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B93C4CEF7;
	Mon, 15 Sep 2025 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757955708;
	bh=ybnq6TfBeUjye9uRRrxgazoqeAR/KqnFTVvxQhsbxpI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JLfa2jcXrnbxpTRuxh1KJ+8gZAamHyThRyVHtBOvj2AncGOmXlLR5S8vUHU3o5/ZO
	 M+FXXmD/qdqaBcUt+v41jYr8U4UsT1fyBTqh66km5cPbSPdaJPhGXuFJpuxg1U6PQ8
	 /drAVcg9f3eTapOvUIpq84g/+r1xBAiggFEkanbUY1gBvNvTOUcvYBkVu+tVCQz13p
	 fJYTxbDO4hnPaSVva9rspIUwRcEps3yX2RIT4gxgwjfttWCaDGr2oGpeH/fWR1cfMP
	 HIKoIvTof8oDlUHZQTxBksbuJdWk8aLox4CyK8Xb4jl5GHkXT2vF3gBMLXmucyBe5b
	 oitwRsrgUOCrg==
Date: Mon, 15 Sep 2025 12:01:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, 
 devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 DENG Qingfang <dqfext@gmail.com>, Lee Jones <lee@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250915104545.1742-4-ansuelsmth@gmail.com>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-4-ansuelsmth@gmail.com>
Message-Id: <175795551518.2905345.11331954231627495466.robh@kernel.org>
Subject: Re: [net-next PATCH v18 3/8] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_100149_954471_C051F0CF 
X-CRM114-Status: GOOD (  13.29  )
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


On Mon, 15 Sep 2025 12:45:39 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/nvmem/airoha,an8855-efuse.yaml

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): efuse: {'compatible': ['airoha,an8855-efuse'], '#nvmem-cell-cells': 0, 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'shift-sel-port0-tx-a@c': {'reg': [[12, 4]], 'phandle': 3}, 'shift-sel-port0-tx-b@10': {'reg': [[16, 4]], 'phandle': 4}, 'shift-sel-port0-tx-c@14': {'reg': [[20, 4]], 'phandle': 5}, 'shift-sel-port0-tx-d@18': {'reg': [[24, 4]], 'phandle': 6}, 'shift-sel-port1-tx-a@1c': {'reg': [[28, 4]], 'phandle': 7}, 'shift-sel-port1-tx-b@20': {'reg': [[32, 4]], 'phandle': 8}, 'shift-sel-port1-tx-c@24': {'reg': [[36, 4]], 'phandle': 9}, 'shift-sel-port1-tx-d@28': {'reg': [[40, 4]], 'phandle': 10}}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/efuse: failed to match any schema with compatible: ['airoha,an8855-efuse']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250915104545.1742-4-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


