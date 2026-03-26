Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B6D10A88E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysN35GdxO1ttW5m2FClYkwqiFcjtmzjlRfjcsFmDvAI=; b=rEq1rHgFPdMcm5ZWwqVxJXuwpI
	gFrOwMbEBCwgH0zcpNumyREUZfI9HfnHqGeykasYtzIvrvfXrCmu+JaL4jCBTmqND8OW2K/pjQSG7
	boie+trYXyNI1Em0SWcf7uhgArp6AANfG+YIR72s8s6BHrq8n9pz30XDXjSYR6Sx5RDJfUqrlvJDL
	xb6NDmXboWIuUatuHp04gJvdcmXhGVYD9Qg1C1wSPrnncSxgJsvwFIS4sFWi/ASW60amp+S5rnkwE
	hWluVBd/oCyJDqZ/WbtwUC2hSvIArpPABvbRt6D1PVKQaeohGehkOjlHBmW0FoRIkJTtnfvKLr6GF
	kSNdY5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oSf-00000005wdb-0FWe;
	Thu, 26 Mar 2026 17:25:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oSc-00000005wd4-12UV;
	Thu, 26 Mar 2026 17:25:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BE3411A3003;
	Thu, 26 Mar 2026 17:25:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90210601FA;
	Thu, 26 Mar 2026 17:25:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54A5A10450C6A;
	Thu, 26 Mar 2026 18:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774545929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ysN35GdxO1ttW5m2FClYkwqiFcjtmzjlRfjcsFmDvAI=;
	b=Q0d1aEaMo5UpzpiJ6qXDP3rV+xnW3uNZNbk4gVTqZfIyTR9HrtirKmZuHJR/iI6mFOjLqC
	aOcC/UcObBbsTyKSKEa/cZqSq5uv7diljbGR86ZwqNdiKY6iNIiQWU5dqpJCcrlHgGZ4in
	Gua7WNkUofKWtstY20tQ+EU0t3kqAfXRNgGerqiiToKGFupUHhKVrcX1QmLFnSrjlNpSk+
	+x5kX+wJVeQQNfTgSMFh5KkHouev4aSioRSQwne1YV//bDQrUAzPmqumiKnUv+DbQd4YIu
	DoA4sNdBW6Kkdkrx8q7FNbJRvdkY0EvfVu5Gbp7QxUAOQASKFizDcC1WH2AsjA==
Message-ID: <385d2137-0d15-4dc0-8994-9cd48e4150b4@bootlin.com>
Date: Thu, 26 Mar 2026 18:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, kevin-kw.huang@airoha.com,
 macpaul.lin@mediatek.com, matthias.bgg@gmail.com, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
 <acVND6DdpM9czIwU@shell.armlinux.org.uk>
 <044110c5-da1e-48c0-93fd-35553e86b271@lunn.ch>
 <acVQQQiciPQBkQOG@shell.armlinux.org.uk>
 <425217fd-f74c-455c-9aa7-5b6682d887fa@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <425217fd-f74c-455c-9aa7-5b6682d887fa@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_102534_429592_DC71DAB9 
X-CRM114-Status: GOOD (  10.48  )
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



On 26/03/2026 17:56, Andrew Lunn wrote:
>> What is the timing requirements for a system going into suspend vs a WoL
>> packet being sent? Should a WoL packet abort entry into suspend? If yes,
>> then we need to program the MAC before the PHY is suspended, because
>> suspend could already be in progress.
> 
> We would then need to hook into the NETDEV_CHANGEADDR notifier, and
> call into the PHY driver to let it reprogram the MAC address.

We would also probably have to re-do that MAC addr programming at phy
attach time ? If the PHY isn't attached (e.g. link admin-down on some
boards), we can't use that notifier as we don't know what netdev to
listen to. Or I'm missing something ?

Maxime

> 
>      Andrew
> 


