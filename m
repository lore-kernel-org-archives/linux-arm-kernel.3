Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F65FEA8112
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uRWFPdHEmXPuzgw91gqbQWD+F9tqzm+QUuGOLt9pcs=; b=GQMHWXatdI8c7KFVT5unLdVCWv
	+MvO3IAYNpZXAq1d2atNvQtl8Gaaf2IA3IOCjSXVb8Q1L8hNlPBJM1G9PT4DzjwRJ5ZnEiFL7eRx1
	BV33KY55ikItgGWUEm+wzCbeHgsUM+ke0Ij2T45WJx23sSN6OzIG+rf2rHXLR0IF+088nysvKu3eh
	h4EAUcsqyeucLlQOtUsaPT4kjAmlVPIc94K1Q3V8s7utFFcYBvAh6wlDa14ZOYS0x+ijt6lYNapJc
	5Qr1unOd5xrixSceFiERZegTtrrJfRsvCXWK7MtIgzH/ACx5+o1slNYRYLFuZQaFGT/Y5e9+G/o6+
	JptKiIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpntY-0000000Gzpa-3EVv;
	Tue, 10 Feb 2026 13:35:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpntX-0000000GzpG-2aBz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 13:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EF8660097;
	Tue, 10 Feb 2026 13:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA280C116C6;
	Tue, 10 Feb 2026 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730510;
	bh=pOU4O74VvKCHJ34mMFpIVQ+S/He2Ol8rafSLir616W4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DPO2T1h+M+Nha4vZaFiTCBZ/lAH+hR/wqUxZb5qfbGyg77+pHgj4+LRd9CqCinMKQ
	 8FF+Gs/Gkna9qwtaxuho8WLcoTbQ7XDzPChAGmfCsXtc5pAYFbLQfzUjfZR83+ikVB
	 VR16qpeIRW9bhXA4H6RnEBvcCKdz1R0X5vb96GaH33oMebEmFGeI5gIL6N0sMIh62n
	 k2efThEbB47mBL6mCkXbc8S5xfeRnl9/Bbu29gv/PcHvO4FbLf2z+Uj9xmwnQP6lV9
	 uCzp6sItHaozwRAD7tfSNtldQacJg1MmTVgq5gOY9yF/oYxlD02SHMi/UN88WtzwuD
	 03Yien9BUoOJg==
Date: Tue, 10 Feb 2026 07:35:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, 
 mcoquelin.stm32@gmail.com, yclu4@nuvoton.com, alexandre.torgue@foss.st.com, 
 linux-kernel@vger.kernel.org, edumazet@google.com, 
 linux-stm32@st-md-mailman.stormreply.com, schung@nuvoton.com, 
 netdev@vger.kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, richardcochran@gmail.com, 
 davem@davemloft.net, openbmc@lists.ozlabs.org, krzk+dt@kernel.org, 
 kuba@kernel.org, ychuang3@nuvoton.com, peppe.cavallaro@st.com, 
 pabeni@redhat.com, joabreu@synopsys.com
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260210052226.3005666-2-a0987203069@gmail.com>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-2-a0987203069@gmail.com>
Message-Id: <177073050804.2585725.9186824856266132663.robh@kernel.org>
Subject: Re: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
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


On Tue, 10 Feb 2026 13:22:24 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 133 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): phy-mode:0: 'sgmii' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'sophgo,cv1800b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clocks: [[4294967295, 1], [4294967295, 2], [4294967295, 3]] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['nuvoton,ma35d1-dwmac']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): reg: [[3875995648, 8192], [3959435264, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260210052226.3005666-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


