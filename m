Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB41D111B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv5bUFMxs4KAHpxzUJnsOpeLi4TFFl07AzHMQZEr5RI=; b=UR7xVdIyDw2z6yOcVCeCw2+OZo
	uUmQ7QYmyZ40E11ZoswUJCEMFXMJVioXtrC8X15eUgmZ9lRtV/F+WArB6MhuaVM+PySw4iEjJ38N+
	jORpP3TiLTx4Mo54qrMfh+uV4l116SeAwnk+x6aEtZvLPtMUQjse3xCm06K7RkQi2AnXhaPl64Feq
	DVi5RhCV9ylQTDfULnpQp5Ix07GMA8FJn+KF2JuL5jFoG6W+PcYCTpXanFWHwq09+wzNZJWrDtlF/
	Zz8jDuoE1iC52Cwc+CwUzWwINBVPYcalRpfOA4mAOe53mPQCb6FxmB0gAxzE6PefJfsPV8MK+GFdF
	/1brAMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rko-0000000CshL-0POF;
	Mon, 04 Nov 2024 07:44:02 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rj1-0000000CsRa-2Its
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:42:16 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9F2F4A03A7;
	Mon,  4 Nov 2024 08:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=xv5bUFMxs4KAHpxzUJns
	OpeLi4TFFl07AzHMQZEr5RI=; b=UjAozkVggqW7Pn76P3FQKyuO1H3QhUzKCKYG
	MXPGw/eeO+RT3nzUhFoQww6cJYUhECAu0iFRc66fHZG2pPfoMgFHWfRR7mAkgnd6
	tqvzdWluQ2BCtaPBInFwCA3LQ9cXcMpBFo1hv92cARW8sIYOz3OZPfWKrOOGRbR1
	OLbxrn0RJhp7yVl5QJuBtUk/Ao7uu4hrRHFXsFONq93aMs2l2JPikLZG3/EKPQSa
	tiSG6Oaoctb86Fnea2mE8+8+broZ1SdCvqRUBf/+cRLC/M1/QKhT3H3WacZyCU48
	ViPwCTZKybSK/WEVoiBB2QZykK4UDM6pAIpanlaPl/5bjSDbfNrURQiYSg6xBJLG
	ui1lCNRghhAk8JDqkxhZT7vUu+WazarSDyZcpIIXuNhkTPOKG8EVLjY/p14yukJ4
	0zpZ5ILtEC0U4oneBRww62WoFibPhvK1Ky/hOERdtKazEBfFZ6O2FXJpwd8I8Nrs
	TYKb0iKDMIxX8CtcmdiFfoQQNISwAg06LyBJOOqsLvlukQ6zoY3bbaN0CoXhl95H
	dXhwlmsx14UbGUp7II0uUk9kwf6yr39SjAjR2b3dPgEWQbsnid1r+D3Y/rS3ILic
	qb8inFrxASzV4CRmz1hldWWRMBvXcBIR8LWvWQGaAa2OSvcbKYizEv45MOUO88g8
	uZiOEJ4=
Message-ID: <656fab96-b326-4721-9b55-2b5e3d652703@prolan.hu>
Date: Mon, 4 Nov 2024 08:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] dma-engine: sun4i: Add has_reset option to quirk
To: Andre Przywara <andre.przywara@arm.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
	<mesihkilinc@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
References: <20241102093140.2625230-1-csokas.bence@prolan.hu>
 <20241102093140.2625230-3-csokas.bence@prolan.hu>
 <20241102174516.02d124d6@minigeek.lan>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20241102174516.02d124d6@minigeek.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_234212_082879_536DE981 
X-CRM114-Status: GOOD (  10.43  )
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

Hi!

On 2024. 11. 02. 18:45, Andre Przywara wrote:
> On Sat, 2 Nov 2024 10:31:41 +0100
> "Csókás, Bence" <csokas.bence@prolan.hu> wrote:
> 
> Hi,
> 
>> From: Mesih Kilinc <mesihkilinc@gmail.com>
>>
>>   static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
>> @@ -1215,6 +1218,13 @@ static int sun4i_dma_probe(struct platform_device *pdev)
>>   		return PTR_ERR(priv->clk);
>>   	}
>>   
>> +	if (priv->cfg->has_reset) {
>> +		priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> 
> Can't we use devm_reset_control_get_optional_exclusive(), and then save
> this whole has_reset bit?

For suniv, reset is REQUIRED. For sun4i, reset DOES NOT EXIST.

has_reset does not mean that whether this instance has a reset control 
or not, that is handled by checking priv->rst for NULL. has_reset means 
whether reset is REQUIRED by this type of DMA, specified by the DT match 
data.

Bence


