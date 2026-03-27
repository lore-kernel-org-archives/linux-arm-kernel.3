Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F6310F285F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0YqKG8DvlQv4RLY3sMzq0x/Dmr5fV2Elxa83h4HfXo=; b=rGQxcJG3CW12aqYO1aVvxQ2xXf
	v5Liu8Dc2E8RlXknKi+Ihc1rhPv/su8BaUEkqarSm5e39ZR4Q/qBHOI+DXXV/JxXPmQH1PHbLBzbw
	JH19sGBOC7K06kOtzYyOqUHtKlgC7rfSTLqCY4uUq2X8p5DpaNSvGXvy8Bz+2y30FofFPb+KExEWN
	AV6AzIuT8+xcQbaw2w9xmvdbNZNzWN84A4vkUs/+RNqOXowgbyZrB7FQ3zc5xz2wu9RWCVgf1u7Gw
	3AOL+EjqAekJTuLeTXAvIj9moQpSKddLbHq2kci3Ekz/4xwWrQKWc7mYD03yqSf0Q8ZScWXWXSaMu
	HqizHvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ApX-00000007r3T-1WbE;
	Fri, 27 Mar 2026 17:18:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ApU-00000007r35-09Bl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:18:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83C3635AA;
	Fri, 27 Mar 2026 10:18:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C71D3F99C;
	Fri, 27 Mar 2026 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774631916; bh=aY/JswWMujYof83wSPNLXR7cuzHQPIe4Rii8L3Y7AjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSCH7MHNUqegat7jNlT/WqiQ96q/ACI+/Rvxuacx95VZSPVtfc8cbhrWP3FAW9i61
	 2M951WUPxho9rGQ/ji69E2T44RnbgtSJdquxgk1vk1aGLk6LSEXnIX2vcWpetXf3E4
	 OMoBcyeimLzoBxQIKKcgSxj32zi2wIuhb9WoN8OA=
Date: Fri, 27 Mar 2026 17:18:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: (subset) [PATCH v17 0/8] support FEAT_LSUI
Message-ID: <aca75_16R1nnobb8@arm.com>
References: <20260314175133.1084528-1-yeoreum.yun@arm.com>
 <177461632621.2272468.5197255307509898250.b4-ty@arm.com>
 <acaMex3Pq13njdRt@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acaMex3Pq13njdRt@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_101840_228371_64F3E8D9 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, Mar 27, 2026 at 01:56:11PM +0000, Yeoreum Yun wrote:
> > I decided to drop patch [6/8] (arm64: armv8_deprecated: disable swp
> > emulation when FEAT_LSUI present). The way FEAT_LSUI support looks now,
> > we still have uaccess_enable_privileged() working properly and we could
> > even support SWP emulation using exclusives. While it's highly unlikely
> > to see both 32-bit EL0 and FEAT_LSUI in practice,
> 
> This is one of decisive reason to drop the swp emulation with LSUI
> (https://lore.kernel.org/all/aXDbBKhE1SdCW6q4@willie-the-truck/)

Ah, I forgot about this discussion. It's a valid point, I just thought
it's unnecessary given that __uaccess_disable_hw_pan() still works.

If we want strict no PAN, I can add it back (really small patch). I
wonder whether we should also add a
WARN_ON_ONCE(cpus_have_final_cap(ARM64_HAS_LSUI)) to the pan disabling
function. Not urgent though.

-- 
Catalin

