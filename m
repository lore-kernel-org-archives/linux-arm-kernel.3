Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAA1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 01:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4REjmunx7hDpwx9OHO2+8yG+89qVoPM0W6D75TmABg=; b=LmoX4n8aekRYivKggTibtK7G4N
	hxwzJ5SGu2AbT8OsB2HtFls7xYsJTo8+H9YoD2s2JSe5Ud38dKlq9oB/cNx+/MC6PeTRQ2WwZe7xS
	0323RU1S91LrTNpUfGt71+iKSpKV2YfWNE0PN9DwdDT9cDuT6qJ1jTITIlacdwsQWmcq755LxLl/Q
	kkEaz3/s2gutvbkhHoMwy38zw1dKGTDdNgVAksd4mSF4h9sE+gBBrom8bH9Oee1maQo5eJeCUVxeH
	zkfVPitnEdfzyc3/pkTJmdGwEn51z5YJpN+KOh0jG7aKY3AEzmbmu0E5FQFw6XDy9Rfp0bbzqwm28
	N7Jn63yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUynh-000000039aB-18eb;
	Tue, 07 Jan 2025 01:54:33 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUylq-000000039OI-2ACp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 01:52:40 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4YRvDt0vHrz4f3lDN
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jan 2025 09:52:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 6EDBE1A11B2
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jan 2025 09:52:35 +0800 (CST)
Received: from [10.67.108.244] (unknown [10.67.108.244])
	by APP4 (Coremail) with SMTP id gCh0CgDHKl_iiHxn3HQDAQ--.39505S3;
	Tue, 07 Jan 2025 09:52:35 +0800 (CST)
Message-ID: <5603f99d-c643-4db1-917e-c42ea7bddfff@huaweicloud.com>
Date: Tue, 7 Jan 2025 09:52:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next 1/2] perf: Remove unnecessary parameter of
 security check
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, tglx@linutronix.de,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 will@kernel.org, jmorris@namei.org, serge@hallyn.com, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 stephen.smalley.work@gmail.com, omosnace@redhat.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, selinux@vger.kernel.org
References: <20241223070650.2810747-1-luogengkun@huaweicloud.com>
 <20241223070650.2810747-2-luogengkun@huaweicloud.com>
 <CAHC9VhRRu-UYEV_-0-QgOZ3ByVwp-ZdEphmsvy4NcdqynH_tDg@mail.gmail.com>
From: Luo Gengkun <luogengkun@huaweicloud.com>
In-Reply-To: <CAHC9VhRRu-UYEV_-0-QgOZ3ByVwp-ZdEphmsvy4NcdqynH_tDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDHKl_iiHxn3HQDAQ--.39505S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UGw18CFWUKF4fZw43Jrb_yoWkurX_uF
	9rArZ7Jrs2va4Sya43AFs3CF1q9rW8X3WrX3s3tr95Wr9xAF1UG3W8tFW8AwnxWF4IgF9F
	k3ZxGryvvry5ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8
	RuWJUUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_175238_877852_C5EAB41C 
X-CRM114-Status: GOOD (  12.66  )
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


On 2025/1/5 10:45, Paul Moore wrote:
> On Mon, Dec 23, 2024 at 1:57 AM Luo Gengkun <luogengkun@huaweicloud.com> wrote:
>> It seems that the attr parameter was never been used in security
>> checks since it was first introduced by:
>>
>> commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks")
>>
>> so remove it.
>>
>> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
>> ---
>>   arch/x86/events/intel/bts.c     |  2 +-
>>   arch/x86/events/intel/core.c    |  2 +-
>>   arch/x86/events/intel/p4.c      |  2 +-
>>   drivers/perf/arm_spe_pmu.c      |  4 ++--
>>   include/linux/lsm_hook_defs.h   |  2 +-
>>   include/linux/perf_event.h      | 10 +++++-----
>>   include/linux/security.h        |  5 ++---
>>   kernel/events/core.c            | 14 +++++++-------
>>   kernel/trace/trace_event_perf.c |  4 ++--
>>   security/security.c             |  5 ++---
>>   security/selinux/hooks.c        |  2 +-
>>   11 files changed, 25 insertions(+), 27 deletions(-)
> This patch seems fine to me from a LSM and SELinux perspective, but
> I'd want to see an ACK from the perf folks before I merge this.
>
> I'll also leave patch 2/2 for the perf folks as it seems largely
> unrelated to this patch.

Thanks for your review

Gengkun


