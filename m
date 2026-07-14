Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B6EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqrW9zYSHaj6Xc9AQwV80EeJsGB55mOhWfKWF07FYTU=; b=spB5lgEcFPl77KuP5n6mhRt81N
	sfzMjMIwvXvgGJWfiw/6+6+BsS0hQaPHMv0tV2f6c/twC/pLhGSR2TxQm6Mwk1c5GcrfG3TKOFL6b
	4UccaA04qjW6glir2+iCSuwqLdvcWAzocLReZ0/ERaS87DrNIwsFCoDsP0ZVaAyOb3eyEshh6Du/4
	TSnJyyG3RyUYk4a2fyyGvPbbcIQq61uAW2zRfUVdhb0c3ZCzwbTWMoQuENtdFNiGXO3TI+DIzLsxa
	Z52eKiA15Qkxl8AdfQ5JLUlGQsPNjIbOqE1BuOMBSXMgifuLS8zw/9oLBEbGPH6tT1YhuNzUTelpR
	wfmabZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYYE-0000000BJPk-0sPr;
	Tue, 14 Jul 2026 08:31:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYYB-0000000BJP7-2TeA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:31:37 +0000
Date: Tue, 14 Jul 2026 10:31:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784017891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqrW9zYSHaj6Xc9AQwV80EeJsGB55mOhWfKWF07FYTU=;
	b=phU4yKOnD8pqqcRiZ6E0nYyLPEOcH3heyQioklUwQXBxaPLGeiNjLDDexqU7/+O0XtR6uQ
	w29e0HOHkIg/YcBYz25n6ZpE0ucvcs8s1ZH2VbAfr9Xcmh5fsmZ1oiGrHz8/LeQT2ufczW
	8qU0ltK4+bJ5ucrDpuB8D1jCL9Id0iY7opoHWr2PmD0vLYsuBQ7Cqz9IwLZnOUoprVrXgW
	sK7Mku0treHtifQrPJsg0R17yTYK365s/roqrn3Fo9AQtzPzTBLO14wS/FizFcLyi75Lu0
	JSGIcSNpEsTFaXO5SLnDPHXd4iXCiG0UWhtJRU0YeKCKTzx1v7kxrxa12Ly7vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784017891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqrW9zYSHaj6Xc9AQwV80EeJsGB55mOhWfKWF07FYTU=;
	b=8mm2NbvEEJ/RjadJo3IVaT2oLIPDQcZiX9mcxVmr5tCdJY3JfJVDDqhY8320AZsCSKmbH3
	5ZCVTPT6WmHs4pCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] remoteproc: imx_rproc: Invoke the callback directly
Message-ID: <20260714083130.ZsK0SgpX@linutronix.de>
References: <20260703-imx_mbox_rproc-v4-1-67b10560a861@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260703-imx_mbox_rproc-v4-1-67b10560a861@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013135_782956_C0435B0A 
X-CRM114-Status: GOOD (  16.37  )
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

On 2026-07-03 10:24:18 [+0200], To imx@lists.linux.dev wrote:
> The imx-mailbox driver moved the callback invocation into the threaded
> IRQ handler. This means the callback is invoked in preemptible context
> and there is no need to schedule the kworker for the
> imx_rproc_notified_idr_cb() invocation.
>=20
> This was tested with the rpmsg-tty driver on imx93.
>=20
> Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
> callback directly.
>=20
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

A friendly ping.

> ---
> v3=E2=80=A6v4: https://lore.kernel.org/r/20260617-imx_mbox_rproc-v3-0-779=
48112defc@linutronix.de
>   - The mailbox bits are part of v7.2-rc1. This is just a repost of the
>     imx_rproc driver which is left.
>=20
> v2=E2=80=A6v3: https://lore.kernel.org/r/20260603-imx_mbox_rproc-v2-0-a00=
59dc3b69a@linutronix.de
>   - Forward the error in imx_mu_generic_tx() to the caller (new patch
>     #1)
>   - Extend the patch description a bit for for "Start splitting the IRQ
>     handler" to briefly explain why callbacks are moved to the threaded
>     handler.
>   - Drop imx_mu_con_priv::pending. The primary handler wakes its
>     threaded handler. Once the handler is woken, the pending flag must
>     be set and there is no need to set/ clear it.
>   - Avoid the double clk_disable_unprepare() if
>     devm_mbox_controller_register() fails.
>=20
> v1=E2=80=A6v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8f=
fc36e11e5@linutronix.de
>   - Using correct register to enable RXDB event.
>   - Update commit description for the "threaded interrupt", "unmasks the
>     interrupt" =3D> "masks the interrupt event".
>   - Add a shutdown field so that the interrupt does not unmask the
>     interrupt if it has been already disabled because the channel is
>     about to be shutdown.  A possible race mentioned by sashiko.
>   - Use devm_pm_runtime_enable(). This should avoid a possible race
>     sashiko mentioned.
>   - Use devm_of_platform_populate().

Sebastian

