Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1765C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 23:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wjR9zLGEuwADHwLW8D87R1EIdeNzJ8O9y9qn/XTXfU=; b=QdpZIir9zWQ6RxYOi1hUdZ4ZG9
	pd87DMjaV1z9YxWkKp4ecm3oRr4iXOGQT7eXu3bdVO1c5znS0KQemrc1kR+CTNLHS09AqyBz606HW
	cUK5ajAb6/Rz92CT8QkCXF3er369S94s3RfsEb1RoBiIc8Bf/6jjF030vvjBEAS7qL/xO1o8fLD29
	52HJdtNUkopnWxMPaaCLnXnvbXJFfYv6PHfgwjSz6o2yfrCucksoo9u0dOk/ZF8lDyO3VZL/Z/QrM
	8anF9YF4nMNzTcFpfdEXw+dmp8FBKML+dZK/NkiksMC7gQg6lTKZSJ8GzG0tzOjO1OEa24rYFAgfI
	wDfrQ8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYw3f-00000001ZY4-2Ko8;
	Fri, 17 Jan 2025 23:47:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYw1e-00000001ZFF-13dQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 23:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70F875C650A;
	Fri, 17 Jan 2025 23:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB3FC4CEDD;
	Fri, 17 Jan 2025 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157515;
	bh=E9IrZCNW5TNGtWQecUFDDhNAWcarWOpqvBph1gyQE58=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oiDVQqUiYilFo9xcKPBPyxOXsMAlrWkAvKDbzguH8buHQykPC5S8FO098aef6DLZ5
	 A91GXVeRzAX7V06jFBPL/dwIv301VuMTpNsnQYOOwcXa6acsWX0RZLDq4Ep0mPANoY
	 xfoPwWtjTZ/rH9OSvrt1fzhUSu37ZsMAjnANuxZM4dHEFlofkSJ+kllRYilw8ayUoI
	 H0MJpBnHtTw0prOPUad5WsUtR28iFEFg0lXh6MyD/gVYViYWmkg2OoMe7ZcFotrgPF
	 Fp4dpK9k8FF2j3q4+EuvT4LYqZRwft3IixHalbQXQvGItpE4+IfM9Ky5BkvWY9iSAw
	 g+7tH22vGwAYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C19380AA62;
	Fri, 17 Jan 2025 23:45:40 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.13-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250117115020.131731-1-ulf.hansson@linaro.org>
References: <20250117115020.131731-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250117115020.131731-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc2-2
X-PR-Tracked-Commit-Id: 726efa92e02b460811e8bc6990dd742f03b645ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b040f0abe6d19a14306d276a26a033f5087f2fa
Message-Id: <173715753899.2291664.4937301036934590099.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:38 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_154518_367684_F17A8504 
X-CRM114-Status: UNSURE (   4.23  )
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

The pull request you sent on Fri, 17 Jan 2025 12:50:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b040f0abe6d19a14306d276a26a033f5087f2fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

