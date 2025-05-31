Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842DC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiKC+b0V0vd1E9JM6p6bIkMvbGxJ8ayMz5PTnHmcmUE=; b=u9ieWZlFkw49/sjtwfwO/MSPYm
	QFCicruJYDDeJYS3PL10I+QsHYqJAR06YzflbiwhTb0NK7Gh2+rUfrJODLzXxT4qX8sB7iz2w+aao
	Cvo2g8NBDc4XczK3uJRmqIQl6DnE9UC3+siMv40Ka7MCQmhDWnLXizTOnunbWgmRONz3CDHNOzFsE
	iEwh1DIcpjsqiaMLAnqtrUfMn8wOxV8digMpBAo4TlwtCrqTMUj2WZhjrFD1Fy813YD0awy71KvJ0
	/I0HTxt9JDHxKe6pmuMj6RlpWnbSab1K27hjcULNL/JT0sfZ7SR9NKr4Bmuu5079g7+9SF0quEjoa
	t7v3oFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOBn-00000003yFZ-1jk5;
	Sat, 31 May 2025 15:32:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLO9c-00000003xYA-1BZ2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7201A4F05D;
	Sat, 31 May 2025 15:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474D2C4CEE3;
	Sat, 31 May 2025 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705386;
	bh=faSEr/ZDlFC0XgCH0YCQ45nbWzlbbpXlLkx4FVTW9ow=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IVF4UGyjqp38xG73gTpKgMsAM0G+XV0xRgm9aflQKAULcw8EEQvLGdwteSBlNasDk
	 E0DIC3YVvveVp1q07UWoIpgEk6ZW4GmcD3Pt/3I7YvBgjbcF1Tyw6f2FUfmQaOrLi1
	 O4J4Jz8K0HsFTy/T+k2R8nOu4SgBrlUUDh0xhvNRiPMin/2pwfzAQSv0Pw1p12gtYr
	 ET6dPdHl/QTJz9tnhSt+PDCDB0oAjpXnj11qRUIUsgolJ7TwJCiJbxN8DGJFDtvD6v
	 dH0pNTXVUh6JLdWl9tiofV/SIeQBj+kv7SssnEtT8cmXtIUkzCxS6aOcWRnMAloTGi
	 Dfbl96mgzChsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE38C380AA70;
	Sat, 31 May 2025 15:30:20 +0000 (UTC)
Subject: Re: [GIT PULL] require gcc-8 and binutils-2.30
From: pr-tracker-bot@kernel.org
In-Reply-To: <feab370a-3857-4ae9-a22d-1ab6d992c73c@app.fastmail.com>
References: <feab370a-3857-4ae9-a22d-1ab6d992c73c@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <feab370a-3857-4ae9-a22d-1ab6d992c73c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/gcc-minimum-version-6.16
X-PR-Tracked-Commit-Id: 582847f9702461b0a1cba3efdb2b8135bf940d53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dee264c16a6334dcdbea5c186f5ff35f98b1df42
Message-Id: <174870541922.163157.8980112873932103512.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:19 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_082948_385967_BE7E9CEA 
X-CRM114-Status: UNSURE (   4.68  )
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

The pull request you sent on Sat, 31 May 2025 11:09:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/gcc-minimum-version-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dee264c16a6334dcdbea5c186f5ff35f98b1df42

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

