Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE15C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyNcX9OUtMhOcEQFyBSgh8i1Ie6T2QMgkGLlHuu676o=; b=xNDF9U8aMOOQRJ2kpq2S+jfmeO
	UeqdoTAB4pC+FjX8dby7U2dvnEFasQygwVF1CyFbliRmdiU5PYJFxJ4G4nOmH4qwKwt4JDbB9dOm/
	ceWXc3WRaScWWbpoANCWpa0V/G6nrJPigKHNaT6jzimyQ0CZRYdVCc25iMXEVX9UbDHDEbRnxJww4
	d6pzakQgiIYZQZM5j+BF6mKn9J5QUSVMSAMAhYJZQ8JMK9t+/tDx1zmrCMZfkYjUGBU0xIQEC2jL3
	B8iwC2v8KGITcDnyO5uI9JQ4LrsWxQ5AmuygWGJgVUZqwi2CmjnZ4wsvXRN8opeT6VoAOglfA7+WZ
	9WT5YlBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bew-0000000F40G-2rXT;
	Fri, 18 Sep 2026 16:41:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7beu-0000000F3zR-0KI9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:41:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FB55416D0;
	Fri, 18 Sep 2026 16:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9771F0089E;
	Fri, 18 Sep 2026 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749715;
	bh=IyNcX9OUtMhOcEQFyBSgh8i1Ie6T2QMgkGLlHuu676o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CI75iQh8jj6GwZeWKpSUrh2UTMeXeF7ZRQgqtWtUvkAlniCLy1fdcsx3ZxtPLTx4E
	 4ZNuFKf7QL9E+M7hE3H9py72DcD2wkiN9YuQ7SAlF11yuu6xkgFBCpX0LCi3Qrx2Ih
	 M1wvno79JbqgGCYsoKWj8uLmlHAS0AJ0DXDXP+BSZFUrDNSiFbjnMVS6YCo/nyx7oK
	 HEEh6KjTtTp1xtnf7CAZbdhPufBqVIoZkgcRIKqO3r4UauoKOC5r7uY5N8S6+iR/bc
	 zLOCXFOoJYU4/bL7IY6E91n2Rx2iZbpZLN34lI5n7+8BvoF1yC5wBs0NT9RSF4Kp+v
	 X6Jx4V3fupEQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C0380CFE4;
	Fri, 18 Sep 2026 16:40:49 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq1SSMDovHJhKmwF@willie-the-truck>
References: <aq1SSMDovHJhKmwF@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aq1SSMDovHJhKmwF@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: fdb9ebc7fb7788b8371fbef6c17dc5c8291e1429
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a077be4fde21ee6e751fa70eb641ef5d9bf2fc48
Message-Id: <178974964812.1040423.4048897901383038528.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 16:40:48 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Fri, 18 Sep 2026 16:01:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a077be4fde21ee6e751fa70eb641ef5d9bf2fc48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

