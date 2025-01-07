Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 01:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e30zrr3MrpDzUxxHon9mXRcs2qZJ9Cd2f6UwE4Tw9SU=; b=h0U4LoGYdMDYLmG6QkIu6e6e2C
	ubk1UjwNe9hYMN4UIGmv/Jj4Xqwp9dSsARxv0L6OTIlDAQJw2L6FpGOeAKCdEgI59ea38EJBKBubM
	J9o5qWu5gF6LdvAkn1fpngVrf5MqNltDs6qsSnid2IvK0ifQKgPv8iW6aA9g/mI2e5kqgZjSEYmo3
	ax0mvWC/RK4p6mqnKMJTA1cq3g77GFaer9X2fqbRQLJqSjDU8Z0M8YSZFMvSNIq97LJEKyjd2NPk1
	e+n1q7SXsWxuPI+cxkRr9LqYBVgvzjkupJJ046R3tnM39M5WW1NZ75+EMFF4qMT3kBXJgKRwqgxwJ
	IDs0iomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyh1-000000038tT-1wTv;
	Tue, 07 Jan 2025 01:47:39 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyfm-000000038iP-41rN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 01:46:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4YRv5N4Pmsz4f3jLq
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jan 2025 09:45:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id E571B1A0C24
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jan 2025 09:46:05 +0800 (CST)
Received: from [10.67.108.244] (unknown [10.67.108.244])
	by APP4 (Coremail) with SMTP id gCh0CgC3Gl9ch3xnFggDAQ--.39405S3;
	Tue, 07 Jan 2025 09:46:05 +0800 (CST)
Message-ID: <f035cbed-bff9-426d-9da2-1bc34ef644d3@huaweicloud.com>
Date: Tue, 7 Jan 2025 09:46:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next 2/2] perf: Return EACCESS when need perfmon
 capability
To: James Clark <james.clark@linaro.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, will@kernel.org, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 stephen.smalley.work@gmail.com, omosnace@redhat.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, selinux@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <20241223070650.2810747-1-luogengkun@huaweicloud.com>
 <20241223070650.2810747-3-luogengkun@huaweicloud.com>
 <57627eec-10b5-4eb0-bfe2-f404a3492eee@linaro.org>
Content-Language: en-US
From: Luo Gengkun <luogengkun@huaweicloud.com>
In-Reply-To: <57627eec-10b5-4eb0-bfe2-f404a3492eee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgC3Gl9ch3xnFggDAQ--.39405S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw13Jw1xGF4UAFW3ZrW3GFg_yoW8Wr4xpF
	s3Cr1YkayxKr97A34Yvwsru34UJr4Ivr4UJF9YgFs8AF1YgFZ0qF4UW34agr1DuF4xCayj
	ya1DXF98urWDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	4xRDUUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_174623_301856_5180F7B9 
X-CRM114-Status: GOOD (  19.25  )
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


On 2025/1/6 23:59, James Clark wrote:
>
>
> On 23/12/2024 7:06 am, Luo Gengkun wrote:
>> For perf_allow_kernel and perf_allow_cpu, both return EACCES when 
>> require
>> CAP_PERFMON or CAP_SYS_ADMIN permissions, so update 
>> perf_allow_tracepoint
>> to keep them the same.
>>
>> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
>> ---
>>   include/linux/perf_event.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index 5d2ec4283ebf..c1bc0d7a275b 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -1685,7 +1685,7 @@ static inline int perf_allow_cpu(void)
>>   static inline int perf_allow_tracepoint(void)
>>   {
>>       if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
>> -        return -EPERM;
>> +        return -EACCES;
>
> Is this necessary other than for consistency? If not it might be best 
> to leave it inconsistent even if it's wrong. I see quite a few "if 
> EPERM do this..." type things in Perf, so changing this would break 
> error messages being shown to users.
>
> If anything, EPERM seems more correct because EACCESS is more about 
> file access.
I think so, from the perspective of capabilities and 
sysctl_perf_event_paranoid, EPERM is more appropriate.
>
> Thanks
> James


Thanks for your review.

Actually, I am not sure if it's typo or intentional, so this patch is 
more like a consultation. It's okay to keep it the same so it doesn't 
torture the user.


Thanks

Gengkun


