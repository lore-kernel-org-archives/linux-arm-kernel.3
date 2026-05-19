Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A58CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBbQ8oN2SPGxu5w7G27NGbSXrEmAB/nwNIgAzdVypHg=; b=SA8PX+ikhR86pSCoGmKYgZ4UW9
	DetkQlUSqWkMNZLQFKqbCY7mVHjSXOO7YsABEZE3r/62MlW5Zsx3Y5/av/0R2qM+zpG15VpNdEm4K
	JxVg/gMLs0+6Z3Rzbtnzkeq3OENaGeZiYB6wo2ECUntWi31mO10vc3qpnAXW++mLz12keU0+gXUpY
	EuzD+Tmo0XvYoWsUa0MijTaAuU76BU79rjjMU607jrosNwxoIkF8jIa00S/300nz4miEVtjsg4oif
	Pq5S1eooa+OvuQsQvdVJjO5jubSuRYuDULx+vDBiH+wZry0j/loVvW2Gzb7V8WDd+xF8md5OFeevG
	thcDc5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJV-000000021dB-3aIc;
	Tue, 19 May 2026 15:24:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIx-000000021Ap-3fgg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55CB560224;
	Tue, 19 May 2026 15:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66F3C2BCB3;
	Tue, 19 May 2026 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204263;
	bh=yGclX00sEmvr2VHCUrzeE+m5yMZUCl/baz5r002iGfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AuhVB9DO3aQKgSyzzgiaQyUBKNX8tiLyVYh2LwfpxJo5jfSn7SvdF//NUd8ec5/X6
	 H5iw6qVBfvxfPa3WCPCgoq/jRlhG0Nmps5YeWqLT0cQdzEFtTIDBaF6Dk4yhEUUfmJ
	 wF5toKF9p0gGO3Cd5IJ52ug2WudLGT0rIUcUT+tNpelfXip53G9nA5g6Sv4SYZnLqR
	 CpLbHKr9t5Ylxfa5HMTWdXMg62nEVdezSbHysBevJ60Hwanx0DQPurSJuv9rQWA3fa
	 dljNqWcu7IGG/4IEOvBqIVE5H+KLhaJPNtH0lF9RKi4YgeJTktCXliqKXgCfSV5L3Z
	 o1RiSEby2rHzQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: errata: Reformat table for IDs
Date: Tue, 19 May 2026 16:23:09 +0100
Message-ID: <177918817933.747252.7403057722390578379.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
References: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
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

On Fri, 01 May 2026 18:52:28 +0100, Robin Murphy wrote:
> We have some inconsistency where multiple errata for the same component
> share the same Kconfig workaround; some are one ID per line, some are
> smooshed together, and some are entirely separate entries. Standardise
> on the single entry, one ID per line format so that things render nice
> and consistently in the HTML docs, and it's simple and clear to add new
> IDs to existing workarounds without churning the table too much.
> 
> [...]

I think I intended to send this upstream at -rc1, but it didn't happen.
However, we don't (yet) seem to have any new workarounds in linux-next
so I'll take it on its own branch for 7.2.

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: Reformat table for IDs
      https://git.kernel.org/arm64/c/ede94377d855

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

