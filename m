Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE4F8E4A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 04:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+wlTf5xEtmWwInEMSYadmTnqkbVTaDEcnUgFTV6bx4=; b=ALGNnJbJ28S4TralQ1D9vm03W3
	b2sCkAkJQA0yaGbhYDI4Yt6DIrsnauZ3cd64/ezIh7h/BvW0IyQPelCsbm6ycVqCJmDm7UXOW8OWy
	MZ0tImeXbVp+Z3vc0cPcJ1Vu/QYu18CK30jpdW+l+D1+8XMg0NNhLc84O4BSJeuVoANb0+BDWz5km
	2NFDKgx0UYxb7cpeZihFtBD21KBd6aIytsvJ47OxueAZJuZdSj0x/vkO13n+NXzdqmiLuRku+cXvZ
	HtV2jd2Ece0OB08qo08T7ReeFPE0UnbaaWebkPjMN5gGEqxuindWB/N6gNwa45G0GVPDkiDoLyQ9Y
	RaFDJyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaY0-00000003POx-3iLi;
	Fri, 17 Apr 2026 04:11:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaXx-00000003PO4-0QVz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 04:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D048D60128;
	Fri, 17 Apr 2026 04:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA82C2BCB5;
	Fri, 17 Apr 2026 04:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399071;
	bh=wBsWp+q2qLfKF9ch+An8C9swcLcFbybwvqPigX5cED0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b8144UW+nMKbTMYFG78W6uAtq8cqYWfyhwpjcRGKoEJZuMOvxh0nPvx1Fcl0BMQ+8
	 Z+oF26jwMf9NZTkdSPhp5iOb594Q05WTW5sBCGikI49aUNclstr9mn/am+G3k9PJfO
	 rwi+VRCbMdjSIxLLTbwU9MnLPuKybTHCJc/jETwUeMF09RT9VRMVSrFsYdlVQfP1ji
	 T3AUdDOocH+VixveFk2sib+XEB+MK0pldPKpTrSrS/iarkZXeZY367Y62MCDLgMsa+
	 MyYwfYiD+YNb7zm7SQOiGr/QOorrYh+L2vYJ7rQPFOVKPFpNClHFM26zXyZXNVFst5
	 7YvPA+uneyNtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BAC53380AA7D;
	Fri, 17 Apr 2026 04:10:40 +0000 (UTC)
Subject: Re: Re: [GIT PULL 2/4] soc: drivers for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.1
X-PR-Tracked-Commit-Id: 33a20cdaf41d08a66581cc01a60c1a3d596ba9cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31b43c079f9aa55754c20404a42bca9a49e01f60
Message-Id: <177639903950.3519243.13927766925600356582.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:39 +0000
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

The pull request you sent on Fri, 17 Apr 2026 00:28:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31b43c079f9aa55754c20404a42bca9a49e01f60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

