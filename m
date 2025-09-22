Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1280ACA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqlHv0i1IdvKBA1QBmeVaSl7Wmn/QngMY+8RQlGfcq8=; b=BugjJSBJ9gWlmPceMv9nUHQQ74
	cFf2IPh5wJnMM9Vq+NBYJnVapnxu+FDtODCKMlwtVO5GJZ9HZ0ootgNiIrMn/F9B97+ofJCHDwUDa
	YTruH+vvLeBF8PbwEGFKjKlg4SaI93ZtigROEQ/H0TqDTzmmFFOZl+dMHJz3kkIa0kD3RkDUBUfFr
	07F3iKSMq48rPu1WPWET9uQtxhhRSUU8e6DMIDJJ3fopchrpJaA5GDYW/oGNMHk4DzZWUwO2AHCCA
	x1HgP4o3lTzhBmr1BFwPFxLAWG0Hfuqe3qOYiaE0/391hzVQ45pOH21hr8vie2WP8de7CsjM1ygul
	G1/IP6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kPD-0000000B8cl-1ZvB;
	Mon, 22 Sep 2025 17:32:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kPB-0000000B8bT-0YdF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D24FD4028D;
	Mon, 22 Sep 2025 17:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C4CC4CEF0;
	Mon, 22 Sep 2025 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562368;
	bh=gLoJKtzalDuOH/rmRMJ55zcAI7y5bhJhyzWCe2JGf1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRtwAyLJHXC/w4/KuZ533bntdd1AtbCwzsDCiQLhxyNuMrwr/qZv3rAQ/6PucLbl1
	 +Ii6PL+zXm8m7CVZDaE4DreOP6VRzhXQYNFICTjAnt+f7LtwHLuuez3v5ibBFjIQ3q
	 2xgeR2WHLYf7BG7JEGPys36TfIfdVYN0LHnLT7xbq/gKNK//5987u+O80O5Mc3rV2P
	 0i6kYNha3h28RSBq6xhh3xp/goplAT1sRv1/XPORSY91gBsTsT7ho+oCIJKt0PEILi
	 GLZj0UA2kS2spRINxR40UBXYZ0+CxuSNNyCEpeZOgN4N8EVyJTYIkNSEDTit6bgTO7
	 2XrDoQB1PmzdA==
Date: Mon, 22 Sep 2025 12:32:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, dmaengine@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 3/4] dt-bindings: interrupt-controller: arm,gic: Add
 tegra264-agic
Message-ID: <175856236329.510188.15404982398472651889.robh@kernel.org>
References: <20250918102009.1519588-1-sheetal@nvidia.com>
 <20250918102009.1519588-4-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918102009.1519588-4-sheetal@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_103249_186470_3AE35339 
X-CRM114-Status: GOOD (  10.20  )
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


On Thu, 18 Sep 2025 15:50:08 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Add nvidia,tegra264-agic to the arm,gic binding for tegra264 audio
> interrupt controller support.
> 
> Signed-off-by: sheetal <sheetal@nvidia.com>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


