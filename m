Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F14CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8g8cU52jNOw33WW4yf7N6b2x2MvboOi4ENBL7KLAd0=; b=F8xDWPcinggusjBZvUroK10Nz2
	f0pQClz2jHbgNv9uqVViZmCFmunt5xe9o+PlNCqRD6pbPOo7SGWporcJaoKG3H1OuL9WNW4QWc4Mj
	t2Mexpfp3Y2zEhZ9WWvRdqTY1VJo/CnoMFY0UnIF0yvXy2kpSLxX+Fc4Qyg35Yi6zpRNEWpOFdcND
	SIQdB1m8EN2gGopVxAhWLhTxucRABrsia7vjdKJk4tRBCtO87GxqDd+Eke/i0igZUS1kLPNn09Fc1
	LuhpWwZxKPXCX2FzENsRxFES1mgiYSfDZ6nbat8Nj+Yf/h9K/JoX1Z6G9W3LsE4gUnAr6ugZ+RoD6
	qcjzJz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxFt-0000000AF3g-0a3h;
	Mon, 03 Nov 2025 16:18:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxFq-0000000AF26-0wUk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:18:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E348043C2B;
	Mon,  3 Nov 2025 16:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC88C4CEFD;
	Mon,  3 Nov 2025 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186681;
	bh=1jqhRNkAoXZW07AubL5jUqcArPCGQen9XHdy6CfaED0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5I2M9rvFYRg13EhCdpGlmy1zwLxcweioaogE4dBkh+X/AZwYatEQYQQjQ2rNiRZY
	 ArpouXhz1v0ai7R6xUlYKN1rLsx4HVtlsbKZJmCCcYr+brf3tRJlzVhE0SFoH7E0c3
	 UNf0baNdwP9XqGX+c9v/Hj1nywOv0WHShBcZ03uKYL5wYOBzF53ec+CAB1dcKtl5Y0
	 oPXrrl31A9ac2gVAr3vpG4KaCCp9kwGuHjzrFEC60au8TuqjegzbIwK0AJbiCFWlCK
	 XzYXRcp2Rh2eqcbvNeP/g34Kz6F36/59BFV9DMk07pxd3X3kVo+EMF8RouqPxv8BTx
	 Z7uFrx8vWCx5A==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Kaanapali and Glymur SoCs
Date: Mon,  3 Nov 2025 16:17:50 +0000
Message-Id: <176218530799.3313037.12661315019771733776.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251021-b4-knp-smmu-v2-1-88774e6d2def@oss.qualcomm.com>
References: <20251021-b4-knp-smmu-v2-1-88774e6d2def@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_081802_281234_9FCBE976 
X-CRM114-Status: UNSURE (   7.53  )
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

On Tue, 21 Oct 2025 23:15:54 -0700, Jingyi Wang wrote:
> Qualcomm Kaanapali and Glymur SoCs include apps smmu that implements
> arm,mmu-500, which is used to translate device-visible virtual addresses
> to physical addresses. Add compatible for these items.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Add compatible for Kaanapali and Glymur SoCs
      https://git.kernel.org/iommu/c/45859c059c20

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

