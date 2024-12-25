Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1EBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4vV6k2yMin3zxgst3cgpCfnKTd2xrj4cgMcOxVOF2U=; b=eOjUPRyaIwxM65TqbDZH700Zow
	FuDKouUwHExrUsrzbXpOmeWWmkincuo3A7MxUOoFnGymsEQQnw3RG419qC3zsoryqKvsNdJMuhHnM
	mtwnPIjCj459U4ltqOFgPmVgeEzJSWtWOraE2xXIiJeKeWJbx4sfiDDv7hIpQzSddEqqMvMeN1fU7
	6Sn7lxiB5tCukj4yLeC13wUprKbOaltynuZC34vYyvAF99WLS09+yARLREV4PiOqOQ1gA7oUdoioC
	NdBoRBuqmyC7z1Y8iS5MDtCok9SoHf/LJeUCuevgaYeB9OBehexxY4vT9UeSifolegPBzhJOu/Grp
	r1sUpN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOf5-0000000DdfA-41ue;
	Wed, 25 Dec 2024 10:30:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOdt-0000000DdXP-2sf0;
	Wed, 25 Dec 2024 10:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E95EA4030A;
	Wed, 25 Dec 2024 10:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4582C4CED6;
	Wed, 25 Dec 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735122568;
	bh=BlZHZylE3rkpvbrheLcHA/p7NRcnz2PMtoKAQwhJgy8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Wm1+iNeMLPeEftMNySyryeQTAFkv13G5yNV7DFPagTpHSS0s15hTeIOQUpcWYvRd8
	 XVgtT5RIagUjDlU//D3gj0LGvKKkCi/bU5b68/X9zn+Xd1bA17CLL+PVca7BG+CxyG
	 uNFEo0zZjNwwzp1o9qKpuNgRZxr6mtt5fwStRulynhHeWYMRgORzbR0cCwtSzrxn2N
	 9zgp8AxQKXkX7CJoiF1ljyB762/Zg4u/usZU8+vy/CI/+rR+kqIVAtJeFyzLZWFcKq
	 v6S/CSSbkxzeLKnVzkVZag+Czd/L6Yve8gTtuO+YKFCX4/lFQmXge8qcuPl1yR8yiZ
	 yMJfdiUdS1p4w==
Date: Wed, 25 Dec 2024 04:29:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bo.Kong@mediatek.com, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, mchehab@kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org
To: "bo.kong" <bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-3-bo.kong@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
 <20241225090113.17027-3-bo.kong@mediatek.com>
Message-Id: <173512256651.1988706.15570394656231888489.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] media: dt-bindings: add MT8188 AIE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_022929_803366_DC49124B 
X-CRM114-Status: GOOD (  11.32  )
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


On Wed, 25 Dec 2024 17:00:21 +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> Add YAML device tree bindings for MT8188 AIE.
> 
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> 
> Changes in v3:
> none
> 
> Changes in v2:
> 1. Fix coding style
> ---
>  .../bindings/media/mediatek,mt8188-aie.yaml   | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek-aie.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.example.dtb: aie@15310000: reg: [[0, 355532800], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-aie.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.example.dtb: aie@15310000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/mediatek-aie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241225090113.17027-3-bo.kong@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


