Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB0EC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54Vyq7TkdJY+5dYhg6T/6D6Toheh277V8fD+wL38QnM=; b=tWjac1kX/9QOSRF8BylO28X5w8
	bSnpBqO77Jd7wPYjaYwTFjBn2FoOu6AYh64OTnL48haKnO7+/LUiEBXMXqjKY03bI6tliAOhyaxXg
	Bh0BKTQChU2bQW8sQRZSkZymmYHahEqsCQUOgH8oXsWsboAPZ2HB7lnTB7h7E+CQEO5BUT/ZfMvCR
	QjcpGavxlsdzijQDpJD2QBayna5iQU8mFn34yWQmxOsC9zAlAO4NXPvKZIacHdrgqc15jGXtMYBMs
	t9zaqjf+IdJwsZ3XQgSFcDbYuqxzXtogkv1qTLDLMeXoFNeKuOFJf02ypzI16vRP6uNWH/ZwvKfoQ
	h3K7cO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Hs-0000000H1VD-2G5D;
	Thu, 03 Sep 2026 10:03:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Hq-0000000H1Ut-1GAW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:03:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BBDC1A1977;
	Thu,  3 Sep 2026 10:03:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D78F602B8;
	Thu,  3 Sep 2026 10:03:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48A6011C792CB;
	Thu,  3 Sep 2026 12:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788429790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=54Vyq7TkdJY+5dYhg6T/6D6Toheh277V8fD+wL38QnM=;
	b=x4AXSsvZ1D+R4c+aolY13sCLKa6WA/pwdy1pAL5Sy9PLHUH+gUdEKst4zJ/Wy8lw7zzGm2
	Z8aOQEQB4uX33I1lcn6VUBB3/ABL2kylBoUmdYeUOe1CzZwZXfSxGlMKpvizWwdRn8WltI
	ZCLPzJG/Yt03UoZ/wb4DiDCKoe+lRDqs2Z3/30O8pxTfd7C6WezbkA+CowfdRQ5PNeV7fN
	uwxWofKipwi1IwzQLE2wfTl3kgd0XG0nfua/9n9MYenTeuBZ7odHXDQGBEcmntrXnj4DvA
	4X4ESajCdmQZkz56KuPRzShP7NfepAh7qsIdzAJ3S/R///7BnriFaQeMIwCY6Q==
Message-ID: <f24fd4ca-dc49-4008-a482-db6f30e46131@bootlin.com>
Date: Thu, 3 Sep 2026 12:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: dwxgmac2: add XGMAC
 timestamp interrupt support
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com,
 rohan.g.thomas@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902131441.322167-1-zxyan0222@gmail.com>
 <20260902131441.322167-2-zxyan0222@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260902131441.322167-2-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_030314_503598_089C4B7C 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi,

On 9/2/26 15:14, Zxyan Zhu wrote:
> DWXGMAC2 uses XGMAC_TIMESTAMP_STATUS at offset 0xd20, while the
> generic stmmac PTP handler reads the dwmac4 offset GMAC_TIMESTAMP_STATUS
> (0xb20).  Before this change, the DWXGMAC2 and DWXLGMAC2 hwif entries
> used &stmmac_ptp, whose timestamp_interrupt callback read the wrong
> register and whose config_hw_tstamping callback never enabled the
> XGMAC timestamp interrupt (XGMAC_TSIE was not in XGMAC_INT_DEFAULT_EN).
> As a result, auxiliary snapshot events were never reported on XGMAC
> platforms.
> 
> Add a dedicated DWXGMAC2 timestamp interrupt handler that:
> - reads XGMAC_TIMESTAMP_STATUS before checking
>   STMMAC_FLAG_EXT_SNAPSHOT_EN, so that the timestamp interrupt status is
>   cleared even when auxiliary snapshots are disabled
> - derives the pending auxiliary snapshot count from the persistent
>   ATSNS field instead of the transient AUXTSTRIG status bit
> - generates the corresponding PTP_CLOCK_EXTTS events
> 
> Also enable XGMAC_TSIE in XGMAC_INT_DEFAULT_EN and hook the new
> handler into the DWXGMAC2 and DWXLGMAC2 hwif entries.
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


