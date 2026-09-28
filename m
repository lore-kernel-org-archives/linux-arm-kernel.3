Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18E7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezDik2QaMp/3ORzwR99KO4kmsJHD+sAI1866xdo9UFo=; b=sPUUPu+6xD4Glt
	tWWDK+oflewxnPB/QDsw7JOrbtcld+sLv5c+Ju6Vivss0edpUi8k/1c+Llh2Ra5eUUwq2okmI5QVj
	UsIsMVZCAoTHmjhwtN9qoOrKIvksYFzseBQHPtoPIDADCnXE3XaVcKid/DyyfJnnH0DlQhgEWukLI
	qTqtoMcWR6D11yqxhw4toUBdsKx2EDUsEdsmwqZLCk08un/C4PonHJh+YBbggty1gcEpEXNKozrLo
	5FLNh144K0wnrbNZx27MVZ8B+2x277GnIWBbBpZrwLPuZCF0ySXUctIbBXS5gKGob57MXb1iCdL4k
	XAF9RDzAUawx1KVmhyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0e5-0000000H9Tx-15cR;
	Mon, 28 Sep 2026 01:59:09 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0e3-0000000H9TW-0qc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:59:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ezDik2QaMp/3ORzwR99KO4kmsJHD+sAI1866xdo9UFo=;
	b=c8dcqaXpuskHliNTYZeLq0e3Pj81CJDeoPIqV+h3UR+jeMo9uTIBckSAig2RFSP7D/5X1jkSQ
	Kri/L0EkszIApThuKCQWIUkH3ozc+qoSq/k09tuhFDiGJIZpQSdJMxQgaWWjE3J9lJEESgRbTfg
	p3oPCSGaBJkwhzuCuW8e38I=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4htPLN0C5mz1prQs;
	Mon, 28 Sep 2026 09:46:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0033D40538;
	Mon, 28 Sep 2026 09:59:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 28 Sep 2026 09:59:00 +0800
Message-ID: <a8a8edfd-0f01-4a30-9876-a9eab172eb0e@huawei.com>
Date: Mon, 28 Sep 2026 09:58:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ptrace: Add PTRACE_SYSEMU_SINGLESTEP
 syscall-exit-stop test
To: Kees Cook <kees@kernel.org>
References: <20260922195719.i.211-kees@kernel.org>
 <bbd65e4d-8096-4939-8308-f0f54c5cb3bc@huawei.com>
 <202609241654.F545D3A88@keescook>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202609241654.F545D3A88@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_185907_396264_62E81FB6 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, will@kernel.org, Shuah Khan <shuah@kernel.org>, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/25 7:56, Kees Cook 写道:
> On Thu, Sep 24, 2026 at 12:11:31PM +0800, Jinjie Ruan wrote:
>>
>>
>> 在 2026/9/23 3:57, Kees Cook 写道:
>>> ptrace(2) states that no syscall-exit-stop occurs when a tracee is
>>> continued with PTRACE_SYSEMU or PTRACE_SYSEMU_SINGLESTEP. arm64 gated
>>> its syscall-exit report on
>>>
>>> 	flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP)
>>
>> Hi Kees,
>>
>> The original fix description is a bit off: on arm64 there is no extra
>> syscall-exit-stop; instead, there's an additional pseudo single-step
>> injection.
>>
>> As sashiko pointed out, as commit ac2081cdc4d9 ("arm64: ptrace:
>> Consistently use pseudo-singlestep exceptions") described, for
>> PTRACE_SYSEMU_SINGLESTEP, arm64 still needs the pseudo single-step
>> because its hardware single-step state machine is fast-forwarded over
>> the SVC instruction.
> 
> Ah! Okay. So this test should be tweaked to deal with that? Feel free to

Yes, I understand that these two cases should be distinguished.

> snag/update this test for the series. We didn't have anything testing
> syscall exit stops, so it seemed reasonable to get it written.

I agree with adding a syscall exit stop test case to check whether it
violates what the man page describes.

At the same time, I think we could also add a test case to verify the
problems that may arise from arm64's own missing pseudo single-step.

> 
> -Kees
> 

-- 
Best regards,
Jinjie


