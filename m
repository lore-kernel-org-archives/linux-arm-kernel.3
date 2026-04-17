Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD3F8E4A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 04:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=466MjUE6t8i6ooekGi1yLUt621q69WwM0HGSG4pczwk=; b=pmoZmGHQl1CnTIc/tiXlCwhB/4
	MbyikPw4d1ki/gUDu/sO79joKnlPCCpXDEzKpZs5064KYTMErX1+O3T5j8mLjj6RzOSgOyfsGpBLy
	ytCVidjwtuvwOak0DSjHkYqfFaPzJuRTPXAHjkiLA2jbN2o9ZWMI+UQOQEwcAtqrsoHLRTcYj8fDB
	ZDJ4Bge3NPk7DxPbe0hSmBPFSDKzdvlVsolFMYpV0q4TfIxvdrgYuaD+2yb6UPk/kIw9F3L/tyB5O
	bezVYxe+gKuqaFEfzC7w9m5N7yqxSeH8Nmx2I/pgiJfcHTryORy5J7UOgXPcVwiLurovlcEQOvpce
	wHA2Z1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaY5-00000003PR4-22vQ;
	Fri, 17 Apr 2026 04:11:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaY1-00000003POm-0kbL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 04:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1671943CAD;
	Fri, 17 Apr 2026 04:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCBFC2BCB5;
	Fri, 17 Apr 2026 04:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399075;
	bh=E10JRXjAArC+gw4mkvjfjJvB3Q5k9wQg/kwMVF+t7Bc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fQoU9OjHAvYMDxJlSua611Tvx7NPUOmZld4QCaCJ8+ihiura18U65m/5uHmhctiIq
	 m9A501lQObfmXmX29pG6HnMib1HGHgk5VAvnQYGfPeFvmO3tGgzIsqfNaM/8legy/l
	 e6GlTD2A3Ptc6I7/9SqqhVS2CY7kakedhKsltxCsJhuCv3zuJK3xExMer7vuXhHOWo
	 QvNIzJh/i7CZP0FG+1FziYpiqiMLQ53expQ7ayC3hO5GkBIlt2WKKWYpZCjAyb8aeC
	 1pTmNBAvG32FtESh8l6gA1D9MEOI1CrElAmxB9ypxbL1smyRtDp1QjCM7OYWEEaQVC
	 r/WLV5OielAdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 413FF380AA7D;
	Fri, 17 Apr 2026 04:10:44 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: ARM code changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.1
X-PR-Tracked-Commit-Id: 3ef628c3f37f1dcef0da51e73ad6e458ec74bddb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8242c709d4ba858c483ef7ef3cc2dc1280f5383c
Message-Id: <177639904300.3519243.17509720046680609301.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_211117_269181_83E4EB31 
X-CRM114-Status: UNSURE (   4.35  )
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

The pull request you sent on Fri, 17 Apr 2026 00:31:18 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8242c709d4ba858c483ef7ef3cc2dc1280f5383c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

