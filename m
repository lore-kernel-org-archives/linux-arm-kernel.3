Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0555C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nc0GZEveyNsfDrAwQEPhop1DRFKVu2AYZuwNyht0URA=; b=g3lT/8rNZy8HcWiATKdnq7rfeb
	7MuH6/Nf18Vp7+TXaGx/s6nkoPAv+GPQiSulNr46Xfawj7twtQfxvXe0iaiGMMqYumjtgABeZrawS
	ZIImjadBWBwC5hvuaAdlNzxOia/YwL5R2pxCNuVQ6mW2TwtBcL4/LD++5luAZocOT0OXRT+u3lpr7
	OwVA6vawXzsE/UpQMrvyS5Pp6D9D5UlRt4uy4bdk3reGql1dMCxcTQHnnOyV5FVQm/w2DI7FXIL/P
	Co9DOJDS4ZLYb8atAN59YH9wvHItXhq92KQnYF8o7SdD6OVE6UnyJXdnVcmVPB8PIgR9FPdIftr3U
	lHHwZesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dU-00000006KWN-2hgz;
	Thu, 06 Aug 2026 17:12:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dT-00000006KVV-3iSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2676160DB6;
	Thu,  6 Aug 2026 17:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EF11F00A3A;
	Thu,  6 Aug 2026 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036322;
	bh=nc0GZEveyNsfDrAwQEPhop1DRFKVu2AYZuwNyht0URA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HZGulFHmp2kRydQcX+HNixq1fQGz3Rl29xnmQfAkrAmykBfoHo8Nq/4xOrrNca27X
	 jT9nyRtSD7+hhJr6wbZqIzOKhvh6uzLHz6x3LGYMd36xREbB3L4skkNe8umNghNmkp
	 fwN4AvN48za6TfxrYVcSSyCnWEC5SVDENlzwePvwudD1bRqGdSJv1JnD/QtHhHIxAK
	 yZ11HliiBp2Hwx3Z/T3qTZvtSA+vQ1I6pXvvurL57UkiRw0SkR82ciLI6/6vr161ze
	 QPqEyzWDpI3ahaChlGle/uCNUp1V83hk+i+rVobryhSyQw0e2OOlh+tgTrWVTAvUV3
	 iBLVZaG2TJ7OA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: add compatible for IPQ9650 SoC
Date: Thu,  6 Aug 2026 18:11:39 +0100
Message-ID: <178601639875.384211.6516528975191609551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
References: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
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

On Fri, 31 Jul 2026 11:01:26 +0530, Kathiravan Thirumoorthy wrote:
> Add the compatible string for the APPS SMMU present on the Qualcomm
> IPQ9650 SoC.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: qcom: add compatible for IPQ9650 SoC
      https://git.kernel.org/iommu/c/02f1359b1143

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

