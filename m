Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88633F34C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHJmMDoYWFoM6dwtiiIkEKq+ypH6lIJ3K5+eSUDa5zc=; b=pC+KdisKzM1PCNB9Zdkn4y3uzq
	/uL0sg1aE+Ooznl5h7GgbZRqXYuru6qKlqkhbEfeNh8lrIJizz8XrmB8OCy4xCk6RwluJztJPRan7
	Gwh72YwPp/k1aN1eym/Hk8C/hI9sEOdlRo4dWbJyl+YMBREtM880+4A1FrfKOFkoWON/5sne5wolB
	yUjZPD8JrFBIdy72ETfbw+EVv0XVv/jGHUk3lG53Bq2tepFcVdlRBRnpZteEV1DHPSGjNqq0p5axi
	CxiU9x5DpW2lro0Ola3nd8xxseBazGtlvnjxF6rYBcGFxIQ7a5tdaBVihkIJC2PdyyUp1ipKYn+y8
	cxcY7Ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIjr-0000000FuXA-1vGd;
	Mon, 13 Apr 2026 14:58:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIjp-0000000FuWb-1R2U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ADA44430D;
	Mon, 13 Apr 2026 14:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00411C2BCAF;
	Mon, 13 Apr 2026 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776092288;
	bh=c/crgD2cydhjzHPYC0Jib4vZAZ370Vr36kI0vZgqROU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cEnAxJqYidHsfLI5Q5LLp7L+MALVzEAcMA3d9iuNv5vgTUM7vvFiF7GVUN5rZvpgT
	 7WbICuo5qKFrJoeHZZTcxuoXfEoAmkrNk9Jx5vKuvhQj79sgU8D2tHJGQKevyT+f9d
	 wu8bUn2qa60JSctaHquVCUHi16ZVyni0ikezYzS7Cd+MFS4xdCTdAXteNmzhI+mTLX
	 FRgjmc8L/oj86kjGoYd99IzV2K0e2YO9FCJ+cfiLD5YyXIYhX7L3+WsWnOKLz2Tvon
	 2HjJO6uTXNhqDbXnINlxDA8swy3c1D68c1wtAZT5ZzIMkTJja3MeXKlqZ2rBua+7Rm
	 CbjCmLtIiy2Wg==
Message-ID: <c74c0245-7651-4cc8-8550-4b25f662a03e@kernel.org>
Date: Mon, 13 Apr 2026 09:58:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_075809_403343_E7C4C5A9 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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



On 4/12/26 12:12, Krzysztof Kozlowski wrote:
> I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
> enabled.  No impact on include/generated/autoconf.h.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm/configs/hisi_defconfig      | 1 -
>   arch/arm/configs/multi_v7_defconfig  | 1 -
>   arch/arm/configs/pxa_defconfig       | 1 -
>   arch/arm/configs/socfpga_defconfig   | 1 -

...

> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> index f2e42846b116..19a8e30a7b22 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

