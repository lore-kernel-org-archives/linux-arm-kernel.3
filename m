Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C1ECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4n7YqAQbrAxNCkBjqyuYrgKNlSo6g0FLnHuL1Mly08=; b=wIgnZ8iUhCvAXWjjFOiaqXXZl9
	RaRGNP+x4o4SyASWhYyE8jJgKIIaZvOeYgR21sQaHbHSsmA+e9yvfOoJ0Zeam6I0XL5lGZsqV/IgC
	HNxqtp8Ryto1DVEuiospBzqyvh4Ph5TrZNo2O1jy5PpT+anaQQE58WTTEqbSg9JyCg4YJDxLOUJkQ
	yaKBxwVlFJkCLMOoINzjlYIQXzyjbOCAPJyqouLk5fjhLjW271s6Di252RMPQ4PdS5rysn/TTzoB9
	9I/EQvr1EihvflXGO/kwTXIAMb+w7utNmNUlODEmnuuohE9Lus+Z1T3yyOScAmuj4JXQl37DPdkqt
	XntDFvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLjN-0000000ATra-0aI1;
	Tue, 19 Aug 2025 12:46:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5b-0000000ACv7-2ZJo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB2D35C5E17;
	Tue, 19 Aug 2025 11:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133B4C113D0;
	Tue, 19 Aug 2025 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601274;
	bh=UGEMRjTBsqlULw3vbm/co9eRDP9gi0S0uyPX0lvQ2dA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=I6WTmdxO2ti6c+P6AFRq0hFKJeuNl1wFUwj0NCunRFIAIcpiYhbCXl39rX1uzzk8p
	 oB5gYz/yLkDitbzhq+hzzS/ov6i4f6lfXYm8gfYf78Yj8YQctSATdeDNwnjk+P4Bgh
	 TXZ6h0UT0zxfLzwhySiolmUo5sHRgZhl61Ty5XusA0xmFH/L8mxqO3Nh3h4lT/x+gj
	 PPjGvvzqEB8eh57UahoNtdT05LPmExIqkehWo5qmkQK/wwF3EVtLCVQr50SHozv6L0
	 ZLRYekP4w/pHX34fIfDMtoNHVeDAfe+c3JPOJQjACZGhjU/2TJoUNe6c1afwx2+c3o
	 pRqIiEKcfDqPQ==
Date: Tue, 19 Aug 2025 06:01:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
Message-Id: <175560127037.3969097.6130940505156039734.robh@kernel.org>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible
 to LTDC device
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040115_693018_913731AB 
X-CRM114-Status: GOOD (  14.33  )
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


On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> it is incompatible with existing IPs.
> 
> Add the new name to the list of compatible string.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


