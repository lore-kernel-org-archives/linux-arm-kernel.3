Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9210ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCss18sy6f8aOP99Nk+4QmSSu+zP78Vtv2kjNibzlRU=; b=AsgGpmlRTveGy9KOTh5kFg+NXc
	fjxMTLiJrCjnbSUtEJaAic1+/FkdEvv4N6styYXZpxCVR+5jxoRCm2SO+APjgMkKn1hJJcjkA/JWw
	uIAgAgK2zUr1vmfdLOcqCYrl2kMwEevgeRxDSQ5tPTT/hCg+BJT9N9VeVNdLtyzfXoWVp79U0cRk+
	mCxZZ/BobnCKcJ4xDpQqBMFrBq+3S36U0d4UxCy7XQ9o90NSMhrsRK9faDkZ6etMW9MNBjVxQSlNd
	lI1EcwJXwKnpd1m8MjevHNVtzRMxYmHrl0CMvNL6NSGXr4pBFHlhQ2lYn1ospbWkwIFBw+I5rKHr3
	jNsr1tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67fh-00000007UW8-38Jk;
	Fri, 27 Mar 2026 13:56:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67fe-00000007UUW-311C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:56:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26DCE15A1;
	Fri, 27 Mar 2026 06:56:10 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DDB63F99C;
	Fri, 27 Mar 2026 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774619776; bh=WCss18sy6f8aOP99Nk+4QmSSu+zP78Vtv2kjNibzlRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch1QomEW70t+DRrnli8fMm69HGPNma+E9iROlZi7nQwaoX6dUOQ2JtWnRSIdpGqg7
	 fZSIz7auQeuccyoYEIQo10XRwAP4aihUy6i1bGlld6hD18OxpUTK41orhRrdaSB5fV
	 nr9RhTZJNZx6SnSUjSgZiRXnR7ex2+tuAeEXGGxQ=
Date: Fri, 27 Mar 2026 13:56:11 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: (subset) [PATCH v17 0/8] support FEAT_LSUI
Message-ID: <acaMex3Pq13njdRt@e129823.arm.com>
References: <20260314175133.1084528-1-yeoreum.yun@arm.com>
 <177461632621.2272468.5197255307509898250.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177461632621.2272468.5197255307509898250.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_065618_972319_1D13CE7E 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Catalin,

> On Sat, 14 Mar 2026 17:51:25 +0000, Yeoreum Yun wrote:
> > Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> > previleged level to access to access user memory without clearing
> > PSTATE.PAN bit.
> >
> > This patchset support FEAT_LSUI and applies it mainly in
> > futex atomic operation and others.
> >
> > [...]
>
> Applied to arm64 (for-next/feat_lsui), thanks!

Thanks!

>
> I decided to drop patch [6/8] (arm64: armv8_deprecated: disable swp
> emulation when FEAT_LSUI present). The way FEAT_LSUI support looks now,
> we still have uaccess_enable_privileged() working properly and we could
> even support SWP emulation using exclusives. While it's highly unlikely
> to see both 32-bit EL0 and FEAT_LSUI in practice,

This is one of decisive reason to drop the swp emulation with LSUI
(https://lore.kernel.org/all/aXDbBKhE1SdCW6q4@willie-the-truck/)

However,

> models may support the
> combination and disabling SWP emulation feels pretty artificial.

But I'm not sure this is a sufficient rationale for supporting SWP with LSUI,
since it's highly unlikely to encounter a real CPU that supports both 32-bit EL0
and FEAT_LSUI.

Anyway, it's fair enough to drop 6/8 right now.
But I appreciate whether it would be good to support SWP emulation with
LSUI so that let me respin for it with the former patch.

[...]

--
Sincerely,
Yeoreum Yun

