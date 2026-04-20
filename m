Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43251EA71BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 05:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYqBi5Y7SR8juLwBRICUsdi/c0VzNDgvxNB9NS9Ihhs=; b=SoswPlTYZHs3FYnZWkOakSoUwF
	xXzU51GgGdd8wnuK5HJgiL5ajojTPaVsyCiFMrHdsiViHCESjotm/mg6xVCAkIwn16XI8I6yNKeZ2
	ttAAo/5s2bET2cTm00cekKwPaQNp9lPmTQEvRq3c9BIevZtAO75hIoTb1Pn9/z3/N9blqllXCJTkr
	/XCVOenUUZ9RA0mTIjSTZbdV5cgFni+5FOC/Lp1Cyyp1jOlFtGF8aVlmOofSIL9+7NmwjgxjVOdPr
	6Z3HOCXqhFY7n5NJ9pwSC/CI28r/WiVmjjUglfOX/cQjWEU0ON/U3CGZ5vFOlJUCt7ylJ1ll30/+/
	NExLDkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhAv-00000006Ra7-3PCY;
	Mon, 20 Apr 2026 05:28:01 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhAs-00000006RZm-3o1P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 05:28:00 +0000
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63K5R9l2040505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 14:27:09 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=zYqBi5Y7SR8juLwBRICUsdi/c0VzNDgvxNB9NS9Ihhs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1776662829; v=1;
        b=O/7mWMQ/1Txgcq83Zz62yWSSux2cnql95+dF4NKmTQQ36GGq2zOlxgygimjHS7rK
         QO7SJEiAYsGCw2hyAEfp2dxSbmYksGEpyKjIkX9sAqfsqFOR20VCHYv4OF8mYYJk
         dn/kGNqtvWlBLp9fo2rwzsgifb1A3Xkmk9OnmIUicx1UuVhgl24WCAT0FuTdxnfw
         n9R/xRc2LawyKhC0rslMiN+blLIKkm8vjADTYVdqIy74ZkN1uG6yMkBuiaAVDd2u
         YorDbuNva9Uk1LlmuoiGaPVrt3yrY3OSUzujy4uXsa5F+tVVTRy9a6MYN/c7xjNQ
         5cBa22eQ/DJCl3bNh4hiTw==
Message-ID: <73cc9b30-091d-44d6-8a57-d4aa97ad678c@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Apr 2026 14:27:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] KVM: arm64: PMU: Add
 kvm_pmu_enabled_counter_mask()
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <20260418-hybrid-v7-1-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <87o6jfavhx.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <87o6jfavhx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_222759_477580_A63EF647 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

On 2026/04/19 23:13, Marc Zyngier wrote:
> On Sat, 18 Apr 2026 09:14:23 +0100,
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>>
>> This function will be useful to enumerate enabled counters.
> 
> Consider expanding this commit message a bit. Something along the
> lines of:
> 
> "Add kvm_pmu_enabled_counter_mask() as an accessor returning a 64bit
>   mask of the counters enabled on a given vcpu.
> 
>   This will eventually be useful to iterate over the counters."

That looks better. I think I'll use that message for the next version.

Regards,
Akihiko Odaki

