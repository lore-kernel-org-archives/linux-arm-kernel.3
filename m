Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB8D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qIqfkzVktUqGL4TZCqG/TtE6T+nDkJffSarBT3k/9Y=; b=auzoe4Cznw0iUT/NjOwegnmHCv
	u9A1E43TAMV5SXK+bzqb2iBpsP3ndzn6lXd6v+oPY1mtVeVbVQzRFiq20sOznlSvuyQYT8e4xFcOV
	KoyQYqiQjlJT3y0g+piQJcKvFinw6fG0TWZ2+9Z4G/g51SaHYDoGR+Nc7q4vwy0YZgWO9FTM4giqk
	OG5dOFShQSfxRlxzjN7YgzlOtnBREUuaGpu9rhBr6Z5R6dENA6pcBTi7j7R2UIIzpYbVLlsT/MwaD
	38NIY1K6EbF2jYTZhJ2mg81mGguvIstd9s+aYDJYQFMo7GFC0+6erzUl+wQFNLqTsqvlMttWFpQZ6
	gwDzEF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KM2-00000009uct-3umV;
	Mon, 28 Oct 2024 07:39:58 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KJY-00000009tmD-22yQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:37:28 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id CFC6EA0767;
	Mon, 28 Oct 2024 08:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=8qIqfkzVktUqGL4TZCqG
	/TtE6T+nDkJffSarBT3k/9Y=; b=khpG7v+0iIyiW18Bod+0hVtkZ/dm8REBF7OQ
	+2mnCyibYzfdDRLIkPajNd7AysCLbBVjwatGc30KDxZR7fRgX2Acg0anP5P2vj6t
	QgGYO7adaVb0mrDVM+2o7tMEaD8g2llZMXNDTvoUTG/l/2xs507g0kgRP773cLD8
	lzHMY6xmOG3hm4l1SsA7gNtIPIfJ+xp23jm2NyNwhjIi5pI9fZU1a9j3ygJmiui6
	Oqgb71KTX5ftpELGpvXM2ptUZft7Hteu7YhLX6h0vLZvVzDmLzWbk8dGdJIJRKud
	c4eQoyYinGD0HNal5Elo7lC7rhyTa53hFNgZpUgntoICWmkda6qsvcOdwr6FgmI+
	TPzA9vgn5sZPF7mWQVUnN8WigmjochcWrGvWZ+IDp6IrF4m28pOMac48AJZbAe22
	Ow33c4lfr8Pa5msQ8928EKifDDBeetGWZ4iHnTOsRbjWIKzapehXrwpXMTrXLhnf
	oPF5F8dS11aUcTFHiH0ktmoa52RX689jyIbkLAHQWzxonAWR1Wwy+qdyCQ0pan2V
	ynqWbSoGl/vUYxdn+pFByMNTiPh5BSebicb3QNJL1uyjpoe48KulEiFnUEnm5Y1P
	2AD8SBkrnwqmdZCm4N5G060wf9htlJgOqPLnS1lXMj9V1xlctwN61qnoT2qdmrzc
	Ch5qujk=
Message-ID: <b74dafed-197a-4644-a546-54c7a1639484@prolan.hu>
Date: Mon, 28 Oct 2024 08:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
	<mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-2-csokas.bence@prolan.hu>
 <nlhsxigg3rbfvua76ekmub4p6df2asps2ihueouuk6zkbn56zl@xdj6jzzt4gfb>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <nlhsxigg3rbfvua76ekmub4p6df2asps2ihueouuk6zkbn56zl@xdj6jzzt4gfb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677C65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_003724_742134_80AE79D2 
X-CRM114-Status: GOOD (  11.30  )
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

Hi,

On 2024. 10. 27. 21:42, Krzysztof Kozlowski wrote:
> On Sun, Oct 27, 2024 at 10:14:32AM +0100, Csókás, Bence wrote:
>> From: Mesih Kilinc <mesihkilinc@gmail.com>
>>
>> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
>> has this bit but in order to support suniv we need to add it. So add
>> support for reset bit.
>>   
>>   static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
>> @@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_device *pdev)
>>   		return PTR_ERR(priv->clk);
>>   	}
>>   
>> +	if (priv->cfg->has_reset) {
>> +		priv->rst = devm_reset_control_get_exclusive(&pdev->dev,
>> +							     NULL);
>> +		if (IS_ERR(priv->rst)) {
>> +			dev_err_probe(&pdev->dev, "Failed to get reset control\n");
> 
> syntax is: return dev_err_probe()
> 
> Best regards,
> Krzysztof

Thanks! And regarding v3 of this patch, I have `clk_disable_unprepare()` 
after `dev_err_probe()`, I assume I have to let that be i.e. not return 
immediately?


