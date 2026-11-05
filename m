Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrJCMV/q;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+q1xpCh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H47SyQm6XOF9+D0wTu3wJ2QVExzRbX0luU1OhEL59YE=; b=xrJCMV/qvBxy8x
	dtJytllEb/cpL5qyGkj7UfpTXCFvfw6GgWi4t3LX/pMf301BvE95amBKGHTAvXuH2N1E3QR4/VNbd
	M1WbMD02YYcHzMQKy9iK8cvxHUf0owNbIPpsKFUMZ4+FIWVYRNLq3V5HnLLbDBXEgOLhDImkQDI99
	f2FTMC/IWuBOk0WpBO+ssxn50GfKFwbEwxVobststpi24kD0B/5FFjowtWhqggcZNqNHgatrT7jqz
	IH+Cj9fJ4JyZbJQCr4KnSdyQFkuiEbKKgHKLyqM/MCDV+tgq2XqEWA9Bk7K5PvoVbK6hLePEp/MZK
	PcVo/U+pIUhb/z6Y1weA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt5L-00000008Bco-0zey;
	Thu, 05 Nov 2026 08:44:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt5J-00000008Bcf-3qmn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:44:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 719A8439FA
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511601F00A1B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868277;
	bh=H47SyQm6XOF9+D0wTu3wJ2QVExzRbX0luU1OhEL59YE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S+q1xpCh7hTsizY2yWhWEm3POUTJQoVDIHwB3V12Zl9GnCYkeC/mMg+NsI9aleUWP
	 a9EvW6hCuw5e4vxtZAQpdGQC8KcO5QjYpN9qOFNC47rbDAgVRSTzXt2aL5h/JjOmSX
	 ScXmqb2AXpBy9PW8riJtaeq7kFEaIZsAJi9cC54v89CQfwtM1mobNFYSCsdU8+gPwx
	 OdNTuobaRUj28RBs5hify13XGz/c+GnzP9bzZ93wyHLhgVK7TYHNHyrwUB6ndrrFP5
	 NWSQF9o/0nqt/b3fqDzb7RTUo6xHN0L3nB4cApEU0jtqzywsAx0BQY0fNd0AVCJG5+
	 wZXtdkMS1iOJA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1279578e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBysCJ7tMDYqgdRGxuUo1woiT2kZSvEcAbR9SXjkRksu5EweGfqXII1ntwI++C5mbv8mtNAZXAjY+TAecf5SrkJd@lists.infradead.org
X-Gm-Message-State: APuU4Z/lxzCvE0OnSXpmBacXqirEfUtKOGs5peubX+YOKxBmB8tF8KIk
	b8svNydX58m2BuOIthOCeMubrcN2TTQB3Bud41jnMjrzJ/oEIFODUn990tYH5X9+/h1Ke81Pciw
	NIYq9hQMq4xBZe4Ht8J0dhZa8eTu2C18=
X-Received: by 2002:a05:6512:1111:b0:5be:5209:9f1e with SMTP id
 2adb3069b0e04-5bfd9560832mr6000618e87.19.1793868276115; Thu, 05 Nov 2026
 00:44:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com> <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:44:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
X-Gm-Features: AclHuK_DuZ25j9_4w6ziN20_9JjToRWYCmaLaXk3QmbA1dnJxgT3Zd7fLk7HDIs
Message-ID: <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
Subject: Re: [PATCH 8/8] i2c: nomadik: reduce FIFO flush timeout to avoid long
 interrupt handling
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

> In flush_i2c_fifo(), the driver sets FTX and FRX flags and waits until
> they are reset (these bits are self-clearing). If after the first read
> one or both of these bits is set, it waits until both are reset. The
> timeout is 10 * I2C transfer timeout. I2C transfer timeout is by default
> 200 milliseconds. 2 seconds are much more than needed: as stated in the
> comment above, the flushing operation takes just several cycles before
> completed.
>
> flush_i2c_fifo() is called from init_hw() that may be called from
> interrupt handler. So, if the I2C controller is stuck and the FIFO does
> not get flushed, the CPU may spend up to 2 seconds in the interrupt
> handler and cause watchdog timeout or other unwanted consequences.
> Moreover, if the interrupt is handled by the same CPU core that updates
> jiffies, the loop may not finish at all.
>
> To avoid too long waiting, reduce the timeout to 100 microseconds and
> use read_poll_timeout_atomic() instead of relying on jiffies.
>
> Fixes: 3f9900f17cdb ("i2c: Add support for Ux500/Nomadik I2C controller")

Is it really "fixing" that? I don't know if I agree that this is an error
in the initial submission in 2010...

>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Surplus newline above? Maintainer can remove it when applying.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

