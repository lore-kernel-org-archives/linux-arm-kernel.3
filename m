Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A5BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4/EbTg9KYclkAUKHMkSEKqfOyePRIgIyqDHwwGBf+g=; b=gk7d7wkLxFwc86Kb3GDdb7suqf
	y1IV/a2jioLsqVkj/NWSQ8p7fu/Vg8rgbBaxT5XQB2HRlukviEAFGty1rLFIaLRIQds5lW3s/Mlly
	Kwj4i47ZJlK2EqH60X53zuwFnZfxnVovhLE1gjdF+aZuK+IGxOttms+9IjsKEJIuXWN7QzjRx8e5I
	oWQYPFuFJQKFBN3nd3HnkR85lL445p+JQVOHEeiZDXk9JCSNp8m9O2yS4D1It80Db0CFdbuJYRT1M
	a9GzypRoqdmzDaMDskdzICqP+BCk5aVVmGvDCxtnduH6GcVe/+UJfmzWpoCjRcDyM2QKRm0xwvNyo
	WgvQRRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcf1-0000000Db4G-0cA9;
	Wed, 05 Nov 2025 12:30:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcey-0000000Db3f-3Fbw;
	Wed, 05 Nov 2025 12:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92D234336D;
	Wed,  5 Nov 2025 12:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4F9C4CEFB;
	Wed,  5 Nov 2025 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762345843;
	bh=sOca8qlDfIBDsxvVAIy7C2EdJfQ9Z0/Cd6qn0qL0vGA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aO/3M89k+D6Jfli9zFpP/uHdguxuGFk9TJ4fhmXgVR6oXi1V7UqFQ0N8eeZsXACWi
	 ACGLD5bTZ2vlUaztBCPptZFADukmoXcsaFTcBbZiiV57G/KUvIH29XWZPIfNK1/prG
	 agPGjb8hiZf0Kfz99IIKsgKOGYDIJAzhzEfI3yhU+3O8BdsuomK3CSTRl7t5TtF6t5
	 4J+6EFwuTAWZlJtdiZSPQyTWOTEvWtaAqoIsWHocA0UGZRkAh57lFfD9Wrz7f/jJ1O
	 L2DWX9zWYCF83Lqih5a08c8BUoopZfutNpsOKslICZ6TWsGobmem9nvrWQdmjkLF3S
	 4iA354oZx9ZnA==
Date: Wed, 05 Nov 2025 06:30:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, cy.huang@realtek.com, afaerber@suse.de, 
 linux-arm-kernel@lists.infradead.org, james.tai@realtek.com, 
 linux-realtek-soc@lists.infradead.org, stanley_chang@realtek.com, 
 krzk+dt@kernel.org, lee@kernel.org
To: Yu-Chun Lin <eleanor.lin@realtek.com>
In-Reply-To: <20251105104452.6336-3-eleanor.lin@realtek.com>
References: <20251105104452.6336-1-eleanor.lin@realtek.com>
 <20251105104452.6336-3-eleanor.lin@realtek.com>
Message-Id: <176234584170.562648.2189277623860888038.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Add Realtek ISO system
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_043044_836658_C7D056C9 
X-CRM114-Status: UNSURE (   9.43  )
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


On Wed, 05 Nov 2025 18:44:51 +0800, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek system controller.
> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/mfd/realtek,iso-system.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,iso-system.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/realtek.yaml:76:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251105104452.6336-3-eleanor.lin@realtek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


