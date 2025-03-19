Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B506DC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmzmDF0sGLr0p+5LIzJSRYR6K/ZAzNmiLj/JcO7Tsjc=; b=KXQWoyBuj4AaK33U5S1FjrWlTs
	/daatQgk08JxUfGrGVBk6NPoaxBSPPZ2VZ1F/vtClDBIgJeZ3q5L578W/NyXZ0RHSBNjRQs3ksElH
	8lgpihg+Exlkvkr8OvPSLOzGqfTE5kxcmjgYEIKe9U3DlmWtBUiI7FiFmYia82j53tQ0+Nls25+AM
	/tVqE11HCFRwIekX/iDrUPd8a4gJXqFxwnJjrXSgWMxFdbLlkysUvBh7F2fLfX/l6EiGes1VXvgv2
	FG1h3GQUD+VHSEq0kQM8c1yXN5xW2/BgomU4avosrrn5BPfPuOLwFpeDD2BXKwc+7CAenaGhebJPs
	ChF2787w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwUv-00000009a4X-1nXo;
	Wed, 19 Mar 2025 16:42:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwTD-00000009Zlf-27mq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:40:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 317DB113E;
	Wed, 19 Mar 2025 09:40:50 -0700 (PDT)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11163F694;
	Wed, 19 Mar 2025 09:40:36 -0700 (PDT)
Message-ID: <83cf1b26-3a30-47fd-93e9-84903193bf07@arm.com>
Date: Wed, 19 Mar 2025 11:40:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] uprobes: Allow the use of uprobe_warn() in arch code
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mhiramat@kernel.org, peterz@infradead.org, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 thiago.bauermann@linaro.org, broonie@kernel.org, yury.khrustalev@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-7-jeremy.linton@arm.com>
 <20250319145057.GA10753@redhat.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20250319145057.GA10753@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_094043_592857_AB8C676B 
X-CRM114-Status: GOOD (  13.84  )
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

Hi,

On 3/19/25 9:51 AM, Oleg Nesterov wrote:
> On 03/18, Jeremy Linton wrote:
>>
>> --- a/include/linux/uprobes.h
>> +++ b/include/linux/uprobes.h
>> @@ -185,6 +185,7 @@ struct uprobes_state {
>>   };
>>   
>>   extern void __init uprobes_init(void);
>> +extern void uprobe_warn(struct task_struct *t, const char *msg);
>>   extern int set_swbp(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
>>   extern int set_orig_insn(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
>>   extern bool is_swbp_insn(uprobe_opcode_t *insn);
>> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
>> index b4ca8898fe17..613c1c76f227 100644
>> --- a/kernel/events/uprobes.c
>> +++ b/kernel/events/uprobes.c
>> @@ -118,7 +118,7 @@ struct xol_area {
>>   	unsigned long 			vaddr;		/* Page(s) of instruction slots */
>>   };
>>   
>> -static void uprobe_warn(struct task_struct *t, const char *msg)
>> +void uprobe_warn(struct task_struct *t, const char *msg)
>>   {
>>   	pr_warn("uprobe: %s:%d failed to %s\n", current->comm, current->pid, msg);
>>   }
> 
> Oh, no, please don't.
> 
> uprobe_warn() is ugly and needs changes. If nothing else it doesn't even use
> its "t" argument.

Ha, I didn't look that closely at it. That is basically the same bug 1/7 
here is fixing for the gcs task function!

This is in its own patch to allow it to be easily dropped, which is what 
will happen as I'm aware of previous variations of this discussion.

While Mark R's perspective is valid, it remains worthwhile to again 
point out that the uprobes subsystem (and a few like it) is a bit of a 
mystery box. Some of these error conditions are very opaque for a user 
who isn't also sufficiently familiar with uprobes to be able to both 
find the code as well as understand or instrument it when it tosses an 
error. Discoverability is made more difficult by the extensive use of 
inline/static. End users try to work around this. For example Brendan 
Gregg's perf-tools uprobe wrapper will dump the last two lines of the 
kernel log when it hits unexpected errors.


