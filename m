Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43774C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJMk5wfqfmZ8Km+K3oUYO2vXzYnu5TIhfjfCYG6aJXw=; b=Me1rQFi1MQGbW4OQ1+/BTkdgxZ
	k1os1xNdd7C/jtJsgGgl4lOPcu+P6VjMtgIndjwIqhWnwt38tIOJwFjpd9X0gSMBbbrY7omkXWk+U
	oGFEHomUlSRb/qhrjYcFRo6Q1l7XuYXFW4p4gBDIbcDpxuLcPPGrOStHjecL96Sv2C/oJFe0nO+B5
	1msakgWwiAxav78zt+N+kXAtAmnHc8ksUYiiOF259vCOXz4Vz8QYLlrSTbp7RE9/RXiRfvGiGLaDv
	edGJHMbHRNvBMR+L5HoZICe6qL8opd04Lek3IU2/dlOSSLpcq+TxSE7OROeiBmc4987ajMuoXed7T
	kMA+eGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wib2S-00000006hzS-2R8v;
	Sat, 11 Jul 2026 16:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wib2R-00000006hzG-1ReU;
	Sat, 11 Jul 2026 16:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D912601D9;
	Sat, 11 Jul 2026 16:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C6A1F000E9;
	Sat, 11 Jul 2026 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789130;
	bh=xJMk5wfqfmZ8Km+K3oUYO2vXzYnu5TIhfjfCYG6aJXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+5P7hSywsTiAsJxEmNblQnkreLzh//QvBfQVoqGeDPv9YhhOZtsMI1JwZkV6u6O4
	 bC+6NNJkM0x8+E9m6xDDWuMmIVwLNuotSvuWcr+D5EjuAMT+Xh+77Wym/tszw5KmDn
	 +ho4taDk06q2GHDiDD9HjNMLg0xWSGlyOHZXASpiuu8HBUFE+wjmiSBQDRP/Ush2Hz
	 LLFXUkg73o0KMBKfA6N+/F2r+oigE+8Uj/0wGmxynlJnpId7lCAuNe3DwJh1pj2A+R
	 lZY3xRP+d5UmnCJZsA4lpySmeLNkHOJpQxi1fR6/dtYSh7ov/gpFd7rBz+EC2lX/P5
	 3s+YCvQPP2bvg==
Date: Sat, 11 Jul 2026 11:58:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: esteuwu@proton.me
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/8] SM8450 QoL changes
Message-ID: <alJ1EGIa8WM-iRRN@baldur>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
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

On Mon, Jun 22, 2026 at 08:54:21PM -0400, Esteban Urrutia via B4 Relay wrote:
> Hello. This is my first attempt at contributing to the Linux kernel.

Welcome! A very good first attempt, I hope you will keep doing this!

> 
> I've been mainlining an SM8475 based device for quite some time now and
> I feel now's the proper time to start submitting patches.
> I'm starting with the smallest part which are mostly modifications
> regarding the current support for the SM8450 SoC.
> 
> Regards,
> Esteban
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
> Esteban Urrutia (8):
>       clk: qcom: dispcc-sm8450: Fix mdss clocks
>       arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
>       arm64: dts: qcom: sm8450: Modify GPU operating points
>       arm64: dts: qcom: sm8450: Add missing PCM_OUT port
>       iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
>       phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
>       phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
>       arm64: defconfig: Add SM8450 camcc

Sending the patches as a single series implies that there's some sort of
dependency/relationship between them, but as far as I can tell there
isn't.

The changes applies to 4 different maintainers/subsystems. If you group
patches based on their dependencies and who is going to merge them, each
group will be easier to review and merge.

Regards,
Bjorn

> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi       | 50 ++++++------------------------
>  arch/arm64/configs/defconfig               |  1 +
>  drivers/clk/qcom/dispcc-sm8450.c           |  6 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c  | 33 +-------------------
>  5 files changed, 16 insertions(+), 75 deletions(-)
> ---
> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> change-id: 20260622-sm8450-qol-466b8c07eb5f
> 
> Best regards,
> --  
> Esteban Urrutia <esteuwu@proton.me>
> 
> 

