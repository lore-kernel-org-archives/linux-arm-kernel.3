Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13602CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnJvMuQVhi9MCFGKpBaETELFay8xVUFL4L3HsxzBy4Y=; b=XRos06QzJcQxHWaVGYxP929mDD
	vboBmH385CA9OVkd0JsqsNWUP6goPIGBAM8oDuKdP+t2oQ2YpUf8sbwCg7Wuw+sQi/FbBtdmMoWrS
	wuMgfe6I7ek7RxTl1llz3j2nmLVufC/MxfE06bHezOMsllG4auANrxxEq20NTSjFUg/CpnNrtAr03
	3EEnNOELEXyAAsT7qY7qGfMkxLILSX+UM7lXMHHDVySU5+EY8AfzkrZh3q2PWwrMBhuXxOXZucIxD
	zbL3NrAbdFNONOjFo2+m1/KC+K8JNhJL7sKX2VfW1lA6sGSyi0Fx3kG015bUs8s/Iw54ruasoSZA1
	aWSO5POw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIHU-00000007L6U-2403;
	Wed, 24 Jun 2026 07:44:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIHQ-00000007L5Z-0AyY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:44:19 +0000
Date: Wed, 24 Jun 2026 09:44:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782287051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cnJvMuQVhi9MCFGKpBaETELFay8xVUFL4L3HsxzBy4Y=;
	b=GlhKvYj8f0oiqs5OAVu8iEXM84ouiP/RXUcX2e7S/CxXDpsARb48V49l49buF7I/2R+8va
	xCFzQgdUKVbmj26DsiaYztexsY2M66vwhgV6jlRyLe0CJuTh11OGeJ6h9RpReW/mGmNmot
	URmVgKt9UNbueflsNpBLlFnbCio/h/Pqvf6/a+RFOIkw9XCvm2OKEpxUvbvTjPyBaOaz8D
	Qjep1LqXigy1ndUZ7t//Mt3r0EbvfEyslBu4qlExaTuKxCdVXA4R+f2dQQ1ZdS3/r7y+/j
	Gn04eMkzjfWI5X8roR+iC2YAZHAX05er42tBBYdTW6yxPeZHROJmdsMRlPlyhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782287051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cnJvMuQVhi9MCFGKpBaETELFay8xVUFL4L3HsxzBy4Y=;
	b=n5tnwOjfI4do1L7kjz5kIb8dirK3WlMxKRhpE5Li/pN+nwD5Wkh1t2mRvoGnpixmXVKKhp
	B0d7JxObsFU5fdBg==
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
Message-ID: <20260624074409.5jwpWs61@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajkbUNkn6MSw8txc@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_004416_222644_50752ECC 
X-CRM114-Status: UNSURE (   6.36  )
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

On 2026-06-22 19:24:00 [+0800], Peng Fan wrote:
> We may need to use atomic API for TXDB_V2. For the patchset itself, it
> looks good to me.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Thank you. Is there anything you want me to do or is this series good
as-is?

Sebastian

