Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC355E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnWlLjPQmwjy7upvMkbZBk7NN1OPViFHw1UhqYzYWw4=; b=W1JcNGGiOiT+eGdwQY113N3sTw
	8RBQFUFRIosbq5MWMF0dwVUB6DR0fjXaYgrECDqcT0qJkLx69phS2urZdGXNaD4tCdBEKxFfc/rbm
	egc4243ttUO6iZVl2TbeXcTKPGVIlBLuLiXTSkIJ4DqV50CUyA/0ocyp+PFCqOhgoixICqee5e6bc
	Ra9nnvlMpjisJD/Lpil8Zzy60VfT/Cje4uA/LHHQofsmwJz+/YKL+PYts1aueuIYjImn95ek9rLLG
	pCMl3EtrKxa6dYzMX3fEi30m9XWa8YoMaSwj8ExiHhuITUARhToCN4rKu3Ec47WdWcX2BGatJB6UD
	vv+kAQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vUu-00000007qet-37Oc;
	Fri, 01 Nov 2024 17:31:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vTC-00000007qQ0-1FDg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2AA0A4491B;
	Fri,  1 Nov 2024 17:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA59C4CECD;
	Fri,  1 Nov 2024 17:29:55 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Fix outdated ptrace documentation
Date: Fri,  1 Nov 2024 17:29:53 +0000
Message-Id: <173048218530.1104111.323163241768582552.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031-arm64-gcs-doc-disable-v1-1-d7f6ded62046@kernel.org>
References: <20241031-arm64-gcs-doc-disable-v1-1-d7f6ded62046@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_102959_060023_6B0D30CA 
X-CRM114-Status: GOOD (  10.88  )
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

On Thu, 31 Oct 2024 19:21:38 +0000, Mark Brown wrote:
> The ptrace documentation for GCS was written prior to the implementation of
> clone3() when we still blocked enabling of GCS via ptrace. This restriction
> was relaxed as part of implementing clone3() support since we implemented
> support for the GCS not being managed by the kernel but the documentation
> still mentions the restriction. Update the documentation to reflect what
> was merged.
> 
> [...]

Applied to arm64 (for-next/gcs), thanks!

[1/1] arm64/gcs: Fix outdated ptrace documentation
      https://git.kernel.org/arm64/c/1caeda5ef251

-- 
Catalin


