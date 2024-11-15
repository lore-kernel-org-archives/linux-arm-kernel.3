Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C737D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lH6OE/MCIDdCFfe9zVafPBZV+lfagIWGtnXGx/s3zc=; b=EoPgaH08Z1fRT4eYd3zmUzfjgU
	UmquW807pc7Cr6dyYcIIJM9JiPHKAoMmDCg3vfwP6VKTTqcJfMASSxXkzztxaPwG/PdqClegEv0+T
	Skc5ZIW2OL5v5SbIgncgPtBqYf+7RvAoJkN6mJzEm9qn6S51amB6Vhymk/hHaraYx+ZQkvzM/gKgw
	dAWfFgm0vvGbp48KYx/81mqTWWYUETXCgHxxyVn/g2gaeXeOnvvoZ7Z1QUz8F1E+8P/Q3okozFzqT
	SPTs2l/sCB8HEerHRnCjEZ7bHO05aSllhYldjN237UwF1rkY/WE9ZygwGDfaObgwEbT3Bf5K40uWr
	oZ3afUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0FV-00000003Zjv-2nGi;
	Fri, 15 Nov 2024 17:36:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0EZ-00000003ZVH-30Av
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 17:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1483BA42BAB;
	Fri, 15 Nov 2024 17:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835E7C4CECF;
	Fri, 15 Nov 2024 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731692150;
	bh=yx4vhMcUNe93yjF2ss21xAank9OEsIHQiHy6fqgsXRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cR1Dn88RWNDYDkl6d+5z29DU8mvMl35uW+V3wuxNj0rGedhcDQQId7M68pvuLhrDu
	 25BAgf/jjqTkdaNgarnRcTe+oi8GIlQwPiF5ZebYrUiFxvHHcOWSjXXh4szx49Wz3t
	 rbO6La3kumGhbCjTyKKSyXEfJvzHM+ZEsFAtymN4nL9jjyjHhHtzaloNtz4TwEMwBb
	 gBcuaFsnek7YigccnznIC81OKp6ztdH6cvcVy+cd6FVDVsN22CIYX5WzwQ0Zg67z0s
	 ZV2wH1jDWu3agp4QPVnwm5FFh3ksYbmAbeYrV2ZxfiqBVX8ouGZ1t1X4znV7z3Wij/
	 kSoWxOcrPVYzg==
Date: Fri, 15 Nov 2024 11:35:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno
 iommu compatible
Message-ID: <173169214597.3440718.17290669612266836614.robh@kernel.org>
References: <20241114004713.42404-4-mailingradian@gmail.com>
 <20241114004713.42404-5-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114004713.42404-5-mailingradian@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_093551_819380_F676DE95 
X-CRM114-Status: GOOD (  10.17  )
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


On Wed, 13 Nov 2024 19:47:15 -0500, Richard Acayan wrote:
> SDM670 has a separate IOMMU for the GPU, like SDM845. Add the compatible
> for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


