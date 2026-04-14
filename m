Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AEAF531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 00:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7FN1MdQ9ldbrjGIK7HToScyEUFmHLoOdcE9fbM+H7A=; b=F1a2x90MNYumTEEu1ikRua+TtI
	qONWcslUVWfLC3+u5jejeNw1XRSgR7WvvB2UiFCCqXqUtJrYv2PcppOAxTrOp3v9l7X8AQAY/hScW
	yZbVPfVK/fW0KO75rO6SLezNPLu7+MpDi8Q2rBFjKFK836Qbra0WEMoR6YIcZDvcSU1vZNLD90PsZ
	PqIT3gFk5KLiR/sFVLDGSlLEZWNWM95oqtezFpJlikcXjMp2imDVhM7SH3+EGPcMz/MxKyHTI3KtK
	vJZWHCGFIl483Xr7XI9DIxZk+W1I4uMN1LSprzwuFjdoKVAyrXsq/J87falS5xA9pKyFz/+nQ6Q6b
	IGeAiZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRnO-0000000GXKE-2TWm;
	Tue, 14 Apr 2026 00:38:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRnL-0000000GXJn-2OX4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 00:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E49A405F0;
	Tue, 14 Apr 2026 00:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17904C2BCAF;
	Tue, 14 Apr 2026 00:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776127102;
	bh=hHa+fbgnPntiN856xJNJCBs9hbW6P/Jq5FWYjMmPZto=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Vzbiz8t527DrfZzcA6P4LBXTbSOBzc8Cd1g8mquvgnkQRrmhnbap6xFIlCYwariOk
	 Yh7w7byfW5Qg56xJmX2N5NIqPzjKSMjIUfOKay9tRvumsdhLaiJ2FMEOQUwy3x5RPN
	 xeGNXfUwyvHAF7AruiSHsC0+C3HOUellUmyfdqfgn4GPDHM1Y/cVYb6CJ9gFsKaMxK
	 DzuBfrZPHCr7LdsmpmQ2WVHZrIzRVW+EQm/NIA4dSG2KUwg7o/sR0nS3Abpk3bo6Us
	 ZVTuPl/aJ7AWautZs3/p+qZUwYLefHUFwP/8YWcaXigvIIJhPkOHGUw1DAcMX+xbFS
	 s6ch6oLzbvkmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0273809A0B;
	Tue, 14 Apr 2026 00:37:54 +0000 (UTC)
Subject: Re: [GIT PULL] CRC updates for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260412002343.GB6632@sol>
References: <20260412002343.GB6632@sol>
X-PR-Tracked-List-Id: <linux-crypto.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260412002343.GB6632@sol>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus
X-PR-Tracked-Commit-Id: 8fdef85d601db670e9c178314eedffe7bbb07e52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d142ab35ee0b7f9e84115fe3e4c3de4a9ac35f5e
Message-Id: <177612707317.625472.91099862803652965.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 00:37:53 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Demian Shulhan <demyansh@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_173823_639509_FD665DE6 
X-CRM114-Status: UNSURE (   4.40  )
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

The pull request you sent on Sat, 11 Apr 2026 17:23:43 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d142ab35ee0b7f9e84115fe3e4c3de4a9ac35f5e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

