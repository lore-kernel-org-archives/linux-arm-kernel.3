Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB86AEBFD17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQQBBatstKHBo4lMlwLveMtfJD+9B9TqPNx8RQnqVxQ=; b=uHXeSu7g8qNA60WLLEJ4la+6AF
	sXNNk1rqMviA0spD1NUAQNHmpKIZe47EnhgzfaccOEYqDngE88lQZN4xCumXQR51VDJ/TgcAZHaKW
	nLzvDXLsgX4q1gbZzA+aywwCZMpOBbNJ0UPKZYWP4T7MSQrJevN7qsiktK+xF1j1nf1EDoiYLcNVb
	kMPWBKUR0H65FawTtX9KbviSr04XsFmT1jMxkzeEfIFu2moxmD90LfTni3SAP0yO5ZZru1AVwmKh1
	Z+m4AStyrcbufIBbQEq1bKvHJBxYJX7G6p9fwTsJsUyqeEp6ehMbpcnr1sKiwoOFnyo5PRGUo2+qj
	48vNUd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCie-0000000FHNJ-28wL;
	Mon, 13 Apr 2026 08:32:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCic-0000000FHMy-3MWC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1174944166
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 08:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9A4C116C6;
	Mon, 13 Apr 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776069149;
	bh=BiNIBNFEvjfdjnsBqksdXXFnEweIGfhc8bp7l1pCXGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KX1HDsJZpV39XyXhw5gKqQYq1yi25yiqTzZN2NeZ+1T2jX41HHA+oxDVesshLgrZ5
	 ZTHnYfDxqvKCVXBBBNTG8yKwPHfxRrSabjL61f2AH/fiYsiSZ3YfO5ZOCF1PBAqAok
	 MWYiaryuvA5nj5Sl/y2/AnLgs3mSQV+Dh73OqbYQ+TPdJ3qP8sJ0fQkQLUUnXcRq8m
	 zIhmBd+c92Ea91Syp6zuQeCPYkFCuFgxjen+7B/3vqoJxs6zzmB2uEQLE/HS975myW
	 i72cjKzRYv0XHBtm+SciVDFpPiY/pMfR3bU+VsiW22TBV3Y+V86opKxKRBt7cOSUb8
	 eJTMmtNcdw6sA==
Date: Mon, 13 Apr 2026 09:32:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, arm <arm@kernel.org>,
	SoC Team <soc@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Message-ID: <20260413-inventive-fox-of-novelty-b7790d@sudeepholla>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
 <20260411-tireless-agama-of-advance-5bdabf@quoll>
 <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
 <45bc09d9-33e0-48c4-92a3-9bf8e64ef80a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45bc09d9-33e0-48c4-92a3-9bf8e64ef80a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_013230_867923_2FC01649 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, Apr 13, 2026 at 08:23:58AM +0200, Arnd Bergmann wrote:
> On Sat, Apr 11, 2026, at 19:35, Sudeep Holla wrote:
> > On Sat, Apr 11, 2026 at 10:49:50AM +0200, Krzysztof Kozlowski wrote:
> >> On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
> >> > ----------------------------------------------------------------
> >> > Arm FF-A fix for v7.1
> >> > 
> >> > Use the page aligned backing allocation size when computing the RXTX_MAP
> >> > page count. This fixes FF-A RX/TX buffer registration on kernels built
> >> > with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
> >> > larger aligned span than the discovered minimum buffer size.
> >> 
> >> Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
> >> firmware driver, so this could be sent together? I think you also use
> >> the same Git tree, right?
> >
> > Sure, I can put all of the firmware drivers I maintain together. I had
> > for some reason assumed individual PR is preferred.
> 
> To me, that's a function of how complex the changes are and how
> you describe them in the changelog text: If you have a lot of changes
> for the merge window, having one branch per firmware type probably
> works best, or even multiple ones if you have a series that implements
> something new and a number of random changes do existing code.
> 
> If you have only a handful of bugfixes across multiple firmware
> subsystems, a single 'firmware fixes' is less work for all of
> us, with no loss of readability in the git history.
> 

Understood, will try to follow something along these in the future.

-- 
Regards,
Sudeep

