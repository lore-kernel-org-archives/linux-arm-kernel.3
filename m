Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232EACA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeLwfRCuJ2UN3SfjLqcJwyf81UK0hgb0h02BI/TrZ0c=; b=VG5v24GiJYmUmG4M9qWtOBryr7
	CaICGXOEAwLtFr4cj8avzg8223KwTzspmZgbK8du3qpCEVg28bl68jZgf0Rg/pcFCLshyRszTrnsA
	NxRqgyi9oWzC2coy8DjH/2MKguC2jfghLuFwJKeMpEMsqtMlI3xFGmAkDSmYiDkuLWwbWJFdPlSQY
	SvRw4y2XveNeykoQXYn5gKL5lyEhX3REX0sOoSBbnyBmvZ4TGmt63bb9Y2CNVmwRPVGAYmLMi+y2/
	9y3kC+YZc/mKoYGL66aYoFJyR2RJX0bpez1avJYNPdQ5mYnZeQjVrJ+ZJur+m0ixsax+jF3l4NZE1
	pUv/s3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPe-0000000C4bx-45S1;
	Fri, 02 Oct 2026 16:47:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPc-0000000C4aX-44KC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:47:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80A56447E1;
	Fri,  2 Oct 2026 16:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243551F000FF;
	Fri,  2 Oct 2026 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959628;
	bh=SeLwfRCuJ2UN3SfjLqcJwyf81UK0hgb0h02BI/TrZ0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k5UtQKDqr7Yb6uU7SSFWyiD+areNZeRmr0VKghEUUgZJTbt9jfUW8K/6NcMqQwHyo
	 7jgJnf5/xnOkRZLikx9eGy2PI4gt0K5QuJBPppBpPJyYakaFlTzWsupMhJTCS6xXTp
	 jqUSzC9FVgHh+bQ1cCLQG6nHU9jaKmW58fGfFnttV3yNAa9IS9iqP5vjO/fi94YZpJ
	 ppzgu8uXDFv7BaXJlMFLt4o79pxNTq/wuf1aG3NgrwUnGjl2dGKxnU/j/iV1wjZHjK
	 8QONTGvVdEbU56B9UtvTG4wSAjE7Oowb9NwTBZKZZevwATLQBOuXYl0XEkaD+BAKTz
	 z155qVMcqAB9w==
From: Will Deacon <will@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Fri,  2 Oct 2026 17:46:40 +0100
Message-ID: <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
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

On Wed, 02 Sep 2026 09:38:58 +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
      https://git.kernel.org/iommu/c/e9da5ec4a1d6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

