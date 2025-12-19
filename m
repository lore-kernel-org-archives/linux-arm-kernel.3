Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D838D74964
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it0iUHw/eEBQ637pReoeL+SRk7tdVb2PLzVbz40JGRA=; b=kKRUDHk8TCCh1RCfNgzYXKEeLa
	LreqP9ZGIXlc1teKlRY3GZk3c9rldgCuVWNcYZwryshpc795SsGWPkHVgR259SxKXyaIcv8ZIHeYl
	JXNuVoqbt74He9xcNSl2t+9C34t4QLONDmxwS5qDASTPZuMEsh8LVUHDwH/LX+JhdRUY57ThJzbix
	sB/tnAbRsAAuDjhP7D6DtmQRsAiAxLQe3a3tTrGAaarvdEIWB5TjbVYiITqSnBaCUlOKXxqW8t3Ze
	pfZo5wZwcjZuKIqAAuwbmojGT3zDpp6jpDk97DbUzzq+tWLtObnrbu/fo5k0DlEEg3O1Gbi0i/PKH
	zQ9irZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc9-00000009p5k-0597;
	Fri, 19 Dec 2025 08:13:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc2-00000009oxO-0MQ4;
	Fri, 19 Dec 2025 08:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61E2B6014A;
	Fri, 19 Dec 2025 08:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A1FC4CEF1;
	Fri, 19 Dec 2025 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132001;
	bh=lvn+iw5IxWpNsx5ppx7UaT4z6tDEmv9IRQkqRmBQGQc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M/IUrif+d4VKn/MpBzO8oXg7fyF4udbLWjFGC+kaeTKXVdK9pnVZSk9qfn61Oncpi
	 GhR5l8VAZ4IA86aoju4qY4COjaufMk77R9+qzFfwAZOU9Mv14DiZsPZrAzz0fP8C8O
	 RVHu5dAXut9fzq8uA8rHcl2hgk3qtCR3o7FIhbbxw1etaHqlACnKIZpUTGy4fOBicw
	 mUDSllG1LCmoO9eVDdYT7nQEkxN8ixdDPeXlwtWDpLBykJTtiH2K8RTzj7p3zgR18A
	 EftOxjTcUmtQ5u7Eo9SivKx97gnYTIzCDyvlh8FtZdCb56p0NX1TrxQ6CjwLInTtmr
	 ati6fNfjsc4FQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBE4380AA50;
	Fri, 19 Dec 2025 08:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/6] iommu: Pass in old_domain pointer to attach_dev
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613180983.3684357.11179224135837486617.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:09 +0000
References: <cover.1761017765.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1761017765.git.nicolinc@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-riscv@lists.infradead.org, joro@8bytes.org, jgg@nvidia.com,
 kevin.tian@intel.com, suravee.suthikulpanit@amd.com, will@kernel.org,
 robin.murphy@arm.com, sven@kernel.org, j@jannau.net,
 robin.clark@oss.qualcomm.com, m.szyprowski@samsung.com, krzk@kernel.org,
 dwmw2@infradead.org, baolu.lu@linux.intel.com, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
 mjrosato@linux.ibm.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jean-philippe@linaro.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, patches@lists.linux.dev
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Wed, 22 Oct 2025 19:21:03 -0700 you wrote:
> Tidy the release_device callbacks in the drivers and switch to the core
> managed release_domain.
> 
> This allows the core further to pass in the old domain pointer into the
> attach_dev callbacks to reduce the use of iommu_get_domain_for_dev().
> 
> This is a preparatory series for new iommu_dev_reset APIs:
> https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/
> 
> [...]

Here is the summary with links:
  - [v2,1/6] iommu: Generic support for RMRs during device release
    https://git.kernel.org/riscv/c/e94160488e65
  - [v2,2/6] iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
    https://git.kernel.org/riscv/c/52f77fb176ec
  - [v2,3/6] iommu/exynos-iommu: Set release_domain to exynos_identity_domain
    https://git.kernel.org/riscv/c/680a6a60fc08
  - [v2,4/6] iommu/amd: Set release_domain to blocked_domain
    https://git.kernel.org/riscv/c/c21b34762e2f
  - [v2,5/6] iommu: Do not revert set_domain for the last gdev
    https://git.kernel.org/riscv/c/2b33598e666d
  - [v2,6/6] iommu: Pass in old domain to attach_dev callback functions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



