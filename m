Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED0CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/9F/B5Ss3zaf0W3INpg/gGeL+VhwhM/ai/5mapCrH4=; b=TfG73WWm4WY9ci7xEzwlpBj2lt
	kU1RK1z2B4ZppTDNnWnjR31OyF8oBk0ucqbBBT5kkryftffEYdwhKip9k34sp9tKakxmxagsF+f+Y
	EASdEv+v1zv0uBol4e4PBBwn0KxWZBRZvrQ58IssBv85HA9zBiSfCSzG3fu9WKCnwCalZcA6O7orO
	xIRFl+IL/bw8/49UZQrjGhvS0IZME3nsQB4G8K1e7meLpsfJXLyOxlRGTRt3mGRLw+hH8LWAVz/tn
	5BPcfPpfHG6LLgycsMLgVb4g1iEEklnsmHoVNK5cwglI5Mt+TI15o64lK48RMXXpq9myAxDAFoFub
	qNaoxasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIgk-00000007GSL-19cl;
	Fri, 09 Oct 2026 22:03:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIgj-00000007GRj-08oP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:03:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65626423D2;
	Fri,  9 Oct 2026 22:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445871F000FF;
	Fri,  9 Oct 2026 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791583416;
	bh=A/9F/B5Ss3zaf0W3INpg/gGeL+VhwhM/ai/5mapCrH4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nCxs/7FQFsy+yY82EtxBv875G/btrLx0jYz3i9WTE5GXWjBLK+tOYf1irwIEVwdX/
	 8VbkfQSsiMps/JWr7IJ8vMHiNz5/dgbwVz/2/2qkab5emd/BeS+0x3BXZ6mzwm0/ad
	 U6OK0+l7oqblLbhBunt9z0SdQYaxxUtsjXU70DrQo/YX0fIsRHiyrBpNOuAMjtYsoW
	 Nr/pwxIFGAoeCtQ2m/6hOB9+FHDanAne6NxcChAULDkiR1ANpzKNxh59IgUZ4CtQ1y
	 dzlrJjFa0kd8FsBklGhNky8RmCEaTyiiqYLzTnIcATi9F6SYht4ZHcd1UkQkvhfipD
	 EZ9Yb67wUedfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A6973926392;
	Fri,  9 Oct 2026 22:03:36 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <asid3RY1C6mbTvh9@willie-the-truck>
References: <asid3RY1C6mbTvh9@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <asid3RY1C6mbTvh9@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: a9cd14bfb0c113f1cd77be4349784663bec71bb4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9515f634dbed2bb8928fbb3b01102dd4e64f4aeb
Message-Id: <179158341481.1020838.3566467573333418134.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2026 22:03:34 +0000
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

The pull request you sent on Fri, 9 Oct 2026 08:55:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9515f634dbed2bb8928fbb3b01102dd4e64f4aeb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

