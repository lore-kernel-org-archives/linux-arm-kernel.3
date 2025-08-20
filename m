Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1671CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4PFiwvMlkGiFjGncVSJJySo2jXK/Qe4lt6urstMIeQ=; b=1N2R8i4nIcujKBD2aOpZ8nmYMl
	NH/PxgQtn6Q/sZkfQJ3eLtv3G1MzMeWUGuEvsTCEJM8e5rKraZWTZ/EVHCJFtuVvmlGMAY0zO72la
	pdfPcuJaLyXUFfMPWl4IfyJ1i8sg3+N5nxn7bkXkXre3IOFQcvpCoeW34Zyj9q8XUWtPCN5HU/FIO
	15t+EeKm8jecTBQka3n6X1wmeOf8mxbi5QwpNV6aNt6td+tcmpJYRegGyzEiBPNH61Y2RjD8zJmvC
	AHX1ecMJXeHY5glR/jiixXDEB8fX8psP8BX0c9AgkEUQcynNqHx+pLdKoTuRHdGuKLE9FwWi3ryM9
	92hap74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojoH-0000000E3XU-1btp;
	Wed, 20 Aug 2025 14:29:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoivI-0000000DnkC-2Z4g;
	Wed, 20 Aug 2025 13:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A65625C6949;
	Wed, 20 Aug 2025 13:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A84C4CEED;
	Wed, 20 Aug 2025 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755696734;
	bh=VmC64I3c//25kcKmSiyTSzAZcozMKfr1010PUjIHDRU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bxhfX2eJTx39hAXzOH8F7an19eyMbxkzJjHMdJmpy3TQOhp97PD3lpExGPEnpy3PD
	 wRYx/EhkPiuSGlKTgwFN2tNTfvc7q9v2W+iQaLR7U+qxX8GkFwSC2im0jYMPQJjwpD
	 zASTRNomGiOlZvb7bTvBShGhDS7ngEunfL/Aplp2tUQhaUFys4g93u9yg4sZ3+LqoT
	 OQgPnyYIP8K4whbPTyzcwZBN/qb/RdF4RiRS91O7Zpct+DMDFgU96I4QecIhfi76bQ
	 P9ojNjlIscgmedSHc1f+6uNK1IghdLvp5A1gBaRWWl7Xy0aHpXaQnVhQBdTZHR1KPb
	 J0UT4fxB3QGeA==
Date: Wed, 20 Aug 2025 08:32:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jjian Zhou <Jjian.Zhou@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
To: Jjian Zhou <jjian.zhou@mediatek.com>
In-Reply-To: <20250820094545.23821-2-jjian.zhou@mediatek.com>
References: <20250820094545.23821-1-jjian.zhou@mediatek.com>
 <20250820094545.23821-2-jjian.zhou@mediatek.com>
Message-Id: <175569669451.3275225.15370422405683288436.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: mediatek,mt8196-vcp-mbox:
 add mtk vcp-mbox document
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_063216_689571_1AE9EFE1 
X-CRM114-Status: GOOD (  12.69  )
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


On Wed, 20 Aug 2025 17:45:37 +0800, Jjian Zhou wrote:
> The MTK VCP mailbox enables the SoC to communicate with the VCP by passing
> messages through 64 32-bit wide registers. It has 32 interrupt vectors in
> either direction for signalling purposes.
> 
> This adds a binding for Mediatek VCP mailbox.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>  .../mailbox/mediatek,mt8196-vcp-mbox.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/mailbox/mtk,mt8196-vcp-mbox.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250820094545.23821-2-jjian.zhou@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


