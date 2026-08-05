Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCE0C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhiH3C8YzyGImWWnb0luRlvAbHRzG52M91VSHkIhB9k=; b=CpV/HE6JMJGMYYwGFLw+lhrPqv
	rWnNsvEf7sTl92J83SYLvRkwoOIk2t63vnwpg0+lEwkZAU8qKQFSzPc17EnAgFM8reIL1+HnD2h6h
	8GfoHXM+K+aG96SLpjWClKPZMEMVHuLdBfKYj6iVbUby5mcPb3Tgxy7nZ3/ln2jCzdk0+2clAgPnQ
	3oP3YOKedk6wGz/77LLCnTgXUNYCFH8FI9CKQ+6V2YgmNIjrwVhZTFDif/xRZPlkT3cxtimBUhyc5
	j8NOc+WizM8P/3Ov9OdphA5gxydKqC+V19+TM0ZanASu26RI7bvh8GQtoDmbih6FUBsilpHuQkZeA
	93dkYeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreOd-00000004Gvs-0M62;
	Wed, 05 Aug 2026 16:23:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreOZ-00000004GvT-30KE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 16:23:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 575EE4E410F6;
	Wed,  5 Aug 2026 16:23:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F3E9602AB;
	Wed,  5 Aug 2026 16:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A5C511C34EB3;
	Wed,  5 Aug 2026 18:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785946977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zhiH3C8YzyGImWWnb0luRlvAbHRzG52M91VSHkIhB9k=;
	b=vnkBKnvsArY36bculXEhMf0GedgZpedCy1oYh7aOEiQ+tU7rjMxtw4bLVlqIGKVpNOhx7u
	k45ukAfhiNRahYUCAIFrZmiiv2fLgm0faSUDdlb35Rir+pXyglmi+ta6qo/AKwfpFyXZ3C
	w8+LZ661EnXMT/FczN313Eysg1feqmswUcTQlf29wransnRDTm4b+8oUzm1J8LrL/aKCK5
	Bq3TmSA6yRHUHdQ420/YW2qQv6ipTaFFy00ahQB8V7oUHJ5xIBhEgGE+vUvoNE/Rvg+t7p
	X3jVw0EJ90l+am1moQc5CrLbnYY0ehcJvT4TtggFRaWYLszulkYKcSmoxmso8Q==
Message-ID: <8e62565e-6292-40d8-bc05-a36869305a79@bootlin.com>
Date: Wed, 5 Aug 2026 18:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: add tc-ets qdisc offload
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_092307_924593_8692DB83 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi Lorenzo,

On 8/4/26 20:17, Lorenzo Bianconi wrote:
> Implement offload of the tc-ets qdisc in the stmmac driver. The number
> of ETS bands cannot exceed the number of TX queues, and mixing strict
> priority bands (zero quanta) with weighted bands is rejected.
> 
> When all bands are strict priority, the MTL scheduler is programmed with
> SP scheduling; otherwise the requested weights are applied to the TX
> queues and the scheduler is switched to DWRR. The TC_ETS_STATS command
> is accepted and handled.
> 
> Export stmmac_set_tx_queue_weight() so the ETS path can reprogram queue
> weights, and wire TC_SETUP_QDISC_ETS into stmmac_setup_tc().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

From my very small understanding of ETS, this looks good to me.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


