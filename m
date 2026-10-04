Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E3FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv3TTQo4TBFnFYWiozxXJYJCOwSs0TX6BGcg6r5MAHU=; b=zqfuYNmPbrSABNhHKCzS3nmFNZ
	vjm98Lud3g+WFzOHMlN7+UpC8KdiW0dT9zaEFAE0plUhMxVEHVyCkh+ovFeOXM4nt7NtNQGufvMi/
	1lZFSi2dKjpOhItEaB4HBRoXY/vbieEJ92SMbK5OAHtPGmhEB9E+wlwj4kF4qNdvB9oiRQoyqRGfH
	duZHkmCVSS6X0agVx7128gXlEI5miz2QEW7+UqarwG9tYEHEL27LCxYu4d49xpgTyHP2YJir8czdt
	7ZcZjgYxm0yYpfQpVTA8slNtNDMiYvU6THcGCDoOMFgYpR+JxXJw+nscmB2wIoXwPihXZ0DjifrYA
	IqqPpSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOm-0000000FP8L-42hb;
	Sun, 04 Oct 2026 22:09:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOl-0000000FP7z-3JuR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49FE543F63;
	Sun,  4 Oct 2026 22:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B14F1F000FF;
	Sun,  4 Oct 2026 22:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151775;
	bh=Xv3TTQo4TBFnFYWiozxXJYJCOwSs0TX6BGcg6r5MAHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HVcIcIjnplESrLEdPZ1NMvOVDUZVvTzT024w1BUyL9NT28/ObG9ShLVaqrMVMC6XX
	 apmz+QMmQqiAT/nc7FzgY91ae/HWUuhPioGxpRFpEdo3zye5xFhyNbu7p583fHxtQq
	 dn92kRvN5xco/wK4Hd6sR/OSeVibQ4OY7gedu1OfBWUU5jED6A/Nf4VMUH0yrZkxMk
	 HIHwzQ8r5FQk1vcgskK+kBHY3LNAxzAIb+OCm6mTGo+8PQe18IkARy1pKNfEAb2oFw
	 eNcNJU2fzVa3CK+hSKSyVTT6+dU16NgUexps4X75MUJk3ErIDhhVS+zJoWeffCI+Vd
	 ST/8dahpzT3sQ==
From: Will Deacon <will@kernel.org>
To: "hpp.iscas" <hppiscas@163.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bhaskara Budiredla <bbudiredla@marvell.com>
Subject: Re: [PATCH] perf/marvell: cn10k_tad: Publish the OF module alias
Date: Sun,  4 Oct 2026 23:09:15 +0100
Message-ID: <179114873097.1632144.14759850922777064324.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905134317.67317-1-hppiscas@163.com>
References: <20260905134317.67317-1-hppiscas@163.com>
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

On Sat, 05 Sep 2026 21:43:17 +0800, hpp.iscas wrote:
> The TAD PMU platform driver has ACPI and OF match tables, but only
> the ACPI table is published. A Device Tree platform device emits an
> OF modalias, so the ACPI alias does not select this module for it.
> 
> Publish the OF table inside CONFIG_OF and retain ACPI support.
> 
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf/marvell: cn10k_tad: Publish the OF module alias
      https://git.kernel.org/arm64/c/848468c86f71

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

