Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A90C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXk2NI+iTtd7pt2ScbXlVziA+GRvQk91Yxwd4VzLfs8=; b=C3Gli4sjUPpujjeB4WtYAsil46
	19T0SLsn1YQlB7+WTt3Amy118pc23b3VPB5x+HVYewfIk9u5DDDq1BRbFGn2cTYs+Jw770i5GBJ78
	SVaLW9KEsHPHzKVA19FSTuyKYyV6ymeplaUzeKlkM/cSihj2TrXOsQJzbvex04zqUW13nUxL4kNIu
	BuMKQLZCUL265cEV9bg0F2nH2i0fvKLE4rB7p0ZMpf2EWrMf61H/ipinlmYw50E2qpY9B7OiZoTlH
	LOUmtAvHW+HOPiu+LZcgqBZsZXUWCTJTl0PpvxDlOXaMfkEs+qnzRlD9tvD0P7dW/VImbaWhEpYL0
	geriptWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lca-00000003nb4-0EIW;
	Mon, 21 Apr 2025 07:31:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lai-00000003nIg-42nP;
	Mon, 21 Apr 2025 07:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B749A4BB2A;
	Mon, 21 Apr 2025 07:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85660C4CEE4;
	Mon, 21 Apr 2025 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745220558;
	bh=AsfbiDjIVGcOHxoZBj404PVsbS0hHdvffd79DyXm0zw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=elclvoT+rKeEsXkmzDTwOoBFoMwx4Qu3exhJ6CQWv+/TF9zxKsr77GD6mtPSxypnh
	 5oXwnoB0khUMMpqQpR0DiazrtlEEzt+CltbSfTptx8pDVkaNInPhkiDh2/XlPH2Uq6
	 zivbAcrvwhpDGJmMvzZ02LhNFRm+dkJueQqEsJT6JNJ2D80AOa1CpYIFo2iTQOC4T5
	 Uin3In3zrWFGv5T8gpHu0XhyQHv7KRxq6sRBDIlmUlEav9OO3m0oSWStWNGkdvWihu
	 TP75G+flspaMDpfgw3gwBUHs69n6E33+LsQDVSuKZAcp91S7et32WKsUePxGDFqwXS
	 s1s2Ge09dybew==
Date: Mon, 21 Apr 2025 02:29:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
 linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
 alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org, 
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org, 
 conor.culhane@silvaco.com, linux-arm-kernel@lists.infradead.org, 
 shawnguo@kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
 conor+dt@kernel.org
To: carlos.song@nxp.com
In-Reply-To: <20250421061544.2471379-2-carlos.song@nxp.com>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
 <20250421061544.2471379-2-carlos.song@nxp.com>
Message-Id: <174522055654.901015.12807309511179699830.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94
 and i.MX95 I3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_002921_074470_3F1E5B56 
X-CRM114-Status: GOOD (  11.83  )
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


On Mon, 21 Apr 2025 14:15:42 +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml:16:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250421061544.2471379-2-carlos.song@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


