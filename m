Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CECC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7hz/wkv4TIP3tFV0atbeAtIVV/ATXHLJDQELrGuxLM=; b=PDbGtppMbWrS+r/TJVjO6+O6Bf
	N70O+bfodmL12GiK5Joxmvf/YLn3jsiFKiY3hWjo7rCLf3ve/FaT4U4V13zPy5myxuGtAu9/35kA8
	mL+U7Jd6grgFm9qoXQQKDNAXdSevhflICjPWSeBWf4BVbFGvndItFQGksLVhdLkxEI8CHQEyZd0DS
	YprAAqFdfNbQ0R6N3BFV+TlPUcicFxhx3pnzoMsxsFVu608sOEl7dvawF+zQ6645Rka9jNYTNWagT
	o7TYHQYMrWToxw983g73vgq8VD/R0JzHF/utvX/777MbVvQEcKtO5KMVwkDJwnq6I7UMTZkmOfzg9
	tXyqxjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Om2-00000008hOb-0Y7d;
	Wed, 23 Sep 2026 15:20:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Om0-00000008hOU-3dcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:20:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8767A40478;
	Wed, 23 Sep 2026 15:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E826E1F000FF;
	Wed, 23 Sep 2026 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790176840;
	bh=x7hz/wkv4TIP3tFV0atbeAtIVV/ATXHLJDQELrGuxLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmf+SlqTaFJfYHX3sPm69koXlm9CC2phElbCF3QFWipRsHqfNXfjmXgo1N3kSzuVo
	 39j8AsPtsVJsZzNHaJDJ9bvjelWWcNwUehLTjZ+H45O9I/fPCGukKXZ/XGLwCRdiuJ
	 pSt1A5uCI9wb8Nv7Sc2WGuJSKK7wFPmI5H2bPOat5tDgoZKRqS9i2q59Y/vcmkTJdF
	 RLO2xKif7mqKBByMy5EeuEhtEsMURKlm1Wt5+JR2eemcdpIl2oGbc/6uOzDtV16eSO
	 Ynpy7Gxwxx6a3RzdUcRLSbltyuUhqbVlK4k/oBgXslQBwUd1msjf7kCrkW19E+anUL
	 RQ19e+5JSteXQ==
Date: Wed, 23 Sep 2026 16:20:34 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 18/20] mfd/regulator: db8500-prcmu: Remove EPOD
 regulators
Message-ID: <20260923152034.GI3864833@google.com>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-18-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-18-9d0c17e1f816@kernel.org>
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

On Mon, 14 Sep 2026, Linus Walleij wrote:

> Remove the obsolete DB8500 PRCMU regulator drivers.
> 
> Drop the regulator build hooks and the db8500-prcmu-regulators MFD
> cell now that EPODs are power domains.
> 
> Assisted-by: LLM
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/mfd/db8500-prcmu.c             | 239 ----------------
>  drivers/regulator/Kconfig              |  12 -
>  drivers/regulator/Makefile             |   2 -
>  drivers/regulator/db8500-prcmu.c       | 501 ---------------------------------
>  drivers/regulator/dbx500-prcmu.c       | 155 ----------
>  drivers/regulator/dbx500-prcmu.h       |  55 ----
>  include/linux/regulator/db8500-prcmu.h |  38 ---
>  7 files changed, 1002 deletions(-)

Looks good.  What's the plan?

-- 
Lee Jones

