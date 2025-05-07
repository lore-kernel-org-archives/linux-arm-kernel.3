Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EA0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F7cfLNuAZihLOMx+uQ090qhwP21WQ0kjiF4tq/FWiY=; b=bbmWN/4uNjrcPqQFJndH4pg0Ou
	daYCBBJdWaXn/EZ1zmWjb0nrImDzPiH94jiOW/osSAtbuT6QAT2qvqvQBHypc8ROUb3+C9u7Esrzy
	ddRtbG+NER6ddnIhLLYM85OOK2p0EWskC+HoLSLHYpns8hOQyqeK5ouuvBIreuLmdZ83YUtSMHiGW
	GKphOe++pC+SPGx7rY7H5BrSqQ9uYACIMNbmLVyHQR8I8d/vPX7CQmBVQWxnkJxuRhAsY5lo+CVoH
	aPiwZs33Ku6ihyWVTqExGNw9hzEYzYcNgeBMOwJ2eKZ5xklHulF61aPPx+XgGFQJFBi5RkUenj//V
	CmkuZI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnt7-0000000GvLc-0U9T;
	Wed, 07 May 2025 23:09:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnr7-0000000Gv9W-0tRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 23:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A7325C5E9F;
	Wed,  7 May 2025 23:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A39C4CEF0;
	Wed,  7 May 2025 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659232;
	bh=t1gjac8ZPVlmoGA9780a3d1MWtDrwkvDAD9J9rjOIjQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jZdZGur8jMCeo3Gy5nWM9p50FLf8+cXaD0nnyDZkGf5EU3mowxUonqS6tCmMMJq+I
	 V7bSjeM9g3R94xB1jkUCUPVA8Ybr/jshgR0tRaf97DHot/gwiR9tfxzrGWBRa9fQsF
	 9aQpCmzq9BB9uyPYb2MZxUffcCAdpBucSCnY9WNfgKUDjKmz+agQjHAmzw0qg2yx2w
	 C/tJamtdiXTapqT6eLwnuhgNxRgmjSprF5BOL46k5lorRNcLSvWtgbftaBzdUEkPJA
	 FhlW0eSS2oA7hyPBIhObHmWFbEstCHvUon0AwYnp7EkMfgIMtmyj5DlHF/ZycOHzOc
	 417nRVAdGYCpg==
Date: Wed, 07 May 2025 18:07:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215903.2748698-1-robh@kernel.org>
References: <20250507215903.2748698-1-robh@kernel.org>
Message-Id: <174665922811.2893796.9617092031140706801.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_160713_290876_720B4249 
X-CRM114-Status: GOOD (  10.57  )
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


On Wed, 07 May 2025 16:59:02 -0500, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215903.2748698-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


