Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DFCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwOgRv8FWM7xC0FLic5dPPFOQVWWI1lXpTN1kw/ZIng=; b=Cldd5HQaioX25wV1Mwah1lXh5p
	/nNYPlaHrwGEtFyzB90yTl/rJSprKS2Y0ZDbV6McBZ5GP4+2L2jjgaE9VrctP07xvvoSqL5XsyQ92
	hp+ZjL3bSqe3H46fsNQyNN8zOMy1++Vqbs8BuhPdnRBMHa0GQnqQhTSE8EAFJNy5AOxLn56FbsVJ9
	uOZculgZrweuSiul63ILdob3VIXld8QAZrTwa3hEwf72t9TjLeMAqJ+iT+6ijz+vbyUtaqYs4AGYs
	m6e17RAM2D5T0Aea/AGnm+pIG5NgolQrIeXVHcC2ZB2YmbIhEnt6jEU7nSZOncm2Hc1W27gRIyZll
	oUdOdFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrXW-0000000Gg36-1T9A;
	Tue, 25 Feb 2025 09:47:46 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmr1u-0000000GY39-2V5h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:15:08 +0000
Message-ID: <a042e0ff-3c9e-45f9-a621-c15a8fc27965@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740474904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwOgRv8FWM7xC0FLic5dPPFOQVWWI1lXpTN1kw/ZIng=;
	b=C+UKbjATfvY0KqJWT6lphcLfXqHfKo7sdCeqWUhAYnvzIZ4Yr1OGgyBr+bJvChgYPNaTW5
	TpxMuj2FPHWVPSBP7hLMCJsjU0skTjFQehT+r5cBYNUPKViVXigjO7QrL7b+XxdYtJLE96
	WGniK67QN5MD30Jb6CMLXv1kbwh13ew=
Date: Tue, 25 Feb 2025 17:14:51 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 4/4] stmmac: Replace deprecated PCI functions
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-6-phasta@kernel.org>
 <f1c3e538e19aca7fd46dd7f10da190d691bace83.camel@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <f1c3e538e19aca7fd46dd7f10da190d691bace83.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011506_778385_A8E0BB82 
X-CRM114-Status: GOOD (  14.40  )
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


在 2/25/25 3:16 PM, Philipp Stanner 写道:
> On Mon, 2025-02-24 at 14:53 +0100, Philipp Stanner wrote:
>> From: Philipp Stanner <pstanner@redhat.com>
>>
>> The PCI functions
>>    - pcim_iomap_regions() and
>>    - pcim_iomap_table()
>> have been deprecated.
>>
>> Replace them with their successor function, pcim_iomap_region().
>>
>> Make variable declaration order at closeby places comply with reverse
>> christmas tree order.
>>
>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 11 ++++-------
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 14 ++++++------
>> --
>>   2 files changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>> index f3ea6016be68..25ef7b9c5dce 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>> @@ -521,10 +521,10 @@ static int loongson_dwmac_acpi_config(struct
>> pci_dev *pdev,
>>   static int loongson_dwmac_probe(struct pci_dev *pdev, const struct
>> pci_device_id *id)
>>   {
>>   	struct plat_stmmacenet_data *plat;
>> +	struct stmmac_resources res = {};
>>   	struct stmmac_pci_info *info;
>> -	struct stmmac_resources res;
>>   	struct loongson_data *ld;
>> -	int ret, i;
>> +	int ret;
>>   
>>   	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
>>   	if (!plat)
>> @@ -554,13 +554,11 @@ static int loongson_dwmac_probe(struct pci_dev
>> *pdev, const struct pci_device_id
>>   	pci_set_master(pdev);
>>   
>>   	/* Get the base address of device */
>> -	ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
>> +	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);
>> +	ret = PTR_ERR_OR_ZERO(res.addr);
>>   	if (ret)
>>   		goto err_disable_device;
>>   
>> -	memset(&res, 0, sizeof(res));
>> -	res.addr = pcim_iomap_table(pdev)[0];
>> -
>>   	plat->bsp_priv = ld;
>>   	plat->setup = loongson_dwmac_setup;
>>   	ld->dev = &pdev->dev;
>> @@ -603,7 +601,6 @@ static void loongson_dwmac_remove(struct pci_dev
>> *pdev)
>>   	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
>>   	struct stmmac_priv *priv = netdev_priv(ndev);
>>   	struct loongson_data *ld;
>> -	int i;
> Just saw that this is a left-over that actually should be in patch 3.
> Will fix.
>
Yeah, with this


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng


