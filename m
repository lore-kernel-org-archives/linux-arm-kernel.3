Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9EAC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4tQ+sDRU7aZ6CAzmMOUXv0qgEZIvH2G6eCwbcj+hO4=; b=ROnsRGxgjshmf3fie5vbYd4C9x
	jyzSiTbb9MVNZsBNbBSPsxdDTISvG7o6YfU521KPB8n25liWB1nR9eMUWoDRuOU0CpsO1+TMbl/H/
	+mxSWyhnvsD+xGrZM5G9+DJBwwyC+4OuozEwbz5SwzwUfIgfftAUaGylAr26cd08FwOUaK1Yiqe9T
	xo2nIeruHfDJ//IPpCEZ9eYbfcir4N6Damesq2O0npOYWl9EmKBlBBWDSfmIyLK95ISkDag92cDpD
	MTbSgpGz1nW2RIAKYe1mUTAaENEEZwsq2Fra3pqMJGx5fVBZk11k8sM/ra1kxqtpRPauNV/VP6HV+
	Ic18NpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztdq-00000005Ybj-0wOd;
	Fri, 28 Aug 2026 10:16:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztdp-00000005YbU-1fNj;
	Fri, 28 Aug 2026 10:16:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1CC843747;
	Fri, 28 Aug 2026 10:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43DB1F000E9;
	Fri, 28 Aug 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787912216;
	bh=P4tQ+sDRU7aZ6CAzmMOUXv0qgEZIvH2G6eCwbcj+hO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=csgXZBNZ+X4iEmHYpxbvT57tC+RvwyPFkPfuJaSyhyLp3N/53N0xLZ2XxXt/TQSoI
	 0wz6dWz6x3UKBQ/bI0j67gIC8bBlKqc/r1D2BzDAtHkO9M6V9bbyydCjyIX3JpIwfh
	 VG9/dFYHq/6STUfGEVgVxd5I0Pg4tzdzOd71evI5qlHdUH1sWTbrm7TC69Gt38+TsA
	 47L6i501WJsik/NuRZtEL7tTCLCCWLvNlhQ43R4bj9L9laqghmYPM4FFhlZEJQW6rj
	 eRWhuKHgErjobB523V9pp/7ntzaEZT7eKdt2oS3BybVGX3ybaNJ4eKguvdeSehrZeL
	 946iCDzbVPOFQ==
Date: Fri, 28 Aug 2026 12:16:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
Message-ID: <20260828-hypnotic-jerboa-of-grandeur-cace05@quoll>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
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

On Tue, Aug 25, 2026 at 09:56:05PM +0100, Daniel Drake wrote:
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 52 ++++++++++++++++++++++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 38 ++++++++++++++++
>  2 files changed, 90 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


