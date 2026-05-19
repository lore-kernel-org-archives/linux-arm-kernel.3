Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DF2CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndIkVrmoSV8hIr4nCccDNKvXr7BAPOMsRKaGaN3/PY0=; b=sLSIorAKLyv7EFa0bsETQQi/GZ
	pTJRU37+4cmr4mYoH76Xvr+6Gbeb24ELxBz1SKoaYaia7+tJh7A3jdBo7eRyQiUOREGEZJL1X8IbD
	4XMcZ5uRYZZLFWnakXroNCvhol//Se/drhJZikFVJsYKBLvzh7aH3mWmOTCWPTJ5EsSFHDxSQgds9
	nLk2n9CB4sijQRIFoWRmuW1dYokGInZI+HF1zcThHsHfpclqqL/ajetjj+M3bW2yzhXIMCIukD/Uv
	ab7Bbp3aJ7+ggX7m17SzMq53Pf3DEaLFwpEFUNaRXuXcf4pWpEIzHa2m9v9tUhaKHsyjxPHDWWH0x
	sR+0tmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJU-000000021bd-3YjU;
	Tue, 19 May 2026 15:24:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIq-0000000215S-0ndp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A43776021D;
	Tue, 19 May 2026 15:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5721C2BCB3;
	Tue, 19 May 2026 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204255;
	bh=6yzeZKjIY7KncVYLNHjU8B1TmRbz+P56hztlrktOXjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ds4cLQmrolBcjcmaH2fKTelUol+Rtg41iRm6WbzrtsN2vJzZzGQaJAE7IkSLAlNUn
	 AJBhs3E9v2YsYhImXYanmD7ioIZE+7pptRxkFVilZGbyuWo7bHA8FAIufYJN6ifcSS
	 0xT0w3/uiqN+Psyd7vpEFFtiBgJBkbMR2C2JSJiUQKTKH1sBtPXkzqdnikuNQ2OIjm
	 LzAi339N1zyZ/MBxgRw6xdaAk0PjDAx5MX3CpBmPVlybm0mnOodfTByss4VSwT2uZt
	 0Ye9ir0C2jE1pXIrMxmyMYSUHqK7POgWOrFEZHqSMuVp7fMA51n+zS0yE6nwy5X6k7
	 GZ4C6k34JTJ5g==
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
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add Hawi compatible for Application processor
Date: Tue, 19 May 2026 16:23:06 +0100
Message-ID: <177918729848.741670.14409258656864671686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427174915.3639641-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427174915.3639641-1-mukesh.ojha@oss.qualcomm.com>
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

On Mon, 27 Apr 2026 23:19:15 +0530, Mukesh Ojha wrote:
> Commit 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for
> Hawi SoC") was intended for the APSS SMMU but was mistakenly placed
> under the Adreno GPU SMMU section. Since that compatible is also valid
> for the Hawi GPU SMMU, keep that commit as-is and add proper
> documentation for the Hawi APSS SMMU here.
> 
> 
> [...]

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: qcom: Add Hawi compatible for Application processor
      https://git.kernel.org/iommu/c/c3f9dabf58bb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

