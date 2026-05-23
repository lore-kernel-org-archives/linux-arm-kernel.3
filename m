Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E95CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 00:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOdjcdrieoIVhDjSmGmUc8dVnOKSpLVQHovlfDmXAb4=; b=LVXNfDPyqe/D9aIiYH4yYHLM1h
	bR9ZHtFNHGrGGrs3zkDNntwHlvs6URYapVHW44EKRGW2xZXq2a0qMp/KUglLiUhlk5tVUZAjRlTuI
	sZKa3plyis6EmTCTd+hsQ4lzHlxHIUKk4y9g8UhP544LfosikuVWsK+Bx3TEAyH8+1bOIPbX6ReWP
	FZ2OdnPe7NoonBpUvw0IR0PfKJuwIhtV8Nvm9tNKQKIZEhYvwPKJa1WRsk0iQhLPW7jFCW2wfesFA
	Oj1cxm6dHKU8slrlQpXT8NYCbw3G6ydj1nUpaOrcgeoy8za2BGizGYxOTrfmwiJeuyg1rJbkQKWhB
	pAaXu+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZy8-0000000CHuE-1k1N;
	Sat, 23 May 2026 00:11:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZy7-0000000CHu0-0fce
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 00:11:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6785860136;
	Sat, 23 May 2026 00:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D45F1F000E9;
	Sat, 23 May 2026 00:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779495113;
	bh=UOdjcdrieoIVhDjSmGmUc8dVnOKSpLVQHovlfDmXAb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QfQZM2qZToodXI72EM2dRbFKuAXhioJ6ijpdSXMpkvZbzz8PQPYBYLax+Z8+Pn9H8
	 B8LN5btyBUxe/KdCJZtqNnyccSPo8SXTGk7JhaiV7unVL9vO4pNsKGH9UQJYZm9MZv
	 GNbJiWozXu3o+djzKrAa0nuO6ROYrHeGyn49ZxyYZhW9j67RCwr0HjD14c9TblisKT
	 v++jtLxD4fuxf3NPQjUleVqlXUklC2odqo+kEi7mVQ0GtS7CtSO3vXXSkuYL0w6YMt
	 7AZPriv2QJ6YfznX+yej7YTtSlB1u2T735aKrmNhnFk5d9YyLTvCM4Kkhf0HAo5h0p
	 k0b2g5+g+t/Tw==
Date: Fri, 22 May 2026 17:11:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 2/4] firmware: arm_ffa: Register core as a platform driver
Message-ID: <20260523001148.GA1319283@ax162>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
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

Hi Sudeep,

On Fri, May 08, 2026 at 06:54:16PM +0100, Sudeep Holla wrote:
> Move the FF-A core bring-up and teardown paths into platform driver
> probe and remove callbacks, and register a synthetic arm-ffa platform
> device to bind the driver.
> 
> This makes the FF-A core lifetime follow the driver model while keeping
> the device creation internal to the FF-A core. Use normal platform driver
> registration so the probe path has standard driver-core semantics.
> 
> The synthetic platform device is a temporary bridge until ACPI and
> devicetree describe the FF-A core device or object. Once those firmware
> description paths are defined, the internal platform device creation can
> be dropped and the driver can bind to the firmware-described device
> directly.
> 
> Since the transport selection now happens from the platform probe path,
> drop the __init annotation from ffa_transport_init().
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

I am seeing

  arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95

on my two arm64 test machines after this change landed in -next as
commit e659fc8e537c ("firmware: arm_ffa: Register core as a platform
driver"), is this expected? If so, perhaps it should be silenced?

Cheers,
Nathan

# bad: [c1ecb239fa3456529a32255359fc78b69eb9d847] Add linux-next specific files for 20260522
# good: [6779b50faa562e6cca1aa6a4649a4d764c6c7e28] Merge tag 'pci-v7.1-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
git bisect start 'c1ecb239fa3456529a32255359fc78b69eb9d847' '6779b50faa562e6cca1aa6a4649a4d764c6c7e28'
# bad: [c09bb0d7c56d56daed51e374409472c3fece9931] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
git bisect bad c09bb0d7c56d56daed51e374409472c3fece9931
# bad: [42b0664d6f7b3d04f961e0709811280e52d4d39c] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
git bisect bad 42b0664d6f7b3d04f961e0709811280e52d4d39c
# good: [63775c4b77cf7ac5863ae0e76f8626b80d217562] Merge branch 'mm-nonmm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 63775c4b77cf7ac5863ae0e76f8626b80d217562
# good: [f437936af5c74fddfdfcd2388a5f1eec2f9a105b] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
git bisect good f437936af5c74fddfdfcd2388a5f1eec2f9a105b
# good: [01bf3f256f1ed15fa3884e4893e5a9d78fdfb2d6] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
git bisect good 01bf3f256f1ed15fa3884e4893e5a9d78fdfb2d6
# bad: [bee649097c8de82d9dccd3660c41163a6507e3d4] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git
git bisect bad bee649097c8de82d9dccd3660c41163a6507e3d4
# bad: [82ccfdd8dd1e29229a3ed7c95a76578706fc4a1d] Merge branch 'for-next' of https://github.com/sophgo/linux.git
git bisect bad 82ccfdd8dd1e29229a3ed7c95a76578706fc4a1d
# good: [32bc5496b48174dbca1f187f710955ee4d9527a1] firmware: arm_scmi: Validate SENSOR_UPDATE payload size
git bisect good 32bc5496b48174dbca1f187f710955ee4d9527a1
# bad: [64251369d33884b431a52b89c60fabf466f3913c] Merge branches 'for-next/scmi/updates' and 'for-next/ffa/updates' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next
git bisect bad 64251369d33884b431a52b89c60fabf466f3913c
# bad: [70492cfce2a4d41e87bf46989028a90f4bc6b38f] firmware: smccc: Fix Arm SMCCC SOC_ID name call
git bisect bad 70492cfce2a4d41e87bf46989028a90f4bc6b38f
# bad: [7fe2ec9fb8e9a78dad8d6b1e551cb4d126e36f1e] firmware: arm_ffa: Set the core device as FF-A device parent
git bisect bad 7fe2ec9fb8e9a78dad8d6b1e551cb4d126e36f1e
# bad: [e659fc8e537c7a21d5d693d6f30d8852f2fa8d91] firmware: arm_ffa: Register core as a platform driver
git bisect bad e659fc8e537c7a21d5d693d6f30d8852f2fa8d91
# good: [cc7e8f21b9f0c229d68cf19a837cba82b5ac2d87] Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"
git bisect good cc7e8f21b9f0c229d68cf19a837cba82b5ac2d87
# first bad commit: [e659fc8e537c7a21d5d693d6f30d8852f2fa8d91] firmware: arm_ffa: Register core as a platform driver

