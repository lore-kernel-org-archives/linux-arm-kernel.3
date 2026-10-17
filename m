Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189EECCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GucSTx+vMay15N5xRgcUGHqnmTXGCCFC1khzIlrgII0=; b=Ocg73QiY4wRYAPLYrOYXKDNcPQ
	zcimpkLEbI6bc6ijUEXJEMJBeetMQaJe1a3kJ46aViFs7F71sLmow1M3CJ8w6XBPhjqjnkNLEujGv
	XGkBkNkjxKLNaQrVPPw/Zg1+P1BnfZVu73vLAMrw3i/Z1rzN98ybGxIvl+QyX1INHedHgAV3DwUro
	rj7ZLVApf+456fGzeZ0p18z6wtE3QRBR/m9F5sn9BC3Zj8W8feQSvtGgOH430NTbC0ziTDr7A/kJr
	slLEmc2nqaziVlNGa6SLSodyKG6L0pfcwEuO3S3tFnjc27TsWarBMPhxoERR5h0kluvyIgEuN2oOW
	zgvdPPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8O1-0000000512e-2y3w;
	Sat, 17 Oct 2026 17:40:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8O0-0000000512A-3p1x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:40:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A73AB43F3D;
	Sat, 17 Oct 2026 17:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AC41F000C5;
	Sat, 17 Oct 2026 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792258800;
	bh=GucSTx+vMay15N5xRgcUGHqnmTXGCCFC1khzIlrgII0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HKmt+38T+BLu5TvojRf4ZV39zzF/QcTdZh6TMuC0SeWukADTM5OZbQWRCRm9BXPrf
	 otvBn5jW6nB28dnbzgpimUuEE6zPZN2coyB+5J96jDmS0xwvAUhu/MxxCUqzo178xa
	 KLk7/iPwbiDVus+uFpd2s10NoHfG2I9M6hmBI2VzzhL2RHxuCT4Isv1EKsm6L5a+uW
	 swTUDKi9E2OznM1/bxm82kmOJQJ8CdHpkVPKHLT0OVj0x7BLW1HKHJCGSCLObTyfZi
	 S25d6HyYlYADJdzDj81v3O6vXP4OPn3ek9Vgxhtoe9EgEnFiTULs5QF1WEzqTAMpzn
	 WSdy1dWLiaUjg==
Date: Sat, 17 Oct 2026 19:39:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Document SM7250 SMMU
Message-ID: <20261017-fluffy-porpoise-of-brotherhood-0f8c19@quoll>
References: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
 <20261016-smmu-sm7250-v1-1-e11fc0384cfa@brar.si>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-smmu-sm7250-v1-1-e11fc0384cfa@brar.si>
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

On Fri, Oct 16, 2026 at 03:16:40PM +0530, Ishu Brar wrote:
> Document the SMMU found on the Qualcomm SM7250 SoC: the apps SMMU, which
> is an MMU-500 implementation, and the GPU SMMU, which additionally
> carries qcom,adreno-smmu.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Seems valid Sashiko comments.

Best regards,
Krzysztof


