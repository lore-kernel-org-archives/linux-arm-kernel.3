Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75511C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GZScCHHqIVwpgN6Too16d1BAnX8RajVwsDCUN98YHI=; b=gHiXtnFY5z9VYTuJKqWxgOFU1N
	pUx6qJxbXPjG+tR1E4k2rG7hZuDaq2qhynmcMbdQqlfnaFn9dFxMNNXvw+sqqkhtswW4JTH9FwVTi
	HAR3/283taj0BVmxYGCAGO9jFYFXJEALJ3GMYaItho8KxW8T8G9oW1d2WoYh6QcqYQ2BhU71n/MHT
	29Gq60Q7p5mIR+ptmibSfTZSJl3UqP6eL6P8GDymG919vFIfdQSGnpfUbS1rJQCiDS04zo88omFhA
	A4VHPJwZi2bn+MBr7A6pCaPku7JOQg+a6/6Mh/Y4OQILQS7v9ngcLnny41lpmKlkju9V8AkV1+ESs
	ecQIoxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuJA-000000019R8-2jn4;
	Tue, 25 Aug 2026 16:47:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuJ8-000000019PI-08ZM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:47:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C42C60133;
	Tue, 25 Aug 2026 16:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572591F000E9;
	Tue, 25 Aug 2026 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676449;
	bh=3GZScCHHqIVwpgN6Too16d1BAnX8RajVwsDCUN98YHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lvnzLfQgQOx8Oap1AUr+o2woZmJDVd6EIA2TA1rS74pD7SiFpLNMnwoIPJQ6hSfc3
	 in4gmSlJAVV823fYm4ReT8mqAbUo8kEi8sCnp/q885xVv4eTfNH9VPWSCJwzWfQUly
	 D/tNEKm6CIAZrtkPj1Xl4dt/i5lFBl/DSiv9kPVSTaOsxDd1sbyvuLRVEHPwgX1jtE
	 yljlBiC/VwiZF8YrRAvui4GKgzM5Wx9lbFp03snbzhVpVFW3z246mVlIr2R4EFxios
	 DVgj8TD75sdO486JTKSNx1Yf/pUazzSwXLoACQxdQ7dVqFddvPTBDtcXISOqCn4D8S
	 Vd/9ZnrcHQ9FA==
Date: Tue, 25 Aug 2026 17:47:25 +0100
From: Will Deacon <will@kernel.org>
To: sandeen@redhat.com
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [fs-test] =?utf-8?B?4p2MIEZBSUw6IFRl?= =?utf-8?Q?st_repor?=
 =?utf-8?Q?t?= for for-kernelci (7.2.0-rc7, upstream-arm-next, 21d6ac05)
Message-ID: <ao3HHZdulsnA3P-9@willie-the-truck>
References: <87021.126081216320600366@us-mta-482.us.mimecast.lan>
 <037e7485-2fd5-4d29-9e08-523a87cfd8e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <037e7485-2fd5-4d29-9e08-523a87cfd8e9@redhat.com>
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

On Tue, Aug 25, 2026 at 11:05:40AM -0500, Eric Sandeen wrote:
> I've been trying to make sense of some of the automated testing like
> this which seems to have been on autopilot for a while.
> 
> Is this testing/reporting something that is still useful to you?
> 
> I've been seeing the same btrfs test fail forever, I doubt it's arm-specific,
> and I'm not sure anyone is looking into it.
> 
> Would you like this testing to continue or is just noise now?

Generally, the CKI testing is really useful and we use it all the time.
I just ignore that btrfs test!

Will

