Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF27606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G9pCT9lh;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=caq8Sutg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MjAMERdRwkFgyYyTaGYqHUCEpETXA7poAfSS4lm3v4U=; b=G9pCT9lhqIq1/bPlhOJDJ3nUYg
	TTefMn+pzRWKiNIx1GJQBri6i2lEAbbIgS2qzuIUEE6b3mvAZG/WexUd0SrfqjdnuMeqX/bRdkdUX
	duag/btqgfHfBRp40ZzqAhgX69i6kYSkvYI+K8IN4ruOTCGgjeuBCqUtZ0iiP4+HDOUH34WMXOHlx
	SxlMO97UNSKOKaB9pdW+XOpWjcoVCk+BpXnH4CbneXkDsdOZeTQwHRYHrAP8tuXS/Jle9GQEHmkDH
	DWOOPEQOZkPD/igM8WXdC8IW/KkzWBDXkvAqiVwtWTVlXnas1q7mlmJLVXnaRS5spNJPHM50beGu2
	ccIsbJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdNB-00000000IuU-1kVz;
	Sat, 24 Oct 2026 15:09:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdN8-00000000Itz-1KTk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 15:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792854563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjAMERdRwkFgyYyTaGYqHUCEpETXA7poAfSS4lm3v4U=;
	b=caq8SutgvnAr7Scb3/AGZb7BtcPjgZQyghYInzM3MlvTQ8E/J0v3jxh6bUVTGHR8elb1Km
	EBM+cFVipGgRILKA5kgHFw4vMevCbcb8Il+ljjz02N2omC/kCAOQM3lL5Iio0e4enCn5de
	SqmODt61FuAz/7MGrj1VI00PCq/jlwc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-386-MsNrRDUuMIGd6_WsmBl95A-1; Sat,
 24 Oct 2026 11:09:18 -0400
X-MC-Unique: MsNrRDUuMIGd6_WsmBl95A-1
X-Mimecast-MFC-AGG-ID: MsNrRDUuMIGd6_WsmBl95A_1792854556
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C31621955F5A;
	Sat, 24 Oct 2026 15:09:15 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BD14518005B7;
	Sat, 24 Oct 2026 15:09:12 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 24 Oct 2026 17:09:15 +0200 (CEST)
Date: Sat, 24 Oct 2026 17:09:11 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <atzKFwYJmosK3qFd@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
 <beb5fc93-4cca-4dc9-a4e3-f406e8c9cd58@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <beb5fc93-4cca-4dc9-a4e3-f406e8c9cd58@bytedance.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Mhr1e45j4wVdQPxw6T4DYUJgA_XcKVXYVxr5qmyY6ms_1792854556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_080926_433271_34924DDB 
X-CRM114-Status: GOOD (  13.44  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/24, Zhao Gongyi wrote:
>
> On 10/23/26 9:24 PM, Oleg Nesterov wrote:
> >
> > So it seems that we can just do
> >
> > 	if ((target->exit_code & ~0x80) == SIGTRAP &&
> > 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)
> >
> > ?
> >
> > I'll recheck... If I am right, perhaps it makes sense to simplify
> > ptrace_get_syscall_info_op().
> >
>
> Hi Oleg,
>
> Thanks for the review. I checked target->exit_code when the tracer calls
> PTRACE_SETREGSET after waitpid().

Aaaaah, I forgot that wait_task_stopped() obviously clears ->exit_code ;)

Zhao, sorry for noise and thanks for correcting me!

And let me repeat, you patch LGTM. But I don't think I can ACK it, I don't
understand this arm-specific code.

Thanks!

Oleg.


