Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91497C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkGBMQgjeGBCArxNyqBLEp0bu3yaKzmfKDbWpDOIDV0=; b=X4vumwO3oaN3jeKxAaly1L4XL0
	IXNaFKL/aklBS4JxIraowEtoIgrXiIhxGobON4Npqt7MAmtBFcpFtx162OQdX57Lnx22fV6Q3XvXO
	iU1DB2Z36O4VWR2WoLLm21vlkQnP3FlElOulwzymGi191nEDIfppOWRBa10kqW/BsBVLPEi7usjgz
	4uuTBRlYPmuNvTN4loRx5g80BwMvBbhOo5UuVOS10N8gOiNDmhGqAMwxDSZa8OIud1x9RNKhXuAnL
	URS0RvIhxED9c89JMYPJ585a9hURbFt6dXMrWoiG/pVYEbY2jmGEEcCcnnTPS4eaoukqa1ycsJMaE
	TlSMZcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vb-00000001Mna-39Lf;
	Thu, 08 May 2025 17:20:59 +0000
Received: from smtp-70.smtpout.orange.fr ([80.12.242.70] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3fa-00000001DeR-3NO9;
	Thu, 08 May 2025 16:00:24 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D3fTuFhAsh9deD3fTuUC05; Thu, 08 May 2025 18:00:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746720019;
	bh=VkGBMQgjeGBCArxNyqBLEp0bu3yaKzmfKDbWpDOIDV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=BWEKViV9LpG1HaJR0L1DVXeLeQZazyjHC14DAaINZvMXNWG4ClO8+K7ZgNGHD6bx7
	 kO84ccrRyDSX6Y5vwBLgupmSSoAZx9QT0GyvgxQxL1JR7s0k6e2kiu/4uJujpB0f79
	 w43JX7RmvYk8GJ32Yzil07MPI4pHxG/KJ2aqFiqRGLSR1bj8uD8ZwNTrvEpl+yf+u/
	 /LGuBf7uWyvyxDOXT7g9qR8BOYIe9NufZ9J/3h/lFS3iFjPp3WbxWQr8/7WOxlKZ5B
	 uXmZMP9fusoaopK7pCI+GdS84hFTQJAOnPHU31hf79+b0l2dYZtBKeP32ugC/b+I7n
	 LrJFIySFD5WDQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 08 May 2025 18:00:19 +0200
X-ME-IP: 90.11.132.44
Message-ID: <aeab63d4-9740-4213-86c3-ca975762046e@wanadoo.fr>
Date: Thu, 8 May 2025 18:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] net: airoha: Use dev_err_probe()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
 <1b67aa9ea0245325c3779d32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
 <aBzROQyQ_5oHmYr3@lore-desk>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aBzROQyQ_5oHmYr3@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_090022_974556_ADC82AEB 
X-CRM114-Status: GOOD (  14.91  )
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

Le 08/05/2025 à 17:43, Lorenzo Bianconi a écrit :
> On May 08, Christophe JAILLET wrote:
>> Use dev_err_probe() to slightly simplify the code.
>> It is less verbose, more informational and makes error logging more
>> consistent in the probe.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Changes in v2:
>>    - New patch
>>
>> Compile tested only.
>> ---
>>   drivers/net/ethernet/airoha/airoha_eth.c | 21 +++++++++------------
>>   1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
>> index 2335aa59b06f..7404ee894467 100644
>> --- a/drivers/net/ethernet/airoha/airoha_eth.c
>> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>> @@ -2896,10 +2896,9 @@ static int airoha_probe(struct platform_device *pdev)
>>   	eth->dev = &pdev->dev;
>>   
>>   	err = dma_set_mask_and_coherent(eth->dev, DMA_BIT_MASK(32));
>> -	if (err) {
>> -		dev_err(eth->dev, "failed configuring DMA mask\n");
>> -		return err;
>> -	}
>> +	if (err)
>> +		return dev_err_probe(eth->dev, err,
>> +				     "failed configuring DMA mask\n");
> 
> Can dma_set_mask_and_coherent() return -EPROBE_DEFER? The other parts are fine.
> 
> Regards,
> Lorenzo
> 

No, it can't, but using dev_err_probe() does not hurt.

Using dev_err_probe():
   - saves 1 LoC
   - is consistent in the function
   - log the error code in a human readable format
   - generate smaller binaries (can easily be checked with size)

So, even if "unneeded", I think it is still a improvement.

CJ

