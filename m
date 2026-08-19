Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528C6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEhJftvJQJCTjrtFDW5w8o2vq636XhPrQnmBVoSdDG8=; b=G+LGqWWg1i3hA9rcLHjAwaXS6q
	ZMyngmu7FswaQd5fr7HfPsz7NXGvLFnV5CVlYRh++f21wPwnfmIraueKJ21zIvdltXHxMdTGysQxp
	xYJ3Sry1cJEM6nS5hrNZ6A5amcY2V2pOZx7yWBwJw55YOysG62fAWPCroXYCWW5W6UiidI0p/zKAv
	TKb7kgAQgHjmPifV3cwL9hBLqUKIASHaCaqUPgzBf2/zUYO14d4i2XW7mEkE1mmU83RbyZCdkzEmF
	y3rDkW5zh3DcQMkdKMeMhDhOhjBfPasNfdhxKP+XABvBr7+TfulgN6Ahts6s0H9402Fd3J/B7D03s
	2H1mPMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhjd-0000000A1wd-0HKm;
	Wed, 19 Aug 2026 14:57:45 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhjb-0000000A1wI-0lNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dEhJftvJQJCTjrtFDW5w8o2vq636XhPrQnmBVoSdDG8=; b=WwpFPVtoi3/FrP852Z+KBYbFfS
	9/xiP6ovuQfbLqkz+VfujWELcMItOyYmXjn9x9njjNS1Rb3aeAgkjiRYOHJMC1KUehzDAuKoLUNWd
	NXIeaRpVcv2vJzhI/jvRgfSAUMHgP6F5vALMRoZ50lILH7aqh0D0lf5Olw6gSECtB2SVfOHsBEyws
	1b5ET+c7xgUf3NohcAiBPTqpZ6RpLwv2QnWXe34W/3f0GFo59KbLAHTyZn02/MvR3VBS09yltU2bn
	9Um7gT9SDDuk+SxTWspbvudVbENVgEJXrqV2xEjl8K6dYc8iB891cWhPGlwkd24x9WBYJWj/KYhDN
	zGvu5EDQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwhjU-009s14-2W;
	Wed, 19 Aug 2026 14:57:37 +0000
Date: Wed, 19 Aug 2026 07:57:31 -0700
From: Breno Leitao <leitao@debian.org>
To: KobaK <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <aoXEBXXvTDBimnHi@gmail.com>
References: <20260817022335.3-1-kobak@nvidia.com>
 <20260817022335.3-2-kobak@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817022335.3-2-kobak@nvidia.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_075743_226162_40B048C3 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, Aug 17, 2026 at 10:23:33AM +0800, KobaK wrote:
> From: Koba Ko <kobak@nvidia.com>
> 
> Performance characterization on arm64 systems sometimes needs a way to
> inspect and bracket selected implementation-defined prefetch and cache
> controls without exposing raw register contents. Add an RFC-only arm64
> cpumod interface that presents a small set of named, range-checked
> per-CPU sysfs attributes under each CPU device.
> 
> Establish the Kconfig and Makefile plumbing, CPU profile detection for
> Grace and Vera from the target CPU's MIDR, register-field descriptors,
> per-CPU kobject and attribute helpers, locking, and target-CPU read/write
> callbacks. Common attributes are exposed for all supported profiles,
> while Grace- and Vera-specific fields are exposed only for the matching
> profile. Place the option at the end of the top-level Kernel Features
> menu because these implementation controls are not tied to an Arm
> architecture revision.
> 
> Per-CPU cpumod sysfs state follows the CPU lifecycle. Module
> initialization populates subtrees for every online CPU while holding
> cpus_read_lock(), so initial enumeration and CPU hotplug state
> registration are serialized against concurrent topology changes. Offline
> CPUs are intentionally skipped during initial setup because target-CPU
> MIDR detection requires an IPI-capable online CPU; a later online callback
> creates their subtree.
> 
> Profile detection reads MIDR through a synchronous callback on the CPU
> owning the sysfs subtree and returns nonzero only when that dispatch
> fails, so no IPI error can be hidden. After a successful read, retain
> CPUMOD_PROFILE_UNKNOWN as the unsupported-profile sentinel. Subtree
> creation skips that profile during both initial online enumeration and
> later CPUHP online callbacks without blocking module load or CPU hotplug.
> Object and sysfs setup failures remain fatal and are propagated.
> 
> Keep the dynamically allocated kobject state in a private per-CPU pointer
> instead of the CPU device's generic driver-data slot. The online callback
> is idempotent when that pointer already records a subtree. The offline
> callback clears the private pointer before dropping the kobject reference,
> allowing the release callback to retain ownership of the final free.
> 
> Register the dynamic CPUHP state with
> cpuhp_setup_state_nocalls_cpuslocked(). The nocalls form avoids replaying
> startup callbacks for CPUs already initialized by the explicit online
> enumeration. On init failure, release the CPU read lock, destroy all
> subtrees created so far, and return the error. Module exit removes the
> CPUHP state with the matching nocalls helper and tears down all remaining
> per-CPU state across possible CPUs.
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Tushar Dave <tdave@nvidia.com>
> Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
> Signed-off-by: Koba Ko <kobak@nvidia.com>

Tested-by: Breno Leitao <leitao@debian.org>


> +static struct cpumod_attr _name##_attr = {				\
> +	.kattr = __ATTR(_name, 0644, cpumod_attr_show, cpumod_attr_store), \
> +	.value_offset = offsetof(struct cpumod_subsys, _field),	\
> +	.reg = _reg,						\
> +	.shift = _shift,					\
> +	.field_mask = _field_mask,				\
> +	.max_value = _max_value,				\
> +	.debug_name = _debug_name,				\
> +	.visible_profiles = _visible_profiles,			\
> +}

0644 makes every one of these world-readable, and cpumod_attr_show()
is not a cheap read: it takes subsys->lock and then does a synchronous
smp_call_function_single() to the target CPU, whose callback executes
an implementation-defined mrs.

So any unprivileged user can pick a CPU and hold it under a steady
stream of IPIs just by reading the file in a loop. On a Grace box
running this series:

  # su -s /bin/sh nobody -c 'cat /sys/devices/system/cpu/cpu0/cpumod/pf_dis'
  0

