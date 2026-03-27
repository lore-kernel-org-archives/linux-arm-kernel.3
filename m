Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CBD10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpIdc/FIY6K7UXGxw1OKFlVBFSShSgTEHcmuBHIFYWo=; b=QtNNjTzkAFTd92Q8+FOMc9HyB5
	12EsZAHbOEP5f8HrmJ3vWnynuxFSy7UpeRX+PUpVAyFn0D1M8wMPVhCxSV++eCL+dnrqRJvnIFZF5
	GP0LpP+rpQFWo8f4KVMCJ11p9bXwcR3SHXwmsFpLCcZhVLRrO/AZmqL/hJcnVN6Vho3GYk8bz/eK6
	uRwZ0hEN+wtHuxAFQOw2I6mjrHWwGzrPyAVLg/Xyy4Enjpgi+6I4O5sKwfogONTyjiNJeMTJ6Nr7H
	dycPp8boDJ8LkIuHIIKQRLKiKS17l8r5zzFavZMbncQwiCUgHppwiCT4B1w7xAsUCSteSVuM3C9XR
	5Iq/rLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ckw-000000085mf-06U1;
	Fri, 27 Mar 2026 19:22:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ckt-000000085mA-1frp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:22:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAE993D4F;
	Fri, 27 Mar 2026 12:21:55 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D66C3F99C;
	Fri, 27 Mar 2026 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774639321; bh=UhHIiHkeoVIvecNWT/vmtedUFGAdoBTec9LU2lfLxcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSnlTV+l02riQc7GahKRFF6tlfxPO76vNWLQM5w0qs4fOIS5u/POTMvyOicvUCtAv
	 BsMYPzLyvqdvr/x1+k5mEgBeWGSRhXkTGVYrNiqdnKEduj3IEHxgd8wyu7vq3eIfFy
	 8d6o4fkYI0owsku7gDbLq00HCbhkFksw2Dnx73BM=
Date: Fri, 27 Mar 2026 19:21:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, maz@kernel.org, oupton@kernel.org,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, broonie@kernel.org,
	ardb@kernel.org, suzuki.poulose@arm.com, lpieralisi@kernel.org,
	joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: (subset) [PATCH v17 0/8] support FEAT_LSUI
Message-ID: <177463928205.2670874.13517032507439052873.b4-ty@arm.com>
References: <20260314175133.1084528-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314175133.1084528-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_122203_473623_7D93C08E 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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

On Sat, 14 Mar 2026 17:51:25 +0000, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> 
> This patchset support FEAT_LSUI and applies it mainly in
> futex atomic operation and others.
> 
> [...]

Applied to arm64 (for-next/feat_lsui), thanks!

[6/8] arm64: armv8_deprecated: disable swp emulation when FEAT_LSUI present
      (commit e223258ed8a6)

-- 
Catalin

