Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD90ACD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLdmVigfgi2ES1tykurI6AsaVZeRKNiKh17V/jrcIrs=; b=MI8p7q+lSiyZeict5SGcVmXtWe
	1geM4UYZC5lM0qJdyANZ4wf6KrPxHdQ386TkVH8KkjQdQJ2MzwjCXIRsUddj5k1BpO9hdwmgE2rfv
	ZLMoK1dWmu5Q4qAHtjFJL/tygBRPtPNRHgsPZ1lGmK51q+saqcuw9DnfiJsXgLLnfk60QfE0C92tj
	x3fF5/9COcPq0Zu4RcPbWT8BC2nFZQLIkPlQ2NNX6VaI4PrpuGkV7+4E1SKLi1PbGPAAvJfWQlt1P
	B+2XPuaeFnDdecc7KPCkLMjPjr4JqRbA4QZCVq8t3Ee56v/mRZWH8nbH7sqirokmAjYadffoUx/MF
	K7jgAv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXme-00000000wLW-2twj;
	Fri, 05 Jun 2026 16:52:36 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXmb-00000000wL6-3qdz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1780678302; x=1781283102; i=wahrenst@gmx.net;
	bh=oLdmVigfgi2ES1tykurI6AsaVZeRKNiKh17V/jrcIrs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OJRDkLICoTY4nB4kNr92J0UuSzqEsinetgzqXcD6AC7ubT3rgC3SVIt8owIh/p7z
	 Kum966oBeyGuZPmbXqXn3t5tXoh6yaVWxECl/6oPl6vD455xuqO7bq4Wp3G1QEB0S
	 4i2xo7odkIVQcDB7PJbnD4UfnYoZHoTitN90Lu3ieSn1ehOiwcL6IPCwHKlmj5Rd7
	 vCJIMd0KY05AgSf+Qs+6OA6h0XRlW18ETTeQzqI6DUEA2l2+Efsd/lWLf/uJ2mW+I
	 sd9unvgUSH43yzrB1n3uUVZJ1YqpWNUpJygzWzpr1NF27DQAcrfvvJZhIodGNgU04
	 +9BnRcJ8XmjHPspCDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1wldLd2gvP-00IpKo; Fri, 05
 Jun 2026 18:51:42 +0200
Message-ID: <b5e897f6-5d6a-4d5b-b862-c11b240890ab@gmx.net>
Date: Fri, 5 Jun 2026 18:51:40 +0200
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
 <aiL5Yy7hiL30FENV@lizhi-Precision-Tower-5810>
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
In-Reply-To: <aiL5Yy7hiL30FENV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ozj+fS0F0Jfri/+5H9vsGbsv/iyFEonp79SI6lKb4pQh25sOoZ1
 VUsKd4XcNYJIgnQ3yzFHzKVz1oDU3srHjhJcjXLmA08TG/tFUhsPzEHgbZ1py2i+e/7pHDY
 iUUM2fuIq0/HaT+nWKKj2Ju8J+zVJ4TH5TRcTuzW6/pmrJM5Mt6okgTSli7E3qPrdZmEd84
 /B5r/3UvzzyOoqHVgHR2Q==
UI-OutboundReport: notjunk:1;M01:P0:TK8rNONpRbA=;TlFUvNYF0amVqjW6V/lND2czL6A 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_095234_268480_7920EC71 
X-CRM114-Status: GOOD (  13.86  )
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

Am 05.06.26 um 18:29 schrieb Frank Li:
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
> I will pick it, next time please cc imx@lists.linux.dev, otherwise, my imx
> patchwork can't see your patch
Sorry for this and thanks for picking

Regards
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


