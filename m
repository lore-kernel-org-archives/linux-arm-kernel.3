Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432CEC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wypQmDHUmcBJmH1nhaLuSZ2cqQW4q1hP00xbJAXnlJI=; b=T1SMyrotBctg4Gf92jhLpybgPp
	pMtC7Zn6dEQVAdPBy2E+4mwPXBUHDoxxeaWoIcebY+I3k/tW5B3bEOYkH9WH3Z7GZ5rTDZH00Yikf
	EpGfSm5E1hGYF7VUjOSlZzLNkPAEmk9DwmMjcCm5VdS+ka1JW6muLaOgY5H4WFuyUt0du3O5OzutC
	9bLNWaiVHJTTxcwX70pCuPJvOkgkQxOX4wX9gl9zVV7zp60OK6WplB4W6CvwQi4tVx50sqB7mHYYs
	CTCN9zu8aVggMpxa2McYhHeP+eh17f5e0PApMh/7ffewZeMkIZuGuc+pDCnSsgIO8DtE/8eapbNye
	SmDXpYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbl9-00000004E4R-2xOa;
	Thu, 27 Aug 2026 15:11:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbl5-00000004E2N-08hw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:11:16 +0000
Date: Thu, 27 Aug 2026 17:10:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787843457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wypQmDHUmcBJmH1nhaLuSZ2cqQW4q1hP00xbJAXnlJI=;
	b=M1pVnvi5/FOctF+AJQ3fJd4zoa9BaWw8XL/6bw+AYqZ7joQGG48ky2PIxfM/l8ARJk22T3
	zTzevqto632G7v66F5Cua0qZZFz5jmt1vIJ7iIe9MjfoCz3I/cbZRiEQy3WMhL2VBkRXAx
	oPBYk+3gQcuG510TbF8rkYPJHHMa86Ee/+gwrSJiz8SkdYjOPurf/nbQalO7pnXKG9aql8
	J6WXqKGsuYOOokapNZZk/LbO4hBWqZptYKqBH444tygtKQa75z6U61UlqFYRJPx027Av7Y
	w73RoaZBYmt/yfXsxevOKp4Bjt+49RgIR1uxxooqp0N8hFBgI4O2zNdGHHsfSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787843457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wypQmDHUmcBJmH1nhaLuSZ2cqQW4q1hP00xbJAXnlJI=;
	b=Z+IzuBO2jz4XIuRKpsm6Kra6CrM0Db+wSUt9ljjkuUb3ojtR1Vn9faOSPItXGTQW7uFiyx
	ohhUj+hn41Xcj+AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ju Nan <junan76@163.com>
Cc: antonio.borneo@foss.st.com, linusw@kernel.org,
	alexandre.torgue@foss.st.com, arnd@arndb.de, clrkwllms@kernel.org,
	lee@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
	mfd@lists.linux.dev, rostedt@goodmis.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3] pinctrl: stm32: program the EXTI mux from .alloc
 instead of .activate
Message-ID: <20260827151056.QrjGOPuG@linutronix.de>
References: <20260803061718.43210-1-junan76@163.com>
 <20260804141402.86911-2-junan76@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260804141402.86911-2-junan76@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_081115_237254_427FDF1A 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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

On 2026-08-04 22:14:03 [+0800], Ju Nan wrote:
=E2=80=A6
> Nothing requires the mux to be reprogrammed at interrupt startup time:
> the domain has no .deactivate, .free() only releases the irqmux_map bit
> without touching the registers, and the resume path reprograms the mux
> itself in stm32_pinctrl_restore_gpio_regs().

The deactivate was last removed in commit db0f032512443 ("pinctrl:
stm32: check for IRQ MUX validity during alloc()")

=E2=80=A6
> While moving the code, release the mux reservation when the hwspinlock
> cannot be taken, which the .activate callback had no way of doing.

It makes sense.
Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Closes: https://lore.kernel.org/all/20220202174430.pf37tt6lua2op3gc@pengu=
tronix.de/
> Signed-off-by: Ju Nan <junan76@163.com>

Sebastian

