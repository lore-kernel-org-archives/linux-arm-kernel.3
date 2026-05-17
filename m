Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FE4CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n49OuauPjfn69Lddbs7E+HZePaPK2zx0j0Xu2IIudk=; b=ZHrERtr1g84/PCb2QXok5Pp2zF
	ixOUNdgEbIMhdnV0ZlinRCavZM6SxhETl8X4F7KCpvROBIoAq6sD7al+8Ds1HFsYNMye2i7JXGW1M
	EYU4E38qflq+Nd8utvq6N+hKtjoDwl6U4cpvOaMHLU5pWfcDRuh17UxnF2+jqzB68oXpGsuZmWh8C
	fTqPTH//hV8kwLd5iAdRCWM9kw58k96CvJpV2DfJN3cIkxOLdenqxQl7iDpIxCBAgn5ZLF6V/jk30
	vuybj9mlCQvrDD5J8QqdvULs27bBg/8ptq9EO4DetYySTKrpaAaSkNn29GuNFeT0NJ1HZM0Xpq2tM
	0PaBhdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOa4o-0000000CeWd-3YNa;
	Sun, 17 May 2026 11:54:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOa4m-0000000CeVu-1fOE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B938D43CF3;
	Sun, 17 May 2026 11:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556B5C2BCB0;
	Sun, 17 May 2026 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779018869;
	bh=P8AgS1njGxxr/Ox8tq35zw6ddy631qvcarL4nhR23wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1joLOQi00MKR4caEv929tNlCHGVw+g7Q9s8M1AuWlTw4wWM/kni3FIGeufk6nHVZ
	 75I7F3xdVJlN5lQtD71e7Bkw+qZmbHKJBUfIxSfy87jmReTcod5TkRKjk/86hNJbVL
	 gQ/8i+IM7L4BQG0ICaLqatixQnREIkFUawA+dF38bADp7OPdX7VzDE14s6USfGjY2J
	 KmY+1kxAKdHqP5fx7H/tRjObhfwmbEeDHSF9dXceKBV2enCBsLKeoDelZKHTC2EMv3
	 G/KcL0PvTb/f7MrHhqgyJfg/5gRElwQcMmSIsNQFCWNPsBnLKWy6o76UmqK6mawz3N
	 NuTlWrJcL8X+Q==
Date: Sun, 17 May 2026 12:54:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 0/4] firmware: arm_ffa: Move core init to platform driver
 probe
Message-ID: <20260517-rare-horse-of-radiance-17eea2@sudeepholla>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <177901775932.3835515.4484747964630642694.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177901775932.3835515.4484747964630642694.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_045432_455021_95733F98 
X-CRM114-Status: GOOD (  12.17  )
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

On Sun, May 17, 2026 at 12:36:45PM +0100, Sudeep Holla wrote:
> On Fri, 08 May 2026 18:54:14 +0100, Sudeep Holla wrote:
> > This series moves the Arm FF-A core initialisation into the driver model by
> > converting the core bring-up path to a platform driver probe/remove flow.
> > 
> > The first patch reverts the earlier rootfs_initcall change. That initcall
> > ordering workaround is not a proper solution and potentially conflicts with
> > pKVM FF-A proxy requirement.
> > 
> > [...]
> 
> Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!
> 
> [1/4] Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"
>       https://git.kernel.org/sudeep.holla/c/1b4c1c4d75a8
> [2/4] firmware: arm_ffa: Register core as a platform driver
>       https://git.kernel.org/sudeep.holla/c/d10175dd517a
> [3/4] firmware: arm_ffa: Set the core device as FF-A device parent
>       https://git.kernel.org/sudeep.holla/c/8bdff2dda405
> [4/4] firmware: arm_ffa: Defer probe until pKVM is initialized
>       https://git.kernel.org/sudeep.holla/c/216d4772b411

These are incorrect and fixed in later email, this was accidental send.
Please ignore.

-- 
Regards,
Sudeep

