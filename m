Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F5AC98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJMczt8U7Il1GD5m7DtSdsfpcELN4wMeLzKtatEddHU=; b=ngW3FschXT08HVm/TbmZPQFUkD
	+kL1IGLwNVnltwMR/d7wufmoOvLBjKOCVh4n8juya01dId06mDjmz8UvVa6DXR1rgyoA78abrkwk2
	r15NWza4dx8laahnFVauDx2LkjEWCDLfh2pYemme9GzsMKydiGqtPtQz3VSFvXO11xc4RC8AqFdpz
	qmEBkd4Z5EH6q7LR6xUqxr5y325HjrYpLgzQmA4sNbmGMEjx91CZD94Iz1xOL1D1RO7YjE37e9MMl
	s/CgM8H2PAd51O41PLhR2U1tR33OIfgGRmQyyI1I56hwgVA1j7EIbQaOATXMXFdu9cZvxmsSZyxtz
	HeRTdapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KpM-0000000801n-0l2J;
	Wed, 23 Sep 2026 11:07:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KpF-00000007zzB-3jIs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 11:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TJMczt8U7Il1GD5m7DtSdsfpcELN4wMeLzKtatEddHU=; b=HfbXBi/VlLkYqIY5tigMyfacCg
	KMVvoG+FwPt1w0X2fz5E68KDYstnqgggEyk2x68/uSluhUiy0V5QVezJY9IMuoNod5CpJaBzGsVyY
	dSJa5m/N0oySKpQYmZjW4NAFfQXk7IiQo068HpywyEOysrFt8KDR/ED+O9bbYsmSBtbHFPOLuKKHU
	KJ2CC8/UKFY3j8Oqs+ttnv27ENaSb6ezj62baTlzlZ6ttJ8w0Q+2vmqzCMvL0dvY4swdK5OvqXkUo
	ytc+WQCNN+XUW1xN9eG5pwnTK9g3r3wiv23YCPQHhi/5O8CF4WNk6r8pUJpa97dtwc1v90B4QiYYp
	sLaRq0pw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Kp7-0000000EgKZ-1qXA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790161648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TJMczt8U7Il1GD5m7DtSdsfpcELN4wMeLzKtatEddHU=;
	b=UblevsNob96RpggecmvzaBJfeWJTOcm2Y/RET7oR9M7VqDUAZJywiPrxnIwWIvv2BI5D5r
	S6o++OrENK1AKsGQGTnaMyf2KxFwSdNwcPEjJkhMwyjz9ePFa5HoET0kI0LvPWudbJC36Y
	S9Var8MYGFtMujcx3+KFnc18s7790Q4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790161656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TJMczt8U7Il1GD5m7DtSdsfpcELN4wMeLzKtatEddHU=;
	b=Qhi5TB33nkdV29Rt3+PTZ61zioEXHufcLBHgNiyr/901JgIyuPwoHj8uapHjiy1KG4I6QN
	fgsNbxJrrNB4CUK+7Hsr/+CKyz+APlroEvY0UfygkWSx1ZkYPbV4pdtogQDpunnVMdYGiJ
	6Nn9Z1jZo+CzFUBT5M7y1lHo1UxuSvU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790161648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TJMczt8U7Il1GD5m7DtSdsfpcELN4wMeLzKtatEddHU=;
	b=UblevsNob96RpggecmvzaBJfeWJTOcm2Y/RET7oR9M7VqDUAZJywiPrxnIwWIvv2BI5D5r
	S6o++OrENK1AKsGQGTnaMyf2KxFwSdNwcPEjJkhMwyjz9ePFa5HoET0kI0LvPWudbJC36Y
	S9Var8MYGFtMujcx3+KFnc18s7790Q4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-_Bbwvj4PNpKWfqYbQKVdtw-1; Wed,
 23 Sep 2026 07:07:25 -0400
X-MC-Unique: _Bbwvj4PNpKWfqYbQKVdtw-1
X-Mimecast-MFC-AGG-ID: _Bbwvj4PNpKWfqYbQKVdtw_1790161641
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88FA3180A9F6;
	Wed, 23 Sep 2026 11:07:20 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 092F818002B6;
	Wed, 23 Sep 2026 11:07:10 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 23 Sep 2026 13:07:20 +0200 (CEST)
Date: Wed, 23 Sep 2026 13:07:09 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] selftests/ptrace: Add PTRACE_SYSEMU_SINGLESTEP
 syscall-exit-stop test
Message-ID: <arOy3YSkb9417Fo_@redhat.com>
References: <20260922195719.i.211-kees@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260922195719.i.211-kees@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: K4U3piq4ob14yCyTwSAhiNbDVzqqvMg0p5bIIcSsf7w_1790161641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_120740_574219_D134A72F 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, will@kernel.org, Shuah Khan <shuah@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 09/22, Kees Cook wrote:
>
> ptrace(2) states that no syscall-exit-stop occurs when a tracee is
> continued with PTRACE_SYSEMU or PTRACE_SYSEMU_SINGLESTEP. arm64 gated
> its syscall-exit report on
>
> 	flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP)
>
> and ptrace_resume() clears SYSCALL_TRACE for both SYSEMU requests while
> PTRACE_SYSEMU_SINGLESTEP additionally sets TIF_SINGLESTEP, so the
> single-step bit alone produced a stop that must not exist. Nothing in
> tools/testing/selftests covered this.

IOW, this test-case veirifies that in the sequence like the generic code

	step = report_single_step(work);
	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
		arch_ptrace_report_syscall_exit(regs, step);

report_single_step() returns false, right? SYSCALL_TRACE is cleared by
the arch neutral code...

> Link: https://lore.kernel.org/all/20260922035510.1090299-2-ruanjinjie@huawei.com/ [1]
> Assisted-by: LLM
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  tools/testing/selftests/ptrace/Makefile       |   3 +-
>  .../selftests/ptrace/sysemu_singlestep.c      | 176 ++++++++++++++++++
>  tools/testing/selftests/ptrace/.gitignore     |   1 +
>  3 files changed, 179 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/ptrace/sysemu_singlestep.c

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


