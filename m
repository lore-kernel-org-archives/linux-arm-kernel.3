Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E2C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWVcDUlsfRDT0/8qPmrzGn1jEyHSR3yPfW1gANeAVKg=; b=tJKymlucUpy7wctRyZ4mcpX9Y/
	sNJLq45hKOSmFMbRNqKOcGiA4t+eRrtctJS8odLKcwVkOIt3LMY7LiCx1C79fo1hyvsUS6F62KiZh
	BLq7D4K4IXwxhI60mAx6rbIj7enX/5amUJlWFpl/tuCwcI1vT30vB7GHtEAta6d65zq5YL/fiQnH4
	WtbFz4tY9dLFC2SBxznHbLHy+Wt8guxulqpGewvfTZ2S4rHQsKYjT7/yAYHmPrukGRcwCRFnoQDiv
	gZnKeC3mp7ftjDGv8HzIu9EpV3vdmyBntgdcSDH4v7622eTMnbTAs38OMiPYfHc5T9PmgkoNDcNCG
	AucjTHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHSQ-00000009oOc-09iP;
	Fri, 25 Jul 2025 12:23:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHHn-00000009n5T-11xD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 12:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB0AB445B3;
	Fri, 25 Jul 2025 12:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B7AC4CEE7;
	Fri, 25 Jul 2025 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753445545;
	bh=1KrjuWTj/BAGpJTBOQ4VNJ8knTL5uEp25bM6bJplq4M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tok2lSwBDH1X8yR9/Jc4IVbBIYqpjB0vyEjB+bEiKaiiebGkT7FP9crn6eZ4iBPRe
	 kdOuy8MUsvnb5CGblr7NIZtTChxBOgisYpXP/PjMTDPbaUTCuOLWNwjWbbti5GORCT
	 DPJ9xpHnsUYIHIzzfmpzF0IeRK6hRvfT7IuYW35pl5Nh3QR2nNF87TjPA3iNhg0y58
	 SNsRGnzVtikyWO212cXdPOFGc1acTFvcXLSlRD0c12YK65dXK/PsYUVSIXEaVoUcWC
	 4GWZLyem7jzBUIAOi93jQD1SCc0j6m5h0mm1QrwpumtXI7BuFnLcV5u80+uL+Aq2KC
	 PLmab2yoKcjMg==
Date: Fri, 25 Jul 2025 07:12:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Will Deacon <will@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
Message-Id: <175344554361.803254.9739669006063034292.robh@kernel.org>
Subject: Re: [PATCH 02/12] dt-bindings: display: st,stm32-ltdc: add
 access-controllers property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_051227_304966_65DAC636 
X-CRM114-Status: GOOD (  14.10  )
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


On Fri, 25 Jul 2025 12:03:54 +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then check
> the peripheral accesses before allowing its device to probe.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml:81:7: [warning] wrong indentation: expected 8 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


