Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7E3CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTylNt1UdVsHDUYp9gMjLb+SsTmA1WBHhrZ7uPff1cw=; b=LfYIJqRIwfN4+hxvd9BB94fwmx
	dcskkZqAj+J5+548Y28K316rPfV+Da12Cn+UH+HL4oFyINrPxhiehIvWpE+9hB4ANmeOlGIUp0CCW
	DzwDaBa3V7J8X+54fMx0tlsPeQXeYPyiuJL8OSfzykVAMstBi3ktfOJl6RE4qW8IIPOdYEVMSB1t0
	WTNPM8502OrMYKS1Mcbd43oepGE8vpkGgns9bPueRiKR3TlS43gD1hs72rSSprCSyyxWvXQ6vLwPp
	NIRZytq60ROu6vK8e76zJHwJhGJyKCjFCsYl8BIq620e3JOw5O9t2iv0o3hmNCD5qUQ8mQSlZtsEG
	UsupgZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVY6J-00000000xhv-1zKD;
	Fri, 05 Jun 2026 17:12:55 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVY6G-00000000xh6-1U1A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 17:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1780679500; x=1781284300; i=wahrenst@gmx.net;
	bh=mTylNt1UdVsHDUYp9gMjLb+SsTmA1WBHhrZ7uPff1cw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fovSec5RvZiTG5zLEZmcviwDh0EiZOyxHCJNAMop0UdB7dMOJubma0IvezKtlo+N
	 R6mIMld0AVgZQCUw2C6gQEbJD4U4OaxGE1vRoPM8sq9SenQCWBgHKOeu86ezfiR33
	 yqOHd0eKPMQQHIl5tv19DsI2q5WK/9vGMihIODEDlnDpri3hyQKVHQ0n278ZcJLRc
	 mBoxddipAfPh/KmKVdEmy2Szr8EzpTbwwHDFgAUOBcSVXT5v2I2T0egYp9EdIbWKS
	 hFTOYdU4EApucl5T2GSGtCRYerEHgJJ1E4Uix/B54dK8d/1LOEmGShVChiC+OY9+b
	 gYSyhzpMh1ZHPMDbfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1x7e3G04dC-00nuoC; Fri, 05
 Jun 2026 19:11:40 +0200
Message-ID: <a9304534-2d7d-4316-bcd1-36ff0931bcf0@gmx.net>
Date: Fri, 5 Jun 2026 19:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64: defconfig: Enable DP83822 PHY driver
To: Frank Li <Frank.li@nxp.com>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
 Primoz Fiser <primoz.fiser@norik.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260527151414.184823-1-wahrenst@gmx.net>
 <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
 <aiL638OLrfntKmSC@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <aiL638OLrfntKmSC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0j0g2y4cakvO89lH6W233JTea55vVfPqa5MU9ySEQwKimb09jfH
 cXKCIjXaLpWoFNmfA66DpoA6FEsKJAqbhYm+SWLkF2iwakvx97Yfmnarh5pkKawTFjQAdPe
 YLMm2f0PM7fxdIembibfzyXg+mnZsRXChx+YRGM8D8wvfHPLrqhfwYE3NQOFixk/6SFWqQv
 eaovbETQRtRfINW3snmCw==
UI-OutboundReport: notjunk:1;M01:P0:NWH7hEEY1CU=;a31Oft3CdcZT0bun2OZpVGTjBwB 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_101252_843699_3164CFFF 
X-CRM114-Status: GOOD (  12.39  )
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

Hi Frank,

Am 05.06.26 um 18:35 schrieb Frank Li:
> On Fri, Jun 05, 2026 at 06:22:14PM +0200, Stefan Wahren wrote:
>> Hi Frank,
>>
>> Am 27.05.26 um 17:14 schrieb Stefan Wahren:
>>> Enable DP83822 PHY driver as a module to support the Ethernet PHY,
>>> which is placed on phyCORE-i.MX93 SOM.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> could you please take care of this patch?
> which is base commit, I can't apply clearly.
I rebased against torvalds/v7.1-rc1
>
> Frank
>
>>> ---
>>>
>>> Changes in V2:
>>> - rebase patch
>>> - add Krzysztof's Reviewed-by
>>>
>>>    arch/arm64/configs/defconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index d905a0777f93..20bbbd310d2f 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -421,6 +421,7 @@ CONFIG_AT803X_PHY=y
>>>    CONFIG_QCA808X_PHY=m
>>>    CONFIG_REALTEK_PHY=y
>>>    CONFIG_ROCKCHIP_PHY=y
>>> +CONFIG_DP83822_PHY=m
>>>    CONFIG_DP83867_PHY=y
>>>    CONFIG_DP83869_PHY=m
>>>    CONFIG_DP83TG720_PHY=m
>>


