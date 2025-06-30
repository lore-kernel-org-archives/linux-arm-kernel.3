Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C65C83026
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntb8givJwlkFP6I+spCEhz8mjbF6thq0psXiQxWrb38=; b=Jl0q2tC2GFbau8u972iqErQHVz
	uHaoO7GRS0BcEAV07o+5tf2+A0cAz0CeNH6XSM+nPvLYwWgtK6ldbhsVlsjd/y/Q/eMugAmhjIE8K
	daXuX1Un/aDA4TOUn3Lvng9e5/u0Jal38SYMloOC6ct7Q3ruTFmuU7cO/P+MMKKkPmGpwb8U4xsuE
	m8P5ESc/dKtAQl6e+qVm6eW7k9sZsIPAX/4Nry+N0OSAwdAsL7kkvG5mtrz9rRv6gmYvfW0imU0Ne
	4bPNSelBMsXrQzcv2xOPux9jNHrp5iE+yVd0qieCMIlVLDUFJtobM05meb1V+5draHuF/yKPhooKj
	BIf/Oa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9BK-00000001U0P-3EmA;
	Mon, 30 Jun 2025 07:44:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW97V-00000001TaC-2eQC;
	Mon, 30 Jun 2025 07:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751269203;
	bh=v6IcimvUqsuVHvRdLPcpsC2EKecm3HZpeFUwlP6K4sQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dTyzqLGsVn0DnQHTwBQEs5oxtpykR3tEtnwoiIdWWf8XTiXNMwdhQYgaOkJGXSihR
	 UA5b+jxKoUW5gn+ZGGTuIARnXFv3jT7BzFAgTLIQgvOOctw3F27yh3pfMfmELEn49S
	 sVbF9uq77LjjNngUCi5JyYSXzmX+SY8JrZZETTo+1dKzMY56rvfBV2GfONMUuoEKbE
	 198BJ7ihPIoV5Rd8DWN3fHZ4ZXJAMxGmkzHR4xOr2vGordA/We74ERc0STAlyoOON/
	 Lc/a0ZXs19DZYsLOoECc6RHbFnoMAOLHeflHtFVaDczAkUWoWsC7luiLi8YiNmGBlp
	 1f4qmzhhySbFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FDF317E0342;
	Mon, 30 Jun 2025 09:40:02 +0200 (CEST)
Message-ID: <3fc71a09-8a09-4305-bd4d-3f157bb0ed3a@collabora.com>
Date: Mon, 30 Jun 2025 09:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-9-f7f842196986@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250626-mt6572-v2-9-f7f842196986@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_004005_825048_05FE3ABF 
X-CRM114-Status: GOOD (  15.58  )
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

Il 26/06/25 10:54, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add basic support for the MediaTek MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   arch/arm/boot/dts/mediatek/mt6572.dtsi | 109 +++++++++++++++++++++++++++++++++
>   1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..b4fa376619a58cacd33ef556f80c1a4f7126c4f5
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mediatek,mt6572";

Please, remove this compatible as it's anyway going to be overridden in all of the
board specific devicetrees; after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

