Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7500CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aceLNhffrrmpBlWsGVzf8me9bVVULioy2Vx6+E8AXk=; b=yER8AZAdHfZkfbciznuK0wtIHE
	MKuugeNe0MIi+BkNvedHuliNNEHhLVBAXhvwvNShxztQrAIlH8cRHrZQ+K9ziERg1fqRVI2wEyb3J
	gyQ3+VuCMKPQLpz5XPDpX6lfHhYm9tf67C1Gt1ZphY4TqVWu26bBgNGsFj9yBDNkKYDeVzwWPX89Z
	SzzKJEwKnrUZX86cRA+wO1CD1ek2FStPwXcrF/tcJFdSYXbzCnR9lbM7w2u+qXFbQRfiOzPyjL4PL
	BcwGsbjcjh3186KedOHF+IvRM5vel0M4ERy9hF4eSWbdJr+0EYys83rD9Eyq3lgTufjlOsHHqpB9i
	GCuLQaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3Jk-00000004ZyB-1k8q;
	Thu, 07 May 2026 18:19:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3Ji-00000004Zxg-31ur
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 18:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C704343F;
	Thu,  7 May 2026 18:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAA8C2BCB2;
	Thu,  7 May 2026 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778177962;
	bh=L13Ya1YLtr11/2vSHCsuWV2gqbbrk3THnoiNxoiKkoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FphLEBkW2BByd/51JTrKOETzSTkxz355vauLF556Z550I3Vp+8XDuYYZdq755prvL
	 WEhJgJuudOzkpTdDGu2hZkOA5mq9htHiumi5gPnpJx70xjrxGpPwTLkiQtnTcaDq80
	 ALyaa1qMgzvHEALZgpRzHSTnw1BxE4P0WOp4m5UIEbojP0vQvv+sCIwe+JOwwKLl8p
	 iXM5jj/05LCMSoJcztk1bKnc6ErOKN4l6CFxzsreiVSDmWiWpf6+9KaCtwehcKBq1M
	 /jMMUbrLADPOk54Y4a6KNJbLXzl/u6B6QjjDN36vJrmJukVXGmxgsRNS9fIkOaqZvN
	 C9d2y1omsOzEg==
Date: Thu, 7 May 2026 13:19:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Qualcomm
 Shikra SoC
Message-ID: <177817795959.2206284.11592002109697803806.robh@kernel.org>
References: <20260430-shikra-smmu-binding-v1-1-1a28572ebccf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-shikra-smmu-binding-v1-1-1a28572ebccf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_111922_778624_36E528E1 
X-CRM114-Status: UNSURE (   9.11  )
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


On Thu, 30 Apr 2026 17:54:44 +0530, Komal Bajaj wrote:
> Qualcomm Shikra SoC includes an apps SMMU that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to physical
> addresses. Add compatible for it.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


