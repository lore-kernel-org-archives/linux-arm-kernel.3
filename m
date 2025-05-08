Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9514C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lk2roZfL8/mX0crr1xETMbjsJEb6s1A3GHxOMyijgA=; b=0PSJTPzQd/GykD3CnRyKvzrVsj
	FlaYh9k1v0HodeoHpgSvsvmRXRDU43yni+oqdDlkmix8JxsbSTJxOC5pU91UUHMhUA1/fe3JGGZ7c
	GLm6k+ZYQDJy1STEVREaDoUIO7zQEe5aCFQHQzqRN9oxdDqCPJG5TmJ0kB4+BATpkU+rxmPxktAP6
	8sfHyL7bOZj/E+NsMKa4CKIa9wWJuncnMWRNIp8ZJ/xHKYhYx1EJeAQscpwtfW3dRMIU3DGn14Fvs
	IRTUnJ8PSZIFxtAJxZeB7AbBchdT6XtfbWXk2iuk2uls4gzuHl9iBtQ801WOjROuQFSG+myIKRW4h
	DXtwlq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvR5-0000000HYoo-1iWZ;
	Thu, 08 May 2025 07:12:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOJ-0000000HY5K-1AYy;
	Thu, 08 May 2025 07:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4956E629EF;
	Thu,  8 May 2025 07:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D463FC4CEEB;
	Thu,  8 May 2025 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746688197;
	bh=Yr2J78SHWoOtKQSemvYmYF7NMQk3vdDKnwJFh78hPRU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FI83Seu2KbzvpHecpTY3G01Iz4PgSGjhZ3fU6bLjrCRPko3zjL0ofM8MabPLKdl9w
	 tA5VmxBV7dWog8cBUK0Fbs+z+18q5y8DEphda8FiVEtyl1dtdcMDFhZM5RtFAjzAa8
	 pRgvgx2t1B83Yx6qtJGheF+OHXTfB/wtI+6LgzvswZnW/G9K9WxOjC72go0tOVjlcB
	 SXtccGNK3/tuzEIxskr66PRmLKg0sA73vqVXJ4Ck62tYy6yYf/o3UAki7nEqnmDRPS
	 iNHoh67/y6nqOh3torH/NwhsT0YrpUWbgAEBvUsx8BDp2rtY/ZaciFrTromuQSCfu6
	 r6+JlSGcwfxlA==
Date: Thu, 08 May 2025 02:09:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, xavier.chang@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Sirius Wang <sirius.wang@mediatek.com>
In-Reply-To: <20250508063546.289115-2-sirius.wang@mediatek.com>
References: <20250508063546.289115-1-sirius.wang@mediatek.com>
 <20250508063546.289115-2-sirius.wang@mediatek.com>
Message-Id: <174668818902.3553912.2627807939857046416.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: Add compatible for MediaTek
 MT8189
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


On Thu, 08 May 2025 14:35:40 +0800, Sirius Wang wrote:
> This commit adds dt-binding documentation for the MediaTek MT8189
> reference board.
> 
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508063546.289115-2-sirius.wang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


