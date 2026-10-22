Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E59F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 23:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sEPBDOia;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=iIb1yoqq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KX4EJZm0EQmRTLudL/JYLH8HB7RyxKs12LfEmWjjSyc=; b=sEPBDOiaRhsvOe
	1VoJRBr7pwBprRVlAHEw588RlnV9Gke10QUrCGuf1u0q7xPgMY0ljicrNK/EkCG3HBtJozb7VSDa1
	uv1CdI3cS2D/Q7lozhcwkyIBVUWGsT33S4H3tgZv6bEG/irmLJVQJzt7VFtWQlkOitV6ELf/sjA0H
	vf23Zwq/y1ypg6+SMw1pFQBeLLf3saXfwDOGOs8buX3ze3yqt6i0FOPJ3TomUbfqdEiwXOozX/qOs
	CRxn7yQf0aEhEybxCieSlN4VOep3+TW+NEcLGiub0CBc5rw0b+LelBO3MTNlc3nmVNfjkmwmEGtw1
	hkRMzo7f5EonYw2VgiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2OS-0000000FB8P-0KIL;
	Thu, 22 Oct 2026 23:40:20 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2OP-0000000FB7y-3XnQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 23:40:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4j9jLm6ylvzlfvpy;
	Thu, 22 Oct 2026 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1792712414; x=1795304415; bh=KX4EJZm0EQmRTLudL/JYLH8H
	B7RyxKs12LfEmWjjSyc=; b=iIb1yoqqHG9VLoqUxoScAVCGRtfMv125y8pQpoHp
	YQ/qGomAd2oWXEDiGx9osdPqvaKJq3D/OG/N/tSXiJ0vP1isL444t6j4H9hGMtNL
	bBfH4mVOddzDIkIjQlZpfUzOWuBtVAK9A2Qzk3c3atZRQPy1UR8+NKf+VtIApNf5
	Y3lS58GQ75/Hg1qAN5MlH+vcVyI97DSCB3/nka8P39MH3WbXwjsGKXYuAwM4uzod
	5JexRFC8qgBFAd6A2YwtQ3gC1zBSz9/7S6833eus/uUdcQA19rn8MDZlJReE2A9X
	gI8ymhyA/RaOE4dQoL7sTd+9ufOJJz9Rll6iAq13/tynIw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id hT7VQrYR-Qkk; Thu, 22 Oct 2026 23:40:14 +0000 (UTC)
Received: from [192.168.51.14] (c-24-6-239-25.hsd1.ca.comcast.net [24.6.239.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4j9jLj4mQYzlfvps;
	Thu, 22 Oct 2026 23:40:13 +0000 (UTC)
Message-ID: <b09b2cee-fcc9-42b1-8e13-3e94aa02a8e6@acm.org>
Date: Thu, 22 Oct 2026 16:40:11 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
To: Breno Rodrigues Alves <breno3011alves@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022185224.60700-1-breno3011alves@gmail.com>
 <20261022185224.60700-2-breno3011alves@gmail.com>
 <871p9h1kc7.fsf@trenco.lwn.net> <87wlr9z8iq.fsf@trenco.lwn.net>
 <87o6clz749.fsf@trenco.lwn.net>
 <20261022230049.95290-1-breno3011alves@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261022230049.95290-1-breno3011alves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_164017_973523_0AB6A3DF 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 4:00 PM, Breno Rodrigues Alves wrote:
> I will leave the decision to Bart and the SCSI tree.  If they decide
> the churn is not worth it, I will not resend.

It's up to the SCSI and RiscPC maintainers to decide how to proceed. I
do not have any RiscPC expertise.

Bart.

