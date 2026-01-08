Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EF7D1D493
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+iqK5f2YhllKR7irsLXlRc/pIwAyIXNfPZN3aApvqw=; b=cxBUO+TCOKlig9ofDenYMSzIFK
	/4V5UZhoO80OLLU0VU7qtjTGA7TjA+Qo1sKqRpCLdYZK2FS12xieauJLoxM+gWltQSnTkzH/gfdnz
	ia0hmc63y5CW6sVdnfLbMxsGcC/kJ/dgjV9Mo+0my+9J1rJmoWyMBU47ZnKAQc0tAyzR/LBaFbL8U
	We26K9T5RLjPi/OjUgLJi1TAA2DtKKvDka6C8ehGLPT/+lJ+8+8IFrjySIH0ULa2VGTw3FL8rVMrt
	7LuXqpLW+59Lb0Bjpbjo/nL8FD5TIFO9eAF0FBwuyqgIY48YKcqNR76RPllkHOMi07xrfc5+fZ/yF
	bCk4XbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwYP-00000000olX-1nIL;
	Thu, 08 Jan 2026 20:24:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwYN-00000000olD-38K5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB22A60130;
	Thu,  8 Jan 2026 20:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD58C116C6;
	Thu,  8 Jan 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903858;
	bh=r23i/DdunsLCJojJYofAoLh5i8vBW6U9Q3YvFO9vFeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CJ9Ox7b+JZXs2kfibqDtKWpSjfymLEw6DKgGG2mYhOFo/0DIRc6HJPF0EB/+Wp/s4
	 Tgh/1a1WT4j1uvXVIHjlEKCRYi693T7bbi5GHGkQXEcMHQ5aId6h1dl9zp7afpXB1P
	 sTWJ+PYl6nPILt7aaeN8HgPEyMqskKYcp99UhbCJbuf0YJjrHOER3MYRirL1Esi5eJ
	 zQ+9C878MivS9RYIphC7qfP8e7AAiL1WEvPsIP1HXUpVbaJ8CFYbgygskWKChnzJjc
	 bUgkgpHG0W0b2AsmrCHAhM6WYN7D3ui9Oz/aoseuMP4h93w3eikmgWSjcrpDhjLM0o
	 3bJEztWw4zA/Q==
From: Sven Peter <sven@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: defconfig: Enable Apple Silicon drivers
Date: Thu,  8 Jan 2026 21:23:58 +0100
Message-ID: <176790371967.51258.18187170699504242235.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
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

On Wed, 31 Dec 2025 16:42:37 +0100, Janne Grunau wrote:
> Many Apple silicon specific drivers used "default ARCH_APPLE". [1]
> attempted to fix this and add the drivers to arm64's defconfig. While
> default Kconfig removals were merged adding the drivers to defconfig
> was not. A follow-up based on the discussion was never sent and then
> apparently forgotten.
> This small series addresses that. APPLE_PMGR_PWRSTATE is now selected by
> ARCH_APPLE as it is considered critical for booting just like interrupt
> controller. Since its absence does not break booting completely but
> leaves just a mostly useless system allow !PM builds without
> APPLE_PMGR_PWRSTATE.
> The defconfig change is updated to include forgotten drivers and drivers
> which were added in the meantime.
> 
> [...]

Applied to local tree (apple-soc/defconfig-6.20), thanks!

[1/2] arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE
      https://github.com/AsahiLinux/linux/commit/92d3935e63df
[2/2] arm64: defconfig: Enable Apple Silicon drivers
      https://github.com/AsahiLinux/linux/commit/8c7a1d258d88

Best regards,
-- 
Sven Peter <sven@kernel.org>


