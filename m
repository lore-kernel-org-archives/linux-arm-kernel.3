Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B1C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4GaCzJfKdWPEQK8WoFLpEX3LNefX5WnGnSukVLLsxU=; b=Wq69nW3D5EP/bhEa0OSXiq6a2L
	PC1KpdWCUPaK6XgdOGg5/DvsV8ZYbUmVi3vxatjsVlculnw0QKLjlGcF4gKk/mAyHdlEA7J11Btrf
	PR7MH5Y99PbFuySmqWtYEUfjNedpKSv0qzDCh9DbnR1JMnOra/15AW3SqhJ+Fc630jPhtSflGUO2x
	S/Mo4/La/By8noCQCMAF93aNC9TLkKri1cAhLlNCCDAnKXGt7XBkqJmgv8reLv41s7JneNPSyWyvt
	B3eaP0xFqSJuVK0OjP0DD++iBtJydsbMYCW0JBrKILqWGWax1u7lvxLdJ1Xt1MoZ3M6fHMwEsa9b2
	G9ekzqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2TW-00000007irb-1jGp;
	Wed, 29 Jul 2026 11:29:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2TT-00000007irD-0ZuU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:29:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B9D14E40FD4;
	Wed, 29 Jul 2026 11:29:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0704C6039A;
	Wed, 29 Jul 2026 11:29:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2B6E11C14D0B;
	Wed, 29 Jul 2026 13:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785324555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y4GaCzJfKdWPEQK8WoFLpEX3LNefX5WnGnSukVLLsxU=;
	b=HmE6icOXq2SlGAWTVfNoPO/Q9lYUr1b4nFdJySBT8J479G01gHRw4g1oOGLNuP/6OMUBVR
	8Mrfz2mEonjxMfUFduPnk928FOV25Sa6J8nyXmlPUdZlWwMjTuYWrehDgUJrRdIapMj/4S
	JiHTJWjgtAtMrxK8j0UapeuNcir3+EpuriT7zMOFXRgp24H7OJ0/pZCqbJMcZoy6c5k9/E
	wlhWAelfoFuYFXAMJcZ8JxhRdTkIQDfKEUN2W2kSjemSY8MIX/m1M6fgZZWICLb6NRBDoh
	ILPdKvBHWb73oOf/PFaJ8gq+AWQPJ87up45f756XzQMwyRxLrBAqzZJsSIxjGQ==
Message-ID: <dfe9ee00-6a8a-418d-9440-339631b31e52@bootlin.com>
Date: Wed, 29 Jul 2026 13:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/5] net: stmmac: Remove VLAN perfect matching dead
 code
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 boon.khai.ng@altera.com, matthew.gerlach@altera.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
 <20260729095110.164157-2-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260729095110.164157-2-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_042923_341048_1664F443 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Ovidiu,

On 7/29/26 11:51, Ovidiu Panait wrote:
> stmmac_vlan_update() falls back to "perfect matching" when the VLAN hash
> filter is unavailable (!priv->dma_cap.vlhash). This fallback has been
> unreachable in normal operation since its introduction in
> commit c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if
> HASH is not available") because the NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
> features are advertised only when priv->dma_cap.vlhash is true.
> 
> The fallback is also duplicating the code in vlan_add_hw_rx_fltr(), which
> is always available since stmmac_get_num_vlan() returns at least 1.

It's not exactly dead code, there's an stmmac selftest for that, see :

https://elixir.bootlin.com/linux/v7.2-rc4/source/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c#L973

It does exactly what you say, it fakes the fact that we don't support vlhash,
then exercise the perfect matching path.

But is it correct to drop that feature altogether ? Or should we just
relax the conditions for NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER to be
advertised ?

Maxime

