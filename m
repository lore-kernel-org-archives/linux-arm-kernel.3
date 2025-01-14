Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C6C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 02:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q++QPyxHMp/WwXTDrHwqKxKHjtWXHAXL/aKMbF08JiE=; b=hfj1oOrlegaI+h8pxPS7dRU5JH
	VoUpyoN8jX61Zbzx0WJfLGlQ7hHua/OBnYmI08HfUlHM2MnEkLRO0xrm0wVTmzJ5NJtZVDNAznxS6
	553QbID/pJoMHqP0FKOiVTUgFz5oxWrdq/ULHDeQkAjMF7C/9zgqLqDWE5rEeSysmDdfJpna62Mqs
	u5Xe8biWSolzP1X7pCCFBnEfPOu9QdXjuu0XLz80P9G6tFtCNg0lGfRs85j9HeoSFged56l2gREqo
	IEQDuFlHs3KAT8K9kwPDQRCaiWGBWYMI348iBGST/2bjzHr+weifVbhuFKX1R4JEliUl3QaK6L07q
	1QixI8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWag-00000007Ezh-1aOe;
	Tue, 14 Jan 2025 02:23:38 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWZQ-00000007EtZ-2gD8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 02:22:22 +0000
Received: from [192.168.0.224] (ip5f5ae8ae.dynamic.kabel-deutschland.de [95.90.232.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 55E1861E64780;
	Tue, 14 Jan 2025 03:22:03 +0100 (CET)
Message-ID: <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Date: Tue, 14 Jan 2025 03:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com,
 peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_182220_817756_089D658A 
X-CRM114-Status: GOOD (  11.63  )
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

Dear Andrew,


Thank you for your quick reply.


Am 14.01.25 um 21:16 schrieb Andrew Lunn:
>>> +#define NVT_MISCR_RMII          BIT(0)
>>> +
>>> +/* 2000ps is mapped to 0x0 ~ 0xF */
>>
>> Excuse my ignorance: What is ps?
> 
> picoseconds. An RGMII link needs a 2ns delay between the clock line
> and the data lines. Some MACs allow you to tune the delay they can
> insert, in this case in steps of 2ns / 16.

Thank you for the clarification. Maybe it’s my English, but I didn’t 
deduce this from how the comment is worded. I do not have a better idea 
either.

>>> +#define NVT_PATH_DELAY_DEC      134
>>> +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
>>> +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
>>> +
>>> +struct nvt_priv_data {
>>> +	struct platform_device *pdev;
>>> +	struct regmap *regmap;
>>> +};
>>> +
>>> +static struct nvt_priv_data *
>>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct nvt_priv_data *bsp_priv;
>>> +	phy_interface_t phy_mode;
>>> +	u32 tx_delay, rx_delay;
>>
>> Please append the unit to the variable name.
> 
> Which is trick, because they are in units of 2000/16 of a picosecond.

Understood. Maybe a comment could be added?


Kind regards,

Paul

