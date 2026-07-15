Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F732C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yomLt5MYeBxxDvtOrB2iJXb6Q+rhw/2kN+Xp7CuMTK0=; b=il9Xb1cHq/YVw5czil3cPI9RIb
	cWPs9PrmYOHh4exSmZFQwlYSufTCyKlohYgUaTk5sSoENlJTKZxFfdxMy2ittXtN9LYnS4TEXm89O
	BPY6yxv8FVSBFBw6BoLXCTiualdR607WfHpSFc/8h4qErOOZcTTvu1qy1ByruphuN7hpgN+F3ucK6
	A9pVy5RTrwTxSR/8AZN971jWOiZk8ZijSWb1SHzP8rEKjySrYMwCvROy1RjcrNQsDTk9eFF71/174
	xLbvmpds5A5P0QgH9m0rNHNle/j+q0Z1jXeBQiH7D5rzjMaI9X+xTR7Ub9FBTFKHs36VIdgnXFCni
	aFsNwaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzEc-0000000Esca-3cxA;
	Wed, 15 Jul 2026 13:01:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzEc-0000000EscS-0VHK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CACF142A02;
	Wed, 15 Jul 2026 13:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6F31F000E9;
	Wed, 15 Jul 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784120469;
	bh=yomLt5MYeBxxDvtOrB2iJXb6Q+rhw/2kN+Xp7CuMTK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUXWYJg0hSRTg8is3/pkFQSP6N7vN4SMoHhTbFl7n8KL5p7op5sqqQB4CndiUvSXg
	 UJeUUkwp/pIncdHUrZ5+30xi8M/8MLnBxpMhRZp+WAPU7b3lyy1D/suZZEjKgt4j/U
	 8wenaMQd8eCOqj+ujwl6jz9HEHDN9xpOwIKRYBSqEJTLNSCOLYjUuAJ1EVLE+W0BPi
	 EHbxnebk5uGSatiLdawl1i0me0Fxs1/SzBAsgxplOfCH2Zhr6oy8t3csqQVW+jePLu
	 6yyeCENQA+wxrWN+64GK3GRtLjX65UtZhxsneP6UEpp5IlxjxEg5WVhOayULgZZvcV
	 e0CFrKFSdtPiw==
Date: Wed, 15 Jul 2026 14:01:05 +0100
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [GIT PULL] arm_mpam fixes for v7.2-rc2
Message-ID: <aleEkbcWsYdZPgtW@willie-the-truck>
References: <1d22f80d-34c0-4e8f-a9a7-3c527fb97232@arm.com>
 <d39e20fe-e4ab-4bbb-8e97-b68400ece11a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d39e20fe-e4ab-4bbb-8e97-b68400ece11a@arm.com>
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

Hi Ben,

On Thu, Jul 09, 2026 at 05:23:38PM +0100, Ben Horgan wrote:
> On 7/9/26 16:48, Ben Horgan wrote:
> > I hope this method works for sending you MPAM changes but please let me know if
> > you would like them some other way or I've made a mistake. It's not a signed tag
> > as I still need to sort out my GPG key. The change authored by be me hasn't got
> > an Reviewed-by's or Tested-by's but it's been on the list since the middle of
> > May and James is on leave.
> > 
> > Fix the reset values for two MPAM controls that are not known to exist in
> > silicon. Fix a NULL pointer dereference on the driver teardown path.
> > 
> Sorry, this is a retake. I forgot to add my Sob on the patches.
> 
> The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:
> 
>   Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)
> 
> are available in the Git repository at:
> 
>   git@git.gitlab.arm.com:linux-arm/linux-bh.git tags/mpam-fixes-7.2-rc2-RETAKE

Thanks, but I'll probably just pick these from the list given that your
key isn't sorted out yet.

In future, it's probably easiest if you go down the route that James
used to tread where you collect the mpam patches up and then send them
out as a series (with your SoB added and with me and Catalin on cc) once
they've been reviewed and you're happy with them. Then we can just grab
'em that way. I think that's probably easiest to start with, but we can
revisit it if the number of patches becomes too much.

Does that sound ok?

Will

