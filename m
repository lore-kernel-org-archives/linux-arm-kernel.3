Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592DEB5967
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S958lvgIAXkgKMqUdjKonkX2dCWRY/avj7zrBZaYvYY=; b=RzW/ms0LX/rqBwaqJwFwQSh6TZ
	mbMnj+mdbObd3kQng2hcx7yKGJPvGLRLf+d3/PYw0UoGncqf4kZmyOryCP05g45YnS8r6MzUPmMjZ
	HiaWFOKGakoN0B4myZae9IZBMf5Vr0WKntPYNEaAXaFxA4ADjweY4mYHGfxmd+igAp1V+R549cXZs
	Y+NDgqjZFQbU1k5tDlAN8ldDUrTUh0jtggyGnnT7uxjBN/RPH4noDBAubNVlTFognQj2dk1oC94Mc
	YZ7fXmaN//jZidC9Wr3NTmKeVDNNDpj8pTEdu1rJI0vM05iqjg2bYBx2FUASjABvfBpuT3fi+wNEZ
	1KGspxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2cW-00000000DsJ-46Iy;
	Wed, 11 Feb 2026 05:18:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2cV-00000000Drt-3rMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 05:18:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F378960130;
	Wed, 11 Feb 2026 05:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9730C4CEF7;
	Wed, 11 Feb 2026 05:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787114;
	bh=MhUShsu/dTKL14u2OVm3LEaaQ/U+4tNtbT5a6zgavlU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dRSKmE9BABhwQDG7Iyc5lmgvogzxeTTSwIqc537YnPbX/wvIQZfynJwJGNUlGwvQO
	 mxvPM/4N4MmwccKPhU13Pw2RSUU6vDQniOmK4+m6qHxh30Kw9UNZr/VCTPTkF8sfWY
	 EKzZkbfXIELUl58jZKmsf1pbTQqpGi8IGg3aUvzOH33xhidDRcbxdll44BaDQGsyN+
	 p0v21NDR+L4gJGXekTzjhcnomhaWhzTefeq4CPUxTKTAy92v12Xf7hrADZznnFDBRd
	 kWroxmgpnCr3N0g7GFYdh77FqfN4AvkfJiFdrlb8/Jlv10GFDe6n2cUIz+u8ueF+Wa
	 X0/nMjHA0/GBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AF94380AA50;
	Wed, 11 Feb 2026 05:18:31 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: defconfig updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <21a0711d-fd08-4c06-9de6-ecfa089ca723@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <21a0711d-fd08-4c06-9de6-ecfa089ca723@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <21a0711d-fd08-4c06-9de6-ecfa089ca723@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.0
X-PR-Tracked-Commit-Id: 6f3f1d83e511c8dbf36021805070caf08498641e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7fae9b4d38f0c52489640c9688e529c4a58e1b6
Message-Id: <177078710973.18664.17210034290587696768.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Tue, 10 Feb 2026 18:06:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7fae9b4d38f0c52489640c9688e529c4a58e1b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

