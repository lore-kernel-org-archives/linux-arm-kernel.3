Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60970C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11f6SdDiBsLZEK+6xrnQANC+Z+Fp65AqSdwdx2iIhKY=; b=RzR34mstsc0eeNDaCn+pNuKadM
	l7gojLEtJx8fsVFPCRlIULl/uhqXB1Uv0aSmKAreidoJHYj0gYLNXxklG4LRsHeK0Am5D6nfS7kIy
	PR3WgQy/OSvlnzzBCdZzQKPIsQ9xp81YZdlsH4bhuh+PuGhlW4u6RyfJbNk0wFhwNi1iJO1dxNgU4
	6hLxSs+oqC9zMv+LvTqbOFWJIFey0sFH7QgFFYfhekHTWZgh1v02DrHmJgzw6GURntGxsDkp0FCLH
	L2Lyof8wYqWJV0T1c+vpNOG31M03iZcGl00bL1t/uBGPR/zWpdbHGBpOnPDmTWPqw3QVxxupSNl4B
	nwLltwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yoN-0000000GQJE-3mbv;
	Fri, 11 Sep 2026 10:48:51 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yoL-0000000GQI1-0wEU;
	Fri, 11 Sep 2026 10:48:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0103741E8BE;
	Fri, 11 Sep 2026 12:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789123724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=11f6SdDiBsLZEK+6xrnQANC+Z+Fp65AqSdwdx2iIhKY=;
	b=rNCxHeT0mYxpRuViaP9flP64qaNE7U13NSACKvh4kwEmZxhLqJvnHMHn+ZDVGA94hobwD5
	Wz488/BOmE+sW3/sExZD+3AQn4f42BvPwAczpKRJaTioBufsRF1vRytLB4aeNgho/DF2Eh
	mmZsHO0P1OXeG2vs2qALwismh3GhVf9kF+1oHVzP5NfOzxTdVekykCevZkO+R/y534nfFh
	PDWYSu2Gkd/CE1DOZ72CwjSHIbD84VjEJg/2NZDzslRLOwWVNFC8mW5eRX29ZXkI3JEJIq
	t6/Fh4zTELjtdNRp5Uqa+pOnZ99IuQMZrPl8h4zV9krgQyf6Xs8j8qa3HuEukw==
Message-ID: <3f0244b6-f557-497a-9e28-bcec63891398@cjdns.fr>
Date: Fri, 11 Sep 2026 12:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
From: Caleb James DeLisle <cjd@cjdns.fr>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
 <aqHlfmYa249e3HRM@makrotopia.org>
 <7a3479c8-45cc-4b88-b111-c35d59f370e1@cjdns.fr>
 <aqIOGgVujIKT7H2H@makrotopia.org>
 <f1c898c4-2a84-41e8-ad8d-8c79df3feb47@cjdns.fr>
Content-Language: en-US
In-Reply-To: <f1c898c4-2a84-41e8-ad8d-8c79df3feb47@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_034849_527380_88A0BDDB 
X-CRM114-Status: GOOD (  10.10  )
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

>>
>> Dumping the PHY register space and comparing it with MT7530 could also
>> help to indentify any better way than relying on the parent DT
>> compatible which *is* a bit of a stretch (but could well be
>> unavoidable, of course).
>
> I'll give it a shot but I have low confidence in it because AFAIK this 
> is actually a real MT7530 MCM just like MT7621 but it just happens to 
> be clocked to a weird PLL frequency.


I just sent a v2 and I didn't find a register that looks obviously like 
a chip sub-id so I left the check based on the DT. But since I have no 
documentation on any of this, here are the differences I found in case 
you or someone else may know something that I don't.


I dumped the pages (g0-g7,l0-l4,ext,misc,lpi,test,tr) and the 
MDIO_MMD_VEND(1|2) of non-0 non-active PHYs on MT7621 and EN7526G. The 
differences that seem potentially relevant are:


MT7621:
EXT   23 (0x17): 0x0800
MISC  20 (0x14): 0x0200
MISC  21 (0x15): 0xffff

EN7526G:
EXT   23 (0x17): 0x1800
MISC  20 (0x14): 0xffff
MISC  21 (0x15): 0x00fe


MMD is here: 
https://docs.google.com/spreadsheets/d/1kzdVxYqu4cTpe6ascNshn5PoCmxrbTkr3bAuWkqKkeg/edit?gid=835011309#gid=835011309 
with about 16 differences in total.


And regarding what's being changed by the patch, the registers, their 
MT7621 value, and the value set by the driver are as follows:

EXT 0x14 (MTK_PHY_AUX_CTRL_AND_STATUS) -> MT7621 = 0x3a55, EN751221 
sets 0x3a04

MDIO_MMD_VEND2 0x417 -> MT7521 = 0x7773, EN751221 sets 0x7775

MDIO_MMD_VEND1 0xa6 -> MT7621 = 0x03e0, EN751221 sets 0x0350

MDIO_MMD_VEND1 0x12 -> MT7621 = 0x7210, EN751221 sets 0xd210

The other difference of this implementation is both master/slave 
negotiation and EEE are unreliable. Maybe these give a hint as to what's 
different with this implementation - whether it's same silicon different 
frequency, different package, different FAB run, etc.


Thanks,

Caleb


