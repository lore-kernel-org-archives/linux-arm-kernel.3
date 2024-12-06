Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A0E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f08fBWIDqIpkdUAJOJ+e0lmMgXqBsq1dgNmH9q3zDHk=; b=v5YI0VIEO9Lqf0Vpeyb/wgHe/7
	gl/Dv5kUAuqiinAwDYP7IFD/Dpe1w+yuvOX0vKmtrjKMwoXahedIvFN26Os+xRSvbE8RwZoA1pnei
	qGXBLrT8ZUKTdGML9tdO+9e2arM6BPEV79uHYkA9XX12L/xtcaqseQ8SNs3AoewvpnGdLGFDwIpH6
	iiOTisHccN/6XLoqddUhRuo3BcOnVrVY4Z/uXf47OQvLLHBbteztl3FFhi89wQTePhT/mv/mhHFXH
	f8gExgw6YOvi/8Sqsd9j3GMTmri72/U7HqLJZAp6f0pa0yfPGGA5z7Cyjj7X4mdFM5v+0Z3ZNWJ71
	Hx2P+kow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJekz-00000002fWJ-1hws;
	Fri, 06 Dec 2024 20:16:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeY6-00000002dGv-48J9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59E415C0F8A;
	Fri,  6 Dec 2024 20:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FB7C4CED1;
	Fri,  6 Dec 2024 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733515417;
	bh=r7ptKlFmA2ZVJjWRFUORfxleHTv707uFZT8qK+s5Xd0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CDqE0swtsh0x3JDKGSbqsK3LQEEoU6tAXTCb8DwzA+wApk1WPZyIsouIqoR7X8EIz
	 6D789QCW/1khOg8T2E4qMxTH2eI0ho8IvF80oYTX1eukrlAV/wUTeq3Razs3GvI3cy
	 MkYuSEeiAmdxs+ASOAKXyKtgxaTurB0STKhw33pITr+EGEt55GSdi+CUt+Lr0sjvvW
	 GnmIvz88IVz0GARB6OSRAnXnfA+7SzAyjn9G0eUUnjhJFhAbTtunVXU6Rpnz6zLStt
	 iGlVG06iXC0fQ4hiMyt1Ymjc0ab9zKWspMDleHqIFrSBlxstjfqrkAjv1RKXQJoICi
	 q0UCqWUEY0qjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB135380A95C;
	Fri,  6 Dec 2024 20:03:53 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241206084031.119041-1-ulf.hansson@linaro.org>
References: <20241206084031.119041-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241206084031.119041-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc1
X-PR-Tracked-Commit-Id: 2379fb937de5333991c567eefd7d11b98977d059
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa4c221fa153211d80acaf54fe5e5b1859c99796
Message-Id: <173351543257.2778953.46327491607829835.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2024 20:03:52 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120339_066074_87D8BA1B 
X-CRM114-Status: UNSURE (   3.88  )
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

The pull request you sent on Fri,  6 Dec 2024 09:40:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa4c221fa153211d80acaf54fe5e5b1859c99796

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

