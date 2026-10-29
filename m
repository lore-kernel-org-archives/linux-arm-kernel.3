Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mkoY82VU;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1EHMp+Zv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=26yG4eXWQUuRwTEMaMGincq8OXRaC7BKnOkTFxcAKtI=; b=mkoY82VU1ggDqsrB0lpUG75F8i
	BIAtsmWrpjH09wkxVI5/gHoNby4qLohk5I1gt2Ucj63s7Jpajl0/gSV5vjVmzdBGnQJpbXyvWFiq7
	dhb8UZPZIcE41ugwgoqDiopvMLpkiz9AF4RrhW5bhcosR69GiGrSmKai0b315+E+b2TAQnsGj98/H
	e+xKK5IwmVgnzCKAGdWfeuirTWDxJ0F2r8gaLyLdd2JscAb/sWpJowTDi7Rf5tqGQ/HMyqW1I88SI
	SEkLHMIVfT7Y7bWO2TYK+HEmO9L/RBvcAHOjsPKIhSSPUmgAx4i8Gywx650WeMt+d30Gt6Q3uCZaa
	p3XKgjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNIX-00000008yPF-26DC;
	Thu, 29 Oct 2026 10:23:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNIU-00000008yOQ-2lLC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:23:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C7DD1A1390;
	Thu, 29 Oct 2026 10:23:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06E7560360;
	Thu, 29 Oct 2026 10:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D69DF10329104;
	Thu, 29 Oct 2026 11:23:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793269423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=26yG4eXWQUuRwTEMaMGincq8OXRaC7BKnOkTFxcAKtI=;
	b=1EHMp+ZvIZYUiY0Fs+NQ34l+xN9Aa85DGUxDMkpVM+qBPKo78H5FoqAiT2z7MnI4VpJHP6
	bQIpXzpHh7c0SP5+HghUNK4LwwdREjXPgOT6/8bdVUJtolx0KulDYttcoZ1KljrRN89whF
	xWIRGxe/Qj/RvZeMzLZf+2RjkUhr3qCJ8BaSR8XbTHLNzA/MguOk9airmBS4wB10/q+vu6
	h+1xcPoHWeMampabcBvw2YvzucrPJLkQiGwmNbA6TdltVtdSfDrTYK5p3MXxToXBxRiKqx
	Rm75b1vlDK8cekIvT2/fXsIn0BFABuoqmrXH2nOSzyNpqj8x1yoXFkSr2M5iIg==
Date: Thu, 29 Oct 2026 11:23:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Markus Probst <markus.probst@posteo.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/6] rtc: s35390a: Allow use of output pin for
 interrupt signal 1 for wakealarm
Message-ID: <179326901959.870466.10617976319707000854.b4-ty@b4>
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_032350_836597_43D1F128 
X-CRM114-Status: GOOD (  13.52  )
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 30 Sep 2026 15:31:45 +0000, Markus Probst wrote:
> Add pinctrl to allow the use of output pin for interrupt signal 1
> for wakealarm. This is needed for wakealarms to work on Synology NAS
> devices.
> 
> I could only partially test the pinctrl patch. My testing system runs
> ACPI, which makes it impossible for me to configure pinctrl there. I did
> however verify that with missing pinctrl configuration in the devicetree,
> the register were correctly set. So there should be no regressions.
> Every other function than ignore, disable and wakeup should also be
> considered untested.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: rtc: Add pinctrl for S35390A
      https://git.kernel.org/abelloni/c/2166aaa173cd
[2/6] rtc: s35390a: Add missing newline to dev_err
      https://git.kernel.org/abelloni/c/a27b25bb9b42
[3/6] rtc: s35390a: Fix alarm not disabling
      https://git.kernel.org/abelloni/c/d93f29e41089
[4/6] rtc: s35390a: Read 24-hour mode on access
      https://git.kernel.org/abelloni/c/6199051016cd
[5/6] rtc: s35390a: Add pinctrl
      https://git.kernel.org/abelloni/c/cb4e92b15114
[6/6] rtc: s35390a: Add synology quirk
      https://git.kernel.org/abelloni/c/f6550426f21e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

