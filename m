Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E76ACAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2927aOfBprOlgtoYwfuZa0EUWoZ47jwza5mOmV8X8j4=; b=UIE55GIa4/SKZXjRM+TO/2ovuM
	6sE+63sH41TKKOSinuj5RFj5Z4jkeQVC/dsHspDa5QpyDT0q+e4NOlFTwsaHd2rs0ui9JA7ACmDM2
	L00TS/l6GHqA9UxUUKEHQIVeg7j6Nb6RGbOSaCPyHUfHEDGGOx4hgoONirwZOutUtD+lStDZgPooJ
	QvVbi8nzQRtjeYKpL82FPbTnEt8BE7eSvExYiepjcTT+xZ4bLAimZBKaspLXlCR8oylB5KXbNFW66
	WPxTSpIW8CG45l1dOILGDxxOFe2i3PYODuu+m2KVBmdXP9HnPzAMQFU5/MrFgBROxtx2eD1YYWkM0
	wK1YdkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28Cu-00000001QyX-0kxu;
	Fri, 26 Sep 2025 13:09:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28Cs-00000001QyJ-2ur6;
	Fri, 26 Sep 2025 13:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DE41613F7;
	Fri, 26 Sep 2025 13:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4EAC4CEF4;
	Fri, 26 Sep 2025 13:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758892189;
	bh=mwabqBGG6iWvuFZvZoI0mQPGdSAIVB5imUltnMh99k8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KXcK1nDI5gb72U8fmIArJ4u6fgmjbXHQgW4d7jdB21V2HOosIgdJca9dXxb5ovUqB
	 vSB/f5oMqM2MkMgBH4u4f6J+MfTPiQ01bSIoWumjDXwIie7zKfxpiA6h7CCoLRoVXm
	 By1bPcC1Wvby+9xkjppyFL/zZsBffbGM/ev4PclVMzgv6FsmXodeP1xBdvNhWSzjOQ
	 w0Ino0XlmFt/ddQtpdXNLw+T+W7v01dIp6RnGjcPbAx40r/E1QKC1m6uAdNHoDs2ZG
	 ZxnvC2s1KzcEXWmkbMatm0AC0HrRxUACYK4Co6XIQ8HTvQL4Yaf9FQHv2rg8eL6RKh
	 i/wOqKQ+nHyFw==
Date: Fri, 26 Sep 2025 08:09:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, Jianjun Wang <jianjun.wang@mediatek.com>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250925162332.9794-3-ansuelsmth@gmail.com>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
 <20250925162332.9794-3-ansuelsmth@gmail.com>
Message-Id: <175889218783.498491.9868084189301535953.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: PCI: mediatek: Convert to YAML
 schema
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


On Thu, 25 Sep 2025 18:23:16 +0200, Christian Marangi wrote:
> Convert the PCI mediatek Documentation to YAML schema to enable
> validation of the supported GEN1/2 Mediatek PCIe controller.
> 
> While converting, lots of cleanup were done from the .txt with better
> specifying what is supported by the various PCIe controller variant and
> drop of redundant info that are part of the standard PCIe Host Bridge
> schema.
> 
> To reduce schema complexity the .txt is split in 2 YAML, one for
> mt7623/mt2701 and the other for every other compatible.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 289 -------------
>  .../bindings/pci/mediatek-pcie.yaml           | 404 ++++++++++++++++++
>  3 files changed, 577 insertions(+), 289 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.example.dtb: syscon@1a000000 (mediatek,mt7623-hifsys): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7623-hifsys', 'mediatek,mt2701-hifsys', 'syscon'] is too long
	'mediatek,mt7623-hifsys' is not one of ['mediatek,mt2701-hifsys', 'mediatek,mt7622-hifsys']
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250925162332.9794-3-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


