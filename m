Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A2C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovgTSNz3TYyiCDsnyfyfrx1HVx/OB3Cs0a1lkx9bQp0=; b=oywmNS3VigCZOeAYSjKn0QgfwT
	BBtc67Ur6BNKoedxCOJ7UgfJ10l1e75uchYkeuSzjtVywv8/6+/5rL5tOU0srRvO/aBvBt+8d0aHp
	LijvwM4pCbQPYR303I+dxD7GhHMDiKSmk0c3vhtnB7kRGPvU184kZqBAZt5/7MWiNiKR5oo9Nz/7G
	nh4pyAYsfnegmZZsgJus5ioxNnIt7tUNHglOppP0zhycJIFsNKi2orpnCi73SJ+U3r0K2okhd5ryD
	1TtAwKzwT/49C7SoLwE+Cku9+iwKgaXrrUR3JksIulX41WBbNwvCz4W81hPXZl9mkNTb9V5GleJ62
	b1XBIcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJomQ-0000000A9uc-3BuD;
	Tue, 27 May 2025 07:31:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJojH-0000000A9fH-2Sjz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 07:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3A234A6CE;
	Tue, 27 May 2025 07:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D8EC4CEE9;
	Tue, 27 May 2025 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748330886;
	bh=XVQsHomBmGb1LhclIkasP5SGZ5XsvwTi9n6tsMPgyY0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=skjocDySfnd0Cx3lKYucz3c8YOKANMO1DxUJmuQc7e5uEcnauo0XOWOxySV6/aNRM
	 b88/HyISicJURJ5O5/gsdSzKIprrvVJca8eslCOv/NrQaEbhhfuKik7RkdwIg4WO+W
	 UrWFnNSXFnjw6LE22MKdJVP6nF0kCdayK1wABuPeQfD4/5xMF6lFHuJbfoyWwNIwPA
	 xjD6j53pn1F1x2c5X5d9eduZeIUyCiBS+L1X03blgL/peQpUPPuoNXGBJQYWwdqLmk
	 cHO0u6owwUYVnswkUhCaMGZ/u0vRHrgVkJxjmvy41CNCswJGnMThfTcp+mjdcxuFT1
	 +IR7tmkRzG7bA==
Date: Tue, 27 May 2025 02:28:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 Fabio Estevam <festevam@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
Message-Id: <174833088465.3257570.17816254353983478375.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQ-Systems boards
 MBLS1028A and MBLS1028A-IND
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_002807_654076_4FD5932F 
X-CRM114-Status: GOOD (  11.06  )
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


On Tue, 27 May 2025 08:03:54 +0200, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
> Layerscape LS1028A.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/fsl.yaml:1594:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250527060400.1005757-1-alexander.stein@ew.tq-group.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


