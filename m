Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2DDC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 04:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp3WBKOzHKmgTE6M5HyuCb2gZ9euj4eaADJIBWJxHCY=; b=4SNJwQgUJMXzvIf3pqhK0gZRmW
	ULC3G1kG/Kg/giIiLaaBqJ6MBixadT6aauXJUjPjn9VovWQPqbEmW+sp4nqRZhj8kADeqFZKdqzTr
	u098+ggTcCItxEnHyGPuyEjWevw9oo+rXt7d+W6tMaQDkAVPMxhB+rNaQNhDNrDU7HAm55CRMNBRU
	sI2lgHN+mMqohA082huuVtCdRUjpHOFCtoCosj9YCm8SIRb2oQd29ocPh4rRs+iSc6z7ItCAd/yuA
	PK4M47/ie+eQH4BRSJGgplWJWnysLyPulkQWMCXFiIeTATTIKQ1Gdi9nbS3LwBpL3idmlz1i21A2m
	mAoBs8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txHx9-00000007W5g-0tfQ;
	Wed, 26 Mar 2025 04:01:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txHvM-00000007Vrg-3xRB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 03:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17688A40DB3;
	Wed, 26 Mar 2025 03:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF8FC4CEE2;
	Wed, 26 Mar 2025 03:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742961567;
	bh=/Hb2X44wCGlpqWtNyNnpAgAmYAQM4rIbH22zKTGwyUU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=awi9WUYj7LbgW9dv14eLJTfP71YHNErrgaEqNXQS8z6naZY4Z7UkbehhcW+/7DCsR
	 j/s7Z6+AB1k6Ddpkx3beluyTd5x/jAUpDeRYWLwK3co6AwegYZt8I+Iq25bqgLi6W/
	 Q8caYl9Oa6Uk4ud7F+J4J9QD4O9lJisWv0pvnnLz/B6AipmUInw9PpZm/GMvd9ePKW
	 7urBJWNCejZMQ20R6IDOCks+CJwX08b5/AY52Ft+QP1hbi4X0Qh3Y6R60znsKsai0G
	 cXWE2USWAO6/6h5PqvWTWlOOPzgOqoWLQyh9A1/ozWc1zemEmo6d+H8a5SjDgIQSFV
	 HRWSuu6H3K0fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E16380DBFD;
	Wed, 26 Mar 2025 04:00:05 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250325121455.36031-1-ulf.hansson@linaro.org>
References: <20250325121455.36031-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250325121455.36031-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15
X-PR-Tracked-Commit-Id: 51f0b8911ec4355cea07b180f6569cc52f65aaa8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a2274e90a76c24a03287e386f1ad128a8cc3b67
Message-Id: <174296160392.837738.15080100171525024181.pr-tracker-bot@kernel.org>
Date: Wed, 26 Mar 2025 04:00:03 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_205929_042419_3852C43D 
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

The pull request you sent on Tue, 25 Mar 2025 13:14:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a2274e90a76c24a03287e386f1ad128a8cc3b67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

