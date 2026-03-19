Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB3109024C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BHNIZEacpNBmPVT1jt72V4CUCdSdeyn6X7ON+myKzs=; b=Wwit6FN/ORCfXIeZ/uN6sfYQW5
	/vC/REgPwjo2GhYGzxznOOmkDmrQ2XvtaHKM12LtaWKRIynSR2Qe9TT2Csvv0QR8AvY3ti+sTu/rb
	xaaRflk+Eazh+IazSLb7z/3TCExZNc7Gghej9EcQeaxuvjQwI4Kc2Aq7yZL3NCrLpGWoX/nzoujoM
	mt9Ik0riU7nLOdPDsXgRoXwTv3nT0i6mZmF0BZKJX/eRtFItnlGD7KQ4loaut47+zlcSkAYzeaTof
	1A5nPgaHnGKOme9WCxxY2HekLZ+47CVRlm7NA1xT3IlHVkpqlsQBuUHk0617ku7LEjov0jdhJU4zo
	jf+eOf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GCX-0000000B4Uh-0JlN;
	Thu, 19 Mar 2026 16:26:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GCV-0000000B4UN-1CMG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 766374421F;
	Thu, 19 Mar 2026 16:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2048C19424;
	Thu, 19 Mar 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937582;
	bh=VlfEhZSHWJ/d6WoSp6w9E8+o7tdb5q7lCZgsb9Fy0oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/IoNtNYjHJdiHRBVTroucToO5jBIF79lHKQLHYcQCLFvTtuLhVeEUDprxXzXGoyw
	 Af4DFHBvfTUdOyN3LATVmwvQC+ePdcCnQ9DwtbfZC9j7qj4UCn3cjhdR4Ot5mPU+qp
	 ioTfEEJNpc+jNWQrRnbszONW3ez4XmWbSCcx0i9rGVnWTarIJ5XCfp+nS7mCWAkZDM
	 xJNkaTgCPfW3zVhKQ5asXSOlHjSB3EuY8JXWeSNKxf9sZMLDWlnma143bXfcsoiykI
	 ogulsYScYxFP+mvTc/6NbyHhqJwXQYAqOCxSgNt+Vapl/UnntqKFRP6+f8U1AXFSWi
	 5KCkB5OVu6EEQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Add compatible for Eliza SoC
Date: Thu, 19 Mar 2026 16:26:07 +0000
Message-ID: <177393144424.3815946.1539453168871501217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-eliza-bindings-arm-smmu-v1-1-7a35a76201a5@oss.qualcomm.com>
References: <20260223-eliza-bindings-arm-smmu-v1-1-7a35a76201a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_092623_342066_EB190511 
X-CRM114-Status: UNSURE (   6.64  )
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

On Mon, 23 Feb 2026 10:46:39 +0200, Abel Vesa wrote:
> Qualcomm Eliza SoC implements arm,mmu-500. Document its compatible.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Add compatible for Eliza SoC
      https://git.kernel.org/iommu/c/889cdd9e1b37

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

