Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEFFCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xpIJSTc/EKDVe7Rsp6mx/xsVw/icl1eA7buZMGoQ4A=; b=XrEusPSDyx80GdCxEpNpbvLYZE
	DSZVLUMLRnHw6aBAWXuULZNVdlSPpsmKzUZ6xaUVWUEp2SKIBLjjaFPOZh2qlMsIwIhfr0/0x61a/
	7E4gCYt4R/+hRLt07qyz6p4qK0cu/U7BlCWTm/jbbgjfIfbW39s3ZukZIv6k3phJsJqAJmtBrVpR/
	RMQgbJX1XXifMHhj0AZ4eOaaLjHXoEUBlhY/ebv27V8SJBv8HD5A5Zf5NlfEyCKCllR5c0L3Ckk/w
	0/eQyi7WnQxcqYmrnfVrcBQ0saH3+b+e2kh0lmVBCZyRVtNJwrMP2fpll22IvuLY/rqui9ONXEUaW
	ZPo8KQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKvV-0000000FAX1-2Jeb;
	Tue, 16 Jun 2026 03:57:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKvU-0000000FAWp-2vo7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 03:57:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E74C43F99;
	Tue, 16 Jun 2026 03:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19651F000E9;
	Tue, 16 Jun 2026 03:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781582244;
	bh=1xpIJSTc/EKDVe7Rsp6mx/xsVw/icl1eA7buZMGoQ4A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Xw2cMGwjQmwirUJwPKvo26EsWvWYyo+ddWXg6tiUT9tmUjDbEKyfdG0fBkpsLp+n6
	 pb4lWCA6agRRtRDmrFQkpdQOqoU/sGXne0BBlBZmzSgmnX3mTg1G+8/t1AQ4Bjb9TD
	 45jVeHu0PvTPYNzfpX4PSw6Y4721M5CcU+IyHvkevGDdpgNpXyeHFCKyucg7fcNG3n
	 GbQuom4lwq3KtpQ5R1dpsfLCcEi/I1RYyTdUKjlzie6+iilXKyLmpdmJpmIDAfADFb
	 5GnVdODcy9her5f3dulHccNQK2cPqsFo8SndJUIBXhL469C+uMEm8Lv2ZxO/h86422
	 kyTNrN+JHHWgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199A7383BF4D;
	Tue, 16 Jun 2026 03:57:20 +0000 (UTC)
Subject: Re: [GIT PULL] CRC updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260615174807.GA1831@quark>
References: <20260615174807.GA1831@quark>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260615174807.GA1831@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus
X-PR-Tracked-Commit-Id: cbe44c389ae80362e72696ac08f7c55a83f2a050
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef3b7426a63c930c51d60d6c2428663d52a84e2f
Message-Id: <178158223877.434177.4901029841879163152.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 03:57:18 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>
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

The pull request you sent on Mon, 15 Jun 2026 10:48:07 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef3b7426a63c930c51d60d6c2428663d52a84e2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

