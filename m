Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8CFF9EDC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUS/NAvAtcvm3aAvzJt3Gtmk4a4KKzsNe+7I4xqFKGU=; b=itVmwTYLheUtFJb7LnYO7UuJKB
	Yigq0AH2nj4hxUo1amkcL2VLwU5vdH5VE9ZPzbnSzGM0Mq8Act2l/dmaY9CAn5PimTm9EKb7giWpQ
	boVXjZG3BE3M1Wam4rxvxE1Ut0MW6V/VpdR/1dIu6rCyn+AFelReNxsOB53vnfPdOK712xAwqgAey
	q0UTRgyicbWzaqTtJJeba00Y4cLi4M756GYkENGvISkMA4IEpcPf0dpmcsIk2Kyvs81ZpIOBQz/EV
	44UxtCXkEgXXg5KntFjcVpUpmOgaZt/K6ccgBFc3+ztS+b5h0YAF4pxHkPBWh8uLMsZDij9yws97R
	f6ccbyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX8I-0000000AFSr-0zPA;
	Wed, 22 Apr 2026 12:56:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX8G-0000000AFSh-2DG0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Apr 2026 12:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bUS/NAvAtcvm3aAvzJt3Gtmk4a4KKzsNe+7I4xqFKGU=; b=bV2hk+ZioHDawHhg/mlZoxjY8W
	Ns6dnocckjGajZ4jECQiQpQqwWPcsLP77DQ2hB4xivsoASpN+bgKOGvivS96n89aNEO+Y+jiBoJl9
	75297u3vIqzPy5uEF06xTfVTP1Pd8LRAu7/OCUb7+7PLM8eicTiLefTWqrOmrk5oQNotE5d7ZxX1U
	fTadBtPQ+MuhG2uL/wTKjAFCZ+6zpy1RchNua6KR0P2NitCoh/pSJChjy+uLhG64Bvf9aW6MGcX1k
	K6xgC/z1RQQ8BJ5FMomMHnDeCLrjnk54OCjRwX7udzhbzyGrUwkmj/FY+lA2djhdTFql905fDGhSk
	tdsYEWrg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX89-0000000BPg0-3xne
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 12:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776862588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUS/NAvAtcvm3aAvzJt3Gtmk4a4KKzsNe+7I4xqFKGU=;
	b=AhYpFsXK5Aft60Rej9LiJ3ibTGp+0lARt8ny4PMpoQlh0wgJiBdnEWXjDoz5Es2FlwPiva
	i7A8C4+gN5CBjmzVz1A8HPjTJdGrTT56afri6+raUegbIFwmjsrJ68UX8sc0EAo8zqVkg9
	HHgzEcHl2xC2kgP2GOLTfi5UqkseeCI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776862597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUS/NAvAtcvm3aAvzJt3Gtmk4a4KKzsNe+7I4xqFKGU=;
	b=IWRSyVeJX+bPakSwA6rD9v7Ug0nffhzKHn4CIczstbvQklaogi3cNE3rna6/erJREGhS/x
	ES5CGHUo8ogfIcDeaflvzDhl2mfwuy3R9phCmuJ6vxhTL9/K/jjbWhgv1Z0MlbWcOIfd9w
	otHCFGT/5MWZBdBmn3/cwlCyvQfQR4E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-LID39KPIOuWodVAVWaZhTw-1; Wed,
 22 Apr 2026 08:56:24 -0400
X-MC-Unique: LID39KPIOuWodVAVWaZhTw-1
X-Mimecast-MFC-AGG-ID: LID39KPIOuWodVAVWaZhTw_1776862582
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A38B319560AF;
	Wed, 22 Apr 2026 12:56:20 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.49.45])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B15961956095;
	Wed, 22 Apr 2026 12:56:12 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,  Mark Rutland
 <mark.rutland@arm.com>,  Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,  Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Carlos O'Donell <carlos@redhat.com>,  Peter
 Zijlstra <peterz@infradead.org>,  Rich Felker <dalias@aerifal.cx>,
  Torvald Riegel <triegel@redhat.com>,  Darren Hart <dvhart@infradead.org>,
  Ingo Molnar <mingo@kernel.org>,  Davidlohr Bueso <dave@stgolabs.net>,
  Arnd Bergmann <arnd@arndb.de>,  "Liam R . Howlett"
 <Liam.Howlett@oracle.com>,  Uros Bizjak <ubizjak@gmail.com>,  Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  kernel-dev@igalia.com
Subject: Re: [PATCH RFC 1/2] arm64: vdso: Prepare for robust futex unlock
 support
In-Reply-To: <32642d18-8c83-47ad-8456-1813084c4622@igalia.com>
 (=?utf-8?Q?=22Andr=C3=A9?=
	Almeida"'s message of "Wed, 22 Apr 2026 09:46:53 -0300")
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
	<20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
	<lhu1pgd8w0f.fsf@oldenburg.str.redhat.com>
	<32642d18-8c83-47ad-8456-1813084c4622@igalia.com>
Date: Wed, 22 Apr 2026 14:56:09 +0200
Message-ID: <lhuv7djb1cm.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 9bLiOo-nviKGZJrwAQwIcDGJvyGM1XKQiGtGMtv7r8E_1776862582
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_135638_154678_0BB1C268 
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

* Andr=C3=A9 Almeida:

> Hi Florian,
>
> Em 17/04/2026 12:08, Florian Weimer escreveu:
>> * Andr=C3=A9 Almeida:
>>=20
>>> There will be a VDSO function to unlock non-contended robust futexes in
>>> user space. The unlock sequence is racy vs. clearing the list_pending_o=
p
>>> pointer in the task's robust list head. To plug this race the kernel ne=
eds
>>> to know the critical section window so it can clear the pointer when th=
e
>>> task is interrupted within that race window. The window is determined b=
y
>>> labels in the inline assembly.
>>>
>>> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
>>> ---
>>> RFC: Those symbols can't be found by the linker after patch 2/2, it fai=
ls with:
>>>
>>> ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_upd=
ate_ips':
>>> arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__fu=
tex_list64_try_unlock_cs_success'
>>> ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 aga=
inst symbol `__futex_list64_try_unlock_cs_success' which may bind externall=
y can not be used when making a shared object; recompile with -fPIC
>>> arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsupp=
orted relocation
>> I think your GLOBLS definition adds a 64 suffix.  That shouldn't be
>> necessary on AArch64.  It's not reflected in the references, so you end
>> up with an undefined symbol error.
>>=20
>
> Why aarch64 doesn't need the 64 suffix? objdump shows that the final
> label name is __futex_list64_try_unlock_cs_success, which should match
> what the linker is trying to find, AFAIC.

Sorry, I was confused about how this is expected to work.

Florian


