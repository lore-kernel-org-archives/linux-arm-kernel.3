Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF84CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5eyyeXmxov0pJmfjTMnPQ3uT+2BVgUe7+2fg1pxHzM=; b=zE788vJPkChHt/Yr6GwISzhGO4
	H788TGJN4nI1vUiLIJS996oDXJtE1wIrdkBYw2j0SlLquPUAs5JqBq8rcNoVaqM9eMvTvaWHHKwss
	iAZzWnljpvPCcJV9WnbAXGuwbsY/S5Umk6J1pf1QaSsISlGdepMIa+ZDOVjGcYTkl9RKoST/P3cVx
	TWgKOJdZ2cVFhrj2tmkiUWENhHMAmChafByUNbXIVGqvtnJYRQQBP9TTrkgJaBjxUu/VGJiayieDQ
	qQ93PksiFW5vWRvSnM4C2PCookyGn9bO8vlg2dQ2VKjt4bKAcqCWzh/NcEdxOWpi30eQmOBAECxx6
	e/B2oShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NMG-0000000GmdQ-3BGh;
	Wed, 24 Sep 2025 11:08:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NME-0000000Gmbe-0TSO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 11:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04E1543E8F;
	Wed, 24 Sep 2025 11:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBC9C4CEE7;
	Wed, 24 Sep 2025 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758712100;
	bh=UVdvU8q0Jz7tDP3BoIFHpKaRsEOydl+T2NplYJMmGEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJxgV06+VcUV+kq2ZBzbV3EFFuJGZ9cu8Liwcm6UV4+jqduqDgVTAkaKcP2sXy4/w
	 TNwLgbTBJkVOoP8KC6LVAlqUljqLasf4JQ3iJIiJMKVA78qyof0LtHJCND/MYpY4GP
	 XGoyq8DmVe2ToaPnF36g/t+pAfsrIKfLeVoLbWVw=
Date: Wed, 24 Sep 2025 13:06:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, leo.yan@linux.dev, mike.leach@linaro.org
Subject: Re: [UPDATED] [GIT PULL] coresight: Updates for Linux v6.18
Message-ID: <2025092446-spinout-paramount-a27b@gregkh>
References: <2025092306-foster-outsource-fb07@gregkh>
 <20250924082242.2306143-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924082242.2306143-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_040822_172348_0E74B49B 
X-CRM114-Status: GOOD (  14.35  )
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

On Wed, Sep 24, 2025 at 09:22:42AM +0100, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the updated pull request to fix the invalid commit reference in
> the fixes tag, in the original pull request [0]
> 
> Apologies for the inconvenience.
> 
> [0] https://lkml.kernel.org/r/20250922125907.2268152-1-suzuki.poulose@arm.com
> 
> Kindly pull,
> 
> Suzuki
> 
> ---
> 
> The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:
> 
>   Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)
> 
> are available in the Git repository at:
> 
>   git//git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.18-v2

That is not a valid "url" to pull from, how did you create this?

I've added the missing ':', but you might want to check your scripts to
verify you aren't doing something odd.

Pulled and pushed out now, thanks.

greg k-h

