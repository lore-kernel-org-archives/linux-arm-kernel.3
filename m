Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A077ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5tVzwoJgHdLfuXWmEM8ScnwC3RY7oY5ltAQTQG/Mq4=; b=aOmtM5aq153eXfkFpT6oZ4Zva3
	U5kGLmrr1vAjSqBP7iAFp3eA9Ok4hfgWOhUOntU/BI4xcW/lVAyTtgyyBFl2X1elx/Dmdox+cq1g0
	D1ho8ic3Q8XRCL09n4tfujv6NFwSAlqOWRVPwSWbICua90Ccn6uEkIb/8EcrlrqNiMgey5mcpvIVg
	sqGW49e9PVgQNCJRFxZX7SntfnbY5RDEzX5KzCbz4TbsS9awARwq2BOIGBPhmkNOpZByAGq+Bljpb
	8X1j9RkM3J1791PSYLEAANQ0XwLehRdhth/v3rn3JW74Nv9apSceqBfpCmS4ztRovQAjLRR2zq2gl
	+mrHSRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLqz-0000000AUzM-2foA;
	Tue, 19 Aug 2025 12:54:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5f-0000000ACx9-1VvQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFF2846258;
	Tue, 19 Aug 2025 11:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A42EC19423;
	Tue, 19 Aug 2025 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601278;
	bh=RSjFfaJWxUYQblpzPRCwMN+MZXg/TH5y7U62UV8jFM8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cp5P3C4IVS6iImCXa6xcb0aPNk5MNB5mhhBh10d62W9vpZ3DmjcPwhOt5bGtPU1H+
	 BNVWxQMnikIbNxmGUlor/Amk9Q02NvfgtdSv4gR2otc8I0dUD/qv6wPBG2FafHzbkF
	 DqJ36yLq5vqz8ev9x8//SIt/8yknzeJOdYFZ/TvTxpUSMnoxGy6y5elLzShe2Bl7j+
	 3Kx5JFTSjJ89Kmau6tYlg2TC081JeLmkmI7XuhgHspo/JqseGEpWtiJzvixKrhNpQv
	 fRlDv0wXKLpN2OtT18gOESyulrv/YKsr1H12SrdmI5qW4MBNXQ+P30s6nQU3REeTFl
	 9NMUlIKWhPTcg==
Date: Tue, 19 Aug 2025 06:01:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-4-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-4-04153978ebdb@foss.st.com>
Message-Id: <175560127211.3969200.8967459930007695197.robh@kernel.org>
Subject: Re: [PATCH v3 04/13] dt-bindings: display: st,stm32mp25-lvds: add
 access-controllers property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040119_423054_DE686133 
X-CRM114-Status: GOOD (  14.31  )
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


On Tue, 19 Aug 2025 11:15:57 +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then
> check the peripheral accesses before allowing its device to probe.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-4-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


