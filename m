Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2uO6BBop;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pz2OBLgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S4XqQHkYxMLzJBKd/RIGFP6W6LvgbNjSzobYrrP08ig=; b=2uO6BBopwaogQ9
	sh7xrQsn3+KPQ1mC6Y/mnOQoG1wIX+hQ6X+2YDN5lyaHPcF1NrMrfRbbhPDA+bP8kNb20NPtCO4U7
	HSDM8b/Tjl6maGDlksP+YYIJP/hXG6MTAJ9Ouya5+KifBvHSBepORpdrTKENaa6DSAXbsnh851/75
	WioAj42tWOmQ1G40nP4nJ5lrLhrn2K4lvxjcm7BZP3PljrMizpovP7wI0Ii6J95OmVbhowuiJrO/n
	7iMjzeAzZsMk/y6eFPLEfiPMHJGAZRNX8jD2at2QhafF3ulTAnegKjKI+W9CI3oL1RS3B94tNdEG/
	HScqxl2TMA5/xfXxrsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpTE-0000000GC59-16i9;
	Mon, 02 Nov 2026 10:40:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpTB-0000000GC4a-0cDn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:40:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA367C8F446;
	Mon,  2 Nov 2026 10:41:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D897160750;
	Mon,  2 Nov 2026 10:40:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9BC810329123;
	Mon,  2 Nov 2026 11:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793616048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=S4XqQHkYxMLzJBKd/RIGFP6W6LvgbNjSzobYrrP08ig=;
	b=Pz2OBLgz8P+QXSTBWZA/IZfDReBRnNcdOXtbRSIklIozAgVqN/zs5TyY+bvBNlNBCvwhpz
	t3Hg95mJtbwX1FfpJqb7T2r8xwwThAYaS8KU2UaHST75vvhpA6Ioufqq6Iyt7zkAyVJgFM
	VDbf5D6OCR5kqEkFWiC5IVhoLOPh1c+kdqmJqKRGRPT0KdNDvdV/yqs0dfIEDEenHRd+on
	U+oHLoo+4mucLCiwijpmRuEYV5r0DC6UUi5V/5L5bHhJ8G9/KQl0dOZ4rqEYhPlIRYDfhN
	5oA5WphUTafQKAgiGEnGrI08Xssmsibe/UleP85uFjEFYTAvAasKyz3l1KKCkg==
Message-ID: <d9e8d715-fae0-4e81-9ffb-f7ceb0453542@bootlin.com>
Date: Mon, 2 Nov 2026 11:40:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel
 interrupts
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com,
 ovidiu.panait.rb@renesas.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
 <179361503537.3131.1099699821303752523@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179361503537.3131.1099699821303752523@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_024053_353627_5B42D9EB 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/2/26 11:23, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new common-MSI error path runs stmmac_tx_err() without any
>   synchronization against TX NAPI or the transmit path for the same…
> - [Medium] In multi-MSI mode the patch adds new callers of
>   stmmac_tx_err() for a channel, and nothing serializes them.
> - [Medium] Use-after-free of the TX ring during AF_XDP pool
>   setup/teardown while the device is up.

These are unlikely, but real. I'll address that in V2, as well
as the typo Magnus spotted :)

Maxime

pw-bot: cr


