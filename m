Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A17C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIRWE08Jz2hqy+Qos4XgtLW5hC7mTV+M8qYJ7bO1IKg=; b=XL8pkLn2v3rTJPtGKbkEACbBu2
	urs5cHPTV45WZbEMLnwEDkKOedy1uzS9ZWI8rVDS6oZqvCNT6KupTpk4XCnSnrnn53LVS+CPn1zJd
	6JSF5hs1ven7tJIoOlPzhOrBpAaZgS1rdkqnRZtpvftDmiwixK3I9kF00JfYqFki7TyPSmtUIqvqH
	efgsT2I1IZVla1NlsTdTuMbnsgEYXLP6P5i+OvXX/UzQXC7f2Qz0GP5tjN+pa+2T/DauQvCSvvGRV
	L7RhbkB9HN1I9y8lnEc55vRiYGalMUht4UQG9z9lBS8J1Fn+81bekDfKzV+DgN8OTe/OlRaNky3rA
	1AIPgrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjd4-00000003L9r-29SL;
	Mon, 23 Jun 2025 16:02:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgMZ-00000002hot-28C3;
	Mon, 23 Jun 2025 12:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750682006;
	bh=WaDo2VjuGWUJif4F4F5rmWUyOyYzy9Md9CqJKUmOAlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GwEn1t03W2xslPqY+JSc+nqh27zLnSDo5JzMbiCjMzDii8k2dCfUQrAP6TDHGpyOk
	 Zoh0XCIedaFFESIy41gEpfo3PQqeWmso6TBDQ+z6W6vPRcqfVT2jDM2i+ROgKtacQA
	 xHz7birge5qTDmPcL8vP7qdOqdaoRA545TV5SGbT7oM/0x58XKTg7KIQkI0z716ek0
	 KKulX8gimq7y7ip/G4+pvMr2Thu1JOvcNmwk4NDX81Px+nxNfzuvJONm1ACL1MMLJX
	 fjPBR3IELUuxu5cGVVndGaBdELp9LA1ZaQ54VSPrtYYDhqKligrrLhQjGwmMc+JKjC
	 yZEniMLIx/h4w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EFE117E090E;
	Mon, 23 Jun 2025 14:33:25 +0200 (CEST)
Message-ID: <b7b78f8c-b70f-424c-90b8-eeb0eda50041@collabora.com>
Date: Mon, 23 Jun 2025 14:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/30] clk: mediatek: mt8196: Add UFS and PEXTP0/1 reset
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250623102940.214269-1-laura.nao@collabora.com>
 <20250623102940.214269-31-laura.nao@collabora.com>
 <d1802074-5472-475c-94b6-a0667e353208@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d1802074-5472-475c-94b6-a0667e353208@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_053327_692643_579CE9E7 
X-CRM114-Status: GOOD (  11.55  )
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

Il 23/06/25 14:14, Krzysztof Kozlowski ha scritto:
> On 23/06/2025 12:29, Laura Nao wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Add definitions to register the reset controllers found in the
>> UFS and PEXTP clock controllers.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt8196-pextp.c  | 36 ++++++++++++++++++++++++
>>   drivers/clk/mediatek/clk-mt8196-ufs_ao.c | 25 ++++++++++++++++
>>   2 files changed, 61 insertions(+)
> 
> You just added these files. Don't add incomplete driver just to fix it
> later. Add complete driver.
> 
> Patch should be squashed.

Laura, feel free to squash the patches.

Cheers,
Angelo

> 
> Best regards,
> Krzysztof


