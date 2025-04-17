Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5336C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UepZ9qHDTZtcPl1OdJB223JS88RarKR1+gtYzuLI6nQ=; b=ymksf+Y/saf3VCafnCbCP/CloK
	72qqJCd/Skb7+sEKUzTZxnYD7n+z0aq3h5on/mjg7e6c9PkIf6R4GZi4rgzt1l7htaWJFZu/T6nuc
	3WOQZwBomm5HVo6/+NgDZMnhbHLTeb2BvVjzv+WArKcdwkGMfP4iNXRbY0wNYdtZouFHsrukftqJ3
	v/ttLqzgmCcW2yk6SZGUAnqhsS+LtPeKlWnh1ZgAzAVS+EJuECA4Ul/mZuODxmw2rLfEZpvSrV7RW
	WGe5M0PHOpjBUJQM0rqC8cEEeJ4q0uCsXXSRkWfh1UulsyDfrxLRFUE22EOOXw/Hn2XGtO4WLj8Cp
	2jnaDFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qxs-0000000DSzJ-1mcz;
	Thu, 17 Apr 2025 15:15:44 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QK8-0000000DKyI-0FLA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:34:41 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1BDC248667;
	Thu, 17 Apr 2025 16:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744900479;
	bh=OIjh00Q5M3izE+JeNh+4wVsx4UdS0lS3tDduRZ4tyUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn/7eJRtsDZpOsqKkvQ0jGZgM4n/w8ehBx/2XEF65xYsooLXW4chP8HTzrwO5HTpv
	 cbyX+8cHOuA87BQ//0Ezc73p6FjItjqBK529cnhzDkYrWl1OFPQmtnqdSlQzCDrrFm
	 jASwu4AYAdnVIgK6YOrML5P+38tC2ukA4Lf4pzvqTL0G8frxU7rbakGD1XUTFO7TOj
	 OwuLVSVm4oAsUxWY3hns4Fp8wXRe47GkUnaMnutTYC9gYxdVIjVUjJIi3G8cFwj+LE
	 9s1HD/TRn3TegIH+d8nrLYvr0rWctKCGkgKbTLPW5a02V5In00GkOlr6Bs2hXes0X5
	 kIQgp/BwW9NmQ==
Date: Thu, 17 Apr 2025 16:34:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] iommu: Split out and tidy up Arm Kconfig
Message-ID: <aAERfYNxHvezN5XC@8bytes.org>
References: <a614ec86ba78c09cd16e348f633f6bb38793391f.1742480488.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a614ec86ba78c09cd16e348f633f6bb38793391f.1742480488.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_073440_337772_D9A95A89 
X-CRM114-Status: UNSURE (   5.90  )
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

On Thu, Mar 20, 2025 at 02:21:28PM +0000, Robin Murphy wrote:
>  drivers/iommu/Kconfig     | 157 +-------------------------------------
>  drivers/iommu/arm/Kconfig | 144 ++++++++++++++++++++++++++++++++++
>  2 files changed, 145 insertions(+), 156 deletions(-)
>  create mode 100644 drivers/iommu/arm/Kconfig

Applied, thanks.

