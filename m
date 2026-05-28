Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7DCCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8mIV8ufMduGj/medyNOciSStQq0smXmRTboOYXyU58=; b=CaLPMYfMjz1ulYX21iobe+HIPE
	Cxr94MChIrq+ZdZaL8iPPFU77/ehEJBK+KlzMyFm5dw+fl8j3r8vIHrB1tDGnd7t14ztXjQPStN1i
	49/cClgevDWT+4Whq4oJGyOeDuUWB5AqiSVWoUbvrN4dt7EqNR3tsVdjPuvYEqsfyjZ733iUsQjt9
	GKfsmkpzQoDLPOECxHVG45ei8/pTZb7SxHAcCPbHjrCHucqmr7oEwMQqsAW/fXmNZl2B8qpSmb/EH
	VmgRs/ChvIGus8XoWIqKABymdqJsEP8xaLjPXOWqKe8F3IHMgX1aMv2hj5GZzOBaDAuBw+0RqHVKW
	kLc6V0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScBE-00000005t8o-2RSF;
	Thu, 28 May 2026 14:57:52 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScBA-00000005t83-1qp6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:57:51 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260528145743euoutp020ab43a5e63862f61b92a0e9e8043268e~zwp5VTZ460115401154euoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:57:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260528145743euoutp020ab43a5e63862f61b92a0e9e8043268e~zwp5VTZ460115401154euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779980263;
	bh=r8mIV8ufMduGj/medyNOciSStQq0smXmRTboOYXyU58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HDHcRRS+zBXh2RyGK8RBYXremq7uAMsJQPT3ALuD+w8siSGtXzjDaQ3bhWruX197O
	 xyC4J3YkYQMuit/XJ4C+eTuvlS2dPdLil4iPMY3wYKrFX5Qxb36g/cyBUghhkZPUZC
	 6QX0MguYU47hlos0PTUkTPeJfHoX/iLbe0+stZdg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7~zwp5GPv8W2557225572eucas1p2s;
	Thu, 28 May 2026 14:57:42 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260528145741eusmtip2de8ddf36bc1db3efa926a8877ed46464~zwp4P6Aw61359913599eusmtip2b;
	Thu, 28 May 2026 14:57:41 +0000 (GMT)
Date: Thu, 28 May 2026 16:57:38 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Ding Hui <dinghui1111@163.com>
Cc: andrew@lunn.ch, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Ding Hui <dinghui@lixiang.com>, "open
 list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, xiasanbo@lixiang.com,
	yangchen11@lixiang.com, liuxuanjun@lixiang.com
Subject: Re: [PATCH v2] net: stmmac: fix fatal bus error on resume by
 reinitializing RX buffers
Message-ID: <ahhX4lIpHwhVekMc@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260526022620.501229-1-dinghui1111@163.com>
X-CMS-MailID: 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="-----ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_"
X-RootMTR: 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7
X-EPHeader: CA
X-CMS-RootMailID: 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7
References: <20260526022620.501229-1-dinghui1111@163.com>
	<CGME20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_075749_071076_B9DFC572 
X-CRM114-Status: GOOD (  15.95  )
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

-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 26, 2026 at 10:26:17AM +0800, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> +		} else {
> +			/* Theoretically unreachable: napi_disable() in
> +			 * stmmac_suspend() ensures all initialized slots
> +			 * have a valid page before we get here.
> +			 * Defensive check only.
> +			 */
> +			if (!buf->page)
> +				continue;
> +
> +			stmmac_set_desc_addr(priv, p, buf->addr);
> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
> +						 priv->sph_active &&
> +						 buf->sec_page);

It this generally sufficient?  Or, in fact, isn't that overkill?
stmmac_rx_refill() generally does a bit more preparation of descriptors.
The issue seems to be that during suspend there is mismatch,
caused by writeback format, between rx_dirty and rx_cur pointers and
there is bad handling of this case, since there is no verification
of leftover stuff and there will be leftover bad address crashing platform.
So stmmac needs to refill/reinit descriptors that were consumed but not
refilled. So isn't going through whole dma_rx_size overkill?
Wouldn't it be better to iterate over buffer from cur_rx as long as descriptors
are 0 and only apply refill to those corrupted?

Could you paste panic that occurs during this issue?
You mention "fatal bus error" which I would assume is system panic?

Thanks

BR
Jakub Raczynski

-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_
Content-Type: text/plain; charset="utf-8"


-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_--

