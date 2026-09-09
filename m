Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09F5C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjFa+0tDikevuBm4q9CtkZnRLbUXGml043SLQjo4Y20=; b=z8JMfdS7eHQrYklGCynaDou+hz
	7E0Kqb9nE26u2Nd48KzOAjvkhqN/REZZla+RCbOIEAI4Kg7e8ldBCyFb5gDpiZ3FzPCK3eyLZCRl7
	zcaikBxeUYqT+FluBEfC4+btkIf2G/dM5oZDyfomZaidgCtZZh1d9y0SsNjKU1t7JvuNfxnvf1c8L
	gNZJ+XkW0n9VBamwShrriOEMe7RGxwi2UyrUkur0ktOAARVCM2jkFno8wbGDFhZhIXvSHevjoxplR
	q/EUVKmTs0yokagRltMuZfA9QXZdR4Iz1Nj+QmWPbM8o/qYDsCl9Pbl4YeJgqQOYTwngpPXCVrBPC
	3c5EsCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4RgT-0000000D5Qa-1kfs;
	Wed, 09 Sep 2026 23:26:29 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4RgP-0000000D5Pw-3zyi;
	Wed, 09 Sep 2026 23:26:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C0FB40B4DE;
	Thu, 10 Sep 2026 01:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1788996382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KjFa+0tDikevuBm4q9CtkZnRLbUXGml043SLQjo4Y20=;
	b=ZLh6GYtZUSHDlwpxATWxSRb0oIeM79jebqM94lRLuSLBRuSzFe+0Sjb2tO757S5xxuC/+2
	m4F4Vr/g8nnHJDp2fSovK1GqrGWMfe+F8u/syXv7tXb1Qtxm+YAfBf03HnA/LrlSE74vGG
	mnvRI7XoQM/iBrcnzoGTalHnKFDzyOdmJSDDx47B81xQaJuoBuxcc0CGeliOGm9bhBkkFF
	mqwDCeBQhSofPD9ULpjm2FLK22l3cVpCNZcw7otqLF2uqb/xJ1hAoyLM4TzKX/zCbcyDZb
	Ij+ryUfcMd+4FnInUtOsKwS+2z0qeCvmMRYkj770MUoVt/lOsTkDn9lUrzToHQ==
Message-ID: <7a3479c8-45cc-4b88-b111-c35d59f370e1@cjdns.fr>
Date: Thu, 10 Sep 2026 01:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
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
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aqHlfmYa249e3HRM@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_162626_275079_89B048D4 
X-CRM114-Status: GOOD (  15.05  )
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


On 10/09/2026 01:02, Daniel Golle wrote:
> On Wed, Sep 09, 2026 at 09:32:50PM +0000, Caleb James DeLisle wrote:
>> The EcoNet EN751221 multi-chip module implementation of the MT7530
>> requires some additional configuration of the PHYs on startup.
>> The reason for this is not known, but it is possible that it has
>> to do with the fact that the EN751221 MCM implementation of the
>> MT7530 runs at an abnormal PLL frequency (362.5Mhz).
>>
>> Detect whether the MT7530 PHY is attached to the MDIO bus of an
>> EcoNet EN751221 switch and if so, apply the necessary register
>> updates.
>>
>> Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
>> Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   drivers/net/phy/mediatek/mtk-ge.c | 61 +++++++++++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
>> index 73d9b72f9d9e..42b06c40d703 100644
>> --- a/drivers/net/phy/mediatek/mtk-ge.c
>> +++ b/drivers/net/phy/mediatek/mtk-ge.c
>> [...]
>>   static int mt7530_phy_config_init(struct phy_device *phydev)
>>   {
>> +	int ret;
>> +
>> +	if (mt7530_phy_is_en751221_companion(phydev)) {
> Please introduce a `.match_phy_device` operation for both, actual
> MT7530 and EN751221, similar eg. to `ksz8051_match_phy_device` in
> micrel.c.

Sounds good, since this will certainly collide with 
https://lore.kernel.org/netdev/20260827065930.2618729-2-cjd@cjdns.fr/ 
would you prefer them in the same patch, or as a patch set? If you'd 
like I can do this and the FE phy as a common patch set. Let me know 
what you prefer.

Thanks,

Caleb


