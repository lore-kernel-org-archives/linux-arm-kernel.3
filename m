Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DA1F9EDC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqICnSzUsZ2eNeZvIB9vJt0dWMzDi5INQgVyX7nVe9U=; b=oSPxGkwiulZlAaBS8XHkeSDWOu
	FKc/kXqIFLfr2ztcibbuGuKRigXZvFKHjBrZ1+h7alby3nTzssoZ9HU+r3yfd7qvl027jAYM1c2ax
	gw3DBOUxCE1SsPkZ9OJnC7fsWLkLmU3+X4U6DIK6rjIAUfw+jhUgztuInE2IIAS2PdQiwEKRKAi6B
	Mi2TVf9TxpmXiGKa3EToto1sEKlp417Jpj4Ong2ee/LHibvhZ0cYp+vMYjpsJWui5kT4opkE+BxVO
	gzCs9QvyxWnZYv2PixcsdF/3+ETBaADuzfN4a9JrPKWOVtzc1D2d6fpQuS8GLaOCPLu0/jTKBFU/e
	phl6I7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWzd-0000000AErf-0bRC;
	Wed, 22 Apr 2026 12:47:49 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWzb-0000000AEqd-0FWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 12:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TqICnSzUsZ2eNeZvIB9vJt0dWMzDi5INQgVyX7nVe9U=; b=dFGUgWWsHnroz4fxwHkrZwMjst
	xON5JrGcqqqLYctXagzrbqJyKOxs0J7Zg64mOXTrcm4PsxAKPw71JeYsPd4nKQ0qlMRlVAJDsHIFA
	rt2oRANIfnbaGuy/2EDZQifkSj+zFAyEAJpwOvORuZJ3tRJniSiDjoGn6th/GxC2k3ckeQmw9+0KJ
	UyO1hbQaVHX1av/px0IkDaeNXAGhbUFMC3VdO2wT82mcXtF9UQvkDGM95joQPXAl0J4SqLkXoZhx4
	OBfzHfbmPMD355sLjLJWjSAYL8dXS64ydT/ZCW1f0EosBWQ3rAvX8TCABd1TGnyIW0FrUUBr1T7ij
	8eJGS5Xg==;
Received: from [187.57.76.96] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wFWyu-000GxY-Qg; Wed, 22 Apr 2026 14:47:04 +0200
Message-ID: <32642d18-8c83-47ad-8456-1813084c4622@igalia.com>
Date: Wed, 22 Apr 2026 09:46:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: vdso: Prepare for robust futex unlock
 support
To: Florian Weimer <fweimer@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Rich Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Uros Bizjak
 <ubizjak@gmail.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
 <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
 <lhu1pgd8w0f.fsf@oldenburg.str.redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <lhu1pgd8w0f.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_054747_386550_C71B7D88 
X-CRM114-Status: GOOD (  13.25  )
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

Hi Florian,

Em 17/04/2026 12:08, Florian Weimer escreveu:
> * André Almeida:
> 
>> There will be a VDSO function to unlock non-contended robust futexes in
>> user space. The unlock sequence is racy vs. clearing the list_pending_op
>> pointer in the task's robust list head. To plug this race the kernel needs
>> to know the critical section window so it can clear the pointer when the
>> task is interrupted within that race window. The window is determined by
>> labels in the inline assembly.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> RFC: Those symbols can't be found by the linker after patch 2/2, it fails with:
>>
>> ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_update_ips':
>> arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__futex_list64_try_unlock_cs_success'
>> ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__futex_list64_try_unlock_cs_success' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsupported relocation
> 
> I think your GLOBLS definition adds a 64 suffix.  That shouldn't be
> necessary on AArch64.  It's not reflected in the references, so you end
> up with an undefined symbol error.
> 

Why aarch64 doesn't need the 64 suffix? objdump shows that the final 
label name is __futex_list64_try_unlock_cs_success, which should match 
what the linker is trying to find, AFAIC.

	André

