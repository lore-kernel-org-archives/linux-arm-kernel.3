Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5CECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCHDnBt5MyQM6JkHq7wiBOhhVWjImO6fr8BiL0FIo5M=; b=CbXSosi2kwjPkOYsY6o15MJ5+3
	9+CnoOAnMBSnx/trv2gXJCKZaQtnvwGfHhejoEAbq+rGCNhp69urXl7eDU/TWkxYLwQPzjbNkQPu3
	r9sqAeEAvgBBaNjKcmZTJh2EeBhZav1jfw3DOVWcZ7mwyvd0kBwbM9YJZOvRoEwS7Jg0VtQv3Y82o
	/t/YMTApIJjbJZYbUakj/bxS+iosU6sK2Nl5LlaKeZ/+GrHovcAxDeOg2kiNb6ZZl91RVEKJCabkw
	BxyVCL9+toyaUj2WGjBsw8QVFLTevS/456oxhv85kbMxQC5PIjr6FTxZZJ65ue2aGoWKJNhw0jklK
	wNsvLfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy6w-0000000AO7s-1jPt;
	Mon, 03 Nov 2025 17:12:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy6s-0000000AO7R-3JAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bCHD
	nBt5MyQM6JkHq7wiBOhhVWjImO6fr8BiL0FIo5M=; b=JXK6JYmdJXuIRqSYe47D
	9DW8p+ljnxrJJyfXMR82i5XBbJ/fDRsoFscQuo5QNrKS3vmOtug9Mf4g3DB1igZs
	9Wx8kp6pyWYrXmZ0uwCDOg6SL3+XI//Es46EPAMXSD5QnQkBIgIuSPYXOL1/16Tc
	ajPfs1doUO5No/rBgSUu1R+fVx36GntXTZveB9JnBQbN2/MPa3ca3/YV5bTi1EEw
	rr40fGG5ruii4rmfqgPXrm3gRzNKxwZ3RRYyZmGuhvcDOvDJd1VWH1IL4+L6aNLw
	/79EPY6o1EgJ28P7ziYCdkkD8Man8u4hTe65bzCNgap2eAtMKWa1w5zfB8QmJOC2
	KQ==
Received: (qmail 2308921 invoked from network); 3 Nov 2025 18:12:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2025 18:12:44 +0100
X-UD-Smtp-Session: l3s3148p1@Ijzd0rNCfq8ujnuf
Date: Mon, 3 Nov 2025 18:12:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable RESET_GPIO driver
Message-ID: <aQjijJzAhGI2-O1U@shikoro>
References: <CGME20251103140555eucas1p16d2f5ab4ed02527da37afd1bd48553a2@eucas1p1.samsung.com>
 <20251103140515.2350619-1-m.szyprowski@samsung.com>
 <b2172320-2539-4bde-b7f8-cf3e94bb9d7a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2172320-2539-4bde-b7f8-cf3e94bb9d7a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_091251_717370_075DCEF3 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, Nov 03, 2025 at 03:52:33PM +0100, Krzysztof Kozlowski wrote:
> On 03/11/2025 15:05, Marek Szyprowski wrote:
> > Commit 25d4d4604d01 ("reset: always bail out on missing RESET_GPIO
> > driver") reworked GPIO-based reset controller initialization, so now
> > RESET_GPIO driver is required to properly instantiate MMC device for
> > most of WLAN and SDIO chips.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> You should sent all this as one patchset, so we don't need to repeat
> same objections to every email.
> 
> 25d4d4604d01 is wrong and it breaks platforms. defconfig cannot fix that.

We are reverting the offending commits now, so these patches will not be
needed.


