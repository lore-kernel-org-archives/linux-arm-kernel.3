Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KGlUuLqIAraPNE6+k/JFDEoNyAOBztkK8YvDc47oJc=; b=vTywVrFkuvpB8bKCvyTPV+CVjq
	7v2Ki+kTQQhsj7EyTCrUQYj/3fT4a6/8vdGS+gjzJFGYNrQHFOxCjvBx3X+28qczJAqFL+gYIP57M
	xMB/d4MJehcXZj6ee/h3l7CAoB4W7F2Nypx1UjBF3dXUUijRxtR2PuT54uU4siX9dGON0vAvZuck4
	XDMdrIdC/6dctIvAe0WXCXYQsLcpTwEUXamT1D4WTeMIuHGyxiTlIDXNZ63P0A3jJqHhTgPMyhWxW
	WivD6PsdUyk5NYQooaR2Mvyo/N9ve+3v+EPpHgf+8THdqPuXbhgy2LLeTswc7GDRBgk9TfMLG1Hxo
	/Njrgcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReMp-00000008Td3-3aAH;
	Tue, 17 Jun 2025 22:01:19 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReKb-00000008THq-3SeO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 21:59:03 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bMLNv0dfCz9t7Z;
	Tue, 17 Jun 2025 23:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1750197535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KGlUuLqIAraPNE6+k/JFDEoNyAOBztkK8YvDc47oJc=;
	b=kdtOwvy3IiqxOmFyM3hzk27AsqTdPfT5pNZbvL2ckyEglV4BThClFF6iV4Y5fgZSTlchAS
	/sKSkjQvv3DFTh49vbsdi6To3IpvLRoFInFnF89ewoVOJoWYzfyPbbWLjirdCGHufxOrTh
	sHILb6QyYbk5asM4LBkRccb+8pPcZ15ZXS14uOgek1NQo7IRsT42jBS2ILZlut8cMO3+ZI
	cOfDu9TOEyr6NuT/3SS5mBdJRL+4LvMs2MQxKGLor7HiFNcKEaGUBPj5wNrwKN+Ztq/RWT
	oTfnAV9gjfgQvLYTX24dOR5QNn5WOCJ3Z0/isnyaW9tGbewSmAs0wvx7DxXsug==
Date: Wed, 18 Jun 2025 03:28:51 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Failing to build mainline kernel for arm
Message-ID: <2l4mufrnhf6vka4cp7q5pcqphlk6b3gfd4m5c7yelczhubpwta@mkn2a7olzjh3>
References: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
 <2fb06649-f2e7-4ad1-a831-f8b6b0dbafee@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fb06649-f2e7-4ad1-a831-f8b6b0dbafee@app.fastmail.com>
X-Rspamd-Queue-Id: 4bMLNv0dfCz9t7Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_145902_047378_FB43C0D5 
X-CRM114-Status: GOOD (  16.60  )
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

On 17.06.2025 23:36, Arnd Bergmann wrote:
> On Tue, Jun 17, 2025, at 23:23, Brahmajit Das wrote:
> > Hello developers,
> >
> > I was trying to build the mainline kernel (top commit
> > 4663747812d1a272312d1b95cbd128f0cdb329f2) and came across a build
> > failure with allyesconfig.
> >
> > $ make ARCH=arm CROSS_COMPILE=arm-none-eabi-
> 
> The problem is likely that you use a baremetal toolchain, rather
> than an arm-linux-gnueabi or arm-linux-gnueabihi toolchain.
> 
> There is some logic that tries to decide if uint32_t should
> be 'unsigned int' or 'unsigned long' based on included headers,
> and it seems that your compiler comes to a different conclusion
> here.
> 
> If this is a freestanding compiler, can you try adding
> -fno-freestanding to the cflags?
> 
>      Arnd

That makes sense, its a crossdev[0] environment/compiler that I built.
I'll try adding -fno-freestanding.

[0]: https://wiki.gentoo.org/wiki/Crossdev
-- 
Regards,
listout

