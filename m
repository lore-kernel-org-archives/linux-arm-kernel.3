Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E48C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sd0Nefj/hx5VlUAmlqlVWdF5+FL/N8G6Z6Uuuq0IIBY=; b=mZlV67rvH6ub8lMhnubCaRXfdd
	gwO4k6WZdmmoalLRmQ4ifBGFB4KrSQdwJ9LCF0IGdDdHQTCEGMlKxkHVIW/OQmHBU9C9Smw4ENUVI
	sCrmHPQN0yOAxEZ87iu00bKo+4io6nWBlYKlHKmtHDwRDToHwaBWz3lgm+DOEFT9BrQW2ctR5X6Y2
	bpuSZbMNYomclKTSdqf9ccai+1FrDZ7pJtFQcMm7fvzXVP+DCOBtRtgM22QzsKk3N+1R08EMhJh4f
	l/Gg5D6r1c7sGsgFFsS5KCdcYsHo88h6LmK/ReNcYeVC8UinkhlYbxgskcf05nNN+rnMs1MPQjjzv
	WFfma/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QnC-00000006Zy8-3GSs;
	Wed, 09 Apr 2025 08:28:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QlJ-00000006ZXf-2GZD;
	Wed, 09 Apr 2025 08:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744187179;
	bh=wrOa//1C4u8hYENOAxqq+2W4agP1bfREkfVr0tNeANI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F4M+j51rC3JshiEfTXHA5tKJBpDoYImKAH5CAllztoULTu84ynM/m0X1gjyNr0bb7
	 o83QKIeC73hniza3njKH29vq0bplmPNLAyyH3LriOmF9mGgsVIz1Q8X51Nxw2zpkFD
	 5s38hOWVau7pPV2aE82YemPw2Sgkzv0XjjjFWdhQQBCYAqDAHt1XlL9EX08zRqM1Fk
	 QRMZ/V38HRRO8REFP/scEdG6Epme8kqSoTvueuiphBhPNt9icfCfQZ6zcz2GI0y5B8
	 QfwOk7c6MXeAX86zLCDOBp+phld5bOsn45WQj7gEo45Fv4IvVeTgQQZAZNoxSrt612
	 ZgHYzP8W4cmpw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10C8F17E0903;
	Wed,  9 Apr 2025 10:26:19 +0200 (CEST)
Message-ID: <e777f95c-c21f-4a91-b044-5fc19eb22c3d@collabora.com>
Date: Wed, 9 Apr 2025 10:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use
 devm_pm_runtime_enable
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-4-friday.yang@mediatek.com>
 <20250408-woodoo-quick-worm-bf82b4@shite>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250408-woodoo-quick-worm-bf82b4@shite>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_012623_790145_B2270E08 
X-CRM114-Status: GOOD (  15.57  )
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

Il 08/04/25 08:29, Krzysztof Kozlowski ha scritto:
> On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
>> Replace pm_runtime_enable with the devres-enabled version which
>> can trigger pm_runtime_disable.
>>
>> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
>> ---
>>   drivers/memory/mtk-smi.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>> index f25d46d2ef33..daef6d350419 100644
>> --- a/drivers/memory/mtk-smi.c
>> +++ b/drivers/memory/mtk-smi.c
>> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_link_remove;
>>
>> -	pm_runtime_enable(dev);
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		goto err_link_remove;
>> +
>>   	platform_set_drvdata(pdev, larb);
>>   	ret = component_add(dev, &mtk_smi_larb_component_ops);
>>   	if (ret)
>> -		goto err_pm_disable;
>> +		goto err_link_remove;
>>
>>   	return 0;
>>
>> -err_pm_disable:
>> -	pm_runtime_disable(dev);
> 
> You now broke/changed the order of cleanup without any explanation.
> 
> Best regards,
> Krzysztof
> 

I agree some comment in the commit description saying that the cleanup reordering
doesn't matter in this specific case would've been nice to have, but anyway IMO
it's not a big deal - he didn't break anything, anyway :-)

Instead, the big deal is that Friday forgot to retain Reviewed-by and Acked-by tags
that were released to him on those patches....... :-)

Cheers,
Angelo

