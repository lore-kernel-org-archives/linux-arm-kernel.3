Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B76CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4A5sC6vx4DwfGfQ1k1Mlreu32CFe9N+OnTRiJsS5XI=; b=da25X42XdDPaVr75hFBOHlDHfE
	yovP660/G8X8DKDZeLVGoQFPYRe+bpa3dx3EuK3q39mHW6s/rfHmR2aCUi5Nn1smEbEdDkGsQJRT9
	Ctn6u70aQK5/fgKbh6Qy9r93MBgNA2hanMUgq6bIYCZy2jSBaLtyKjD/f6fPlpkCVHjmWy9u0xq6o
	X6iVXEUm7gvxoCKWi2poMaIT1/6l3NKrIzRqvv0q1Fu8jfSCvQaAHaK0juiknyCzS/9Tj54zzsiDl
	x4RIoOFi16/QkTwf1K4P8hMFOVExPSBhuRlzCUR9ssduT79bu4oYyHC7zofx8STYRB8UdyKO8q147
	hAVZwtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZOj-0000000EWdM-2gvO;
	Sun, 16 Nov 2025 09:50:17 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZOg-0000000EWd1-2yx4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 09:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=U4A5sC6vx4DwfGfQ1k1Mlreu32CFe9N+OnTRiJsS5XI=;
	b=S1m1+eEgNtV/MtOka1ZTSFj7g7N6dqQ0meJ2NODGU7I8LFnBtJ1kLw0iAt74W8
	NOsO3LJU8uYGjjF22TB8C4ANXw+uI9QYCnyy0nfugZ8pptDeOiU7z3XCfRRWbxhk
	isfbNf6LRjgm2gN8BtUZIZNfloKijhgq/50FxDL8PSMng=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHr4c1nhlpklwWAg--.8044S3;
	Sun, 16 Nov 2025 17:49:43 +0800 (CST)
Date: Sun, 16 Nov 2025 17:49:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qxp-mek: Add sensors under i2c1 bus
Message-ID: <aRmeNSTudl1mBvsn@dragon>
References: <20251029-qxp_sensor-v1-0-e97ee1de96d8@nxp.com>
 <20251029-qxp_sensor-v1-2-e97ee1de96d8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-qxp_sensor-v1-2-e97ee1de96d8@nxp.com>
X-CM-TRANSID: M88vCgDHr4c1nhlpklwWAg--.8044S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4ktrW5CrWxKF45Zr17GFg_yoW8XF4Dpr
	97Z393Wr1SvF12k34agFs5GFZ8Cw4rGFn09FnrJayFkrsruFyDt3W7Krnxuw48XF4xXw4S
	qF1vvr1jkrnxXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URGQDUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBhWu2kZnjh-mwAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_015015_091791_1D46EBFD 
X-CRM114-Status: GOOD (  12.29  )
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

On Wed, Oct 29, 2025 at 03:27:19PM -0400, Frank Li wrote:
> Add sensors under i2c1 bus.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 7b033744554105de6dbc4366f21e3c90f1768deb..9a96018e6f0680ac503135726f4899aca121e7f6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -450,10 +450,36 @@ i2c@2 {
>  			#size-cells = <0>;
>  			reg = <2>;
>  
> +			accelerometer@1e {
> +				compatible = "nxp,fxos8700";
> +				reg = <0x1e>;
> +			};
> +
> +			gyroscope@21 {
> +				compatible = "nxp,fxas21002c";
> +				reg = <0x21>;
> +			};
> +
>  			pressure-sensor@60 {
>  				compatible = "fsl,mpl3115";
>  				reg = <0x60>;
>  			};
> +
> +			/* Ref SCH-54536 */
> +			pressure-sensor@77 {
> +				compatible = "meas,ms5611";
> +				reg = <0x77>;
> +			};
> +
> +			inertial-meter@68 {

Keep devices sorted in slave address.

Shawn

> +				compatible = "invensense,icm20602";
> +				reg = <0x68>;
> +			};
> +
> +			inertial-meter@69 {
> +				compatible = "invensense,iam20380";
> +				reg = <0x69>;
> +			};
>  		};
>  
>  		i2c@3 {
> @@ -483,6 +509,12 @@ light-sensor@44 {
>  				interrupt-parent = <&lsio_gpio1>;
>  				interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>  			};
> +
> +			/* Ref SCH-54536 */
> +			light-sensort@60 {
> +				compatible = "vishay,vcnl4035";
> +				reg = <0x60>;
> +			};
>  		};
>  	};
>  
> 
> -- 
> 2.34.1
> 


