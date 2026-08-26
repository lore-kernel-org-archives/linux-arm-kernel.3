Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6FAC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+7SgzsZ1Y/K6TQ/aEsfofbJUDWnBL25FhcOxsOV1E8=; b=jgvusEcK+VtxBe98t/y2djSBcO
	65W1FBocqQnjoyRZqchqmIpHBHKE4tWf8xN38XsK/0m/uiM3w7cr4e4ByWD2/ugVzJi40FUjGNChI
	u3/n9elen4v/bphY1zm+giMhxr7RqvGYk75wCrEENxJ3QYm9fX+Jcw5Q52JRecPPNa9V3rvTgvvdB
	5/5OOHsP8nhg9t5TJpjDuokRgHdrYXkx9J9UxUcUzLMDB4tpKWl77Pyk/SnMoJ3LpdMFixZ322bzO
	r9gejXW4yz+vZFLMEHYtLnYFZaOY/OR7TU/jVlxL62+exJwxb0rd9pW5zNaiLvP48ueg2cc3evu5r
	0tcQ/2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGdd-00000002lPn-3KYh;
	Wed, 26 Aug 2026 16:38:09 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGda-00000002lOX-30iA;
	Wed, 26 Aug 2026 16:38:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26C3B1DF2C6;
	Wed, 26 Aug 2026 18:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787762283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=M+7SgzsZ1Y/K6TQ/aEsfofbJUDWnBL25FhcOxsOV1E8=;
	b=fMZ9KW/gnShK5/dxniHckjV8LE+yT7flsBZYhJEr4A3advuFY/ISy6puIFFIxicqzwg9hO
	Mq3IP2Fq5FmqRlUG7fLM2o14sNVHoiznwqg/LgfbnjEIEixvNtgLllNQIHTtPFLIoMQFPv
	VqFQRKb+eKJcdtrJ1tTPMqeKKvs2yT6kaYBSM/HZBgmjnyjy7awj0D1LWdS9vX+t8eu1Hn
	cvU70qZ9/8obpYNFgVcHhc0vuPX7aAfKaMpkxZbdfB0Rv4jNq8EGPCxs4NH9GrzH0G+nzZ
	1AfrTubP4RYdGM5OEtap0NA6546cYQBFv0M9L5bEuFzwsABmpcai9sKzmq1nDw==
Message-ID: <cd7e6b13-a712-43ce-aae6-f45da2f77ba9@cjdns.fr>
Date: Wed, 26 Aug 2026 18:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: support EcoNet EN751221
 gbit SoC PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: ansuelsmth@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260825193456.1823985-1-cjd@cjdns.fr>
 <20260825193456.1823985-4-cjd@cjdns.fr>
 <d7d86078-8a29-4e7f-a62e-91f6b266bea1@lunn.ch>
 <a75b6b15-f86b-4cb2-934c-87583b5bb02c@cjdns.fr>
 <4d594c62-2ceb-43c1-a3d2-731b80493787@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <4d594c62-2ceb-43c1-a3d2-731b80493787@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_093806_951325_2C7EEF0C 
X-CRM114-Status: GOOD (  19.88  )
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


On 26/08/2026 04:21, Andrew Lunn wrote:
>>> Does this need a change to the binding document?
>>
>> Not as far as I know. econet,en751221-chip-scu is defined in mfd/syscon.yaml
>> because it's a catch-all for configuration that the engineers didn't know
>> what to do with.
> Do you need a property in the PHY node to make this work?


No it's not requiring anything in the PHY node, instead it fishes for 
econet,en751221-chip-scu in the DT. I'm not much a fan of this pattern 
because of the magic, but this way of accessing is fairly common and in 
this case it is how Airoha likes to access the chip-scu thingy when they 
need it. 
https://lore.kernel.org/all/20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org/


>
>>>> +static int en751221_gphy_config_init(struct phy_device *phydev)
>>>> +{
>>>> +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
>>> Why is the EEE register being cleared?
>>
>>  From reading the reference implementation, I get the impression that this
>> hardware is something of a basket case. There was a certain amount of "write
>> three times and then read back" type magic that I just omitted because it
>> really looks like they were actively debugging and as soon as it started
>> working they shipped the code exactly as it was.
>>
>>
>> In the case of disabling EEE, I thought it more prudent to follow them
>> because I don't have every SoC that this PHY ever appeared on and I would
>> rather not diverge too greatly and risk it being unreliable on some devices.
> Is EEE broken? If it is, this is not the correct way to disable
> it. You should call phy_disable_eee(phydev); This will also prevent
> user space enabling it again.


I tested my board removing the EEE disable and the MASTER line, and it 
seems to work. I can't get any CRC errors flooding the link, and 
MII_STAT1000 reads LPA_1000LOCALRXOK | LPA_1000REMRXOK | LPA_1000FULL 
which suggests to me that it's able to operate happily in slave mode.


So unless you or someone else thinks it's inadvisable, I'm inclined to 
just enable these things and then wait to see if anybody finds a board 
that has problems.


Thanks,

Caleb


>
>>>> +	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
>>>> +	__mtk_tr_write(phydev, 0x1, 0xf, 0x00, 0x00002b);
>>>> +	__mtk_tr_write(phydev, 0x1, 0xf, 0x03, 0x082422);
>>>> +	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
>>>> +
>>>> +	ret = phy_write(phydev, MII_CTRL1000,
>>>> +			ADVERTISE_1000FULL | CTL1000_PREFER_MASTER |
>>>> +			CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);
>>> What does this default to?
>> It starts with only ADVERTISE_1000FULL. I don't know why the engineers
>> wanted to set it to master, but its definitely intentional.
> Generally, switches take the master role, and client take the slave
> role. So this does make sense for a PHY used in a switch.
>
> 	Andrew
>

