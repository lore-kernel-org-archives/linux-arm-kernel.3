Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26125C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4wnemy+Cpm02wxdtYRjDgRVPaEFpHczlDt8udTKcXg=; b=p5FYAM/Tq1jKzRAnOW+/hBFscJ
	Cg47erwA83l72p9mM2Txv3gGEn9RDYe/9d8cEPMFOTvgBDk5DYaQWCcPw6vPw/CVK2h90/fLWS23I
	cWxnjo7CRL7BMhNfjRcGC4rqb3kJdXafRnlIq/37h0hyFLZW2Mjv6qUNqCxRQuA3mPwPZc+BQ733J
	knqauCXCv8Ml6+pNs6JyoU/HLqLZ3+0uAOMjqtGkHJG9JbhpPhE9ogPTIMhXkGyCEdULulp5v226q
	GtHmT44V7S7RsSQOQtt6Jd0VGRarton7W3NnFqWm6yrP0hPwhrAV5odzF98YDlyuFIomqLDaUFOSQ
	aUjv7BhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZQ-00000009AIP-3soL;
	Wed, 23 Sep 2026 18:19:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZL-00000009AH4-0fYO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:19:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94D171576;
	Wed, 23 Sep 2026 11:19:41 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 063A13F632;
	Wed, 23 Sep 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187585; bh=PbQLuwLwXn0fX1RVLXtQOqY+MF5vBAWCmCnBChPy1a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj0qfraXAH3tlJFvcGRxEz+5Hsb204IK0GSZzFtEwYW9dhsKtCrrkONxdi1m4po0X
	 v5lFFyylvoXB0Xsy2MLFoqMWNl7KnzQ2kE/X/uQ4GNswhRqveEJUd8S4/zZurC4mkl
	 B++XSPtwzpy15UNMV/cp5G+MxZVQWVWw0RwjousY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: Change description for ARM64_HAS_LPA2
Date: Wed, 23 Sep 2026 19:19:36 +0100
Message-ID: <179018757671.2942904.4569029517179842152.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916055141.2702145-1-anshuman.khandual@arm.com>
References: <20260916055141.2702145-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_111947_316286_5F6965B2 
X-CRM114-Status: UNSURE (   7.99  )
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

On Wed, 16 Sep 2026 11:21:41 +0530, Anshuman Khandual wrote:
> ARM64_HAS_LPA2 represents CPU capability detection for FEAT_LPA2 both in S1
> and S2, regardless whether KVM gets enabled and uses the same subsequently.
> ARM64_HAS_LPA2 in itself is not really anything KVM specific, although the
> description suggests otherwise. Drop 'KVM' from the description and update
> it appropriately.
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/cpufeature: Change description for ARM64_HAS_LPA2
      https://git.kernel.org/arm64/c/9d9523b6cf42

