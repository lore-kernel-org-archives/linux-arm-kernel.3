Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbE8eUBs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oN+4QOBs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvtDLCSmskozuno0dIt+ThevDRMQi02bPeyK4nH9tqY=; b=AbE8eUBsVTARiP
	gKX3iOIMxEkK52WEPHIQplMQ/4UWu1eWNm+8iVeuUtUynVJqZNs2Vl08lcUyirfnngtMBhZifwJ/V
	IE+GOwiR2SshTusXvdIREWgUP/wj4KdkqJ0M+aUQc+kjepq41G0MqVXh16wc4p4UJkJ9l7nOqdQDW
	7rdTPsmV+SuYUgKecuts6ZQG9363Y1HDQiuzsYQc1N9ZRpSqR4eo5T+cokV4PVV+IsRQ8fOtpMMKK
	4yVCxPRuL9Dm/30jqYBxzZwjVB66AwpjGBQt7jmvx27L9rnmo7FqCX3/oZ0wCdoawyitUFxT2cDJ1
	xLBb56e8H5nb0JVeGo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt3S-00000008BLU-2bgN;
	Thu, 05 Nov 2026 08:42:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt3P-00000008BL3-3uHs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD31644612
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A181F00A1D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868159;
	bh=rvtDLCSmskozuno0dIt+ThevDRMQi02bPeyK4nH9tqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oN+4QOBsbnBg0fLnbGyLj7eJTEX7Y+6Q9LopYs4Wu9GhT5EqlScslk3mic3dgx8xj
	 xJa2JaY4gqnDKXfFQEsujalxSH5j30shV6Y4TvrddcRNHF4wGbAgbCMcHmhWG1FPKd
	 cBQq1JtXZiv7EDHx9SfnECtZh1r823a3p1U5RgHLPzc/wm88g43ClP2AorR1p0mB/T
	 D343BG2HcdA09hPEoio1DKGm4zeV+xShH31aTbbG7SdbigPMtaCLsgzoCmqQlUPJgp
	 pXPnQ936Eywq0EWeY+T5VweYFmDJjO37g5PttHtOc4tC/6vzd6jbkfqmZlrTxcfLzA
	 7GcKcBM5/aEXQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso513246e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:42:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz4YbxNmCJF++nckrDWxPk+ugq+DEcxMj17Jy+gS31csPw5BXmqlVTW1tN3anmJ7glN1iqkXfSyr9HnKpUog41W@lists.infradead.org
X-Gm-Message-State: APuU4Z+Dau2UN4VUIgQaXfuTYRO30VOWLn0lce7jYl3jOeev5e/FvH49
	kbBPWGdINRkgdbCZMhRXroDDoksXqil9Dha1HczKiwMY56Ws/zTGJnblr9YOK5MosWVsPDWrALS
	NNMARSPIjl7OEZwXgxTRF5+55ExPPZWE=
X-Received: by 2002:a05:6512:2251:b0:5ba:35ee:bd96 with SMTP id
 2adb3069b0e04-5bffa1ac589mr492769e87.41.1793868158370; Thu, 05 Nov 2026
 00:42:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com> <20261103-i2c-nomadik-fixes-v1-7-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-7-655c6af2cb70@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:42:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkO7_Sp2P1JXLx7R3mdG-XHuBVAhOKmqDwBUWx8w7aXTw@mail.gmail.com>
X-Gm-Features: AclHuK8MJxI4wS-teKXOpfKbaFW_kc2gE9B-vbnzGqTtWPAzGtR0sGkpo-3ChDg
Message-ID: <CAD++jLkO7_Sp2P1JXLx7R3mdG-XHuBVAhOKmqDwBUWx8w7aXTw@mail.gmail.com>
Subject: Re: [PATCH 7/8] i2c: nomadik: fix race condition with interrupt handler
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>, Ben Dooks <ben-linux@fluff.org>, 
	Andrea Gallo <andrea.gallo@stericsson.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:30=E2=80=AFAM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> If nmk_i2c_wait_xfer_done() gets timeout on waiting for wakeup from
> interrupt handler, there is no synchronization with interrupt handler
> that may run in parallel. This can potentially lead to various race
> conditions between thread and interrupt handler.
>
> Disable and clear all pending interrupt requests and wait until running
> interrupt handler finishes after the timeout.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

