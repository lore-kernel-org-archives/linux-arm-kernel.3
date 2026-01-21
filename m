Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD67C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edZp1aoo/YOFkLzaA5PbV/Jic1P/IosULZVK4bYG4io=; b=pRB17sqzoCrjbq/+o1ZMxed0UZ
	FoSnY5tGZmXdDzyHV7kipYWw21wscuD1YxrVh6y8KngD0ZlSLBr6Hp8Cn62XEBEP63ChgiOvdtG2t
	F0FzqwYL2q3X9WvKVUwj74X0kMkKb3h7MnJbTannk/dfVBX2ZE01I4BfLu24frV+apwHIYY5HYB0K
	mIy5BRcN/SK7Xl8NKZhfVWT+5dJzA6Hx5POl+4oOz0jYydRFgp79NGJn/DC2DuuJveuDYLdcRQQC/
	SPe5XGgz2nCctK+joQzqehpJ2+9vOZ+y3JYaJ4oHCHg6HD8sZueI4UKlLq+MqIkavUmKmLeOaOiv0
	9GjgIh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicps-00000005vEc-3hpf;
	Wed, 21 Jan 2026 18:21:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicpq-00000005vEG-0xpV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 18:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A19DD44485;
	Wed, 21 Jan 2026 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85668C19422;
	Wed, 21 Jan 2026 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769019700;
	bh=kdGbKUjg7HDZv9Xoxtbh3+nHI7tolhaWZdYz8UEZvEk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eQrDVeED66DgA0dTt7m5pghFcvKPl5+Afmn4NDSo2QHva8ILvHBUygmuRlRhMrwuo
	 xN+NyooPMj7DQkim5oe1PnK+UMKL+/2J4xMLDyW/5ITm1X5H1DcNU4UO2xekKGQ69k
	 RoExbsY/4huS+dmWes8VPKxFRqhdHfNd2iGXR5ByVkrWFUnBM3xQTIF2l6Uc3SLRRh
	 h1lCwL5j871AA91rm+PwWbMaHbCznfNNbFZwz1TiLhPPbeeAjYyrtaMVLSInIRpBcE
	 s+LYFbMFbXiAVg8Bs1gvmRwuTYJ2fbuvBfydw1GTJUOet4FKzKN4pdqi5J3dniZo9G
	 qhGvRhZgNkXhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8EEA3808200;
	Wed, 21 Jan 2026 18:21:38 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.19, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
References: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-2
X-PR-Tracked-Commit-Id: 0638dc292e54ba0cbcb1ff81af3ca52d3bbfaf54
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf38b2340c0e60ef695b7137440a4d187ed49c88
Message-Id: <176901969746.1402269.8266620976533586622.pr-tracker-bot@kernel.org>
Date: Wed, 21 Jan 2026 18:21:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_102142_306062_47CB3619 
X-CRM114-Status: UNSURE (   5.02  )
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

The pull request you sent on Wed, 21 Jan 2026 15:55:32 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf38b2340c0e60ef695b7137440a4d187ed49c88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

