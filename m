Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D26FD2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmd1VkQTifwsmxFFnk29nZ4CBv5F8unfbxE0oKp0GEE=; b=xXl2syR60GAskCg93jfwih5Cov
	gnw3paIDR3UcO23TK0MptPhLDYLx1M0BYN52yde9/eLWi30T79H4i2LQeOR0Jk7zvmM19UEPze3UH
	Dw9qEcWkccVR0IBtXzAznhHzLnHCgLxo0Hcc4CaWtJZkzJVfUYCTnl35qHFGpz+iXdP23JxY/rHob
	0vVZMoUkHjIhxARCro6dmQ6hP1ws0aFMqA0TfrYypTIXyLXdbfisPL4GfrKv7xmxMGqUmWcEE/azK
	S2W1FisrbNYrFmF+2zXFzxjFAoBoArvY1PRtiPO24QIfRLh9mAYHaIvmRw+Ys4hCFHx0olS01PYmS
	naJ7zhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wmr-0000000Da1L-3XKW;
	Wed, 23 Oct 2024 08:32:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WgO-0000000DYTi-2dxv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AD55A44BB2;
	Wed, 23 Oct 2024 08:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A4DC4CEC6;
	Wed, 23 Oct 2024 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729671931;
	bh=XzVfo+yGb5qyhp8c3EGJOmQk0WqCkhFLW1iQ50gHA3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hdn7tXZTllRMvFASo/RBclPnxYNsKqqCv6abJXKt9fwPsVkEq5BFEkR3qJSllxQVu
	 UG6zTeQ+18TCx++vN0Dw1zlMEItXB7jppaCugJ+y0bTkXtlyWepbqcpcOYojURi4ED
	 U5R7O9PBjtRlsgDM/4StfUwnR+Iq7lpDYPrCKdfl46D/27GdA2J8MPzEALctNBH/kw
	 OZPklSYlSRzioCPVdfNl096yRBUWd0q42Uvz60RfvroPICMATEx1IHdhFdzQIUwtow
	 0eHRyVyYwt7/HaReaT/9l59WMW9dmIxzfgB5q73O95M+7AVEbPTi8HFLNWk1nb0Ba5
	 dvwZN602tjgfQ==
Date: Wed, 23 Oct 2024 10:25:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document sm8750 SMMU
Message-ID: <tf7zt3ytxdzgeop2n5ard2kivbjtcqun5jahgqvejynj2ttyon@eg2yd4ulouw4>
References: <20241021230449.2632493-1-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021230449.2632493-1-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_012533_101659_9F2E4E5E 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 21, 2024 at 04:04:49PM -0700, Melody Olvera wrote:
> Document the sm8750 SMMU block.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

This is incomplete, what about clocks?

Best regards,
Krzysztof


