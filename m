Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA4D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNRxze2Fb4jAa3NU1q+qZ6MvoeIK07yRAN5JSVYEztg=; b=l6HrbnHCQ5M9tH3tylEoPLjtST
	r9chAqNbQY1dNjW8DWwhGfMT/sPKN8tKCbVMXQtxaxRcMLPgmHTLQEuQoo6LVIhPqIWLUwjMZyMH2
	UbYloZ+pd4UwiNY2MMvxm9nOyAuXSdoglE5hX83Y8TSHEYhEHnVygFjggzMNOTYB8ITGLEU1g9eZz
	G4Gk/rsiLtjWv3CfbuS8l3HdlaeL56qDs6f/tRc7FlnxNBMX08PULGxVbCr6ZvFBXDBXGb9YP7wMV
	FzE7qqAaNZsVtMZhPXyMv6lg3y2iEMsjeriptWsmNb+yoJLZT7P4T25gYRwQ5hdr7KdPGsQrmUjG/
	dhid+jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOeF-00000009Vtx-0r2K;
	Fri, 23 Jan 2026 21:24:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOeD-00000009Vtc-0BN6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 21:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0EA9434C8;
	Fri, 23 Jan 2026 21:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E540C4CEF1;
	Fri, 23 Jan 2026 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769203491;
	bh=VNE+m3Pfw/5+DeSp+zS9BpD2eDtyYG3WMUZep7z42kk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FRU2es7KDBQsIuGPn/Zwj/zskcTTWOFBo7wXszdenmmDoS82otCCJjnCgrE/qh0fH
	 katSaRxM3a6b2D5aO2mhWIMfYrNap8jxC6v63bsnL64JHxMAxFFF/tvn8l3nY7tVsn
	 DjZpZv58jbEdgUzg1AEj0Uljw6Io5dse6V3atpAkYpo/T5djglhmQPnfJYa3cmGe1d
	 OTE6NmcobUHSqOe7hIiq6xR91QJ8qOt9BqxRFR+QsTHL2osbkJx21aCrqSD4nksQMj
	 HqzXVaL7+P43LV9OyBbO0HofT5RNPXeyNlFmCCoEKrL5fi1nJB5TFU8j8GkDpDcqD1
	 k519Lg0mBvhzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BA0B3808200;
	Fri, 23 Jan 2026 21:24:48 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260123121435.245253-1-ulf.hansson@linaro.org>
References: <20260123121435.245253-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260123121435.245253-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3-2
X-PR-Tracked-Commit-Id: 861d21c43c98478eef70e68e31d4ff86400c6ef7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9731fa48beb346bb9804cb81e34b3260ce65e561
Message-Id: <176920348722.2720183.9624545632206323526.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 21:24:47 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_132453_103597_F1817462 
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

The pull request you sent on Fri, 23 Jan 2026 13:14:35 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9731fa48beb346bb9804cb81e34b3260ce65e561

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

