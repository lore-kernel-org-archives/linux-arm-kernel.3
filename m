Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E22C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSR8BTfCX9kMB6qOH0+UvwaxFfvP+jyFvyHmy/gj9gE=; b=su0QcUiUghXudVnLJi6RYgp+tE
	V3Ei5WPpzbYFTqwtkGpcPXwes2tsTsqt2y/AlWfsX0zx4A+oWjeGa1BgoSocadd6yDDqnOxEfhHQP
	IH89coE5auO5QCFXAm4COIEOU1vGq62M/0xHkOtTCaYSLjD2v6XO7GN8hwH9RVX8iHgB9P4QzpSd0
	Kpwl7LDuC0pcikR//H536s8KpF8VuIjPTpxOIOZxlgZhBG4/lGtAXC7yqvH9e+rj8kbuFsj5Egp2w
	tknTozzfQpo/DpMq/ZMQg/Xj0YNXFmpMAbjek5IS+xWLwZyScBrjboiqFtjOCpj1QWmGCbF4uyioe
	3cG9NP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trprE-00000004The-3Q0M;
	Tue, 11 Mar 2025 03:00:40 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trppZ-00000004TWW-1jDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GSR8BTfCX9kMB6qOH0+UvwaxFfvP+jyFvyHmy/gj9gE=;
	b=mZnOCRZQXcVe3qU42I6laEGda6LowRCDbbqby/VYSPkoIP7nfG6xvzU/5Jqa6z
	pRCqMJYTRfo35c3f5zV+o/9Rtii1wOF3p/1FvJciRnfLqV26vVOhM21mslRJvhB4
	Yt4vHL4RM0M1NetSflvuDl68Ia94puFgxeiaoP6+yAvgc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnGk7Fps9n5JGvAA--.954S3;
	Tue, 11 Mar 2025 10:58:14 +0800 (CST)
Date: Tue, 11 Mar 2025 10:58:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, soc@linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx: mark imx53_suspend_sz as unused
Message-ID: <Z8+mxDdvtak/3SRs@dragon>
References: <20250225201157.4190864-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225201157.4190864-1-arnd@kernel.org>
X-CM-TRANSID: M88vCgBnGk7Fps9n5JGvAA--.954S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyDGF4DWw1DAr18Zr4fKrg_yoWxtwcE9a
	yrtw1xAr1fJr9Igw17Jan0yr40g3yDurn8Z34rJ3WakFyj9FZrZ3y8t34kX39agr42k3Wx
	GF9Iqw1fCrZ5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU00PfJUUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBUNZWfPoGYkbQAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_195857_752728_40125707 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, Feb 25, 2025 at 09:11:52PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unused 'static const' variables cause a warning when building with
> W=1, and imx53_suspend_sz has a definition for this as an
> alternative when CONFIG_SUSPEND is disabled:
> 
>     In file included from arch/arm/mach-imx/cpu.c:9:
>     arch/arm/mach-imx/common.h:101:18: error: 'imx53_suspend_sz' defined but not used [-Werror=unused-const-variable=]
> 
> It's still referenced though, so mark it as __maybe_unused, so
> the one user can address the dummy copy and other files that include
> the header don't produce a warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!


