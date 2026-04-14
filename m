Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB97F9D0E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XpvUWJdPK3It3NjFxZMUgAiv9eSPEerzQWrcf7EaiA=; b=xqsAjQ7fMd5+POa/1tuyfsQa2s
	bivO1s88Q5sSCeQLl5Abdp8g/pswliW+gHJqvvFVda9b/auUwhyWmm+QSmNJpxoLClfyVxizfa5i8
	DgbKirXDY3FEutgUY1s7klbY0CfUpP6K5UrY2OCpd3wjjA3uxOgSNuvbpQdFf8VRmdEgGkGnqvsei
	C/iXEnHwtGQEJEwGff2pIAjoholOsNKU2TD40iEzKFlCYVCh1RX27DoPTTVvpDUziR3XHzEJ72w/2
	1RFMCiwOxVnWGIrmC/4+UwOT/yc0le4VRbWWEK+Vjgufgbt6dSdjJ9hYYAhgBJktCJWvsFvRtjeOR
	BYlJBetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCguh-00000000242-1t4l;
	Tue, 14 Apr 2026 16:46:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCguf-0000000023c-2zgJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35F0743C4D;
	Tue, 14 Apr 2026 16:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B62CC19425;
	Tue, 14 Apr 2026 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185217;
	bh=h5CUHLLZGJj1sqfzAOFN24P+lZAUpLgJCzAIP3pIVak=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=M3XzHspleh86r3vzAE6YUI8iX7fuNondhwJgpVrbrS0Op2mj2wIUHrH6fREXFKsIG
	 pem7Y2vx+7Y7xwcrJ53ciAxItrD22RLU7qrf8Hp2j1xmoJc8hIvngurUvXyS+qkBub
	 09nlGhcwM6sBuxJtfeY0yNha/v0y2nM1OpuMFM/Zr94Pf2tTnISy5Y3xt0Ci2EKXuG
	 vKqkWXd08DrAsFfVL/8q1rNyTPsVxR/M6KO84zqoDqRYb4tOiaVJZBICeda8HWuSed
	 ECCuMdETCSR6E3e0oPEVWgRNlqQU9u7DIt6JDR+Yv+2AaB+z66VFmF1bo5P7C02lT1
	 Sx30d41kHGYgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1313809A07;
	Tue, 14 Apr 2026 16:46:28 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild and Kconfig changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <adu-ZyIv47FnsVLI@levanger>
References: <adu-ZyIv47FnsVLI@levanger>
X-PR-Tracked-List-Id: <linux-s390.vger.kernel.org>
X-PR-Tracked-Message-Id: <adu-ZyIv47FnsVLI@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.1-1
X-PR-Tracked-Commit-Id: 404927758daac5ec4594071e033c1fa6ee9ca9b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d0d3623303775d750e122a2542d1a26c8573d38
Message-Id: <177618518744.1376142.6209842916194520385.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 16:46:27 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Coffin <alex@cyberialabs.net>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, David Howells <dhowells@redhat.com>, Dodji Seketeli <dodji@seketeli.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, John Moon <john@jmoon.dev>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Yonghong Song <yonghong.song@linux.dev>, kernel-team@fb.com, linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel
 .org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_094657_772934_81734113 
X-CRM114-Status: UNSURE (   5.30  )
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

The pull request you sent on Sun, 12 Apr 2026 17:46:47 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d0d3623303775d750e122a2542d1a26c8573d38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

