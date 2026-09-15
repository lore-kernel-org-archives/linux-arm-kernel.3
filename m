Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C559C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbavliD54dG7PozP9lPRJAT/qtK1sRmoX7AU//MVtoU=; b=q+W5HdymndTQRB3JTmghsdGnyM
	KDaizH5UuFTtdgmIz3eSfzcju2Ylklw/oVGLWmT6rgjItL6tY3ZtGYgdynngD2WPEO2QIll48zSty
	dbhJl1V1DS1mG1aKu271k8JrPkcVP32oC5x5fWIydKp17/NlN6dR7RqwCEmRtIHSxPnT57pa34mFn
	I6G3Z3rBX/MelGyQmZgNv/TIIbvXfGhy55bDwbbJ2A71Cpx+PH+uXoDEnONTVvA4rCnCMhBU6f8Cf
	gkhRm4I41A9CrFs4QLky4F/dhETrFpp57CoLfqyQtOF+QY98EjKEhasvt1oucJUNRfaBehq1e4lK5
	sEp7cwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RrN-00000006MQ2-0wsO;
	Tue, 15 Sep 2026 12:02:01 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rr9-00000006MMh-2EIv;
	Tue, 15 Sep 2026 12:01:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D77747E84B;
	Tue, 15 Sep 2026 14:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789473703; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tbavliD54dG7PozP9lPRJAT/qtK1sRmoX7AU//MVtoU=;
	b=tKafBG8KGwbeX0kxLyniCtDhO0GbcrDfhP5FBIiC6YlLcQxrcaiePXF7ks1dS4cyPsRwcD
	d2zoSOyyG5aZMlkZWmfOCo5qkKIMPtKK/JeF9sbZyZg265+Q/0/D3c5yc58KE8R2BWHACM
	r2x6te608l9C4R7HWEdL2kRS0XSv7OK0ZJV5GKzxLANja8bl9qfRjllp6qLBYbVn24mgia
	DeTfM6ljw336jVFbMd7x1AoPZbMYzKOq8gknRHo4ysKeYntnhy/S4ER2cyzTf4bjw5rUuJ
	cbqKYimekSRbqwzECicTMTIkPPWaMED9zgDf+C+VqXZPb0r9IdGQjBKulnICQQ==
Message-ID: <2a7edfd0-b784-4b60-b9f9-769fe00286b7@cjdns.fr>
Date: Tue, 15 Sep 2026 14:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260915113427.113296-1-cjd@cjdns.fr>
 <aqkwYd5dTmHDCIW9@makrotopia.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aqkwYd5dTmHDCIW9@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_050147_995990_E5B1CF18 
X-CRM114-Status: GOOD (  12.27  )
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


On 15/09/2026 13:47, Daniel Golle wrote:
> On Tue, Sep 15, 2026 at 11:34:27AM +0000, Caleb James DeLisle wrote:
>> [...]
>> +/*
>> + * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
>> + * does not advertise ESTATUS_1000_TFULL.
>> + */
>> +static bool mt7530_is_gphy(struct phy_device *phydev)
>> +{
>> +	return phydev->phy_id == MTK_GPHY_ID_MT7530 &&
>> +	       (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0;
>> +}
>> +
>> +static int mt7530_phy_match(struct phy_device *phydev,
>> +			    const struct phy_driver *phydrv)
>> +{
>> +	return mt7530_is_gphy(phydev) && !en751221_is_mcm_phy(phydev);
>> +}
>> +
>> +static int en751221_phy_match(struct phy_device *phydev,
>> +			      const struct phy_driver *phydrv)
>> +{
>> +	return mt7530_is_gphy(phydev) && en751221_is_mcm_phy(phydev);
>> +}
>> +
>>   static int mt7531_phy_config_init(struct phy_device *phydev)
>>   {
>>   	mtk_gephy_config_init(phydev);
>> @@ -135,6 +199,23 @@ static struct phy_driver mtk_gephy_driver[] = {
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
> I'd suggest to actually use phy_id and phy_id_mask assigned by the
> PHY_ID_MATCH_EXACT macro by calling genphy_match_phy_device() in your
> match functions above instead of open-coding the ID match.
> Or drop PHY_ID_MATCH_EXACT from *both* drivers.


I suppose the latter is easier because then I don't have to re-think 
mt7530_is_gphy() which would be lying if it wasn't actually checking ID 
is MTK_GPHY_ID_MT7530.


But I guess I should come back tomorrow since I'm already in trouble 
with the 24 hour bot.


Thanks,

Caleb



