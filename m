Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F611CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/0ZQBhs+XVkIKFROpIbInZ89jBqJs9X6/OMYW+B01s=; b=h07k5u/02lYvb1tzBw9njM1JuA
	DGPTluPGLkUGlT5VDDg1iQbTZf+wlL7vz8ucu0g5CL35/9idlmmDwqAwMm9X33IloDGrLFuXv3Pdk
	7LTS7oA3Q+J+A5s26zU4NSVSyVnitxa1fE5FSP0njDSZr3C1zCQ8R73k6ZP7jZwthgLZ2iuBnvPZd
	dUhctoxvSME1ygnSDjt7NAdPNXBSZvJrUFd3nlW2c4svNxAVRNZxofiimvmtX99h0xdWruq4m03lY
	TE+YVNLn0gBHrFgF78C2b9jH52ONV47Yv2O0rOHw9W8B1kDhqBiQdWN8dHce7k1SPUXJFb1O8J309
	a8622iRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTS7-0000000129i-2jsv;
	Fri, 07 Nov 2025 20:52:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTS6-0000000129S-46OA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 146B660191;
	Fri,  7 Nov 2025 20:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B109C4CEF7;
	Fri,  7 Nov 2025 20:52:56 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Drop cpu_set_[default|idmap]_tcr_t0sz()
Date: Fri,  7 Nov 2025 20:52:47 +0000
Message-ID: <176254876744.3846522.3909820639580560567.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015021024.366722-1-anshuman.khandual@arm.com>
References: <20251015021024.366722-1-anshuman.khandual@arm.com>
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

On Wed, 15 Oct 2025 03:10:24 +0100, Anshuman Khandual wrote:
> These TCR_El1 helpers don't have any other callers. Drop these redundant
> indirections completely thus making this code more compact and readable.
> No functional change.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Drop cpu_set_[default|idmap]_tcr_t0sz()
      https://git.kernel.org/arm64/c/fc1abd409318

-- 
Catalin


