Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7839BD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJcpqX+IkDeSbbX5ZUT4/YtUVDj62JSdkHdihRSdL8c=; b=c3sz4X2rg6FRH5Vak2JaOPGw4d
	IrotgjX+5tp8YCTPU1mKlZKe48vUTbYdbwA/n7qpBpLlMRB3a/SXbgx83AEyQqZrVQxlbgkX00o63
	Sh2oohwPYRKzc17J+HzgGkj/JdoStnGbn+/DrP3L1sA4EWvyXf9aTW8dk0CJ0eTwAyRKy2ZIHMB5N
	gKuq19F/8Cl6A5cS5fnzGD6CWEFLpDROBElvEy53Ini88ECN4YzFmtXxfb7QsYAEwZb4hcxCG5RtY
	FeyBY4JCgd4SCijweRlrbWBgOP1zNf7kjP0bK5oSvW8Zp2X9AKEv/OycVx+K5d19uiBUlzIP6aPIk
	fR7ZngKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kmq-00000009rT4-0x4t;
	Fri, 08 Nov 2024 08:56:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kd4-00000009pQV-2v6n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:46:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t9Kcm-0001lQ-8f; Fri, 08 Nov 2024 09:45:48 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t9Kcl-002alM-2d;
	Fri, 08 Nov 2024 09:45:47 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t9Kcl-0004JW-2H;
	Fri, 08 Nov 2024 09:45:47 +0100
Date: Fri, 8 Nov 2024 09:45:47 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: trivial-devices: Add NXP P3T1085UK
 I3C/I2C temperature sensor
Message-ID: <20241108084547.dzmxgdwllwvbiw5n@pengutronix.de>
References: <20241107-p3t1085-v1-0-9a76cb85673f@nxp.com>
 <20241107-p3t1085-v1-1-9a76cb85673f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107-p3t1085-v1-1-9a76cb85673f@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_004606_755188_734900FE 
X-CRM114-Status: GOOD (  17.80  )
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

On 24-11-07, Frank Li wrote:
> P3T1085UK is a temperature-to-digital converter with a -40 °C to +125 °C
> range. The device can be communicated by a controller via the 2-wire serial
> I3C (up to 12.5 MHz) and I2C (up to 3.4 MHz) interface.
> 
> Add it to trivial-devices.yaml because only one 'reg' and 'interrupts'
> needs.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 6ecd6432b021b..361943b3d73bc 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -301,6 +301,8 @@ properties:
>            - national,lm92
>              # Nuvoton Temperature Sensor
>            - nuvoton,w83773g
> +            # NXP I2C/I3C Temperature Sensor (-40 °C to +125 °C)
> +          - nxp,p3t1085

The description of this binding says:

"This is a list of trivial I2C and SPI devices ..."

but you add a I2C and I3C device.

Also I really like to see that you add a "power-supply" property which
is most the time missing for such simple devices but always required.

Regards,
  Marco

>              # OKI ML86V7667 video decoder
>            - oki,ml86v7667
>              # ON Semiconductor ADT7462 Temperature, Voltage Monitor and Fan Controller
> 
> -- 
> 2.34.1
> 
> 
> 

