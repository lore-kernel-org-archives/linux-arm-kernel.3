Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191B5CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddKJya3jyaIV5FOmL1IJGCB+sWznc2oIKv7Vz9ERAew=; b=xdRyknKkIRZF6CQLS1PAAeadEn
	yvGI5GbVqXsxXmQYoqnwd+zwlqEUnB4+TbTeM4f7Wbi3L46Oh+ODfUFKkusEqGJCmIRAXW1EBDvTd
	+ogNrIQNfEdETiYX7/JICXWM4zzTBldfpNmZlU8Len+lk7Ft7EMET1inh01Kim4nrPfcYhB39jod9
	4CHIi68I+euMVpkgUwKGeJg/YboFQNp2N+um7hcxiQws0Ie4RZfjBwe5iUPQBkOJzYxPM1SKkCIa7
	ve01XemaITB8nn7ADP38L9WyoKB1o2AZ//vfUatc5EnNxEjiXiyeohEk6zoYQcPdp4loGLSOliz6R
	Tk8O5yZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AJr-00000002N62-0AMr;
	Tue, 07 Oct 2025 16:13:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AJp-00000002N5v-11CR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 16:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6C7B61D04;
	Tue,  7 Oct 2025 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F2CC4CEF1;
	Tue,  7 Oct 2025 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759853620;
	bh=qjkaPjwH7M3f9DsHVddOSMKYUMQqQrIIvpUpOYA/IRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TRuVcDvjWDPjlfgJhCCdSekNI5lqg62k6VxoiwvP73+Fpz/6kawS7Ee8x1o9N/dfk
	 oHvFNMYbulqewM1iqTylI2jXH+NtF9yzWShrga2Yi+6ZI/hCcUcrfXoDmv02toLSo2
	 2vU0jMzk9WwBMUMKSX8Jdbg0CdOA9WpGn5/8I5s+739Rru3CUnrqFvnAs23YK88SUF
	 Inah+LXDwxlyC7f/w3sj5+umJQvhEecKtIKFqsabEmQT8UpMvWX7lHNRX3EJJnte/e
	 7AwCDimvHIJySq3bQ65xNmcOEoaRwNsEJU2ixOvzoxOdrv+/9YQOpGqDCwc9XSgzQV
	 KDRNSHEgkSLxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0E639EFA6D;
	Tue,  7 Oct 2025 16:13:30 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aOTPIiF3aO-YroaE@willie-the-truck>
References: <aOTPIiF3aO-YroaE@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aOTPIiF3aO-YroaE@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: f620d66af3165838bfa845dcf9f5f9b4089bf508
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 971199ad2a0f1b2fbe14af13369704aff2999988
Message-Id: <175985360915.2684232.18171883448738269661.pr-tracker-bot@kernel.org>
Date: Tue, 07 Oct 2025 16:13:29 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Tue, 7 Oct 2025 09:28:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/971199ad2a0f1b2fbe14af13369704aff2999988

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

