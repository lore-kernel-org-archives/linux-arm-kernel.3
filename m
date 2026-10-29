Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 04:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kR3G8lLy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=OKYVWu5I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WY5wnUr0YMRLXTa+IeVdTK62D3adKCL9XnatFjihAzk=; b=kR3G8lLyko+CrKL8cUtaBI4Oq3
	aG836QWIqP0pet9/unL4PyLh+3yC0SnbXuYNA2tFvJUG70ljNxUIBbhWA/v1MZmFkhnLg48RWFYEP
	mS/Kz3f8SAI51FDO6R7dD9j05M7pIImmYJ7pxXww2XGQFEaQEpqI8QFZ4jJCAEMIT+4+AHW+IFAyn
	iZ653HWAEjq3tmC4c9Cn/Cse7OR1LKkQ2cfhDCf6xi8NeVk2aQtEhwlyC0L+GSezfh0kJ1Vdcf5xP
	V+W004QPLAaKnfbOZ8f/U1aaoWFKIQSA9g41xhF6CfKKoGxb7C1A4SrJXxsuKzd+iq/azfx1xeGlX
	zm6bgkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHfx-00000008JxB-1Pfy;
	Thu, 29 Oct 2026 04:23:41 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHfu-00000008Jwc-2RDQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 04:23:39 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id MBghx7jePMylkMHfhxRniN; Thu, 29 Oct 2026 04:23:26 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MHfgxy2Ku8LLeMHfgx5OXt; Thu, 29 Oct 2026 04:23:24 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae2ca3c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=MDvQDARPIxcOL7T4D4kA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=7h6zrudLq975CqBWz9ej:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WY5wnUr0YMRLXTa+IeVdTK62D3adKCL9XnatFjihAzk=; b=OKYVWu5IWjJ697XodiKp8mPZMo
	40q5C15s3gWM5WgNuKMhIM/I/DdoMBnOZEVTC4mZJ3rkZlUi7YFnmmP8ZdHLwRMtdnYHiKr0axDhw
	sUjuhm3tLAxeIUsdw+3B3FOF+jOOQVcgrqx3+4NWXrsA3nEJJD1b9o/AtIzVSlz5kAbonopoGfsbz
	UL54DZdn4m6hRNDgMWbBfA3yWRIoYCm12+9AKRzH7Y+fTxiEuV92MZHtvHRxSaqcpzx+T448ao3Y6
	TL+lmTOJOACd4tLbeMYHz7xc//MaZ2ZJxWVm2+VNJbpRo8YnOb1T48ZuDrcXD9c0mnrEE1sOlrg/m
	RJzWpe4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53758 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMHff-00000003SdK-3t8p;
	Thu, 29 Oct 2026 09:53:24 +0530
Date: Wed, 28 Oct 2026 21:23:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO
 controller
Message-ID: <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
 <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMHff-00000003SdK-3t8p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53758
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJyT2sU14YpBbZL4uof38PS0p5UisQGO586d515epT0J2mhJLTxLOOA6FougNyEklesw3H2IDWi0B3RG4fYEk/ybJjnA66JDmhy1Zwl/x4cS0Sq4ZGvG
 +nJl4D6C7WpHizRUGt2uHMDsJ3UgvFsiPhbc/AFY9eMk72i5DzwnAIjP5MAVVOtJh9AADYkXWvrIQykKUfkZ9KFQQmgWKZ/K1BLIGqZxUvpK44WZzmLNjxqr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_212338_728310_EBFC7487 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, Jul 06, 2026 at 08:14:00PM -0700, Dmitry Torokhov wrote:
> Define and register a static software node (sa1100_gpiochip_node) for the
> SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
> directly to the GPIO chip prior to calling gpiochip_add_data().
> 
> This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
> controller in property entries when converting legacy platform data to
> software nodes, resolving pin bindings directly via the attached firmware
> node without relying on name matching.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

With this patch in the tree, the qemu "collie" emulation no longer works.
There is no console output.

Bisect log is attached for reference.

I am not suggesting a revert if that is even possible, but maybe it is time
to retire collie support if no one else reported this problem.

Guenter

---
# bad: [c03c1a14507dfaf8b856c2608f9ac216021fc222] Linux 7.3
# good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
git bisect start 'v7.3' 'v7.2'
# bad: [4e69c1856bfd9ffb7e9d335a25842fa211628929] Merge tag 'drm-next-2026-08-20' of https://gitlab.freedesktop.org/drm/kernel
git bisect bad 4e69c1856bfd9ffb7e9d335a25842fa211628929
# bad: [5a8cd539ac19f7a68e68e1d25ef9ca2ff55b8500] Merge tag 'bpf-next-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
git bisect bad 5a8cd539ac19f7a68e68e1d25ef9ca2ff55b8500
# bad: [abea5c349368a683e40fdc2e745099aaaacc89d7] Merge tag 'i2c-7.3-part1' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux
git bisect bad abea5c349368a683e40fdc2e745099aaaacc89d7
# good: [bbd0571269b5a17bb0685fc30ea0b89b950801f5] Merge tag 'x86_cleanups_for_v7.3_rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good bbd0571269b5a17bb0685fc30ea0b89b950801f5
# good: [658ed6d54e9775a627662f152c8e21509eea68c7] Merge tag 'dt64-cleanup-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into soc/dt
git bisect good 658ed6d54e9775a627662f152c8e21509eea68c7
# good: [368cf60c36a3a311474de08e52dc6314df3b06ce] Merge tag 'soc-drivers-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 368cf60c36a3a311474de08e52dc6314df3b06ce
# bad: [1be05c6afbb2c4052d0a13fc91ddcd89aaee9614] Merge tag 'input-for-v7.3-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
git bisect bad 1be05c6afbb2c4052d0a13fc91ddcd89aaee9614
# bad: [c36a4991e231242c04141536718d47255ec80887] Merge tag 'chrome-platform-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux
git bisect bad c36a4991e231242c04141536718d47255ec80887
# bad: [7c8af4b5b627d8bbf88c6783db49c52dd6b43f5a] Merge tag 'imx-soc-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/arm
git bisect bad 7c8af4b5b627d8bbf88c6783db49c52dd6b43f5a
# good: [809177dbf32e3c649abcd027334dbcfe34720446] Merge tag 'arm-feature-deprecation-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into soc/arm
git bisect good 809177dbf32e3c649abcd027334dbcfe34720446
# bad: [ab1c3ab445b44d6b412bc4f7fad3db4f3857a80e] ARM: sa1100: h3xxx: convert gpio-keys to use software nodes
git bisect bad ab1c3ab445b44d6b412bc4f7fad3db4f3857a80e
# good: [9212f660d34c385f2ba8ad5fb7b94c1d45c166cb] Merge tag 'ixp4xx-arm-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator into soc/arm
git bisect good 9212f660d34c385f2ba8ad5fb7b94c1d45c166cb
# bad: [ea07a154791e7e95525f843beaa72402a4fcf88a] ARM: sa1100: assabet: convert gpio-keys to use software nodes
git bisect bad ea07a154791e7e95525f843beaa72402a4fcf88a
# bad: [e4671f292ebb363fdea08ae3b0cd18ba7a2b486f] gpio: sa1100: register software node for GPIO controller
git bisect bad e4671f292ebb363fdea08ae3b0cd18ba7a2b486f
# first bad commit: [e4671f292ebb363fdea08ae3b0cd18ba7a2b486f] gpio: sa1100: register software node for GPIO controller

