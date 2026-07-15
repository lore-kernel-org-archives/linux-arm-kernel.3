Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2608BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+MMF/q5ugX//N+uDMb2mF7BpnfqLw5EsidChlurJNk=; b=Yz9O/suiqTksIX7EHyAJW+r9Vy
	B0dEUHzfnpfIEmDeErs4wJbJJU9kBtpk4HJvXZ8Ykerwg5TzxLRGdPxjMZkpWy/gcJWEfvwtH1soe
	ft5KqX+/GVEcOFN4mbHK+6nrsX3jiNiKYbjQCF66SjE2onfSfY8DzetjJA50gZaVr2ri+y3arACxp
	iO+eiCEm3HlZuUZY4RaNU7shNtEJkocdFTV6CgYezg+mtyi4kBlG3bj9pB3YeaHxCCo3utXuXky/x
	R9x+KdCxsZGxPMZgPAE02B3xW4/Du7L7YxstOXzvyilK/BS0/vmOIRsVpkL892mk2YUlDoYastJPU
	rqShiTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzNT-0000000EtYc-0ayI;
	Wed, 15 Jul 2026 13:10:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzNQ-0000000EtY8-3s0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:10:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D58D1477;
	Wed, 15 Jul 2026 06:10:10 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48CFA3F915;
	Wed, 15 Jul 2026 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784121014; bh=n0euHi7aeJqNwBhSD7TB73ysgzDUw1iWorxwlAz5VXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o/5KglD0KTSzp0M4QeaOlLLOZNxIZUd9caSktdYaqoJe8DivDHhJ5NyHbxwCb3Ukp
	 Y2LWRv0tDCGp1Z/4lsK56fk5ePzkPXxgt0oPiKm1DaPFhVsC30mYl/keR3gaKgtDKt
	 TW/5ONsGYsOq4qiGgp0P5wSvJf13gYhZaqWqzyl4=
Message-ID: <7119d552-f686-4467-a572-11d1616b4c79@arm.com>
Date: Wed, 15 Jul 2026 14:10:11 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [GIT PULL] arm_mpam fixes for v7.2-rc2
To: Will Deacon <will@kernel.org>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Guangshuo Li <lgs201920130244@gmail.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Andre Przywara <andre.przywara@arm.com>
References: <1d22f80d-34c0-4e8f-a9a7-3c527fb97232@arm.com>
 <d39e20fe-e4ab-4bbb-8e97-b68400ece11a@arm.com>
 <aleEkbcWsYdZPgtW@willie-the-truck>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <aleEkbcWsYdZPgtW@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_061017_095158_78B85B37 
X-CRM114-Status: GOOD (  19.63  )
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

On 7/15/26 14:01, Will Deacon wrote:
> Hi Ben,
> 
> On Thu, Jul 09, 2026 at 05:23:38PM +0100, Ben Horgan wrote:
>> On 7/9/26 16:48, Ben Horgan wrote:
>>> I hope this method works for sending you MPAM changes but please let me know if
>>> you would like them some other way or I've made a mistake. It's not a signed tag
>>> as I still need to sort out my GPG key. The change authored by be me hasn't got
>>> an Reviewed-by's or Tested-by's but it's been on the list since the middle of
>>> May and James is on leave.
>>>
>>> Fix the reset values for two MPAM controls that are not known to exist in
>>> silicon. Fix a NULL pointer dereference on the driver teardown path.
>>>
>> Sorry, this is a retake. I forgot to add my Sob on the patches.
>>
>> The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:
>>
>>   Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)
>>
>> are available in the Git repository at:
>>
>>   git@git.gitlab.arm.com:linux-arm/linux-bh.git tags/mpam-fixes-7.2-rc2-RETAKE
> 
> Thanks, but I'll probably just pick these from the list given that your
> key isn't sorted out yet.

Ok, thank you, is there anything that you need from me for this iteration?

> 
> In future, it's probably easiest if you go down the route that James
> used to tread where you collect the mpam patches up and then send them
> out as a series (with your SoB added and with me and Catalin on cc) once
> they've been reviewed and you're happy with them. Then we can just grab
> 'em that way. I think that's probably easiest to start with, but we can
> revisit it if the number of patches becomes too much.
> 
> Does that sound ok?

Yes, I'm happy with that.

Thanks,

Ben

> 
> Will


