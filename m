Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8281BEB5961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys6HSmmM9OmO8xt0WTbDHiW5R+c/5jFMxM4CuyTjOCA=; b=lqoWgHZFWJh4de0V8Wka5YRc/R
	gxTOZI7H48NY/KD9zO+IWe9lRHm+RCjkCQSncoo558vcOw/tI3JnkNYzOn8wS+coM9nxRIv5xm/SV
	LZgwRiYOLyN02ajCLqaJ5VJNKu69Gwcajm0FpW5qJM0OFiWu0zHWzBZ0GYCD9bnvEP6R1kKQ+gUw5
	Aj4z7lKK41njDhhSpp0LD3mFW2hDjqwxHwcEHUKbVRHVMjckuConHIbvcfO1SYIyLfatIV8oHGB80
	3Q+Nt/kM/qE3P5PJrcHzm4wfJ9X/jY8t1mc8v5rYaOSik0wELH24kq6HfHnr//aG7dFrwrbmg1+j+
	k0ig6jqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2cr-00000000DzR-1puw;
	Wed, 11 Feb 2026 05:18:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2co-00000000Dy1-2ibs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 05:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 987B543AFE;
	Wed, 11 Feb 2026 05:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76685C4CEF7;
	Wed, 11 Feb 2026 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787133;
	bh=doziiPU4GaF+MOSaYoYSMDV/GysXWiDL2SF/9lPR9WE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A2aKME2PD90cq6OLA+1t09f7BE/PmS3BiLQVAMxw0/c5+acevVhu04Sjx9u+htrZJ
	 4H7tBjq1pbf9/GI/orWZjfOdHF+O9fx17VgyzFCy5+XtyQYpwj1PLUFg1DVTfUJ4C3
	 xLPbB9ChxP2fzp0w6mya9pA9arK0glkjjZaQXtgvRVUMKbseIECqSXT9pcNsGFAdTR
	 I/uXN4Ff0ZffP2mojkCPR8SLPlUeOKUWXzPSbMt6I+CSBmWyPICZ5nQ0tTypzwaRD2
	 4TudLWDptd7J+7bPZV9U35mxCUyZFqbztt/pp71nVbZ4WTMaV3U3fX+qzSC4h0EIfj
	 LdshbKyUeNFig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C2192380AA50;
	Wed, 11 Feb 2026 05:18:49 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: devicetree updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.0
X-PR-Tracked-Commit-Id: f51d34065de4f29fd237276a49cad06ac7356a55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6589b3d76db2d6adbf8f2084c303fb24252a0dc6
Message-Id: <177078712837.18664.14238075137899174735.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:48 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_211854_703265_E97056BE 
X-CRM114-Status: UNSURE (   4.51  )
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

The pull request you sent on Tue, 10 Feb 2026 18:09:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6589b3d76db2d6adbf8f2084c303fb24252a0dc6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

