Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E119C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi/dRVXiXBIot4v5nHDQZH3qjk6CazAUgLOp7/ZEMyo=; b=htgp7RyJB15VeLJwWRxfrWSVcY
	1Aid+N5695X1x5Glqm16rrhtklNlSUuxi7yIKcIRQHCS3AifPvm3xTVC7r/YOpj7b9+BDVlUZbvQv
	E06Ib0N1eUvIoWvuTiw+48rOJS++bGs6AHhot91ARpBV5XQQFXaDzhHuzOq6CIsSePYvdW2tS7sCe
	UneAX0z+ZnU2GGn1QtAtCcXCHft1CsDWDYF2GWmQni4Ja9yDR342CFxUICCICig6zuv4dVVa24A72
	IJAMt2gn2A58VdJlveIUsNpYXJQrHuRL7zeACaXf7Wm012PzKlWOp+r89ZIBcQhON06hetN72JK0Y
	AiJGjzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pt9-00000005pa0-097C;
	Tue, 15 Sep 2026 09:55:43 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pt5-00000005pYs-24gV;
	Tue, 15 Sep 2026 09:55:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8132D476D79;
	Tue, 15 Sep 2026 11:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789466133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Fi/dRVXiXBIot4v5nHDQZH3qjk6CazAUgLOp7/ZEMyo=;
	b=E56no6bXvfvfWeTMftV4PVj1DAjuMK7Xn6M1Q0ejyA1aBMsTX7kyxZyUIf60GgdKtarDIr
	Lvq35rb+5Ux3RhtOABB5GVzoihOvmMoAe5VoKVQ/lVJ+xmVxOEjOtAYKeMb5/ZSgkFjwWf
	jWrrXxjJGKdwO2WlLfVoVdeR6w0yKV3NLC4DC+3rd6jLYLxOXnm9HvV3DXqUkA7550gqNK
	Hnrxopx2C0jqER04Ykkof8osavGCNW2vuBd8jgIsb1iRV4a4d7V4KdjS7RO7t+eLZt0nTe
	cG1eFDCyEUs0td27/oGO17hkHL8LOP8gydXTivMlxy6lZvbAVxFZez0KJDBfdQ==
Message-ID: <c560a70b-8ccf-415a-ba8f-0c061a9f6b03@cjdns.fr>
Date: Tue, 15 Sep 2026 11:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260911120646.4123877-1-cjd@cjdns.fr>
 <a6e1bb7f-e395-434e-8e9b-992141969d74@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <a6e1bb7f-e395-434e-8e9b-992141969d74@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_025539_726953_E53A54C4 
X-CRM114-Status: GOOD (  10.20  )
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


On 14/09/2026 14:01, Andrew Lunn wrote:
>> + * The EcoNet EN751221 "G" multi-chip module MT7530 requires additional PHY
>> + * configuration.
>> + */
>> +static int en751221_mcm_phy_config_init(struct phy_device *phydev)
>> +{
>> +	int ret;
>> +
>> +	ret = genphy_soft_reset(phydev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Master/Slave negotiation does not work reliably */
>> +	ret = phy_write(phydev, MII_CTRL1000, ADVERTISE_1000FULL |
>> +			CTL1000_ENABLE_MASTER | CTL1000_PREFER_MASTER |
>> +			CTL1000_AS_MASTER);
> Is it sufficiently broken that we should stop the user changing it?


Well I must be going crazy because I tested this a second time and now 
it's working without forcing master at all. I guess when I was 
previously testing, I must have had some un-resetted state leftover from 
trying with EEE enabled. I will re-send without this command because it 
seems to work.


Thanks,

Caleb


>
>       ethtool     -s     devname    [speed N]    [lanes N]    [duplex half|full]
>              [port tp|aui|bnc|mii] [mdix auto|on|off]  [autoneg on|off]  [adver‐
>              tise N[/M]  |  advertise mode  on|off  ...]  [phyad N] [xcvr inter‐
>              nal|external]        [wol N[/M]         | wol p|u|m|b|a|g|s|f|d...]
>              [sopass xx:yy:zz:aa:bb:cc]      [master-slave preferred-master|pre‐
>              ferred-slave|forced-master|forced-slave]   [msglvl   N[/M] |    ms‐
>              glvl type on|off ...]
>
> You don't appear to have a config_aneg, so genphy_config_aneg() will
> be used, which calls genphy_setup_master_slave.
>
>     Andrew
>

