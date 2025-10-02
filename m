Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40086CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGEL/UIyOql9gf/Ibqxm8KiNoR4p0cdXovKEHmG9JCY=; b=KbZRLURbIEXp2quNqOnp7oV+RO
	bu82M1pa7DZEYLmJA9SDghfGqaHL099MsBXK4gARJuxapLwFrUueN4ydDdv0ramQrgrXu0KO1U2zR
	9njv0wG4ertX2t7Or16fGVv8MDJU7X1h9uB6zX56hDBuAFkbGrM0vcS6G5Xia2nV2LPmU32Oycd/E
	psN5aFosUFyXf95JF0imkBT0jSsxA8+61SwYVATp/Zhox9QOnIxsDnSzA0aL/pSMAUfTMrzGRjLjR
	fTY76sps6IFJf1zzcZiWF4cm6ZuaCd2dthDf2RHGZzdhXVZnbFnmbfgzzWSRhd3RqT7m/0y1OSwp0
	Im/36//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q8-00000009My8-0XfK;
	Thu, 02 Oct 2025 01:10:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q6-00000009Mvm-1cD4;
	Thu, 02 Oct 2025 01:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEE2B48DCF;
	Thu,  2 Oct 2025 01:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F77C4CEFA;
	Thu,  2 Oct 2025 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367433;
	bh=yYvgAGMLkQkF6DSmQ97Q6YLP2uC771aG/GEeq2XVi8k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TWinBhTgMdKjyTiIGPqlpbTJFUia7cdTXVRpZLTSAIgyFs7B+AIdx4Bulx/MDb0gT
	 lF03+oP+G+r+7rod95/cV+28x9oLJiRAhF1ZAOHhqc5IoUI2Ao2NChxOwTqZTzjjJN
	 uNY+EaeO/D2zYyExZ9pHSeMlbrJHgd53D765TaDv7QZPevHMQUEpnnwA1g6thyXQNm
	 fQTwzWbK1APx3CoNdXnSf2YOxE7w3ulmM20xc5fPQH43Irwf8cIW7VGXfkGFuh7f9/
	 +Xv+LWmLGjLQJBqGdN3coVhSbw1Tcp6MwboVt0mQFcen05gw8qsjLYrCKGbEjaJaDO
	 dgt8XoWuYP+3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 517F139EF947;
	Thu,  2 Oct 2025 01:10:27 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] soc: defconfig updates for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <d6fc7506-9700-4462-9842-d20ee54bea5f@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <d6fc7506-9700-4462-9842-d20ee54bea5f@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d6fc7506-9700-4462-9842-d20ee54bea5f@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.18
X-PR-Tracked-Commit-Id: 1f76c941c29bffdc97212969115f1fd5f91a4aed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f8912147dba3e9688b290aab0987bc9b0c6bb9a3
Message-Id: <175936742602.2689671.3791407765436153026.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 01:10:26 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_181034_449848_77EDE2C8 
X-CRM114-Status: UNSURE (   4.20  )
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

The pull request you sent on Thu, 02 Oct 2025 00:27:14 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f8912147dba3e9688b290aab0987bc9b0c6bb9a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

