Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE54C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 00:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvL7Y1puAYMJvjVAAOLp36Z2Kjbr2kxEAcXrHRHw7Fg=; b=FhgDR3ru+F6U5Klc28oXxldsg8
	RYdKS/fN8Vl5IvgL8KwyKgp9UI0mC88ROjn7vBOG+O4Yvq5hk7n1y9AsotyQ60WlRz8a27JtY0MJ0
	kgaXe/yZ/n21Jf72MTWoIbRId7pKtCiKhCRveMCJAPFJ/UyKcc+twB4/cjCsZHenueTl3Hj+IR582
	KGqk4T09nS65FbOljLRAGk8QzdSBXPt0VyHp3F5dvqU9kfD4ji1k1q7Ui9LPzUP6g1M223Cne1d6W
	3TjNaRt0fRPocZjqJ8wJEj5c2rbUTmv2N574eDnReQAFHCtjsYEM6vnHEbaMa5ra+ALwQLLsozQ5l
	O6Lm5u9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4hg-0000000BpyN-2HSo;
	Wed, 28 May 2025 00:31:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4fO-0000000BpYk-0Dpz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 00:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B16CD43D3E;
	Wed, 28 May 2025 00:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87305C4CEED;
	Wed, 28 May 2025 00:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748392147;
	bh=E0bPhgFZCMLFbSxypsa1RlNtcOqOpu3ifA2g26DwHNE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Mvt8V/XSgOndO9JRXaat6YHE1t041IA5oMiHE63hpIoa4HsXn1/y4iq0b3Pe56mIy
	 lO2iUWG3j+2qOcsa7MgW8VWyi+zqbyDlWQ9popP4I4IoXFhTv1LJ1leKxMGueGsACH
	 3ohC8dYPNzX2D7nNWGZdAf8GsnniLBrrqNBOXM7oi7ssQKITdxkNraZDJM+UDRANP8
	 n9ME5QnqRBmmQv9moKmwXLsZdC0/T2v2Jo1K2pgbjzw51TtwwkcpBVF42zi9R9ig9+
	 ilSrNhgmY28dHR0G2dEhgaeVWnp3vsFe3lgWJg6Bkt6JceINQ/OeuTe9JnmzPThSrY
	 RvQ39MYOzLlGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB01D380AAE2;
	Wed, 28 May 2025 00:29:42 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250527104856.206797-1-ulf.hansson@linaro.org>
References: <20250527104856.206797-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250527104856.206797-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16
X-PR-Tracked-Commit-Id: 36795548dcc841c73f03793ed6cf741a88130922
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 418da6ee1ea62090f6b66d95b8fcf7db2f42c00f
Message-Id: <174839218144.1837144.13413788928509105361.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 00:29:41 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_172910_119528_EC4D5FE7 
X-CRM114-Status: UNSURE (   4.38  )
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

The pull request you sent on Tue, 27 May 2025 12:48:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/418da6ee1ea62090f6b66d95b8fcf7db2f42c00f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

