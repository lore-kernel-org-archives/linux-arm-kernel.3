Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E5C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJp4rYGfCyVBSJ4qRp4Dvdioa41fPP8ClB9wWTWCzjw=; b=U5/VqQ5x3miUwdzc/cLJXBXc+9
	R++dAevXsjYzgyoNn/cgPTbd90Vrb+Wbdr1ErqmWjH9TVGOuZAo+yxcBbLnvA50Pkj2L6FWmTzOfI
	n0rpEodI3gqfrpRsM7VaZFLAl1hGkLoWLtfwK754dgJS3j3CMurR97p07nyadh9GWVeRmcdQW7C1G
	pvcLm86+Oqv7NglTuap8t0JPM5Vxko8ceElTKR26gD8r0Qy0XtlibT9dlUVq/uzPkNXQQNx5YzHQo
	hSc19LknH3PkaYAMRxfcj0D5x1y4WEQpiOaWX+xdFslO9ici+fUvkUSNn++URQCkctHZoc6bB9S59
	TEZtPz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YnR-0000000Da6g-1rj9;
	Thu, 10 Sep 2026 07:02:09 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YnO-0000000Da5a-1Lgo;
	Thu, 10 Sep 2026 07:02:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F0D140002A;
	Thu, 10 Sep 2026 09:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789023721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vJp4rYGfCyVBSJ4qRp4Dvdioa41fPP8ClB9wWTWCzjw=;
	b=HkcLTc9Pv7shqY6xnM1fnVqUKoJ5NSzhnAZHVtmRA8vJ5pSbMF34oxJL340E7LmN64xgyx
	HK8PueNvZEw2Dkr9O6sMYuLf5L4qryshGLuJo0maVUyl4rP4S4Yt4OV9XzOYHXZ6oqTm4/
	qB8ALVLDe27vfHr8pK05B3/rjUaqhaTGSV7ndSjLm6j1pEQqBB+Ii9ChgwPHOW3t1OmDo5
	nCkCPsG5f7ZbMiuBe142X7UoTa4KH7jPCOncSP3vZiskGNez5XMUnKCnOeCg5ujhlcAfOQ
	EB0/i8fHXKXbBPQLOy2U0d15S152FntkJMeQ3jWspQ2MVCbd4SYJXXKCFObKMg==
Message-ID: <34c4739b-1d10-4bf9-b8b9-c09e023908b8@cjdns.fr>
Date: Thu, 10 Sep 2026 09:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
 <746ebc26-e4ad-4988-a839-c5805d7ab319@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <746ebc26-e4ad-4988-a839-c5805d7ab319@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_000206_652527_130159A8 
X-CRM114-Status: GOOD (  10.65  )
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


On 10/09/2026 04:03, Andrew Lunn wrote:
>> +	/* Clause 22 local data. */
>> +	ret = phy_write(phydev, MII_CTRL1000, 0x1e00);
> Please express this using
>
> /* 1000BASE-T Control register */
> #define ADVERTISE_1000FULL	0x0200  /* Advertise 1000BASE-T full duplex */
> #define ADVERTISE_1000HALF	0x0100  /* Advertise 1000BASE-T half duplex */
> #define CTL1000_PREFER_MASTER	0x0400  /* prefer to operate as master */
> #define CTL1000_AS_MASTER	0x0800
> #define CTL1000_ENABLE_MASTER	0x1000
>
> Once we have symbolic names, it might be obvious what this is doing,
> and if there is a better way to do it.
>
>
>> +	/* Vendor profile disables 100/1000BASE-T EEE advertisement. */
>> +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, 0x003c, 0x0000);
>> +	if (ret < 0)
>> +		return ret;
> Any idea why? Is EEE broken? If it is, phy_disable_eee().


I am so sorry, we had this entire conversation about the other PHY and I 
did not check carefully enough that this one is doing the same thing. I 
will test and submit the same solution we arrived at over there.


Thanks,

Caleb


>
>      Andrew

