Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E118C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVepXsBCNO91FdjBvyQzGD6VrPN4gaXGPf+Aalnvykw=; b=izhcfyXnB4C3Ss8p47IkP8aUhz
	EUzfJnMeMjJbi0d0mQYoe/dLk74A9ljD1yTcNKYskwLfVi6kTxGxJh/7SkzlueDqnMDwtfAvb4nFn
	qGEX4tbmq4in3jgfEz5IInObWG/BFGKw5utBrmPUh+RgZmNf0Zv1ooVBBAQD35kQsJwoW3Yg7J3vZ
	UZIfnHu9IVHDZLSQS02gZIlTFevw7FwVZzsiU9aM2Cav3NB1F8l5vmgm0UPbOhGNiLyJvwKRTj1av
	KGEP49YHU8AvKvXcM4xs2/Qxwmxe3abXcvIUL1HGxfZihes0EUEanShhXvcChsrT00oAOEvv9lMH0
	fpvaDEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyBu-0000000B9Jz-0QtX;
	Wed, 18 Jun 2025 19:11:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRscn-0000000AGI3-0u8L
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kVepXsBCNO91FdjBvyQzGD6VrPN4gaXGPf+Aalnvykw=; b=RCnTpljdU5pVfOFdr7I6JRSyU1
	01V8NifdDdZEdnEkR5w1mzXyCqrXAVqf53Uud9LXaZg94DOdHkZm2PaPkaFmV20HJqvPnMjMoYkVP
	mo+ZhHc1JAT1JB1mLIE+uDgpsaJnra0HgLercaOdBWj1kOaSLLABPax5C5YXs+QpIFsOqhPcbw35N
	vvtt5fHJ1InoO2s3DL8X+53IflbaSZfSmEsBWbjv5SDGiKkJzR/uczYwm8flW9uiOIuqOOlWM8Txa
	4yyqJ/Yl3dgawwScUNykMP28BL3qJi95PB0CD1gm3FPsmku1HWwZv0xpI8qKwap0K4qW42n/YDOG1
	oQxn3d2g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsck-000000042r1-3LO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:14:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uRscP-0007dU-6k; Wed, 18 Jun 2025 15:14:21 +0200
Message-ID: <35925b11-175b-4185-8055-ba0374ce9a9a@pengutronix.de>
Date: Wed, 18 Jun 2025 15:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl, ls1046a-wdt
To: Meng Li <Meng.Li@windriver.com>, krzk+dt@kernel.org, linux@roeck-us.net,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev, shawnguo@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-2-Meng.Li@windriver.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250608030616.3874517-2-Meng.Li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_141443_041313_3FF0C183 
X-CRM114-Status: GOOD (  13.71  )
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



On 6/8/25 05:06, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 8a6c3a75a547..34951783a633 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -37,6 +37,7 @@ properties:
>                - fsl,ls1012a-wdt
>                - fsl,ls1021a-wdt
>                - fsl,ls1043a-wdt
> +              - fsl,ls1046a-wdt
>                - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>  
> @@ -105,6 +106,7 @@ allOf:
>                  - fsl,ls1012a-wdt
>                  - fsl,ls1021a-wdt
>                  - fsl,ls1043a-wdt
> +                - fsl,ls1046a-wdt
>      then:
>        properties:
>          big-endian: false

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


