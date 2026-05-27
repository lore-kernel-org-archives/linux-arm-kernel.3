Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D579CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87egiPaTb6TEc6vvvCGBQXU6+oy7c7NXrivB4XpIy3E=; b=JfBKVrYhpwSLHticueTguCQxv5
	dmKpsSxCNl+4vbYOivRms05xiURLx2J5f0Y6uBAGfZ+Hz4aX6pWrV7SujwXTZ7lj97km1SFJnQ4oG
	4yfXVvhbbPYVS+zZEEhrGxJuRb00BMI8+y14x8gvo+zxTJLnadx23Zkl8Dx1W64Wzab3puKLQapxL
	Ix1F7/nkxIdUpI6bXdFg1ZbLxyN0C20SNhD+9kHKckxWWbxn+hByrNEMv3nWMCvjSV7A8GuXksfLW
	R3LS105SdWwVXDF14FPntBuSbTuXS/IIyz7TpeDmQKZY13paenuD3/OtYDdR9oYnwtVD5x5XTKt1m
	MghfzNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFUI-00000004JgJ-46Sy;
	Wed, 27 May 2026 14:44:02 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFUF-00000004Jfu-3o6i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1779893029; x=1780497829; i=wahrenst@gmx.net;
	bh=87egiPaTb6TEc6vvvCGBQXU6+oy7c7NXrivB4XpIy3E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=V9Jo9/j0CeXXaYvyta5v8PKUHn1lcsMIi4eBybaUGCo/ds/Pated8ZQjiuROsrD7
	 HBgwpwO+LAz6T/irGeC+K6xqAhD8b9iTBpb/uiUC3O4Q1WQBpHM4Yzj+sSN2D+RYR
	 4akB00GTXMRybhGeJ0exw/Sw8XLCQAz3TL4WNv7I5g+g9yE97UAQqtwGQ7fsX/00X
	 NrH2M9bnLz+9GeTttxpQCTDsMWLF+C2VzFd2tg9h9NbdQAQuvnyhelaPAbmc+iusP
	 3/jmCdABjuIzfpqfGo+9mfXF/S2UiSFv6qCiGz9V4NaoaAm2OCSdUdK3AvSLI+IdE
	 2dVvsdns+3hJHxbUQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1wwvTQ0zyL-00m1Wz; Wed, 27
 May 2026 16:43:49 +0200
Message-ID: <0f467da4-944c-4648-8690-b84153bb6555@gmx.net>
Date: Wed, 27 May 2026 16:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable DP83822 PHY driver
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
 Primoz Fiser <primoz.fiser@norik.com>, linux-arm-kernel@lists.infradead.org
References: <20260502124312.6660-1-wahrenst@gmx.net>
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
In-Reply-To: <20260502124312.6660-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:eqH+us07+JQJ56icU6QwUrX4cnRJXrMs81snZeFBPAPmpA8cMW5
 wHCDxxksxmpDON//F0t5aj50HCh2vl8RuPnWTcgmsYs3JXACT8HuNS6c1ZRQRbkYw5ymNQ1
 AZlY/QLVuHRE2l4vObsYql2lEbqRin5kw4Rev2rAuIaija/k+jscoBAS5g9QAkddRZkLSAb
 RBZKemihWA9AkyvQj9saQ==
UI-OutboundReport: notjunk:1;M01:P0:mysmGcfJh4c=;u1cGd64tfzx+N4isKE2PI45N+RH 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 hsQoVPpdokl9bLZsVoA8aM3hxys=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_074400_236962_4B37EE5E 
X-CRM114-Status: GOOD (  12.89  )
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

Am 02.05.26 um 14:43 schrieb Stefan Wahren:
> Enable DP83822 PHY driver as a module to support the Ethernet PHY,
> which is placed on phyCORE-i.MX93 SOM.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Krzysztof send a Reviewed-by, but it isn't applied yet. Should I resend?

Best regards
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dd1ac01ee29b..cea96ed9a945 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -422,6 +422,7 @@ CONFIG_AT803X_PHY=y
>   CONFIG_QCA808X_PHY=m
>   CONFIG_REALTEK_PHY=y
>   CONFIG_ROCKCHIP_PHY=y
> +CONFIG_DP83822_PHY=m
>   CONFIG_DP83867_PHY=y
>   CONFIG_DP83869_PHY=m
>   CONFIG_DP83TG720_PHY=m


