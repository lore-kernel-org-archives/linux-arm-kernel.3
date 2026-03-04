Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F42EB7ED4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YhUqJKjNYH65VZemBM/Eh+hY8mXxas2MnS9eOtKakA=; b=xY4Z9aEa9SAPhaqLwWgjB3lfGW
	A9j3xJx961+eMSxX4zheJ8q5SxLvs5d9L/UimCgJftpedmJoBP40DLAbgCZkTNrMCPCK+jfKPl2JR
	b7OYuZkhScHwo6Ih/X3ykG9JBUAS7rLEVx5Lm+GlQ7WuAXcNVnI22HAQ94/CMVU+Er0cWXjX1/jl5
	d4kY+V12qkAbs4mnZAOCe0ebvMjeScadpGOXmmNsJVQ+ymvNz+qxOSVVvjNiMuQbg2ADZu28iSIM/
	Ae2qQAkdmLeI/HMTxAj4El2qtZQMde8KaUK/AyZsXO3S4b1CRqpGpOfAB+2IoEocO55kyxrQx+Tc0
	qCFw/cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkWv-0000000H6vt-35qe;
	Wed, 04 Mar 2026 11:36:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkWv-0000000H6vl-0YQB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B703C60097;
	Wed,  4 Mar 2026 11:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7920C2BC87;
	Wed,  4 Mar 2026 11:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624198;
	bh=fVa2FI2dmPWrKtEOJmEyVjPJeA/foOm5/Q0jw7iXxek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvmMP9gA0GssHmtBPON5JEeQJuSLVeu5NXmEVMbrdRKr5AnWqdcB+Ay9LX5RnbPfD
	 QOuXdkKkuOXRqR8uVhmk8mV/6fGKcS9z6sCt2XlwmiWxGc6Iit0X50z/8XY0PUU3Vs
	 jsu6O1EjldggUixchqLHn2ALouWE0IzuYSz8nbEBKJMB/DqxArkmM2nbbppEZWpeLm
	 e/OYmev6Jo0unA/XN3TTJEAh9kfGVr7KzK0ytxpo7bK1N0VXtIxVhXyRByftUAOmPE
	 vkJcllMQGTYU61TpPQsGJmaTzCc198pLSDA93nfeIxQH6C6uS0ATeA8N/vNmPE9Amp
	 HQ9F9/SxiDFIw==
Date: Wed, 4 Mar 2026 12:36:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: Add Support for Allwinner A733
 PCK600 Power Domain Controller
Message-ID: <20260304-succinct-russet-stoat-fab9e3@quoll>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
 <20260304-b4-pck600-a733-v1-1-2f54efdb8cc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-b4-pck600-a733-v1-1-2f54efdb8cc2@gmail.com>
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

On Wed, Mar 04, 2026 at 03:43:44AM +0000, Yuanshen Cao wrote:
> The A733 PCK600, similar to A523 PCK600, is likely a customized version
> of ARM PCK-600 power controller. They share the same BSP drivers in the
> package provided by Radxa, with the only difference being the lack of
> resets.
> 
> Therefore, document A733 compatible and make resets required only for
> the other models, as well as prepare the PD definitions for future
> device trees.
> 
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml        | 17 ++++++++++++++++-
>  .../dt-bindings/power/allwinner,sun60i-a733-pck-600.h  | 18 ++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)

Thanks for the patch, nice explanation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


