Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A14C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tG6bFTHMsgEHmJIPf4wkxUSqE9RPDcZHe5v02YOFGZQ=; b=3uNaZLBB5BbR/yNgOJ/FszJ0wz
	Ok5a3Zyt9nIehKXwe0rNv3Hc5DocyLbiduqN0RV6H8fD8M8XqaHd/3kpmt0q3Erly585oa2rwh856
	s4HCuJoT/J3tzUPYMoAq/KitemPnoKKZo71YfbwpYFsMefulNsvXLRJiWrpcZHkRD1Lx2Nq1ma3kA
	sadLA2UX+6UkISI6kiJlmm0lNiJTwFYcVGiG4RkfgkpP7ZfKiKY/AFpIyzCoV06VfZtagHS7lhs/c
	+HShjztTcd6Zidr3+nYDgN+Y/mtRkLnUFtCxmObCnmVwj+cDAghaiaiJqf9x03gFU1R/bGYyWM/Ef
	7gtF2czw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfdY-00000003JOS-0l7L;
	Mon, 10 Mar 2025 16:05:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treIb-00000002xTj-0vVJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB8815C4D89;
	Mon, 10 Mar 2025 14:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA84C4CEE5;
	Mon, 10 Mar 2025 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741617608;
	bh=Sm0Mo6AtmCgx4dV4CHSjPIsBg9QJ8dBbfeea4VPSE+s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nY82kkBAX19588GNnTU7OT7x5ke3WU5Y58THp6MOE2HWDR98BSfPZyK5MM/ffZHhe
	 qOtovvBTkAmHIWE5ngOIg3uzcuaHnV3ruojLJA/ygMIw95+6DOEAHQ5Q8FYCybOOif
	 ZHUTq0s50uoq/kRC9KeZs9RZAx+vozFkqCSMh07GmZSynZnSda5+0ehtcb7Tllt4wW
	 +5ymbfgjjhj8xMtAV3Feqlr2LvndGegOIE65s/i9h5B8Y12i+8Z6ID1naPyQ/SD0lb
	 haGqT9BPpf5umg08ykl+kZjCj5FrhFZrYF7gKwe3ZdzgYsVfRnuFP8ay+XcL025aRn
	 +BZZ+tNf/o2Jg==
Date: Mon, 10 Mar 2025 09:40:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Randolph Sapp <rs@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
 Frank Binns <frank.binns@imgtec.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Darren Etheridge <detheridge@ti.com>
To: Matt Coster <matt.coster@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
Message-Id: <174161760551.1089.16761714043131512755.robh@kernel.org>
Subject: Re: [PATCH v3 02/18] dt-bindings: gpu: img: Add BXS-4-64
 devicetree bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_074009_369319_38663378 
X-CRM114-Status: GOOD (  12.86  )
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


On Mon, 10 Mar 2025 13:10:26 +0000, Matt Coster wrote:
> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
> 
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v3:
> - Include adding the second power domain so it's in context
> - Remove unnecessary example
> - Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com
> Changes in v2:
> - Use normal reg syntax for 64-bit values
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 34 +++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/img,powervr-rogue.example.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


