Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE7CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1Dlk7t3CGGAnHWGGA0QsKQQaeWoYRka/VURIXuvDtI=; b=y48Q3+qKKv7RnEGsh4ix0iCR45
	y8HISytxUPuy/dUJKAJ5sFTC6b8xP422HsN5VSB//FWWCo02Aqz4Q/x9qccp/8DHkFxYIgfA2GrSS
	bn4MimscUR3o2LNofjLfvXvCftByC7wIHiTeFHkq6F4wAYgvfwlWZBjjIcplbFRqhCugRlwv9Ounq
	MhviT3gKrdJCHh0pOGLMa7Mhp3pg5YL7IMiR1YS3J5HASM45ebsBpJnyoSlhFrrXuhoaZf7w21LNB
	POrHS4PRZa2hR+CFBbyGf4lOKZcjgKWjyAqZbFKDCfd4Gb8f/aZaI2pcpqmk2ehjg2rosW/8Eept3
	Tf3NnhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6BM-00000008TJz-21n2;
	Thu, 21 May 2026 16:23:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6BK-00000008TJh-4AWZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:23:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE23760098;
	Thu, 21 May 2026 16:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855761F00A3B;
	Thu, 21 May 2026 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380613;
	bh=f1Dlk7t3CGGAnHWGGA0QsKQQaeWoYRka/VURIXuvDtI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BJnjRqYg0vOY2U8MqPwjcGUSUJMke3BWQGRpCJ8Wp04j3Ew7QBSfu23dGm3f98Yd+
	 KZvxK3FOXhctSlY0KVHO2xQ6EUUiqMmfNF+9T7shzBOZg5CVuxQRz3T51BO6TM+AVE
	 nd7yFnZ3OnfVF9UkaJq0DOU6TwmNQG0nrWkqxOdJmmFLZti2355tJqXFIf+BbyNWUt
	 ABe2BqPG1z/EKWzN8TqoFByJO6PcGe6CXDAnMRyovxJSrB8JkByxZ0yjY4WqOPHqsW
	 QgIzxOtJldY4HOLBLo7bXRMwF65Mu2u7FXR4JDj9C2c051mXMiVRx7cr7GYsBQrRCq
	 PbbXElSl3eFSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B4D3930E0B;
	Thu, 21 May 2026 16:23:44 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
References: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1
X-PR-Tracked-Commit-Id: 1fcf4149418e7a8f8253dd74059d56340795503f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd3802fc4f6b52201a93330d44981a66bd6ef883
Message-Id: <177938062308.406099.7581855805759436158.pr-tracker-bot@kernel.org>
Date: Thu, 21 May 2026 16:23:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Wed, 20 May 2026 23:13:35 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd3802fc4f6b52201a93330d44981a66bd6ef883

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

