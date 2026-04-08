Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB510F995C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM051NeGJd3SKROVOPugNJeVjacWiD4pD7bkR9fjSw8=; b=zYeWjUEznGUri1y6Tsrw4ffOyC
	dAuOR7m7J95u73nWypUQgDsDhHxToFIAMAiYkR1C1MI2JNGEhcUE9rbykC//i3reCPjLjxxw4XoGY
	dJLh5nJhJ2pp2TbuSF0T7LtBUVAtxcEvTqXzae7UyIK780SrEgVsDjzjhmpUugZthXFMtUd0OR5ym
	cCtKq+aY0kOcOMy4ugLyj+agzov1big+dTKkVwKxYWM8Cr9mK3MgIPjjzM5inib/d0PWAo1CfSEuE
	ZFvmLCto/NsLfF1hKcDSWE9ALqQs8WyIiqcRs4XGKAx3ekFhoHhiXVBNczc70AvPEUH7KVtWAynZ1
	E6Yzm27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAW97-000000098nl-2ct5;
	Wed, 08 Apr 2026 16:52:53 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAW94-000000098nE-0uUs;
	Wed, 08 Apr 2026 16:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1775667167; x=1776271967; i=wahrenst@gmx.net;
	bh=eM051NeGJd3SKROVOPugNJeVjacWiD4pD7bkR9fjSw8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rKOHWJhtsZ5h1HwCJbFwUXtNkH1VTHwBccJfGT4WZznCIf+6s5j02C6+isgZ7eyL
	 zfoNJ9dkIIl2V7GxmBF2itorsg07CkF+33R7Mqkw4Wav5lN87Ave+Jdf5llDXOZik
	 cR9jV/qJAdLotC05eEB9+PLJHnnsQgau7aqnXg4vr5cl09W5ZsGJuJnQJRvHHpH3F
	 LbUrz5npD9Qiqmr5dqdIVVQKbhS2zLCNpuDPAKbab/owLGQqwRa/AmzDk4Fl08lmU
	 /aHIjuQJR1jWNtKkR3q6D6LVAUtdRUScR2dml5kW20hdBWlhmkGjMGvMEacs1d/5E
	 uXhye41OkiLBtZmJXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1vKktv35mm-00vgwL; Wed, 08
 Apr 2026 18:52:47 +0200
Message-ID: <251100fe-db96-4d83-899a-cd764582d698@gmx.net>
Date: Wed, 8 Apr 2026 18:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
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
In-Reply-To: <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QeamPME4jt+vQZ2l3IE6D89qiiuF8HtJ8/sx3LpeypnR2YI56pB
 xSiclDJjc7gqxVt6Qeu649F6Y0VKtRIciS+IKWqxn+BEwnvWXp9udsQFSMO5lbiG0V2vXN6
 GXUX8jU5yvFrHLkJKQOWu3AsBhWklPOYjYb+qXQOv3IEb+0HRzym7FWcP13CPwV747rbuxC
 Rlz93C8GJL2HDW5iSGuiA==
UI-OutboundReport: notjunk:1;M01:P0:yBFxjzV208Q=;6gGu7Oi4JS1sw4cogDX5SCx7qBy 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_095250_542377_B3A8D707 
X-CRM114-Status: GOOD (  31.18  )
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

Hi Gregor,

[drop Emma's old address]

Am 08.04.26 um 10:00 schrieb Gregor Herburger:
> Raspberry Pis have OTP registers which can be accessed through the
> videocore firmware. Add a nvmem driver to support these OTP registers.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>   drivers/nvmem/Kconfig                      |  12 +++
>   drivers/nvmem/Makefile                     |   1 +
>   drivers/nvmem/raspberrypi-otp.c            | 159 +++++++++++++++++++++=
++++++++
>   include/soc/bcm2835/raspberrypi-firmware.h |   2 +
>   4 files changed, 174 insertions(+)
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..892d05fe67be 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -483,4 +483,16 @@ config NVMEM_QORIQ_EFUSE
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem_qoriq_efuse.
>  =20
> +config NVMEM_RASPBERRYPI_OTP
> +	tristate "Raspberry Pi OTP support"
> +	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
> +	# happen when COMPILE_TEST=3Dy, hence the added !RASPBERRYPI_FIRMWARE.
I don't think these comments are necessary, because this applies to=20
other firmware drivers, too.
> +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMW=
ARE)
> +	help
> +	  This driver provides access to the Raspberry Pi OTP memory via the
> +	  nvmem subsystem. The driver supports the customer otp as well as the
> +	  device specific private key OTP.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called raspberrypi-otp.
>   endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 7252b8ec88d4..8ca2095e068f 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -95,3 +95,4 @@ obj-$(CONFIG_NVMEM_ZYNQMP)		+=3D nvmem_zynqmp_nvmem.o
>   nvmem_zynqmp_nvmem-y			:=3D zynqmp_nvmem.o
>   obj-$(CONFIG_NVMEM_QORIQ_EFUSE)		+=3D nvmem-qoriq-efuse.o
>   nvmem-qoriq-efuse-y			:=3D qoriq-efuse.o
> +obj-$(CONFIG_NVMEM_RASPBERRYPI_OTP)	+=3D raspberrypi-otp.o
> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi=
-otp.c
> new file mode 100644
> index 000000000000..13ee3784b137
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
> +struct rpi_otp_priv {
> +	struct rpi_firmware *fw;
> +	struct device *dev;
> +	u32 read_tag;
> +	u32 write_tag;
> +};
> +
> +struct rpi_otp_driver_data {
> +	const char *name;
> +	u32 read_tag;
> +	u32 write_tag;
> +};
> +
> +struct rpi_otp_header {
> +	u32 start;
> +	u32 count;
> +	u32 data[];
> +};
> +
> +static int rpi_otp_read(void *context, unsigned int offset, void *buf, =
size_t bytes)
> +{
> +	struct rpi_otp_priv *priv =3D context;
> +	struct rpi_otp_header *fwbuf;
> +	int ret;
> +
> +	fwbuf =3D kmalloc(sizeof(struct rpi_otp_header) + bytes, GFP_KERNEL);
> +	if (!fwbuf)
> +		return -ENOMEM;
> +
> +	fwbuf->start =3D offset / 4;
> +	fwbuf->count =3D bytes / 4;
> +
> +	ret =3D rpi_firmware_property(priv->fw, priv->read_tag, fwbuf,
> +				    sizeof(struct rpi_otp_header) + bytes);
> +	if (ret)
> +		goto out;
> +
> +	memcpy(buf, fwbuf->data, bytes);
> +
> +out:
> +	kfree(fwbuf);
> +	return ret;
> +}
> +
> +static int rpi_otp_write(void *context, unsigned int offset, void *val,=
 size_t bytes)
