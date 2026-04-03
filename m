Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C88E8538E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=033UAyZdJKmabU7/Yh4MpkgEbBaDChflDGJcd5ALkQ4=; b=S3kAGWu5yc8GUvgFw7g9cIlFim
	WTV6F4pLbo1AuZhA1WskcHdXK7ZSETGCQ7NqLW0j8bnVz8hTX4OpMjwZ6vW/vfTrmZeNWXKDXErV/
	AtOwhr6hEwziYvfkuy5msNstyhga29vCnH1/bNLlXR8+XB1NDOAUrryWFHh3divMISe0LBleVhRLn
	ayOBLufopoIEvqbJbB0Q+GjPVvZ9H1P5xLMXjP7MS1wnJw3XeptjIsaEiWiBhTZt98kEPstnbMXs6
	yaVcRouZ2ED7YtC0cQsSb0CWE+ybL+KousBNeLApsr+lsaZV74nQOzmPO7z7VK661vkEOoRurZt50
	atphlnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kZc-00000002Vy5-1ddR;
	Fri, 03 Apr 2026 19:52:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kZZ-00000002VxI-1wCO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 19:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70E26444A7;
	Fri,  3 Apr 2026 19:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6C1C19424;
	Fri,  3 Apr 2026 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775245972;
	bh=ESjjzHbGPAgCM9vs/WTcN8dQgDw/3zlQsf9ibAFPw5s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XzFBicjhTWj1PH6dwDPHCqUXK6EXYGSbnGLEPGWglsogjqgkby2sBW49DnPg5TSHZ
	 DZk3egKroVTzp7Jyi3s9XL+vZIPstfX45sByPv2Vbh4l/+1yMeIWdKLa7usiH5LRLO
	 O7S5/IXEcPOErZLVPvPf5vAziV6QccMgIhCqV6HWH8OwxtHin8XGKrKuZhLwYhVKj9
	 zQvRuyR133Jr9OeQKS8saJ+DJw12MpVV6XChgzgKHtlc7pFl5rzNnkQDFcaPnvaEeV
	 0lrc/yctrczuFGHRnuGnXYIiGhVUY38OKJ+bUrLMstojQWIIFO0bHxFukuaSVzPP54
	 eFBYQZJXZM3NA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BD463809A14;
	Fri,  3 Apr 2026 19:52:35 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fix for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <ac-MF-N_-wrXkjrF@willie-the-truck>
References: <ac-MF-N_-wrXkjrF@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ac-MF-N_-wrXkjrF@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 54ac9ff8f1196afc49d644a1625e0af1c9fcf7f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 441c63ff42c4e666304cdd32d23b5fc6bc1ea3cc
Message-Id: <177524595372.1431632.1144347019243966007.pr-tracker-bot@kernel.org>
Date: Fri, 03 Apr 2026 19:52:33 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, ardb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_125253_553338_A8FA772D 
X-CRM114-Status: UNSURE (   4.79  )
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

The pull request you sent on Fri, 3 Apr 2026 10:44:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/441c63ff42c4e666304cdd32d23b5fc6bc1ea3cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

