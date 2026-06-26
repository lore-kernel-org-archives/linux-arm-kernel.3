Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB95CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TVxqiKwDBksfcLYjum9fSYxSLypbXQ7jgHRkZjpTck=; b=m2JAA28MQi0/kS46yeHIs54SlR
	J6GEd3c8312bggLB5piSmUaJIfLUMHylfq5uk2k+m7v9g0HRc9ngpQjy7pAQYTFyw/CwDeuWltPje
	Nuf9HGhc62EYryzy5RO73Hz4X6UJqJISTedJ5JyBxdN973DfQ72z8mbjrQ1VBTKeJq+nFhJjR2JEJ
	jdoFy09gPf6j5J+vwJGhLRYmRtfmgeOgbiNYNTfZ41Wa/D7U7gPE1kV+QfGSTrthB6LbijtQ6CB5S
	2tw7ExStq52UTgxVfUgyellWDb4ggOeSZm2KgTXc2cWFq+ymyZVaVXkja99UcnUd92h8rt8EhflrH
	meXnHwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd210-0000000AsC2-3iFS;
	Fri, 26 Jun 2026 08:34:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd20y-0000000AsBf-235i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:34:21 +0000
Date: Fri, 26 Jun 2026 10:34:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782462858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1TVxqiKwDBksfcLYjum9fSYxSLypbXQ7jgHRkZjpTck=;
	b=ofMtdCr5++bUOaJdHemxHF8wTb21XyXCdlmXxT5HB2wKbUMv2cx378nFE+s5q6u7uEi//6
	SVP3GeBoqKWdHGH3fv6OctMTfuqPYv/mw8T04pVC+bhPemttuVRd2g6FVbPPXr+8YYWNWl
	RfPlEK8ZG3MerUSh3tqN9Vl9ZGayUI7k+rphZxDdvDzM/XmHDtEBqevXyyKxLOZWwCYhxM
	VeKnLmGcTQ0jGmOfkpaTUQj6mWJoZB1+PmJxEbR3UHWdMV1R+7N49k492kuCUHpE4FNIHN
	OZdrbpPaAiRmU0gMrcl6VZvhtVrteWe5kQ/FBs98h/PchTagb0pydJ/BV2G5sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782462858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1TVxqiKwDBksfcLYjum9fSYxSLypbXQ7jgHRkZjpTck=;
	b=fxdu6q8Nxp//divDyDsLSzE0l2MH0u1XJelSJse/Jk/2G9znHbfH2QRZwtwYaOzRc/uxFo
	9m4brKcmJHT6R7Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <20260626083416.xbVlbOQJ@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89>
 <20260624074409.5jwpWs61@linutronix.de>
 <aj43FQ7f6juXQ/tP@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aj43FQ7f6juXQ/tP@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_013420_702656_905BB9FB 
X-CRM114-Status: GOOD (  12.34  )
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

On 2026-06-26 16:23:49 [+0800], Peng Fan wrote:
> On Wed, Jun 24, 2026 at 09:44:09AM +0200, Sebastian Andrzej Siewior wrote:
> >On 2026-06-22 19:24:00 [+0800], Peng Fan wrote:
> >> We may need to use atomic API for TXDB_V2. For the patchset itself, it
> >> looks good to me.
> >> 
> >> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> >Thank you. Is there anything you want me to do or is this series good
> >as-is?
> 
> If you would like to address the AI reported issue further, you may
> update readl_poll_timeout to readl_poll_timeout_atomic.

What about the timeout value? Keep it as-is or reduce to?

> From the fix on error return, this patch is ok to me, and the series is good.

Thanks.

> Thanks,
> Peng
> >

Sebastian