> +{
> +	struct rpi_otp_priv *priv =3D context;
> +	struct rpi_otp_header *fwbuf;
> +	int ret;
> +
> +	fwbuf =3D kmalloc(sizeof(struct rpi_otp_header) + bytes, GFP_KERNEL);
> +	if (!fwbuf)
> +		return -ENOMEM;
> +
> +	fwbuf->start =3D offset / 4;
> +	fwbuf->count =3D bytes / 4;
> +	memcpy(fwbuf->data, val, bytes);
> +
> +	ret =3D rpi_firmware_property(priv->fw, priv->write_tag, fwbuf,
> +				    sizeof(struct rpi_otp_header) + bytes);
> +
> +	kfree(fwbuf);
> +	return ret;
> +}
> +
> +static const struct rpi_otp_driver_data rpi_otp_customer =3D {
> +	.name =3D "rpi-otp-customer",
> +	.read_tag =3D RPI_FIRMWARE_GET_CUSTOMER_OTP,
> +	.write_tag =3D RPI_FIRMWARE_SET_CUSTOMER_OTP,
> +};
> +
> +static const struct rpi_otp_driver_data rpi_otp_private =3D {
> +	.name =3D "rpi-otp-private",
> +	.read_tag =3D RPI_FIRMWARE_GET_PRIVATE_OTP,
> +	.write_tag =3D RPI_FIRMWARE_SET_PRIVATE_OTP,
> +};
> +
> +static int rpi_otp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct nvmem_device *nvmem;
> +	struct rpi_otp_priv *priv;
> +	struct device_node *np;
> +	const struct rpi_otp_driver_data *data;
> +	struct nvmem_config config =3D {
> +		.read_only =3D false,
> +		.word_size =3D 4,
> +		.stride =3D 4,
> +		.reg_read =3D rpi_otp_read,
> +		.reg_write =3D rpi_otp_write,
> +		.size =3D 32,
> +	};
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	np =3D of_get_parent(dev->of_node);
> +	if (!np) {
> +		dev_err(dev, "Missing firmware node\n");
> +		return -ENOENT;
> +	}
> +
> +	priv->fw =3D devm_rpi_firmware_get(&pdev->dev, np);
> +	of_node_put(np);
> +	if (!priv->fw)
> +		return -EPROBE_DEFER;
> +
> +	priv->dev =3D dev;
> +	priv->read_tag =3D data->read_tag;
> +	priv->write_tag =3D data->write_tag;
> +	config.dev =3D dev;
> +	config.priv =3D priv;
> +	config.name =3D data->name;
> +
> +	nvmem =3D devm_nvmem_register(dev, &config);
> +	if (IS_ERR(nvmem))
> +		return dev_err_probe(dev, PTR_ERR(nvmem), "error registering nvmem co=
nfig\n");
> +
> +	return 0;
> +}
Is there any reason, why we cannot register this driver in=20
rpi_firmware_probe() like hwmon and clk driver?

I like to avoid the complete dt-binding from patch 1.
> +
> +static const struct of_device_id rpi_otp_of_match[] =3D {
> +	{
> +		.compatible =3D "raspberrypi,firmware-otp-customer",
> +		.data =3D &rpi_otp_customer
> +	},
> +	{
> +		.compatible =3D "raspberrypi,firmware-otp-private",
> +		.data =3D &rpi_otp_private,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rpi_otp_of_match);
> +
> +static struct platform_driver raspberry_otp_driver =3D {
> +	.probe	=3D rpi_otp_probe,
> +	.driver =3D {
> +		.name	=3D "rpi-otp",
> +		.of_match_table =3D rpi_otp_of_match,
> +	},
> +};
> +module_platform_driver(raspberry_otp_driver);
> +
> +MODULE_AUTHOR("Gregor Herburger <gregor.herburger@linutronix.de>");
> +MODULE_DESCRIPTION("Raspberry OTP driver");
Raspberry Pi OTP driver ?

Regards
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bc=
m2835/raspberrypi-firmware.h
> index e1f87fbfe554..6e94ccf34f47 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -92,6 +92,8 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_SET_POE_HAT_VAL =3D                        0x00030050,
>   	RPI_FIRMWARE_NOTIFY_XHCI_RESET =3D                      0x00030058,
>   	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =3D                    0x00030066,
> +	RPI_FIRMWARE_GET_PRIVATE_OTP =3D                        0x00030081,
> +	RPI_FIRMWARE_SET_PRIVATE_OTP =3D                        0x00038081,
>  =20
>   	/* Dispmanx TAGS */
>   	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =3D                   0x00040001,
>


