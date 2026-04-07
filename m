Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9124FF512C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ztlzy6/9/0FUOexK7kEqVQjcXPNMf035a9M8FFtxKo=; b=4ACE9Im/V2Nq5MCzZ5YROlOuYh
	/Fl2mCyPkJ7B5BD+o6OayDSR3RzMG4BOTU9F+dN1Glr2ak2QNWl5640Ku30k8mijBEP16U9z2HBZh
	1+Hc9i2pllGMD/Kdx2B7IWL0CmQybK34PdOH3e2BX2rz87fmwm+yxROqWL2aIwAivtr2WqQdavJzd
	wIqej7coBhFziIvZnyEuWRsBHCceRj+mOiKgK0l7dOhXEOEU+srmys6nmTjq+X3L6+WS5wSOlqQLz
	NdGscSd/5Q1ST+X4vxtpxqSno2CwGk+o2RWg3/TBR9lOaD9mlMMnQR8cSZ/3OSU291TjmSFnVJMlP
	1+SkKDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9qE-00000006pMy-2pUW;
	Tue, 07 Apr 2026 17:03:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9qD-00000006pMm-0Uz3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 484B960133;
	Tue,  7 Apr 2026 17:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D687C116C6;
	Tue,  7 Apr 2026 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775581432;
	bh=cvSfD19P7uTmsATu2GySWCnv/dAXkRtQ9Eb0rF3LY/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YAowgwY8frarC3ngk17I+k/t9K/0gPezR4wsmrg2wUodIyeKKKyY3f4j83jovC1UG
	 x0OU8wils+E0iyIsFAs2LHttPoJ1px8fDhbFmOePXHRoZPtpsH4/07+G228uFFzCP5
	 1DDiOPyZ1BQgTnwHtMatOWcIqpeFJDH4X3cj63X9gtA3BK1EPpzgqCA6PgQtxFOBkF
	 Sk3AT55vezhVu9+R7EMhGolvc4eHRoNKHQGvJPQMJoYl+WVHcmj6o+8MOiCqPU94or
	 3/x+qmiof/kn6hH4t/ofc8JN9+BMEiHqde+BtiKTUrvzpWJ5/PEsaxcT+1XhnvbhVL
	 bNGXJMsjAZVpg==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <Robin.Murphy@arm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC
Date: Tue,  7 Apr 2026 18:03:43 +0100
Message-ID: <177558103339.2252830.5428863486031269927.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260403080956.2714415-1-mukesh.ojha@oss.qualcomm.com>
References: <20260403080956.2714415-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 03 Apr 2026 13:39:56 +0530, Mukesh Ojha wrote:
> Qualcomm Hawi SoC include apps smmu that implements arm,mmu-500, which
> is used to translate device-visible virtual addresses to physical
> addresses. Add compatible for these items.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC
      https://git.kernel.org/iommu/c/5e8323c3d528

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

