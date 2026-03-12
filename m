Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F5FFED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUw0mSRCbpfSnS9d2mLBCZYAanMTtRZtsJJapN7EOME=; b=X+1v2nwupW7UeRGHraMmWASblk
	SKKznY7sfWlomhbryXwlC9xngZuXQS45pw9FjVuJy5YI+STxhxAsdfLOQ+kkc6UhI2u3Ghi78T2/y
	gPYjx495G4k6v5lkpCJmDfVpXQWe9NewGoJlIlhEJaYdvmsbIsd17+rLPqOXd6y96mN0EclNdDBc+
	MGb6NxAfNp/EgrPegixec2TeqYQixIJB4DYmn4MJOclFQJeikOYsMKhCwvQh1SqgbkCO2o8BW0i1c
	zVq1lEM9jgrhbBOrbaE1IJQA7oImzWT4OqzTD3tKA90Ca2BVa6NjL3pluYf+8EXtwGyGkQkq9RHs9
	775XRf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dWf-0000000Dt6w-0jlI;
	Thu, 12 Mar 2026 10:44:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dWc-0000000Dt6Z-0kM7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 941B443B8D;
	Thu, 12 Mar 2026 10:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5997BC4CEF7;
	Thu, 12 Mar 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773312257;
	bh=RQl4cQHw2vxOHj/N4vk9xIw7gKGsxB7Usr3ddtX/tvw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fhzuj9GoOcmoPJcmUUcRslcJSQfckwLBQ1Jgf4L5koKTh75ABGBhXKwOrPjehOdZK
	 ClO0a1C4iFvqM6T9d8u6K007ArLx0wY9d7W2Nncn6S9SQPepFW/D82GPB6rgltzggw
	 T3fCLKjUZmiXOLtHfdlO6pTsAva/y6ZLDruqjlunqPBrEXj6szHZjMgHt00/48yobK
	 I74euXIRstW0EiNFRdGh0PG5aCazhLUGl0N0vu9p2kD7uGqEWutimdydBnJwJ6DwHM
	 41PfVXY+9tQcfT4lYHwGoxOCvp+kNi3/lyaWCofBp9ltS4QQsLO79u8fAmxyTyAiXP
	 hR/0K0f2TNClg==
Date: Thu, 12 Mar 2026 05:44:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: festevam@gmail.com, mani@kernel.org, bhelgaas@google.com, 
 l.stach@pengutronix.de, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 kwilczynski@kernel.org, linux-pci@vger.kernel.org, s.hauer@pengutronix.de, 
 lpieralisi@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, 
 krzk+dt@kernel.org, frank.li@nxp.com, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
To: Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20260312092745.295578-3-hongxing.zhu@nxp.com>
References: <20260312092745.295578-1-hongxing.zhu@nxp.com>
 <20260312092745.295578-3-hongxing.zhu@nxp.com>
Message-Id: <177331225647.2535696.15664490600606531279.robh@kernel.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_034418_263649_8FE3960A 
X-CRM114-Status: UNSURE (   9.31  )
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


On Thu, 12 Mar 2026 17:27:42 +0800, Richard Zhu wrote:
> Add i.MX94 and i.MX943 PCIe compatible strings and fallback to
> i.MX95 PCIe compatible string.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       |  6 ++++
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 28 ++++++++++++-------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml:39:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260312092745.295578-3-hongxing.zhu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


