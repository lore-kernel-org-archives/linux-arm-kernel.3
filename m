Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UvsdoJ2FUgLr9sdil9O7uR5TP3u8LCrzHRnMzjqw2M=; b=W5lgxaG61/VWkrfq65YCDsHL4Y
	t6QZcf93CeQX+WbR05PIoyTtvvqawBgdqhSgplvmx4yjAvEplud3GTlAUSINbdjOCpjO47zGWx/T1
	fgdkAu1dJzkUC6bgqylJMi8iqwdIbzEMJybKt/MuTzOrKyjI6m8EDb0g48FoQdwTfGp4TyVubDFJC
	JTcBD0cvZjhlICxOS9t4tahP/1Xy6ZVozFgBdIYfTjagzEiAZqHd8e6gWaZuaTTLqux9jepkQGDy3
	2kfRF6KGsa5xaTOczxxywluQfpK+s/miV25rxP1zWuIP4eJCkbo2cnQ4SZOktfg2gWZYdmANPwkAH
	3h0LObYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdG0-0000000BfmS-0TiS;
	Mon, 06 Jul 2026 06:56:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFz-0000000Bfm2-0koQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:56:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 558B161832;
	Mon,  6 Jul 2026 06:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA501F000E9;
	Mon,  6 Jul 2026 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321002;
	bh=6UvsdoJ2FUgLr9sdil9O7uR5TP3u8LCrzHRnMzjqw2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iJ2qDUgjnu/4u0aM7/x9sq28AXbSlVKIzLzJbI+jchuUgJ88fCvmroQpMdrDZeq7j
	 ODPItrIykgUXQqk4TIBlpM+17hvIxPvywC+ikLXeXC4OtLXpVGVqi9C2e7tThr+R50
	 FZuctFGjAKgoaJJFz5jNpj0xbR0r3++3ljHxyFFHTfsetGx+zKilB2PKVLyZRV/Mch
	 B3Uzl4PL25BaSMpKE+amwKND61FgbsOuuJ+ZpWZw7bnjS7r3jaqShbi2NaOxI7Fzj5
	 zqT/tznJKsQku24GAjANskpz4Jex4Et8LwcOnL4rFMfBQLY0oGTrYJ8UPyg4b/cNC8
	 uYNDx+Po2h7Vw==
Date: Mon, 6 Jul 2026 08:56:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 4/8] dt-bindings: arm-smmu: Document GPU SMMU for Eliza
 SoC
Message-ID: <20260706-judicious-tasteful-crane-5f7455@quoll>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-4-c9f1354dbd29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-4-c9f1354dbd29@oss.qualcomm.com>
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

On Sun, Jul 05, 2026 at 01:44:19PM +0530, Akhil P Oommen wrote:
> Add specific compatible strings to document the GPU SMMU present
> in the Shikra SoC.

s/Shikra/Eliza/

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


