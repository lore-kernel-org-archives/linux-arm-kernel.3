Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F8CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ48LZbwiuY23ckTuAV9qe+Kj3wR410D+cAQTnDSHI8=; b=DKcDcjXG3ItdcRqL0poYEz4nN+
	1Ckv9zRIwLI+5bzhM9IvzxGVmkRDTANNVq+x5gIhGzCqrtbjlWi+AdaaB9GOGlv36qCNW9vSllanE
	0VciuCvSWyghGUYwCqpgelqm1lX+NQ4n6L2++khh93z9JPPcwqLIosKlX+NNp6nwPAULSkoA6Gx6h
	Mg4Nd7S/wQwCj/xIh8fwj3u4GQh1fQ7g/XW4rE/WYUnljHwE9wxIlL1gTJDtCdBM+aOGGiVzLS+QN
	+LK5syGz5Jr2YoGuoNaxDKRN+keDMZz5GNf4YvVVUvsr/mzBYx4jIQ6/5kPbJwbYnpHMwkfy+BUno
	CNr+xFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwwS-00000002vqc-2ewV;
	Fri, 15 Aug 2025 16:06:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umv47-00000002flb-2bcJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08BFB6116F;
	Fri, 15 Aug 2025 14:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962B7C4CEEB;
	Fri, 15 Aug 2025 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755266753;
	bh=Qjn3miaSSWjGbZifrmCykBjvck0/NI6OeGEqHIax6Ok=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XGCV6epN6MWVCGkmFkMsW+z0RzvdYZBqdSHq3bgXBR/fhWVmsWDMXJxGA9qKE8gVT
	 rGKmP/gPYzt4Pjn1zukN09/LIDEYXwafhcE7EEPZoBsrQT9v4RwLa3MA5CdhidRcMX
	 LnULsQXMjgsdNQZCjznAb5j8nQIRPAh1rSMRdWae0VYIzC/WvXFIk9Wah2lRb994Gd
	 413alaTsJYvr/j/hnxiNEfMm2i2P6gF5adEmzKbRmo66C6b8VyJC+whwRNUGNS/67F
	 jVN9f6KUbBhFMQVuL7WFbi9m2QFeDdtL/4bqrnTlMungTpAdfMd5B61Hov/Me4Z/WD
	 vf8wTQiubB+bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB40B39D0C3D;
	Fri, 15 Aug 2025 14:06:05 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.17-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250815080816.282648-1-ulf.hansson@linaro.org>
References: <20250815080816.282648-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250815080816.282648-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc1
X-PR-Tracked-Commit-Id: b6bcbce3359619d05bf387d4f5cc3af63668dbaa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 66ba63d4d87bb3b1c3b5f0f09610c4c16748bbf0
Message-Id: <175526676447.1083334.1395206172249648683.pr-tracker-bot@kernel.org>
Date: Fri, 15 Aug 2025 14:06:04 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Fri, 15 Aug 2025 10:08:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/66ba63d4d87bb3b1c3b5f0f09610c4c16748bbf0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

