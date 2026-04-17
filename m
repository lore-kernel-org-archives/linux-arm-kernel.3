Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5BAF436B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD8oNR3xCf7EhjHndl/KRVLr7LRyQ9LNjpsrj9J4Ttk=; b=LKX+9Qx2QYnx7Mu49RU3VIZBz+
	h9Yfea2msJwGbIYK1JRoj41DvyzpqLxtVXNco1ypsSkaVkd5sb1jZBGOMcJc0wYK4qnH2okPqTxUd
	NCir5NIo+TAXVxPxtCDpw5gZ7lI2k1Q4+8uQtilLYuGdzcFIlVN4LIkOzbNF7kNuly4/qL2aIzSK0
	f/I2cTUIaro/ga2omryew8mUlsHj3gAJS98GisRXHC52YnMGgX8M5Mt/B6jbebaxD4tAKvDhkOHjD
	MCSInnatyzWISD11btgozyFZ9kkHKyy8oLl2KXnpsx32a+OXZyw3G1xKCoFJ636Zw4lYaAedgb3eN
	1qD/JepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoa-00000004Auj-0WUY;
	Fri, 17 Apr 2026 15:09:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoZ-00000004Au3-0R4a
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Apr 2026 15:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wD8oNR3xCf7EhjHndl/KRVLr7LRyQ9LNjpsrj9J4Ttk=; b=VRXtofX6K0ml0NMM5UGTx9TbnM
	SgHCjKxJt8Fa9BZnpFgho3mVmuuBtJtLRVE0bnuv4Aat5KvF2xqNoG5fF3Mf5SKtvD16GIbszPomI
	DhCEe9hZL7KH2TSpZnLAnH8UFpBUVxJ8BnepycMzSk/aGcOx5fVrTeGPO95u09Lm/0ow/py66ImVz
	/DL+s6fMVgVyavIRksoRzVpBQrkbYE6kZp2OUa3Nz3uXlHsWa8FePlwcr8IEWIIOBUCV1nelHJj1l
	17C4+Lt3V4soBUzDIPJuwda8v9EkmBhERneED7rxvf++MWIK6BoXJu6NIrjJM87LrVAmDuzd+qrM3
	gKw8i24w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoW-00000005WQ0-1YSc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776438531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8oNR3xCf7EhjHndl/KRVLr7LRyQ9LNjpsrj9J4Ttk=;
	b=c1tpzMo+Z0Km5hbRrcagv1afo3UD+TMrr8HrPJ7swmQWaKtGPh25kBbQciZXmd4UYrqxqi
	S5nbHq66P/qgWIuZSJa/eMQnMFDXLiXEotOorww3wJ1zCi/oP9r/eRmuL8MoMDlANRzA78
	uknECQgzWasUviraL0tJSQIokselgV0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776438539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8oNR3xCf7EhjHndl/KRVLr7LRyQ9LNjpsrj9J4Ttk=;
	b=QcLCEj0M11mVWzQW7qRNonu0O1s6mOQXEpFNbjmLFTZB/PLBt7RhCRqjsKeOQd94a0ehME
	kaL4zaywnmqj+GIWUCNFZlyjhDqimtmYUIGZkp0jCw60DlwixOR5Dtvetug5ZbuYOx6ukO
	O+u7/k4NiJvxMXsTuKj4I4FymNvNWxg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-8Hf6sgXsNnycF4J_K7Zeyg-1; Fri,
 17 Apr 2026 11:08:47 -0400
X-MC-Unique: 8Hf6sgXsNnycF4J_K7Zeyg-1
X-Mimecast-MFC-AGG-ID: 8Hf6sgXsNnycF4J_K7Zeyg_1776438525
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9907D1956066;
	Fri, 17 Apr 2026 15:08:43 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.32.186])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92AE030001BE;
	Fri, 17 Apr 2026 15:08:35 +0000 (UTC)
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
In-Reply-To: <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
 (=?utf-8?Q?=22Andr=C3=A9?=
	Almeida"'s message of "Fri, 17 Apr 2026 11:56:10 -0300")
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
	<20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
Date: Fri, 17 Apr 2026 17:08:32 +0200
Message-ID: <lhu1pgd8w0f.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: KW-m-TS0BDNb-zCM1HYnnDxiiLMXNdzDewftqGIO4Fs_1776438525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_160900_564918_6AAFC45B 
X-CRM114-Status: GOOD (  14.58  )
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

> There will be a VDSO function to unlock non-contended robust futexes in
> user space. The unlock sequence is racy vs. clearing the list_pending_op
> pointer in the task's robust list head. To plug this race the kernel need=
s
> to know the critical section window so it can clear the pointer when the
> task is interrupted within that race window. The window is determined by
> labels in the inline assembly.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> RFC: Those symbols can't be found by the linker after patch 2/2, it fails=
 with:
>
> ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_updat=
e_ips':
> arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__fute=
x_list64_try_unlock_cs_success'
> ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 again=
st symbol `__futex_list64_try_unlock_cs_success' which may bind externally =
can not be used when making a shared object; recompile with -fPIC
> arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsuppor=
ted relocation

I think your GLOBLS definition adds a 64 suffix.  That shouldn't be
necessary on AArch64.  It's not reflected in the references, so you end
up with an undefined symbol error.

Thanks,
Florian


