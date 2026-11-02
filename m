Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B160A2627
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxLrCLfN;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cnhigwiT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EqxU/QbNkW2B2od1CDNaCFGS/nDhfFKYC9a4Gqos2ac=; b=wxLrCLfN9Fmi4XROcrL5Kng2lR
	/cmFBnVXSn2pPndSSopMb5kuGCtwScBg0HTNd6z/Y6GIOEpzP3te5Y8du8ieSuhnwqw1eaSMdWApq
	0QPY8X3KjZbpSsMYkuQPxcoQMcGY0kpdf2x3qUlAvsxbqEg1HjaF37yUY//l1mGmnNAW34Js/UM2Q
	i6TjnOXPDj/cDxtIKP3h9IcJqVl60Dd2LmGNxa0K51ioVyWguuX3SyafoqR3ORHZux3BtbHom1W7W
	GWWhaXkdGMvDuhPO4tFYahis4FX8D9IqATQagr+CnbXukFnt+p2vNlGVpf9G0DzmBjoFZ6q0OcQjN
	rNFfK/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqGD-0000000GM8Q-0pFC;
	Mon, 02 Nov 2026 11:31:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqGB-0000000GM7j-0vH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793619088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EqxU/QbNkW2B2od1CDNaCFGS/nDhfFKYC9a4Gqos2ac=;
	b=cnhigwiTI4cJSy4m1dLfs1LpoErErSW4olOzBzMn0F+OStoD/mtLJtsA/FDFpfD1uOI6h1
	i/nndLZP0HUVc5OOwIjqFd0BghYVSezltIeCdkpxh9Kg9cvZenpY9Aw73kXeFTKvKarMiX
	FWcSCcDE/iN0TcOhPp1ZUPyx8RbaE6s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-LLUmnpSFN423PNFgxNbHGw-1; Mon,
 02 Nov 2026 06:31:24 -0500
X-MC-Unique: LLUmnpSFN423PNFgxNbHGw-1
X-Mimecast-MFC-AGG-ID: LLUmnpSFN423PNFgxNbHGw_1793619083
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9A32195FCC4;
	Mon,  2 Nov 2026 11:31:22 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 499BD410;
	Mon,  2 Nov 2026 11:31:19 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  2 Nov 2026 12:31:22 +0100 (CET)
Date: Mon, 2 Nov 2026 12:31:18 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <auh0hj3NRzExmgYs@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
 <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
 <8028d335-c304-49de-81fa-07fd446cf9d0@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8028d335-c304-49de-81fa-07fd446cf9d0@bytedance.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 0cRP6q79sx-gJbrPw8J2AVJU7pD6IGq6PPt---HSD2U_1793619083
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_033131_330413_9B28A93E 
X-CRM114-Status: GOOD (  17.02  )
X-Spam-Score: 0.5 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/02, Zhao Gongyi wrote:
>
> Hi Jinjie,
>
>
> On 11/2/26 3:54 PM, Jinjie Ruan wrote:
> >
> > I think maybe we can refer to ptrace_get_syscall_info_op()?
> >
>
> Thanks for the suggestion.
>
> I checked ptrace_get_syscall_info_op(). It is currently static to
> kernel/ptrace.c and identifies a syscall stop only when
> last_siginfo->si_code is SIGTRAP | 0x80.
>
> The arm64 path here also needs to handle a syscall-exit-stop when the
> tracer has not enabled PTRACE_O_TRACESYSGOOD. In that case, the tested

Yes, PTRACE_GET_SYSCALL_INFO/etc depends on PTRACE_O_TRACESYSGOOD
by design, this is even documented in man 2 ptrace.

> For this patch, I think
> the local check of last_siginfo, with bit 0x80 masked and ptrace_message
> checked for PTRACE_EVENTMSG_SYSCALL_EXIT, is the smaller and safer change.

Agreed.

Oleg.


