Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8A4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 19:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wt6nc3zi1eWn8nXL6of6Z1W5AiDpPlyQKrI8HPWOTw=; b=vcevZ5aA4bx6zgyc/iCX/yduTT
	XuSXfyN94QcHMDvO8uYdNQFuDO6HvZyWQTaaMDe3cpqaGAA7hONJA+2NaYge2yaDpv4XD6xsz7Nts
	fEZviGyFke8bPNxslxAmvHRXJZjr0XzkDHqjf0tFLZrzX0QGb6RAU4PCtQrTJOAwkKj6pVKsWgYUr
	nOK2LPcKriJznWgAQtZnEFWtTJTH2Y/rtYVJQbeDJXyNRHWAyxbsG8Q/M6ncJYFCOrWDaHPt41U4o
	oZ4OHuuB+fmmAIftxA12rhvv+okHMi5jz7/NZ0pFjePz2HeflOwj/Tj7lQVabYRyA/8uG3AY+U2sP
	478ApANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdUx-00000009QEI-0DyF;
	Mon, 26 May 2025 19:28:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdSp-00000009Q7D-0lJv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 19:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4BCA5C4836;
	Mon, 26 May 2025 19:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8ABC4CEE7;
	Mon, 26 May 2025 19:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748287581;
	bh=FaL621iJbj/67K/Av8Le03EGK0pHPFx/zpQdIWk/TYY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VoHTb2Mf099/zglBpx1ECF8UqZrtYZLkXKlHE9VLsMGd/wpLIgJaBD+uJvdbrFNKP
	 5/OYLBHG3jfTOUuKoajriDsjOsScVYJj1+z1aKXyn194xaoC1MBAl4oElXvtF3KgJz
	 frJiTXEpUA1c6jbjR2sMbdGvds4O+/HKAww05iW3R2MSKY/BsSH/VdOqWVKWpIkOe4
	 4EGi1vlVcbb4tQTDBuaB+fjjGlptyMvOd4jwsOiaXKtJWpgiIZHu0XMZJ2BUxfgEcG
	 FmXeFpWig2tcgxTzfTR1gMdaRuXd/6WFBj/xCBU8h5vc1YtF//UYdNMk7yFGeXtJZS
	 9vY7WAAeqdb7w==
Date: Mon, 26 May 2025 14:26:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Paolo Abeni <pabeni@redhat.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 devicetree@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, netdev@vger.kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250526182939.2593553-3-james.hilliard1@gmail.com>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com>
Message-Id: <174828757941.2206833.11560250898621466497.robh@kernel.org>
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_122623_268924_85DF25B8 
X-CRM114-Status: GOOD (  14.11  )
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


On Mon, 26 May 2025 12:29:36 -0600, James Hilliard wrote:
> The Allwinner H616 EMAC1 can be connected to an on-die AC200 or AC300
> PHY depending upon the silicon variant.
> 
> Add a new allwinner,sun50i-h616-emac1 compatible and example, support
> for the allwinner,sun50i-h616-emac1 will be added later on.
> 
> Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
> based phy selection.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../net/allwinner,sun8i-a83t-emac.yaml        | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.example.dts:219.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250526182939.2593553-3-james.hilliard1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


