Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B08606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7taPbLh;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Lx9IsB10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qVOyjGft3yl8t21QQK6X5h58hFCy9arSFXCjxP8+GvE=; b=q7taPbLhNysCMs
	kSp/6or1595c680jobLslMoXxZUVawIdAZHCTFpqN1D698pwrwrAU2g5y+6Be7UhfRDfbDvRGjbGn
	bDmS6Ic4wHAyVaSUKJ3kOXAEdqs0QlY/lbXFGx1Y9rWzBcYIRlWrFtnJSSUfhOLj/HKjPrvOtmQOj
	Ps7f4OQDJfFFSAsor3/4oNdXL4LLjk5LPWE5qetcSMhaGMpT3YImv49RMG/WQOVFFNl+LzNLXB8v2
	ak9lFNS2gLKyHaDTm65sftUJjQpFBQ5kJiemcvRKEKni4ReuxZoDd3unjCEYr8QUSRn4WYgn4WBJa
	B66ozxd0qT6O1Vjwh5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLixJ-000000059Fk-34wo;
	Tue, 27 Oct 2026 15:19:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLixE-000000059E9-2sbq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:19:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56794C79AB4;
	Tue, 27 Oct 2026 15:20:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90477603BD;
	Tue, 27 Oct 2026 15:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8E5310328D57;
	Tue, 27 Oct 2026 16:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793114346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qVOyjGft3yl8t21QQK6X5h58hFCy9arSFXCjxP8+GvE=;
	b=Lx9IsB10zLwRififq18Vz4f1nNHDehrBnlXxwgOhAP+wxSg7U/q43gZuD1al62hhYFIKuQ
	y3lOVI+kCxXZk0VZhn45QsWfo1FeRxHHug5oXzJeBBz/pkMDW2wkzQFF4RNTSX1PRwVVOu
	fZfkA3d+qLoIvSI3d6ISPM5Nv0r16emp9QCCwyfnB1l3/tD+YVJR9MZjUFJGKrVFpE0vjY
	Pd7NeZBp4SF2WXTNrslrxtNGsc9xFcHEwxFEhqp5GbjG1Bwkv8Lsjx2gxDCxzBld3lvHNy
	xWb0PMGxdayeOXdOiQwtR+WicMTwJp5IEI04oxKrke+MRAV+Q2Y5TAvgWXja+w==
Message-ID: <8a1547bb-cc42-465b-8a8a-d4790cd0867f@bootlin.com>
Date: Tue, 27 Oct 2026 16:18:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] net: stmmac: descriptor management issue during PM
 sequence
To: Thomas Bourgoin <thomas.bourgoin@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Ding Hui <dinghui1111@163.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
References: <20261027150556.51209-1-thomas.bourgoin@foss.st.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261027150556.51209-1-thomas.bourgoin@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_081912_920081_EA7113A9 
X-CRM114-Status: GOOD (  19.86  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

On 10/27/26 16:05, Thomas Bourgoin wrote:
> Hello,
> 
> During low power sequence on STM32MP21 we sometimes observe out of range access
> to the DDR by the GMAC ethernet. I managed to narrow down the issue to the
> resume sequence of the RX descriptors with the function
> stmmac_clear_descriptors().
> 
> On resume, stmmac_clear_descriptors() returns RX descriptors to the DMA
> without restoring their buffer addresses. On DWMAC4, the DMA will
> therefore consider a descriptor for the application as one for the DMA.
> This can lead to illegal access from the DMA anywhere.
> On STM32MP21 the DMA address bus is 40 bits, thus the extended status from the
> write-back descriptor is read as an high address by the DMA. DMA will then try
> to write in the DDR at 0x100000000 whereas on STM32MP215f-dk DDR is only 2Gb
> from 0x8000 0000 to 0xffff ffff and nothing is mapped at 0x100000000.
> All the other SoCs of the STM32MP1x or STM32MP2x are using a GMAC with a 32bits
> DMA address, so I do not have illegal attemps.
> 
> To fix this, I propose to reconstruct the RX descriptors that have been used by
> the DMA but not forwarded to the NAPI function stmmac_rx() before suspend.
> 
> I'm not used to this driver especially the xsk management and zero copy part.
> Since this driver is used by a lot of plateforms I'm open to all suggestions.
> 
> This V1 propose to reuse stmmac_init_rx_buffers() but maybe using
> stmmac_refill() would better fit the issue. From what I read, I could not call
> stmmac_refill() as rx_q->cur_rx is only updated in stmmac_rx(), so
> stmmac_rx_dirty() returns 0.

Thanks for the series :) However it looks like this is already being addressed by
Ding Hui's series (currently in V5) :

https://lore.kernel.org/r/20261025100636.613670-1-dinghui1111@163.com

Can you take a look and maybe provide some reviews/tested-by tags ?

Thanks,

Maxime


