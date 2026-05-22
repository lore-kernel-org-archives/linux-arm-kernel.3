Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3086FCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GwqEuPTd+MR1zy5VZznoGmeEK7GKNhmlvjLDNCzxYk=; b=C7iKkYfsLuhH+i4alGPLn2kUkr
	vaqKmerXi+nEVq/+BJ6ZMDMIm0+bnagDnx88q9k75+N6+aTjQa4Ca0eZbf0OT4208RBJ6oPZtWZa3
	lP5JITQLSn7yDwXI3bDHZ+kSsGL04qZzvyJOefQOk7X+Obw6c5H+4zc+mToshIXGeKxcxEFrpdvtU
	9zP3bRAIhSURzHCdcPf24qEgSuj7nR/E/5mEmgf5ZnPGaTp6ci6B476og6xKq+4I2/LeRmbEwe8He
	og/ZleQomLKaJ8Zd7in82YuRGbGF5WWOUcwKVERktPtSPndDCdiMpT8w6Jhrez2v1HCTZ28WYnKfT
	OilL+2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQY6A-0000000C5Ew-2GUM;
	Fri, 22 May 2026 22:12:06 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQY67-0000000C5Dh-10O3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7GwqEuPTd+MR1zy5VZznoGmeEK7GKNhmlvjLDNCzxYk=; b=jCYDm7SwyA+L3wNOxm1f+uSwAE
	+4vC4I+TruXzHAcmMB7sul7EBVJl60qJ6dMtGzvNYM0ej9kn9yz4LlVrS6DxBefc5a3ni36XRnXZ0
	Yg7lmbmuMWqCTQtQ6ES3WHZc8tZuajOQpMZ/6AB21HmiGvIc7mMm6ZoIH/nsQ2ZRjiiO6Qy1zGHCD
	wi+erIveQtxha4Mg2otBnN4m4pdJqj6QC75CZzCIgfiDEVFVebVKjCKI1YUTCtVvNSS/642EnMiDO
	XSWHw/2wrFtzvNymlwH2qN3LmEQXd/9oE/hnw3UKNnuKXnVpwm0+2kQo5HOpC7QuLo5fx2qooD/dB
	ui9+8gqw==;
Received: from [179.193.2.40] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wQY5M-0054gC-EM; Sat, 23 May 2026 00:11:16 +0200
Message-ID: <2db4a7df-4395-4e95-8ffc-d7043459b454@igalia.com>
Date: Fri, 22 May 2026 19:11:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/2] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>,
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uros Bizjak <ubizjak@gmail.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
 <20260428110054.oQNT-kMn@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260428110054.oQNT-kMn@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_151203_573959_F2EA5126 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Sebastian,

Em 28/04/2026 08:00, Sebastian Andrzej Siewior escreveu:
> On 2026-04-24 15:55:59 [-0300], André Almeida wrote:
>> Hi folks,
> Hi,
> 
>> This is my take on implementing the new vDSO for unlocking a robust futex in
>> arm64. If you don't know what's that, Thomas wrote a good summary,
>> including the motivation for this work and the x86 implementation:
>>
>>     https://lore.kernel.org/lkml/878qb89g7b.ffs@tglx/
>>
>> There are some loose ends in my patchset so I'm sending as a RFC to ask
>> some questions:
>>
>>   - If the process is interrupted between the labels, we need to check the
>>   conditional flags and clear the op_pending address from the register. Using
>>   objdump I see that op_pending addr is being stored at x2, but I suspect that
>>   this isn't stable, so I need to figure out how to make sure that the address
>>   will always be stored in the same register.
>>   - So far I have implemented only the LL/SC version to make review easier, but I
>>   can do the LSE version as well.
> 
> I am a bit behind here. In the meantime, were you able to check it with
> 	https://lore.kernel.org/all/20260404093939.7XgeW_54@linutronix.de/
> ?
Sorry for my delay. Yes, I had to do some modifications for the test 
(will reply to your patch) and spot one error in my patch, and now the 
test passes, thanks! Will send a v3 for this soon.

