Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA16C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bAvcc3Ftus2hZoxR3vN3x/TCpUZp4ds8W7Oy4K3Dq0=; b=skAB8bWQYsuIqLu9asPJ9hID8N
	/EDBxaL6povG33Ovc0bYxwaAmZJWol6i1WbwHdMqfAB+W76qZE/DK1UZt6BTQXOHiNgU3xbx6c070
	H8PxXM0xkvK+q/OEL2BA9sPt5CR/iCSyj3sagHbV9GRUs5QiIaHGOX6vik7TPl+k28sDIIQr8LUXZ
	znRFIsPdEwpn7Xgqz3/s+E0hvmvxadUJc2TnhO4f7C+b3XI/zgX2HPWLHgKL8yHSixypPtWsNgqpr
	01G+ef9LXe9M/9LhEFaM02NlswL58hL1fNQBPLZFzUzRzc0tMgig6/FYaA9GIpLZf3RW7ZxbyTH8Y
	lROKvftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitki-000000073Pm-1aDW;
	Thu, 22 Jan 2026 12:25:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitkf-000000073P3-38Kj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 627E1409BA;
	Thu, 22 Jan 2026 12:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4A6C116D0;
	Thu, 22 Jan 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769084729;
	bh=PCkOwqNi3U6oGSdDkbyRnZsslygP62vGIxEK1b/bxQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQZMG8wWZN9e21tL896qXExBf7Ly8WOAxcQfgRRBjdV6c6MB5ESaYKNZ/2KMxoiW7
	 CEkJA4YasricHEv39yRk1rCaoeHwXaCkH35QI/T3ltW+D9wVl3xlwzE5d2B2FAf2nF
	 U/xDGrHK+cYsRSMDLkevmErJFF+lHFAkuod9FY9uiJuTIY9JvZvRt2xpaVuiuLqv0d
	 fn+Fi6hBDHOYEjM4dtBg2HVZ0vBtXoM0xnBxS5iRROpt27H8Ku0N9ctgRWOb7IO9E3
	 HbcLDNorXm4IDySDEM+U2zT9kvZA6VIxyXw9RC9k89aF1vH8KN73OCb9H3UYb8lwuQ
	 1DKiIMglmMPXQ==
Date: Thu, 22 Jan 2026 12:25:24 +0000
From: Will Deacon <will@kernel.org>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com,
	jeson.gao@unisoc.com, xuewen.yan@unisoc.com
Subject: Re: [PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
Message-ID: <aXIXNC_zJu0rOG4L@willie-the-truck>
References: <20260122114925.624309-1-zhaoyang.huang@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122114925.624309-1-zhaoyang.huang@unisoc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_042529_805482_1CBC9D1B 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, Jan 22, 2026 at 07:49:25PM +0800, zhaoyang.huang wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> A DABT is reported[1] on an android based system when resume from hiberate,
> which is root caused as CFI will plant stub code[2] to verify the
> swsusp_arch_suspend_exit's authentication, where the hash value is stored
> before the page that alloced by create_safe_exec_page. We also have
> tried to copy the hash value together with the function but get failed since
> the value is not on the desired position(src_start - 4). So we solve
> this issue by setting __nocfi on swsusp_arch_resume and it works.

Acked-by: Will Deacon <will@kernel.org>

Will

