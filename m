Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5CF364BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIb/VwDwwjtrsy9KSGb2BbDtj7fRV/YNvhTtrg5QCU4=; b=1TfZ7bd9JKSI9KZUA+d66jTblm
	0RYUpXhSsHmcS1lJSZ8i/y38hvDZaNZYrnfUbdynyrpKeTTIy10APTmi/OoJhDcaR+Sr3gz/+S0N6
	blbEn5v0OJiC9KF2fkwtw4fEE+ZHX3Sb2oSs5wjJbCWL9GZZUwmtFQEKkU245wHgiEWsVtuOfFPku
	XOye38ou55pv+hIW5H8Xa8oRJRmSpf4pUzVdopnjMUc+n/yQUGLScmiAlAL18doTXryIos7yyOK2a
	HBIY2zvKalVpWb626VEMm4n8Wwdj4lsqMnKYOF7mo05oMjg8Ty1exq5aFSTAEC4+fEn7eAlK8gwIj
	ZjkeyhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwRW-0000000BCZ2-4Anv;
	Thu, 09 Apr 2026 20:57:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwRU-0000000BCYa-0Nqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 20:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B360540A45;
	Thu,  9 Apr 2026 20:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F4DC4CEF7;
	Thu,  9 Apr 2026 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775768254;
	bh=54kvRZ2rkbOuxoiopOrDDDHNsJgHFcyQMKsLi84Ficc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=a03kBB90ccj37LqtMgwr2DHZjyp7wFXZ9NvaB1hzV7MIK3Z9YarsKgJwyXbw1Fqea
	 X+Mlvtw69B0CA5GJIOh9WmjEJjPoGRgwgyCKxjIEnI5iXKkxHl/HAlOlOo0hK/fuvm
	 zcbde3nOhmb0+7WAViJFO9kb40kS1c3CYaR/WFjboSsQPH0Z6N85oxJeIg+2CzrofC
	 oqLomfGcBGL1xnWUQKmqi6n2UjFZiiVUviGUVMH/fsrLI5h3U+SYYTAsWaIdyjaTvS
	 +nNlRDGaBWWt91goCnUFy+i8JtUbFEuG/H5WySWY3LZkDJdzDJPJLeWRjb/WQ740f1
	 lrtpAPU1nMd6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF9F39308B7;
	Thu,  9 Apr 2026 20:57:11 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.0-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260409150950.28527-1-ulf.hansson@linaro.org>
References: <20260409150950.28527-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260409150950.28527-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc6
X-PR-Tracked-Commit-Id: c2812c0cb909211a1d2e7cec862406e32833b9de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d58305b2dbe3434c9b21ede210329b97c44ee9e8
Message-Id: <177576822986.1737704.17369808610359378593.pr-tracker-bot@kernel.org>
Date: Thu, 09 Apr 2026 20:57:09 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_135736_146628_70EB2E10 
X-CRM114-Status: UNSURE (   4.61  )
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

The pull request you sent on Thu,  9 Apr 2026 17:09:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d58305b2dbe3434c9b21ede210329b97c44ee9e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

