Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D842C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZb6n4JJxvFy+YqRtXxIIRCL8spCokk7cfpz2ttyDOc=; b=to7B8/1ItUf9ckIfuBhP8r11tT
	SbG0T6DvB/PcQtL2ALl2Hwu1tpOkDQeLL/dYOdPbpCiBdtRFxo7xnvMRAMgISE+rcbUhREqY7vk80
	AqoVo1rkF/W7B2ip/bVyYW9S6xzlCnvv0VS/1A+f96mZtC48jZ11l0pPyEES1Mza592jz0EJ9C6FE
	P6rR+T3WRw4DTTB1GFnNjGn8cF/f93RkG+pSoZf4L77Nyeix0F18owtfxDH/uCAO1EQprAJgmAT11
	hKUhYZqv6q8itRij5PxqDAe7KvN0/jDaEVmTX1WI7GciURRuEOktp1cz3Q2C3ALy+qA21AbualKdl
	JEMxyxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIGCx-00000002aNW-35OB;
	Fri, 23 May 2025 00:24:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFnu-00000002XKo-0wkM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9569A4EC26;
	Thu, 22 May 2025 23:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851CAC4CEE4;
	Thu, 22 May 2025 23:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747958304;
	bh=dV3C3FSrxga/xMlaTuycKD+t44FmP/fFjl0D/jaskrI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cMN4/M0uuru6Q0ypAj2/G1GQUL0nJHe940pvPoPvRbBLxllEspVn6vzqTI+Nh40Ac
	 aBesyPoA/iDAau2AaqX3ERK2eFldtXEP9MZouZVX20JzQuNYskF6e4oYLpXtgZ+j2Q
	 jVxqn5MaqMO/g3cNbovljVniBl2UQdEZG2Xe9gL1O1hr7WZsee2tfhm8lDTg3jRHEM
	 ATPGK/xmp3Sl1mnOUTI6NeRLyJI+pKx0HIi6lpnhRC+dXnKFBtd+QcSUmrFWxyXklR
	 JpYKZz3Mdfcpr1GawBrPkGwPO9YitIsGMi+T6ZdtiB2KsqrKaUWo+9LDak41jKlZaK
	 b3QYLbJR0EyQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C303805D89;
	Thu, 22 May 2025 23:59:01 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.15-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250522223843.171621-1-ulf.hansson@linaro.org>
References: <20250522223843.171621-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250522223843.171621-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15-rc3
X-PR-Tracked-Commit-Id: 0f5757667ec0aaf2456c3b76fcf0c6c3ea3591fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 94305e83eccb3120c921cd3a015cd74731140bac
Message-Id: <174795833977.3061927.107906031204643619.pr-tracker-bot@kernel.org>
Date: Thu, 22 May 2025 23:58:59 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_165826_325114_7DB48628 
X-CRM114-Status: UNSURE (   4.31  )
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

The pull request you sent on Fri, 23 May 2025 00:38:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/94305e83eccb3120c921cd3a015cd74731140bac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

