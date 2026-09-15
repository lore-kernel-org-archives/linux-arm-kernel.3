Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D3C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rnkxr64g+I2fSWzS6Bo7IoB17S09s16i9qGmZBObXS0=; b=Q/tbzbE5/nIfwFREoCVGkLX87+
	jMDw6KWW5ZlehZ7gY/uUwohF3IwafNjjb13gxrn/k6x7oxBEY4FXTLsbtZC/MJbBynn7aSM2OtlcK
	iD2ZJu/vxgrvbHH9/SYzKsqs898eopkYaiaZvt+i2Gtib8oDsumroICWyYBOBKwnjFOWQrCnlC/qX
	Hifizls+An0Gb2UnF8TeQjhJpwiZ3QL2on73S6oPjogZqiz+A2jyJ5yFHaFWBF6K+p+h8SEKCxzK3
	nBZFaXftRHkrBSwyfPn6Q8jlS7F34AuakytDw3kv6lU/Et7LluDERw2+1CKHmRjzZ0coOjspCmwuY
	X3r5TnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qx3-000000062kX-1KR8;
	Tue, 15 Sep 2026 11:03:49 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qwz-000000062jH-0pQP;
	Tue, 15 Sep 2026 11:03:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1B0B47BBCA;
	Tue, 15 Sep 2026 13:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789470221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Rnkxr64g+I2fSWzS6Bo7IoB17S09s16i9qGmZBObXS0=;
	b=eP8h4pFnk5dbf0sYuxS+ADkZ8G9V7ecD8zIcJSD2NQQKtKMD97pIJWjMRB9IP3uK+NyTDd
	Mv9RoSpzS1tLlbxyvNf8eZ+w2q7dn4/RmoFrbbUuTE1ZqQ+oLot2Mib7Fp4etj60yuRX2m
	UYXaGH/UQt4wSvQ7524dDbPQ/KFo8djG0OiKf3U+VLaRC0FCiKI2vpgZ8yRtOQtl8GxsP/
	IfHT/3NC4o+ZKffgZa8vGROZJXoHCjwOZowewD5XJIGUG08gchETNUj9uBjgEnZQzD09qp
	HMoItiLIrFYLAU/Y98sKlRsPp7C7RFrj86HfoN5U3PSqOsBMdQ8EK26gD82PYA==
Message-ID: <63125030-a3b5-432b-b62d-9264946a1a3a@cjdns.fr>
Date: Tue, 15 Sep 2026 13:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260915103550.79957-1-cjd@cjdns.fr>
 <aqkilcQAs-GERF3x@makrotopia.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aqkilcQAs-GERF3x@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_040345_621123_841CD6DA 
X-CRM114-Status: GOOD (  24.38  )
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


On 15/09/2026 12:48, Daniel Golle wrote:
> On Tue, Sep 15, 2026 at 10:35:50AM +0000, Caleb James DeLisle wrote:
>> The EcoNet EN751221 multi-chip module implementation of the MT7530
>> requires some additional configuration of the PHYs on startup.
>> The reason for this is not known, but it is possible that it has
>> to do with the fact that the EN751221 MCM implementation of the
>> MT7530 runs at an abnormal PLL frequency (362.5Mhz).
>>
>> Detect whether the MT7530 PHY is attached to the MDIO bus of an
>> EcoNet EN751221 switch and if so, apply the necessary register
>> updates. Additionally, never attempt to configure an MT7530
>> identified PHY which does not have gigabit support because the same
>> ID is used for another (FE) PHY.
>>
>> Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
>> Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> [...]
>> +static bool en751221_is_mcm_phy(struct phy_device *phydev)
>> +{
>> +	struct device *parent = phydev->mdio.bus->parent;
>> +
>> +	return parent && parent->of_node &&
>> +	       of_device_is_compatible(parent->of_node, "econet,en751221");
> I thought you had found better options than using the parent of_node...?


I documented my findings re registers that are different, but I don't 
have any documentation of those registers so to me they might as well be 
reading outside air temperature, so there is nothing I could safely do 
except the parent of_node.


>
>> +}
>> +
>> +/*
>> + * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
>> + * does not advertise ESTATUS_1000_TFULL.
>> + */
>> +static int mt7530_phy_match(struct phy_device *phydev,
>> +			    const struct phy_driver *phydrv)
>> +{
> You miss the check for the PHY ID, see also below.
>
> I'd suggest something like
> 	int ret;
>
> 	ret = genphy_match_phy_device(phydev, phydrv);
> 	if (!ret)
> 		return 0;
>
>> +	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0 &&
> The above should be helper function used by both .match_phy_device ops.


Sounds good.


>
>> +		!en751221_is_mcm_phy(phydev);
>> +}
>> +
>> +static int en751221_phy_match(struct phy_device *phydev,
>> +			      const struct phy_driver *phydrv)
>> +{
>> +	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0 &&
>> +		en751221_is_mcm_phy(phydev);
>> +}
>> +
>>   static int mt7531_phy_config_init(struct phy_device *phydev)
>>   {
>>   	mtk_gephy_config_init(phydev);
>> @@ -135,6 +195,23 @@ static struct phy_driver mtk_gephy_driver[] = {
>>   		 */
>>   		.config_intr	= genphy_no_config_intr,
>>   		.handle_interrupt = genphy_handle_interrupt_no_ack,
>> +		.match_phy_device = mt7530_phy_match,
>> +		.suspend	= genphy_suspend,
>> +		.resume		= genphy_resume,
>> +		.read_page	= mtk_phy_read_page,
>> +		.write_page	= mtk_phy_write_page,
>> +	},
>> +	{
>> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
> This assigns phy_id and phy_id_mask, which are used by
> genphy_match_phy_device(). However, you are setting a .match_phy_device
> op which doesn't call genphy_match_phy_device(), so this is ignored.


I see, I should have checked that more closely. Thanks, will fix.


Caleb

>
>> +		.name		= "EcoNet EN751221 MCM PHY",
>> +		.probe		= mt7530_phy_probe,
>> +		.config_init	= en751221_mcm_phy_config_init,
>> +		/* Interrupts are handled by the switch, not the PHY
>> +		 * itself.
>> +		 */
>> +		.config_intr	= genphy_no_config_intr,
>> +		.handle_interrupt = genphy_handle_interrupt_no_ack,
>> +		.match_phy_device = en751221_phy_match,
>>   		.suspend	= genphy_suspend,
>>   		.resume		= genphy_resume,
>>   		.read_page	= mtk_phy_read_page,
>> -- 
>> 2.39.5
>>

