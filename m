Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D19C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il/pw1gjlA6IJ+bL+PE9tys0GZUYbeb+B2TCpKOjtck=; b=aSaYTxL0wfyNLcShQFU0BUmy5c
	FKFHOO0QUlEV8Hgq402mJAiMkaX5rCjjpp+XcXzUwKjvBWYDb7QAbvSyecV0tVy1IW9CvrMx31I87
	u1OoRZYntJfjTwMZQoGiiAbvbN9ispoGI8+87UjYutrVyILvsOoB0bWOGknlV3p/Ar7uwOlLEM8y5
	j31rHaHs2O57QVX730kbyPC0PMhu+JjwaH+PUel0SrqKj7IQLlrt4apElrApcTl9ywGZ7ubHsrREI
	uqiz6IVaCvz+EmdrNQUSo4yGaDeI2S82o5+haYEsX97LWfz0Wg5NVskBgeODXoG0TsMLIfP3NY+4u
	qsREW9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrXO-000000031zE-069e;
	Thu, 09 Jul 2026 16:23:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrXM-000000031yD-07s5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:23:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FB681477;
	Thu,  9 Jul 2026 09:23:37 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44B963F66F;
	Thu,  9 Jul 2026 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783614221; bh=6Ardmp1BWBbUyRv9HrIJJzy1zpSsSXEpkvvSQ+j65m8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ak0GC+lo9rCJl6FwV7OG1b1RK702+1p5bWXAIF1j3vKEgWOyQ0xxBouJYGrAAWAjA
	 MgjiRT2LsXj/PRLv6+94U+NInOfbW43kcanJEByoLs1kY7o9zWMuuBivPz/50xKgDo
	 xHDf2s3ZjQcq2hBCuVudq+r9hGTTqGABMhH4JSRE=
Message-ID: <d39e20fe-e4ab-4bbb-8e97-b68400ece11a@arm.com>
Date: Thu, 9 Jul 2026 17:23:38 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [GIT PULL] arm_mpam fixes for v7.2-rc2
From: Ben Horgan <ben.horgan@arm.com>
To: "will@kernel.org" <will@kernel.org>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Guangshuo Li <lgs201920130244@gmail.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Andre Przywara <andre.przywara@arm.com>
References: <1d22f80d-34c0-4e8f-a9a7-3c527fb97232@arm.com>
Content-Language: en-US
In-Reply-To: <1d22f80d-34c0-4e8f-a9a7-3c527fb97232@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_092344_115293_C3BFD4AE 
X-CRM114-Status: GOOD (  14.71  )
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

Hi Will,

On 7/9/26 16:48, Ben Horgan wrote:
> Hi Will,
> 
> I hope this method works for sending you MPAM changes but please let me know if
> you would like them some other way or I've made a mistake. It's not a signed tag
> as I still need to sort out my GPG key. The change authored by be me hasn't got
> an Reviewed-by's or Tested-by's but it's been on the list since the middle of
> May and James is on leave.
> 
> Fix the reset values for two MPAM controls that are not known to exist in
> silicon. Fix a NULL pointer dereference on the driver teardown path.
> 
Sorry, this is a retake. I forgot to add my Sob on the patches.

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git@git.gitlab.arm.com:linux-arm/linux-bh.git tags/mpam-fixes-7.2-rc2-RETAKE

for you to fetch changes up to 9f1ff4625c7f84aca8f0fb07949ef8870ed31a3e:

  arm_mpam: guard MBWU state before adding it to garbage (2026-07-09 17:09:53 +0100)

----------------------------------------------------------------
Ben Horgan (1):
      arm_mpam: Fix software reset values of MPAMCFG_PRI

Fenghua Yu (1):
      arm_mpam: Fix MPAMCFG_MBW_PBM register setting

Guangshuo Li (1):
      arm_mpam: guard MBWU state before adding it to garbage

 drivers/resctrl/mpam_devices.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

Thanks,

Ben


