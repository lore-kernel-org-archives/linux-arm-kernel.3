Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46202606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ByYEbO4f;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ThPIICXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kaKlAjkcc4R8jkpGOd7sZb4iaQO79DTZVsVAMxaaeHo=; b=ByYEbO4fF2P5NB
	Gszb2Yl7qwouGnjH5JtmW+Wo4/d2ACLoqHJWV+HY6PvfulySCuvUyjToq4lwDoR2V2zdRqfDqSapg
	BMdOU/HBIXRTXVjaTbgs9eJk4TX2ErSMh8T7E4pUsGJZtLlfVihTYnx9c0VO+bYDVULWVxUJ3QlVn
	re9vsFjkuVPWQt3YAHaXp6FaTL7OCwYUGMfkh23/dNy8XGyXmMCzjQSQ14QnYNmxwAQYZP9gLsjlE
	TI+WOOF4xmqOf3ppCLPhO6KOJ/fAN7/ygx2HNdV81nOI7bKary3e+RzZy4GbfZ+GP2vy/lgY0XuVx
	7V+XOdX+31m3T7hV7eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnJn-0000000Frip-4Ak9;
	Mon, 02 Nov 2026 08:23:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnJk-0000000Fri9-2vcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:23:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FF944E413BD;
	Mon,  2 Nov 2026 08:22:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E738960750;
	Mon,  2 Nov 2026 08:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B721B103290E8;
	Mon,  2 Nov 2026 09:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793607774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kaKlAjkcc4R8jkpGOd7sZb4iaQO79DTZVsVAMxaaeHo=;
	b=ThPIICXArd8S5NyDuuRcKMV0Lsi9+AnvaGdvpt3by5ofB9et56fu3HDKIV6caTM/GJVfNW
	da8nsHRruxuewWrXN2tP81B+0b/ZoQnsEDgIfZNDhZyxwTS1WTES2j+dPD4m1/+AscmLiR
	ZoM58yz6YOjsz+A16VqzrvX1M+JrNQLpmFQUjfVkppU7i5kfrUVZjg8nZFPRc1C74ooZDQ
	K1JfYDRvxod1V2fuVkpfum9JRa95D1jQ4nxFJc35aLtuJcZKX9e9B9EfYemo+rxjf/utWW
	NUmUNJwLZawSHR8aq01ldEsn3TGdHGvHXXA3U9uXpIpKjOBFr+dHv6G3LQzOZg==
Message-ID: <20d4a3c3-99fa-4659-8d5d-eb5eefcf6545@bootlin.com>
Date: Mon, 2 Nov 2026 09:22:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-motorcomm: mask the MISC interrupt
To: Magnus Leatti <magnusleatti@kernelriot.com>, Yao Zi <me@ziyao.cc>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102080938.2955-1-magnusleatti@kernelriot.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261102080938.2955-1-magnusleatti@kernelriot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_002300_906357_D6533EE6 
X-CRM114-Status: GOOD (  18.56  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Magnus,

On 11/2/26 09:09, Magnus Leatti wrote:
> motorcomm_init() writes 0 to MGMT_INT_CTRL0, which unmasks the MISC
> interrupt. MISC arrives on MSI-X vector 5, which stmmac requests as its
> MAC interrupt, and nothing in stmmac clears it. The vendor driver masks
> it.
> 
> Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts"),
> heavy RX load sets MISC and it never clears again, even though every
> status register I could find reads zero. Vector 5 then fires about 120k
> times per second and the machine stops responding until the TX watchdog
> resets the adapter, or does not recover at all. A 64-byte UDP flood
> from another host is enough:
> 
>   iperf3 -c <host> -u -b 0 -l 64 -R -P 4 -t 10
> 
> Mask MISC, as the vendor driver does. I could not find anything else
> that depends on it here: EEE is not supported, and Wake-on-LAN uses PME.
> 
> Tested on one YT6801 board with net at cb284914e749. Without this
> patch the flood above hangs the board within a second. With it, no MAC
> interrupt fires under that flood or heavier ones, including after link,
> ring, MTU and speed changes and a module reload, and throughput is
> unchanged. Suspend could not be tested. The register values were read
> with a debug build of stmmac.
> 
> Fixes: 02ff155ea281 ("net: stmmac: Add glue driver for Motorcomm YT6801 ethernet controller")
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>

Can you test this, sent a few days ago ? I also saw that storm, but it didn't
seem to be motorcomm specific :

https://lore.kernel.org/r/20261030102251.208929-1-maxime.chevallier@bootlin.com

It should address the issue, doesn't require masking MISC entirely,
and isn't motorcomm specific (this storm will happen on all dwmac4 multi-MSI
glues).


> ---
> Russell, d3265c19b35d ("net: stmmac: xgmac2: disable RBUE in default RX
> interrupt mask") describes a similar storm on xgmac2. Should dwmac4 do
> the same? I have only tested the glue change.

The above patch should handle these too on dwmac4 :)

Thanks,

Maxime


