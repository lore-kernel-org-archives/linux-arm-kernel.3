Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5FC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QbmljoA7cUSu8InNHkDYKT1TQBGRW4y/Zfa/6fYwBE=; b=GjhpK945L8jbZhh86/PW3JEPIy
	8gPapg7EYjBzgngfADorjmhwmQRAg+bZkKVLX6DM58Z2vaq9NtKLj78JUabnxnwZy0YB90r7K3PPv
	C5e6C5S+O25ZFRk5CnzhaN3M6iOJhRdUw8Cn7oy0EgJjbQSM+N3Em0S3tiwafRV/yZZNfyt3m4JCk
	p5TxBV3lqry+//GPV8jvMHH6bEL3lrWW0gI3P2f2x0r8xKsR/bGFu916Vjbd3M1iBS5IR5gmzCYQe
	JMJfLDe828iyhv7T8EKXCAaQmQ3f9/E3EFFkmw5lY25XW9aEBVLlB86RwvdN6xxCKJ20XEea3tFQw
	cZmoqnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5R0-00000006tRu-2kQJ;
	Mon, 17 Aug 2026 22:03:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Qz-00000006tRl-1GR6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 22:03:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C729C404A7;
	Mon, 17 Aug 2026 22:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE0B1F000E9;
	Mon, 17 Aug 2026 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787004236;
	bh=8QbmljoA7cUSu8InNHkDYKT1TQBGRW4y/Zfa/6fYwBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJveCKqguAtkA0rT2DSLIORNmt1ukydaTlK4aVIJATv2SrQr6Sa/IAjGWlnUSHsYL
	 m+btWOz7UgN7o2OoCNxuh2OCCY+RnwRB5Gvc7fNyGWd+59+NYdOliNpNgKqYlhCIYF
	 NTOOgae98pqE1nK4ei2X5Iv9mMymvxojHHEyi3ceFXkwgfY/9wg3aallrSn4WFGO+F
	 qFHUlYHYMM4o7atUm2bSUc8F4yaM35TyJuxP7SXLc8TdIJnPPiXq4cC071vCqe+yb+
	 q/9hRkTGXDsF9UDAo24bUS+ZKgSVrusX+oynUMOjhqQrbzWOC7jaJoiNU1elyEAFhx
	 41cwUkKPkGRTA==
Date: Mon, 17 Aug 2026 17:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: KobaK <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: Re: [RFC PATCH 2/3] Documentation/arch/arm64: document arm_cpumod
Message-ID: <20260817220354.GA2274565-robh@kernel.org>
References: <20260817022335.3-1-kobak@nvidia.com>
 <20260817022335.3-3-kobak@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817022335.3-3-kobak@nvidia.com>
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

On Mon, Aug 17, 2026 at 10:23:34AM +0800, KobaK wrote:
> From: Koba Ko <kobak@nvidia.com>
> 
> Document the ABI intent and scope for the new arm64 cpumod interface.
> The sysfs directory is per-CPU and is created only for recognized Grace
> and Vera profiles:
> 
>   /sys/devices/system/cpu/cpuN/cpumod/
> 
> CPUs with unsupported MIDRs are skipped without blocking module load or
> CPU hotplug and do not receive a cpumod directory.
> 
> Describe the common attributes, the Grace- and Vera-specific attributes,
> and the accepted range for each writable field. Out-of-range writes are
> documented as failing before either cached sysfs state or target CPU
> register state is changed.
> 
> Document the CPU hotplug lifecycle explicitly: the cpumod directory is
> present only while a supported CPU is online, is removed when that CPU
> goes offline, and is recreated when it returns online. Reads and writes
> therefore require an online target CPU.
> 
> Also document the firmware prerequisite: EL1 must be allowed to access
> the relevant implementation control registers. The interface remains an
> RFC for controlled performance characterization, is not a general
> production tuning ABI, and should stay disabled by default on production
> systems.
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Tushar Dave <tdave@nvidia.com>
> Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
> Signed-off-by: Koba Ko <kobak@nvidia.com>
> ---
>  Documentation/arch/arm64/arm-cpumod.rst | 89 +++++++++++++++++++++++++
>  Documentation/arch/arm64/index.rst      |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 Documentation/arch/arm64/arm-cpumod.rst
> 
> diff --git a/Documentation/arch/arm64/arm-cpumod.rst b/Documentation/arch/arm64/arm-cpumod.rst
> new file mode 100644
> index 0000000000000..7dbe2cd5404a2
> --- /dev/null
> +++ b/Documentation/arch/arm64/arm-cpumod.rst
> @@ -0,0 +1,89 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================================
> +Arm CPU prefetch modulation controls
> +====================================
> +
> +``ARM64_CPUMOD`` exposes selected CPU implementation control register fields
> +through per-CPU sysfs attributes under::
> +
> +  /sys/devices/system/cpu/cpuN/cpumod/
> +
> +The ``cpumod`` directory is created only when the CPU MIDR matches a recognized
> +Grace or Vera profile. CPUs with unsupported MIDRs are skipped without blocking
> +module load or CPU hotplug and do not have a ``cpumod`` directory.
> +
> +The interface is intended for controlled performance characterization and
> +evaluation. It is not intended as a general production tuning ABI, and the
> +configuration should remain disabled by default on production systems.
> +
> +Configuration and placement
> +===========================
> +
> +The controls are built when ``CONFIG_ARM64_CPUMOD`` is enabled. The code lives
> +under ``arch/arm64/kernel/`` because the exposed state is CPU implementation
> +control state accessed by the arm64 kernel, similar in placement to other
> +architecture CPU-facing helpers.
> +
> +The ABI remains separate from the existing arm64 ``cpu*/regs`` sysfs files:
> +``cpumod`` exposes a small set of named, range-checked control fields rather
> +than a general raw register dump.
> +
> +CPU hotplug
> +===========
> +
> +A ``cpumod`` directory is created only for online CPUs with a supported
> +profile. The directory is removed when a CPU goes offline and recreated when
> +the CPU comes back online, again only when its MIDR matches a supported
> +profile. Reads and writes require the target CPU to be online.
> +
> +Firmware requirement
> +====================
> +
> +The controls require firmware to permit EL1 reads and writes to the relevant
> +CPU implementation control registers. On systems where firmware traps or
> +blocks those accesses, the interface cannot be used.

How does the kernel discover if the interface can be enabled? Write a 
register and if we're still alive we can enable it?

> +
> +Current ABI

Is the future ABI going to be different? ;)

> +===========
> +
> +Common attributes:
> +
> +``affected_cpus``
> +  Read-only decimal CPU identifier for the sysfs instance.
> +
> +``pf_dis``
> +  Hardware prefetch disable control. Valid values are ``0`` and ``1``.
> +
> +``pf_mode``
> +  Hardware prefetch aggressiveness mode. Valid values are ``0`` through ``9``.
> +  Values ``10`` through ``15`` are reserved and rejected.
> +
> +Grace-only attributes:
> +
> +``cbusy_filter_threshold``
> +  Valid values are ``0`` through ``3``.
> +
> +``cbusy_filter_window``
> +  Valid values are ``0`` through ``3``.
> +
> +``cmc_min_ways``
> +  Valid values are ``0`` through ``7``.
> +
> +Vera-only attributes:
> +
> +``l2spr_cmc_max_ways``
> +  Valid values are ``0`` through ``7``.

There is already a standard way to document sysfs entries. Use that.

Rob

