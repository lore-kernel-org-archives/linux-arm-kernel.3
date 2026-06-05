Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF15CD8C81
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S5bTm8rbuZlIAAoSymNhUWu/wLeDuEjljh72CUpC8w=; b=VmH5Fz/F3uZPy12tzLJpZH0NFH
	Ewok907ttCOHOsL6hc1xtYAK29FKOiB6qlE048ocu+5jaDP3KuOjfJPIKyPVFBd5Vc/Y6VSHUya0M
	eMPNFNRUM/BLYp5mkySRK84X1fbx68L+jF/x8fQtZvtdumjCUBaXc0yv1B9dDCIGFD/avFnoR4mfy
	cxuv/hq5PV9rK9JsPsoCWEYGlJMAEu9gaDFSylBNbGtyXZ6c6AnbASpB7mylr9V2/5CV93SHYj8jY
	7W+kxhLbIXX29wpjRkBp5S3f7ZN1g9US9JXWPKzL5VfOoh0SZw/89ciohs7ebF14lggrBd8rde4s8
	diR2F7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXKF-00000000uGP-2921;
	Fri, 05 Jun 2026 16:23:15 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXKC-00000000uFx-1eT2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1780676537; x=1781281337; i=wahrenst@gmx.net;
	bh=7S5bTm8rbuZlIAAoSymNhUWu/wLeDuEjljh72CUpC8w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AZ8+U2JeFWaoa09ejBWPSN0+bhdRYG3YkjKzNzkIUxObSBsSNhE4gpO2Rd4CN7wZ
	 BE19/FxC1N009HILz6wUmV5VfdZPGk8IYFPt+ORjXkw5ixtPLysNThS/2xymIrvbH
	 QEvQn6Y25Q1yBQUqfYud5r6K9uqDkCflGdQlh3MQHXz2M7ZALkUVIvMU4WlXyIWmz
	 ibd/6IJKlJT1xS14X70faJR+Ts+Mq22ntm7Mnp502LgIje7k3W4V2AD4ijXqlwGo/
	 NSXW48Rk+hE9FY50eydIFArqEQsuhwBW3uHUkD/kPTV80sj5OVf3lcJPsPQWnlrCe
	 ZDZnCkJ+u3C9Hw3iYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1wbqhH3pE3-00BDfV; Fri, 05
 Jun 2026 18:22:16 +0200
Message-ID: <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
Date: Fri, 5 Jun 2026 18:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64: defconfig: Enable DP83822 PHY driver
To: Frank Li <Frank.Li@nxp.com>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
 Primoz Fiser <primoz.fiser@norik.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260527151414.184823-1-wahrenst@gmx.net>
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
In-Reply-To: <20260527151414.184823-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3llaiK3jbj1JNvOOORQdIFTIAGUt/VMV6CWSPAxJ0pa4WI61VSw
 zFMucLkljZl1BbBVEH0X1OxUbTx3zOBWGALAyd3i4l1lg8H3e58rHuEPa04CQvZwONnV+As
 +tLu9xcAjHl4d7YsfmQRwnyc4YoQZ0HO0wokLZS4jInCqZKM85SGT73BftcuGwch1mgOs+5
 eSRsdYk8ly9Vqtv6B9c3g==
UI-OutboundReport: notjunk:1;M01:P0:e3IRCbbwp4E=;ZTXq9fwKF5NAxDXinPCzJGF92lo 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_092312_807685_3F394412 
X-CRM114-Status: GOOD (  14.37  )
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

Am 27.05.26 um 17:14 schrieb Stefan Wahren:
> Enable DP83822 PHY driver as a module to support the Ethernet PHY,
> which is placed on phyCORE-i.MX93 SOM.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
could you please take care of this patch?
> ---
>
> Changes in V2:
> - rebase patch
> - add Krzysztof's Reviewed-by
>
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f93..20bbbd310d2f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -421,6 +421,7 @@ CONFIG_AT803X_PHY=y
>   CONFIG_QCA808X_PHY=m
>   CONFIG_REALTEK_PHY=y
>   CONFIG_ROCKCHIP_PHY=y
> +CONFIG_DP83822_PHY=m
>   CONFIG_DP83867_PHY=y
>   CONFIG_DP83869_PHY=m
>   CONFIG_DP83TG720_PHY=m


