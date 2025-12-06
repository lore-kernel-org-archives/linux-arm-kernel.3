Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A1AD3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeA0T60jYHH3R5Cg38sUHQ0VAWPvnLMWkad0xdB5RxM=; b=DGld92u0lxuZE6iIr2HgPncj2S
	qvjgGgmsXlHUV/tNzm07B2/K8VJ6kZ4kxu4iVfFUIdHT35Fs2SOpju+NXWdqxAYd3BJoUzniN1tdE
	ouAiBFsFBeoP/LYIAoJsxV6e1XeMluhGpr3i7y5J9Bx0U36R5buGN3geQ4K8yUdVfMBpEg6erH6S/
	fdqJg4V8tpCnpY7uQUzpMExubY+S5mKnCi6X8DvnZQ3BXCiF7yku+tpvlYf1oEhzQvr2+/Fc64o8O
	fSnY1Dapo2QBwR+3v+HaLOQuqGqjySbENlbBo2JjGO/p/rg2BASBym/bs9okljUAPhE5+qP+mBCUR
	kI9Ovxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe4-0000000ARTT-26U9;
	Sat, 06 Dec 2025 02:03:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe1-0000000ARSl-169P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 02:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B397740566;
	Sat,  6 Dec 2025 02:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921DAC4CEF1;
	Sat,  6 Dec 2025 02:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986611;
	bh=gJ5r0a6TufP3WXYaoqIEUPLs5mk3mBUhlVCiIrokZOY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MshxxfK1smTJiWW9JCxLdgo51Ls8m/0A3+8a64oFej9kf96sYbY1uZJ5Bvm/Opuf0
	 t6Mvjbt3+viCjeH5i6R5ooK29ROba4o4MabG3CXmxwg8sRpRkYsDVEaBra7qc5+9EQ
	 keV5JvMykbv9ioD6eo0qe/wJHHIm08uG2IPL/tOzOswHUCgbq1oGaT+0TsEG+4Up68
	 qKCvywXkYgPffIPtrGT3yTAOgm/7/3BbUNUN9fSizfbP/3kHYW/+WYZSwPyhbrZG3g
	 EZUrfxEGu/DLyPoFVkqKyqpn4zE2RLTwFvpJQJnuUggbOGTEwUXjRQ2pWHCF7fz25F
	 w/RAcrWisfoDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBEF3808200;
	Sat,  6 Dec 2025 02:00:30 +0000 (UTC)
Subject: Re: [GIT PULL 1/6] soc: defconfig for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.19
X-PR-Tracked-Commit-Id: 00de4ef9d3abc0b195988c23aea2fefe5f76d3c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4c6c76e4039366017a4f568672e4ea9fc82f97d
Message-Id: <176498642885.1925836.9314675250384268584.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_180333_337243_00344632 
X-CRM114-Status: UNSURE (   3.55  )
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

The pull request you sent on Fri, 05 Dec 2025 19:26:47 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4c6c76e4039366017a4f568672e4ea9fc82f97d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

