Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B660DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXMjZB7unGdAPHawTHDHYq7OtFRZiyCjd74uE75bGDg=; b=W61hloNoKTfLeNrJg2It+YaNSI
	PIsJla5pjVPoqsmcUcYL0/EgERuSIl1KfFSC6iki45hU7ZK/HrmxkmXorG9AYKYjjLFfBI2eoz5c6
	OYG3zpyQuT+rLTwHFXZ0YnT1IMO/egp0oLi6/0OybU9anNOoxv/wAzR9poPWsJXYJaSvPQF4kIrLv
	aKIM+PDMJJwNUel+uvyoF4SPq/6vlarp+2X22TfPjo5/I7vv5zD5EzG0IZE9fQbHTHxgdSuhg3VFb
	EO/eV2xvsj4RsB4U41K8e+lPBLT40X+zvIJ4EMmJcXtwUBLiV99fHjswrhfzedDXiHH9RjWM6V8+N
	a8f2FE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCSc-0000000EzRv-0JMo;
	Fri, 10 Jan 2025 10:41:50 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCRO-0000000EzKg-1z0Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:40:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08F7814840C9;
	Fri, 10 Jan 2025 11:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1736505632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXMjZB7unGdAPHawTHDHYq7OtFRZiyCjd74uE75bGDg=;
	b=SV/VcX3+cLJP9SeuPvjDTUtHYVDrj++lsg5W7vxIm9ME+cc8FEnlaFoIq9bPRiyETqA+4d
	OeDUPDQp1fENFuqJnEE16Vr4Obz2f0S+L0zPcghKF1565yEWtK5Oqt7+KSOyqiuIUSsAbP
	x8/Y24eDUxeEYO4QLF5uHUBsHUYauTDtiDtO1v6uBC21KPw9u5PUB/7ktgyNZRxhJfdpTt
	rr/Yb8E3HbTXPPVWrQu+qlK1cEu9pP3yEmOEMi0YKQJFZ089RneynkFzICrChbFAUBLQLG
	6wtH8kWZ1z+97misSriigLrGPbNNmhw2uUZt3OvHV7r/ag6NifiRkXtsMdKwvg==
Date: Fri, 10 Jan 2025 11:40:26 +0100
From: Alexander Dahl <ada@thorsis.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v3 2/2] spi: atmel-quadspi: Add support for sama7g5 QSPI
Message-ID: <20250110-married-program-83bc1a997ce8@thorsis.com>
Mail-Followup-To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
 <20241128174316.3209354-3-csokas.bence@prolan.hu>
 <20250109-carat-festivity-5f088e1add3c@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109-carat-festivity-5f088e1add3c@thorsis.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_024034_680998_04A1274C 
X-CRM114-Status: GOOD (  21.43  )
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

Hello,

Am Thu, Jan 09, 2025 at 05:27:58PM +0100 schrieb Alexander Dahl:
> Hello Bence,
> 
> I had another round of intense looking at the code, this time I
> focused on pm_runtime handling.  Although I just learned about the
> basic concepts, I think the ported patch has some mistakes.  I'll
> comment here, because I don't have a SAMA7G5 to test, and I'm not
> confident enough to fix the code, but I think it's worth reporting.
> See below.
> 
> Am Thu, Nov 28, 2024 at 06:43:15PM +0100 schrieb Csókás, Bence:
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 

[…]

> > +	/* Release the chip-select. */
> > +	ret = atmel_qspi_reg_sync(aq);
> > +	if (ret) {
> > +		pm_runtime_mark_last_busy(&aq->pdev->dev);
> > +		pm_runtime_put_autosuspend(&aq->pdev->dev);
> > +		return ret;
> > +	}
> > +	atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
> > +
> > +	return atmel_qspi_wait_for_completion(aq, QSPI_SR_CSRA);
> > +}
> 
> This function atmel_qspi_sama7g5_transfer() seems to be called from
> atmel_qspi_exec_op() through ops->transfer() only.  I think the two
> lines in the error handling of atmel_qspi_reg_sync() lead to
> unbalanced calls of pm_runtime_xxx.  Compare with
> atmel_qspi_transfer() which has no calls to pm_runtime, everything is
> covered by atmel_qspi_exec_op() in this case where the pm_runtime
> calls surround ->set_cfg() and ->transfer().  Right?

This problem has been addressed in downstream kernel (linux4sam) by
Claudiu Beznea back in 2023 already:

https://github.com/linux4sam/linux-at91/commit/e59f646f516088fdab6d8213d8acda0c1063ec21

[…]

> The whole call tree from atmel_qspi_sama7g5_setup() downwards is not
> covered by pm_runtime get and put calls, although heavily doing i/o.
> Further down in atmel_qspi_setup() there's a write to QSPI_SCR which
> seems to be handled correctly.

Same for this:

https://github.com/linux4sam/linux-at91/commit/5ff0e74c1d548599fe85113e2f1817cb8a052b15

Some hunks of that seem to have made it to upstream, not sure?

Maybe Microchip should upstream those fixes, now that SAMA7G5 support
was ported to mainline?

Greets
Alex

