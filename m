Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E06CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fNEhStUrfNS7Jp/iVs9IDKTY22PttxfS1sUfr0lqcU=; b=C49ZUFesfA0200wEJicka9Zp3w
	hoA86vDHSq5KzKzE06nk4l95daSrt1GXALGIQYTTRq3oC2qU//BOaO4sknhT4bu2SFf10NrZ8PpzA
	5kZW+ee4qBcNx1EYF/JwSsyUiL3ERX4H1nGPdlgjjTV5pcBS8z2Uzk+hH3fcXYI0Gk0JgEmQRjf2M
	HMUolvZ1FoZ0Yu9yJxfqyR9EkFF3LSlWTU34ffrfCAs02a0DIBIITZ5ZjiL0bpvbgK64Jg+xLaSC3
	t1l+YsfmsCAJxPp8VJqWyxFxD9M4xncfA2LT5bM3y7+KRwjU6j2HUqhCj682nwKD4NaGUmhrRkL99
	N+4xGGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kDm-0000000Eh5F-0K3w;
	Wed, 02 Sep 2026 12:37:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kDi-0000000Eh4e-20Ar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:37:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 603E84E414CE;
	Wed,  2 Sep 2026 12:37:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 317706053C;
	Wed,  2 Sep 2026 12:37:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 751E911C79293;
	Wed,  2 Sep 2026 14:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788352654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/fNEhStUrfNS7Jp/iVs9IDKTY22PttxfS1sUfr0lqcU=;
	b=MFJ7yO3aZwqgTUJJCwP0uqVRmFD5d6DSyUeDPt8Muxq183aUIUVVDC0pjDXn4AP78vRjsb
	8TlYiJ2vB4Ly8ePpdtOXSwkDSPr5i4s7xVD6OAlu3CXvuTRnwkFfCcbhI3Kd+s6Vcb39pn
	RFBEl0OY8STYxBtXsuNtAsEx7/DEM41cyj3/WZeeT5qqAkNRXuEZRKzqpmMAnxQ2x4O4Yb
	tWB1pC6XrNJ2O1DtyoDk4qGszIcdHXbAAkQJXz99eJ6pDFAJHe/MNWGipPo5zvoWwcabS/
	FACQYkw5QG6kwcS1m+hx93+JksA6J6U3V/Bfi6LYDRvCDvj8a/HrjouVjGtCAg==
Message-ID: <7140f146-643d-42d5-abca-88fc8697bba5@bootlin.com>
Date: Wed, 2 Sep 2026 14:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] net: stmmac: remove software VLAN tag stripping
To: he.peilin@zte.com.cn, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 vbridgers2013@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn
References: <20260902173506784mJX3FrsAcjhcYqtGuZuxE@zte.com.cn>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260902173506784mJX3FrsAcjhcYqtGuZuxE@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_053738_678953_0DBBD202 
X-CRM114-Status: UNSURE (   6.32  )
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

> -
> - if ((vlan_proto == htons(ETH_P_8021Q) &&
> - dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> - (vlan_proto == htons(ETH_P_8021AD) &&
> - dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> - /* pop the vlan tag */
> - vlanid = ntohs(veth->h_vlan_TCI);
> - memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> - skb_pull(skb, VLAN_HLEN);
> - __vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> - }
The patch is all mangled and doesn't apply, something went wrong
when generating/sending it :/

Maxime

