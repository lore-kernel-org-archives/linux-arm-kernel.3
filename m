Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BFDCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zM4LhHiGguqW4GxrHXHlOhST5maHFvGrTe92pnsfX60=; b=a7ZfOi32lUsnjvQcPlX3P2pNrG
	/SBzxwHlXrh3MakIoxLH5LvDkjTXzPf+VUbOcYaLpBD0oeKQutyv26Ihu5E/M3ViUeuhndAqzZL0U
	sc+4dQ7GP1ghQHSK87W+qNwAFHA9jxA9eQCcGnOO1YcXe3fQXql0tr/gV0AptdgzanjjRcGBTWALH
	eT1T8Z+RKvy/EpJDpG6g6cnVFUreypoZ4U22HND+C6U0/Jte1JZbc9GHi0apmuY8+PX3+PoIm2XVO
	pseOvfzRb81gpVgGrgHSUSUpLx58k7Tolu/Y7jxRv1hAq4PaaerEVrNbJ1t0+XP41V4gTuUUnox/U
	k0yufS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYJ6-0000000BttW-3EM2;
	Mon, 24 Nov 2025 15:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYJ2-0000000Btsu-03MW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:16:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50455497;
	Mon, 24 Nov 2025 07:16:33 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2230F3F73B;
	Mon, 24 Nov 2025 07:16:39 -0800 (PST)
Date: Mon, 24 Nov 2025 15:16:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, Huang Shijie <shijie@os.amperecomputing.com>
Cc: patches@amperecomputing.com, cl@linux.com,
	Shubhang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org, geert+renesas@glider.be,
	arnd@arndb.de, linux-kernel@vger.kernel.org, peterz@infradead.org,
	soc@lists.linux.dev, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2] arm64: defconfig: Remove the redundant
 SCHED_MC/SCHED_SMT
Message-ID: <aSR206S6V3-EaDfp@arm.com>
References: <20251021075704.527626-1-shijie@os.amperecomputing.com>
 <176357945539.2095097.9737276524353571173.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176357945539.2095097.9737276524353571173.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_071644_111688_6FA4E87D 
X-CRM114-Status: GOOD (  10.81  )
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

On Wed, Nov 19, 2025 at 07:10:55PM +0000, Catalin Marinas wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> On Tue, 21 Oct 2025 15:57:04 +0800, Huang Shijie wrote:
> > The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> > has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> > 
> > So remove the redundant code in defconfig.
> 
> It's usually Arnd picking up defconfig changes but since it's more about
> core features, I queued it.
> 
> Applied to arm64 (for-next/defconfig), thanks!
> 
> [1/1] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
>       https://git.kernel.org/arm64/c/a086f211a3b1

I'll drop this as Arnd already merged it.

-- 
Catalin

