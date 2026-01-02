Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90252EED628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KechaPvvRjeULtRMtpFhRHGyWS+3J+zdsobctcmlMWo=; b=v5NXcv/TTI1Wz6eC5FkMWAGT/S
	uKll0WtLTFohZ25UrFpvp/hV16HkA/DzNULwA/eW/cMcQUaTkmzMJlUX58I32UesB4+ijANdUT5NS
	tuc0fXX3s+T3lVKJMaKBW2yqGkfuCIwRgdef37Hh0VrmuepTPIPEbcpTCB8tLn6mIdOnXjx8T4CC6
	zBGkcWccNfJT+N+II+Ty0dehPfE0jS5GkdGPfOEKKmkAIdslxfab0M9zFpuuTU7v185YWwlriVvMM
	vDwMu2MkMe4rWlrH/F6thtr8GhNDb5RSLN9Kgs1kLhCnSTxVpLj+5iWb/kw+J3V3wTPb/Gm3DvAWY
	rmR8YFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbj6g-00000008a14-2GMV;
	Fri, 02 Jan 2026 17:38:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbj6d-00000008a0V-0wEQ;
	Fri, 02 Jan 2026 17:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B26243E34;
	Fri,  2 Jan 2026 17:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC47C116B1;
	Fri,  2 Jan 2026 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767375510;
	bh=QcknUrYBl8gCUaV1a78vCxQD5n24yW7uv7ymg3UZsKQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DB+6042dL0G5ELqyiLR7WjVeG/WEjV3ACWHki7Qc7OmIbo01rSw8/bZk/kVcuej3P
	 B7JwNU4kORP5Lpn9QaFz/M3RoeTLQi+QiVD5xH7A9rN8JotoDRRM9GM9b1RAbhZveB
	 HAfDqvy8V2Zl54xRbkgrrGNV/cadxQwFO6ZDiztHOZfStVkyH0RM/woaGXVc4ocQyv
	 pbLEVDp1x+X/iJiP85H+pFu3sfmPMrd1N6x36g7LKcLO0rhP7nxlXw8nkW855sxCif
	 AzkKT/5CQUc3QmP4CLyppeNJqJOq22f3cPYEBqDZlGisqCA9DGSd2RE+XE3xv7fC0Y
	 NCip/kEY1GsLw==
Date: Fri, 02 Jan 2026 11:38:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: matthias.bgg@gmail.com, sergio.paracuellos@gmail.com, 
 tsbogend@alpha.franken.de, linux-crypto@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, ansuelsmth@gmail.com, 
 devicetree@vger.kernel.org, benjamin.larsson@genexis.eu, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, herbert@gondor.apana.org.au, krzk+dt@kernel.org, 
 chester.a.unal@arinc9.com, angelogioacchino.delregno@collabora.com, 
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
To: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260102155341.3682013-2-olek2@wp.pl>
References: <20260102155341.3682013-1-olek2@wp.pl>
 <20260102155341.3682013-2-olek2@wp.pl>
Message-Id: <176737550920.3990125.15817156622138815627.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: crypto: eip93: add support for
 Mediatek MT7621 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_093832_519700_0F5CEF1E 
X-CRM114-Status: GOOD (  12.79  )
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


On Fri, 02 Jan 2026 16:47:34 +0100, Aleksander Jan Bajkowski wrote:
> Add compatible for Mediatek MT7621 SoC. The implementation is exactly the
> same os in the Airoha SoC.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v3:
> - Use enum
> v2:
> - Corrected commit description
> ---
>  .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml:35:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260102155341.3682013-2-olek2@wp.pl

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


