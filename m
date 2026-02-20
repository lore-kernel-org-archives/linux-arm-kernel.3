Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08189C5B561
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTugq+d7/HHrRBaInroSdmDHr0gyX+r7BG3el5G//ro=; b=h/+mhFoXQvHiITTqxT3ShXZhRM
	8cjWyeyZOY+Q/c27SIGqZVrnO1QAR+AzcFRYnvDucOfVof9KHrpHypnC3yO7xhznUGfgKCgMStDve
	KefrkuVoZm36mirKYOMmO8NHL1fy5j90wAUKcTCMCUpOSLAh7E4OoEcfayD64tnCh5keKW6kkIhp7
	DKQg6wukmXgYHsjJr2vj+OH1EkFm4vgu359lQnraF64dqBQqGkC8hZ94L9oTYyO6WLZeqV/FNzfXv
	ZLRJcIJMBOVB3A6CktAnCmYIcUVxn/Z3yYBAx1RdquWmMH4Q7SsotQ2sBywT+e/CoptXxU0OLMjpT
	TUw/n44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXSg-0000000FahX-3hLO;
	Fri, 20 Feb 2026 20:50:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXSe-0000000Fagz-0QHC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 20:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B006243D4C;
	Fri, 20 Feb 2026 20:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8688AC116C6;
	Fri, 20 Feb 2026 20:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771620650;
	bh=xnE7mh23tkBuYO3YDm3AWkovbN46k7pIsmdnX6H/FJY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Xe/Mu94AY5Z/Dn03eKMNqHrU2oNYbxi9ARgyfippSfnmGgOOX4t/yaPjvvaRVlnof
	 qdANxYys7tyTFHeakD9XXdcLibx4iaEl+Ah02LGr3ZabaZqF8ySwT0Vbyte7vslIOv
	 XKi83VeDg4U3GQBtmLX/UxmWT6s7mA9WjiIZDdKBDY2mbShY2yXpDsUiLKIG1eYAD4
	 GpIQr2gvpDh3qORp2/gawLc6dJzZ20htK/u1o8MPROGz2c6FGGmqoDI/Y/kGt7EFsq
	 CP6Xe6QDaCSs72yjxZm2U7lAIAQIDqRlfXBQZel5fR1bBiuddCfbIzxyfPYt0+QWtH
	 mez0ihOP02Pjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EF83808200;
	Fri, 20 Feb 2026 20:50:59 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZiApyXis2_3vg_t@willie-the-truck>
References: <aZiApyXis2_3vg_t@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aZiApyXis2_3vg_t@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 729a2e8e9ac47099a967567389cc9d73ef4194ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a27a5c0f08039475e21f3517e1bfe4a05bb82887
Message-Id: <177162065819.902486.8558573188703836714.pr-tracker-bot@kernel.org>
Date: Fri, 20 Feb 2026 20:50:58 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_125052_439765_41024BB2 
X-CRM114-Status: UNSURE (   4.56  )
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

The pull request you sent on Fri, 20 Feb 2026 15:41:27 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a27a5c0f08039475e21f3517e1bfe4a05bb82887

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

