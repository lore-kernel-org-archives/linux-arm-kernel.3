Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6398C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOlr6C5vhqa1kxYAAqtfuSRSBiOOy3yEM6QLgnHqjqQ=; b=EKMF8JEPm1MGb7LwwSzS36QgSu
	C0WOT2xNaMAbm+JlqJGwmsUup1ibcGRG+N++RbL5O5F+YoeMlk0BTulzHoFGhgVDOvnw9ja8Oa0JZ
	2MJwYrHlZPMEO5iTcZ3NzPjR5g4HmmipLkMJZgPURth/ukY94abIS5C89SGiIug5uWGnvq9T9p+gn
	PMigvoWiimpOUl3nMMAuekFiOhSQxsiD47pLTQkC1e4N1+kni62IeEFNEeDBGbecudWFfTFh7dSXd
	iADUpyQaV1PbAQVj1nFfBcYThzCRyOPOcATNWkSvsOfxzG9z/Jaij64ZZij2QMBOInxBoAziE6g0b
	ZH99JrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbFc-00000001PsZ-3Ydr;
	Thu, 28 Aug 2025 11:57:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urY0M-00000000nXk-3kBj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 08:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tOlr6C5vhqa1kxYAAqtfuSRSBiOOy3yEM6QLgnHqjqQ=; b=PQ49MXov9p5YSteuW0IVHswnmy
	Wl5NLxiz6I++LTYcd7nf14biYFb5ceRQu9PXtViRsz2UbUpgXe9WH1ZP4xJm7dSwrc60hMcjBeMaA
	rxhdGz9Cp/wLVfsj3nC9HqJNCZWKnS0EUhcaKb0G7AZLWYN0oGPzcM2wkLxPk8FDJdarGJqzKrWsD
	zyna/rzmLUEVDTLzuk5wSh9iJDs3srMcvENhNIqC3FoQULxfzyAz9nGZn9jO/lC8sj4IPG69IcDWW
	XvnqOFXPshJ98UKf6r+DSpEKS7ZCWMV0qFgh+Q3LbBbmu4aAqxrwSlfE6IJrA0ZCuPqUpVMZSKmSA
	W8yc5Ejw==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urY0J-00000002fqP-0xwv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:29:09 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6851A222FE;
	Thu, 28 Aug 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756369744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOlr6C5vhqa1kxYAAqtfuSRSBiOOy3yEM6QLgnHqjqQ=;
	b=VVDi/G5o8C1V6YAUebvIHQxNyDxcUqhryqx39L9fB3EQ7nFKvJHpSzQzgC26KTHMNhUkzO
	5r8H0JU3IyYH2T6EPcu8JnnitMnRQ9IrF9aMRW8OsrDo1V8007Am8yVqa9lZhTGbFw4UVH
	NASV6+R0bI4EXjA663yPVGRYuy2es5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756369744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOlr6C5vhqa1kxYAAqtfuSRSBiOOy3yEM6QLgnHqjqQ=;
	b=H7wpXe7rcDLkp5HsTMTb0+OLJJAAbCglgDyy+bXScDGYpg4BuYttPj/7BoDiP4mPPwWNQd
	0Xk4fLj0s/44NcAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="VVDi/G5o";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H7wpXe7r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756369744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOlr6C5vhqa1kxYAAqtfuSRSBiOOy3yEM6QLgnHqjqQ=;
	b=VVDi/G5o8C1V6YAUebvIHQxNyDxcUqhryqx39L9fB3EQ7nFKvJHpSzQzgC26KTHMNhUkzO
	5r8H0JU3IyYH2T6EPcu8JnnitMnRQ9IrF9aMRW8OsrDo1V8007Am8yVqa9lZhTGbFw4UVH
	NASV6+R0bI4EXjA663yPVGRYuy2es5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756369744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOlr6C5vhqa1kxYAAqtfuSRSBiOOy3yEM6QLgnHqjqQ=;
	b=H7wpXe7rcDLkp5HsTMTb0+OLJJAAbCglgDyy+bXScDGYpg4BuYttPj/7BoDiP4mPPwWNQd
	0Xk4fLj0s/44NcAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4116D13326;
	Thu, 28 Aug 2025 08:29:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F0QNDU8TsGhoKwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 28 Aug 2025 08:29:03 +0000
Message-ID: <1fc287a8-4b90-439e-8562-35c093d92ff5@suse.de>
Date: Thu, 28 Aug 2025 11:29:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, stable@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-2-svarbanov@suse.de>
 <20250825165310.64027275@kernel.org>
 <3bccf773-abd6-4ade-a1c5-99f2a773b723@microchip.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <3bccf773-abd6-4ade-a1c5-99f2a773b723@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6851A222FE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_RCPT(0.00)[dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_092907_581438_8FB7FA12 
X-CRM114-Status: GOOD (  12.28  )
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



On 8/26/25 12:14 PM, Nicolas Ferre wrote:
> On 26/08/2025 at 01:53, Jakub Kicinski wrote:
>> On Fri, 22 Aug 2025 12:34:36 +0300 Stanimir Varbanov wrote:
>>> In case of rx queue reset and 64bit capable hardware, set the upper
>>> 32bits of DMA ring buffer address.
>>>
>>> Cc: stable@vger.kernel.org # v4.6+
>>> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue
>>> to handle RX errors")
>>> Credits-to: Phil Elwell <phil@raspberrypi.com>
>>> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/
>>> ethernet/cadence/macb_main.c
>>> index ce95fad8cedd..36717e7e5811 100644
>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>> @@ -1634,7 +1634,11 @@ static int macb_rx(struct macb_queue *queue,
>>> struct napi_struct *napi,
>>>                macb_writel(bp, NCR, ctrl & ~MACB_BIT(RE));
>>>
>>>                macb_init_rx_ring(queue);
>>> -             queue_writel(queue, RBQP, queue->rx_ring_dma);
>>> +             queue_writel(queue, RBQP, lower_32_bits(queue-
>>> >rx_ring_dma));
>>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>>> +             if (bp->hw_dma_cap & HW_DMA_CAP_64B)
>>> +                     macb_writel(bp, RBQPH, upper_32_bits(queue-
>>> >rx_ring_dma));
>>> +#endif
>>>
>>>                macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
>>>
>>
>> Looks like a subset of Théo Lebrun's work:
>> https://lore.kernel.org/all/20250820-macb-fixes-
>> v4-0-23c399429164@bootlin.com/
>> let's wait for his patches to get merged instead?
> 
> Yes, we can certainly wait. As RBOPH changes by Théo are key, they will
> probably remove the need for this fix altogether: but I count on you
> Stanimir to monitor that (as I don't have a 64 bit capable platform at
> hand).

Sure I will monitor those series. Unfortunately I also don't have MACB
64bit platform, I only have GEM.

regards,
~Stan


