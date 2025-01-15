Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E72DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ0EubDQbNlPnS96t9FEwo3SgFfrEoVdb0B8sGlvPQE=; b=xJ7O36LfMHENI+AWsMmXhCR9kj
	ru19fPWBgUhzUYCf05gRBttB0ueBxg20vT9oFT6MOjl195VHaFvXiABkIuYsfvzKbC89FP6YKSQ2z
	I6jbL6NCLkuvXBKcXuJ/E6eBe5q9WgFKoFTgaJ2yLq4mhjlxob4pBFIOWOxJ/rqFH0AYMGsQIaM8b
	jNCu39czRZBeM+87qvprvD1FYZ3Nzz9Obk0ebJzKldMM81mYPOz+lLmsEy3i8hmndiNV/KBrtCqvD
	qWHgQw4/1CRMPVWtREVVe3z25zcn4mS+ufTJ1TgolUgOQxlXnm/lCBpDr7dPRyA1atiHU+D2Nvuna
	JfILWE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyvg-0000000B7jh-08rJ;
	Wed, 15 Jan 2025 08:39:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyuP-0000000B7YC-1zCy;
	Wed, 15 Jan 2025 08:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A48F9A4187D;
	Wed, 15 Jan 2025 08:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1901EC4CEDF;
	Wed, 15 Jan 2025 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736930272;
	bh=vyRbBaZo/lSYwKFE9n7rCU97h+K/OLoEAgv/w89xg2g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FcHmbhvC0TllnjT/YWcEywyTOQWlMSCVxa+GI/4NA6ZxurJFIz2+uYZWGmVs/SIqX
	 BO62lY0ZycFRHfQ+2m15ZKAPjzWbRJkuwKRJazxH8GWct1ilTHEAP8VnX3HDvFN0QL
	 PkUmlRn+2uYV7ub8ZulH+kpPmUd0h21J0hTs9JxJgt4/6scROa9iCYfWK1fEQVYpEM
	 O7Y4CMVtmM3LaQDTUnY05GWWfeYuOsFa8XipLbCaZMiGtVXE5i6Zz3JyXFPZSTHPs/
	 qsIZ1Ejc4jJTciyJKbn/+ZbsEjpd3juC1yUsQGnRxJtIDX6nLkX8E1ZZPz1gmji4zb
	 +SbMGHnr9B26w==
Date: Wed, 15 Jan 2025 02:37:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wenbin Mei <wenbin.mei@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
 upstream@airoha.com, Chaotian Jing <chaotian.jing@mediatek.com>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250115073026.31552-1-ansuelsmth@gmail.com>
References: <20250115073026.31552-1-ansuelsmth@gmail.com>
Message-Id: <173693027082.3240418.16772447316188600820.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_003753_574631_48898A7D 
X-CRM114-Status: GOOD (  16.26  )
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


On Wed, 15 Jan 2025 08:29:50 +0100, Christian Marangi wrote:
> Document eMMC compatible for AN7581. This eMMC controller doesn't have
> regulator exposed to the system and have a single clock only for source
> clock and only default pintctrl.
> 
> Rework the schema to permit these new requirements and make supply
> optional only for airoha,an7581-mmc compatible.
> 
> Also provide an example for airoha,an7581-mmc.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> This depends on patch merged in clk-next
> bfe257f9780d8f77045a7da6ec959ee0659d2f98
> 
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 64 +++++++++++++++++--
>  1 file changed, 58 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mmc/mtk-sd.example.dts:104.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250115073026.31552-1-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


