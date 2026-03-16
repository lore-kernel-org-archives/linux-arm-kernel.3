Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D791AF53D6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWZA42CaVkKNsw7oqTBRYJIAnfV1wG5EnDK0gpaaVVQ=; b=qerJHZxF9I1OkkoCI9bddIvMrT
	DuwQc1GmMj+/KeRO2nHwgO1wIyk831vhPDIA170DK9z1HWEuAD9Jir+ule9GwHPjHSWGP0IqBPkKH
	gbq9P7LFO4poBEad1v4fuNg3MLwDaDVP/JBidY6iE2WdG88TdWQWAPj9+GAwjol0p236uUI2tbhFo
	AZ55snItIAhZoMNXa5RvXPH/mCkx2rei0bjRLMrTnuREyi1saOE+Km82VWvnCrbzhmafQx8RuhkdV
	2f5pseDYFtYTP+bsJtnzEnllMgPMxJokREgHjjlWCp6cTRYDcDcoD37fTEq2GZsJKhVS0gW/FKGDu
	fZlclGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Alh-00000004S8N-04GH;
	Mon, 16 Mar 2026 16:26:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Alf-00000004S8F-2dSE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 16:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qWZA42CaVkKNsw7oqTBRYJIAnfV1wG5EnDK0gpaaVVQ=; b=K6G1bVjy9lLehzJ9AqP1juc7Zz
	DvQ9tZ1sfKZsjTrNEewaDNUmkUTGiFDxxi7vINjYzJMyY0ia4/4d670QPXqcrtz46h2IAhsGvhh56
	+IqOdsWNqL1EIi57ASAXxjyXOOdk6UorEns+f4ZDWCz8hVp4ZDG4P7CdbrIzYYW1o5WUDJxko28Nc
	ilByROiGgay+ZK6hHaepvQSBLLvzHGQe59huI6Mp/mSa9d9y7anPSl17I+OHGi4C2+sVDYjsEjXFt
	5v+xYuyuiPOycrJ+SWOBgu1yJaGSPe0suiQAIWImF4RkOtyQuslxj9r8ZsQEW7COxTHrpT6RhSuaX
	E13HAmOQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Alb-00000007Cl2-08sX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:26:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 245681477;
	Mon, 16 Mar 2026 09:25:59 -0700 (PDT)
Received: from [10.57.61.116] (unknown [10.57.61.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61F33F73B;
	Mon, 16 Mar 2026 09:26:02 -0700 (PDT)
Message-ID: <e2fb2f38-2a31-473e-9ab2-efae8e7a0303@arm.com>
Date: Mon, 16 Mar 2026 16:26:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org, jpb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 wangzhou1@hisilicon.com, prime.zeng@hisilicon.com, fanghao11@huawei.com,
 jonathan.cameron@huawei.com, linuxarm@huawei.com
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-3-xiaqinxin@huawei.com>
 <68add41b-bafa-4884-be70-c03d6ce851eb@arm.com>
 <1a42d502-a2c4-4c41-ba7e-4dc115159ed6@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <1a42d502-a2c4-4c41-ba7e-4dc115159ed6@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_162607_295225_A8428EA9 
X-CRM114-Status: GOOD (  12.57  )
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

On 2026-03-16 3:35 pm, Qinxin Xia wrote:
>>> +    /* 32-bit control registers */
>>> +    seq_printf(seq, "CR0: 0x%08x [%s%s%s]\n",
>>> +           readl_relaxed(base + ARM_SMMU_CR0),
>>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_SMMUEN ?
>>> +           "Enabled " : "Disabled ",
>>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_EVTQEN ?
>>> +           "EventQ " : "",
>>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_CMDQEN ?
>>> +           "CmdQ " : "");
>>
>> There's really no point printing these extra strings, since if any of 
>> those were *not* enabled then we'd have already failed probe and never 
>> created the debugfs entry. And if anyone ever were to be trying to 
>> change the driver behaviour at that level, I'd very much expect them 
>> to be able to be able to read the bottom 4 bits of a CR0 value in hex 
>> anyway ;)
>>
>> Thanks,
>> Robin.
>>
> 
> Since Kunpeng supports ECMDQ(have not been submitted upstream), the
> intention was to check whether the SMMU supports ECMDQ, and the logging
> for other queues was added incidentally. The prints for the event queue
> and command queue indeed seem unnecessary. I will remove them in the
> next version.
OK, I would make a similar argument that even then, it wouldn't make 
sense to expose debugfs entries for ECMDQ_PROD registers that don't 
exist or we aren't using. Thus their enabled state should similarly be 
inherent in the files being present at all (but again either way, if a 
developer couldn't tell the significance of 0x80xxxxxx vs. 0x00xxxxxx 
already then I'd have to question their capability to usefully debug any 
more subtle ECMDQ behaviour...)

Thanks,
Robin.

