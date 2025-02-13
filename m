Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8BDC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gob6xpsM5KcwcTB7+GDg/HZqd/D9nZ0fwXf/UcO7r78=; b=2ATf7+Pi1b5p26Uvu/P/ItQQG0
	KLexkZXx+NZcN+nxBmt1OYN0S4ANzTiltDFeDnxD2d+gbAuA0lsAgzbyJ+REWLFK/iLSTiOS/rFma
	BaXNHFpjaZYLX3yZcnOkCWJgJnjJck4ldupeIUC9/xQ0lEVSM1BGBkhkKKuje6zX/qKYoOQiBZhSa
	JYfTELvTq+PjrRlPc0bZiOJtnyeHUEpwV7Ioif23pSqKquUgIcektbbAjBohc6wjYOiDE667jKMtY
	09vd/DRENYKLcsIZ55nFU3emKZ096c8FDiBLJ4fYxpR7Cwyknw4+I603K0G8kRkWVpEnIuzdxuUTA
	kqNEA2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVWP-0000000AT9H-3efs;
	Thu, 13 Feb 2025 09:28:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVSD-0000000ARmn-1RiA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FAB05C4C26;
	Thu, 13 Feb 2025 09:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE2CC4CED1;
	Thu, 13 Feb 2025 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739438656;
	bh=SETByG1qewINiXUWVnpG1tbMW3sFfN+fC9WwoSZz3Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOWjFEzMW5Itbp966Mhhgvt+TSmcPLI232Gake1rJyNJewJB2DhfHk0U5YNO1lnI9
	 xQ/+R0S1tgEtop555Oa0DEXmWmTzo+yE467JQme2B7qtBZahmDEqSJD00Iwd5qeN29
	 YmNehKmWRS1AEc7jH5c0n4NV1bzFgDctDN5u7WbrzjTHoG6opz1dwamldQt6qv5iqd
	 56+oBFZ7CKTXHKkYk6Sd2i/P9P9mIPfYTMbgTjyo9Hsw9y+WNGfQ/qU7nHx8bOWGQy
	 x/zVofWifwca7Iiy9krdj6/EYQ+c72Cyj1uocQVgooNnXQGiTKq2x5mzluf8iCcm8B
	 O577k+inauNZQ==
Date: Thu, 13 Feb 2025 10:24:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH 10/12] bluetooth: hci_wilc: add wilc hci driver
Message-ID: <20250213-fine-thankful-lobster-eed3e8@krzk-bin>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
 <20250212-wilc3000_bt-v1-10-9609b784874e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212-wilc3000_bt-v1-10-9609b784874e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_012417_476572_9B8CC540 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2025 at 04:46:29PM +0100, Alexis Lothor=C3=A9 wrote:
> +#include "linux/bitops.h"
> +#include "linux/byteorder/generic.h"
> +#include "linux/err.h"
> +#include "linux/gfp_types.h"
> +#include "net/bluetooth/bluetooth.h"
> +#include "net/bluetooth/hci.h"

Keep some order here. Why some are <> some "", why net is mixed with
linux...

> +#include <linux/module.h>
> +#include <linux/firmware.h>
> +#include <linux/of.h>
> +#include <linux/serdev.h>
> +#include <net/bluetooth/bluetooth.h>
> +#include <net/bluetooth/hci_core.h>
> +#include <net/wilc.h>
> +
> +#include "hci_uart.h"
> +

=2E..

> +static const struct hci_uart_proto wilc_bt_proto =3D {
> +	.id =3D HCI_UART_WILC,
> +	.name =3D "Microchip",
> +	.manufacturer =3D WILC_BT_UART_MANUFACTURER,
> +	.init_speed =3D WILC_UART_DEFAULT_BAUDRATE,
> +	.open =3D wilc_open,
> +	.close =3D wilc_close,
> +	.flush =3D wilc_flush,
> +	.recv =3D wilc_recv,
> +	.enqueue =3D wilc_enqueue,
> +	.dequeue =3D wilc_dequeue,
> +	.setup =3D wilc_setup,
> +	.set_baudrate =3D wilc_set_baudrate,
> +};
> +
> +static int wilc_bt_serdev_probe(struct serdev_device *serdev)
> +{
> +	struct wilc_adapter *wilc_adapter;
> +	struct device_node *wlan_node;
> +	void *wlan =3D NULL;
> +	int ret;
> +
> +	wilc_adapter =3D kzalloc(sizeof(*wilc_adapter), GFP_KERNEL);

Why not devm?

> +	if (!wilc_adapter)
> +		return -ENOMEM;
> +
> +	wlan_node =3D of_parse_phandle(serdev->dev.of_node, "wlan", 0);
> +	if (!wlan_node) {
> +		BT_ERR("Can not run wilc bluetooth without wlan node");
> +		ret =3D -EINVAL;
> +		goto exit_free_adapter;
> +	}
> +
> +#if IS_ENABLED(CONFIG_WILC1000_SDIO)
> +	wlan =3D wilc_sdio_get_byphandle(wlan_node);
> +#endif
> +#if IS_ENABLED(CONFIG_WILC1000_SPI)
> +	if (!wlan || wlan =3D=3D ERR_PTR(-EPROBE_DEFER))
> +		wlan =3D wilc_spi_get_byphandle(wlan_node);
> +#endif
> +	if (IS_ERR(wlan)) {
> +		pr_warn("Can not initialize bluetooth: %pe\n", wlan);

dev_warn or even dev_err_probe to handle deferral.


> +		ret =3D PTR_ERR(wlan);
> +		goto exit_put_wlan_node;
> +	}
> +
> +	of_node_put(wlan_node);
> +	wilc_adapter->wlan_priv =3D wlan;
> +	ret =3D wilc_bt_init(wlan);
> +	if (ret) {
> +		pr_err("Failed to initialize bluetooth firmware (%d)\n", ret);

dev_err_probe

> +		goto exit_put_wlan;
> +	}
> +
> +	wilc_adapter->dev =3D &serdev->dev;
> +	wilc_adapter->hu.serdev =3D serdev;
> +	wilc_adapter->flow_control =3D false;
> +	serdev_device_set_drvdata(serdev, wilc_adapter);
> +	ret =3D hci_uart_register_device(&wilc_adapter->hu, &wilc_bt_proto);
> +	if (ret) {
> +		dev_err(&serdev->dev, "Failed to register hci device");
> +		goto exit_deinit_bt;
> +	}
> +
> +	dev_info(&serdev->dev, "WILC hci interface registered");

Drop simple probe statuses. sysfs already provides this.


> +	return 0;
> +
> +exit_deinit_bt:
> +	wilc_bt_shutdown(wlan);
> +exit_put_wlan:
> +	wilc_put(wlan);
> +exit_put_wlan_node:
> +	of_node_put(wlan_node);
> +exit_free_adapter:
> +	kfree(wilc_adapter);
> +	return ret;
> +}
> +
> +static void wilc_bt_serdev_remove(struct serdev_device *serdev)
> +{
> +	struct wilc_adapter *wilc_adapter =3D serdev_device_get_drvdata(serdev);
> +
> +	hci_uart_unregister_device(&wilc_adapter->hu);
> +	wilc_bt_shutdown(wilc_adapter->wlan_priv);
> +	wilc_put(wilc_adapter->wlan_priv);
> +	kfree(wilc_adapter);
> +}
> +
> +static const struct of_device_id wilc_bt_of_match[] =3D {
> +	{ .compatible =3D "microchip,wilc3000-bt" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, wilc_bt_of_match);
> +
> +static struct serdev_device_driver wilc_bt_serdev_driver =3D {
> +	.probe =3D wilc_bt_serdev_probe,
> +	.remove =3D wilc_bt_serdev_remove,
> +	.driver =3D {
> +		.name =3D "hci_uart_wilc",
> +		.of_match_table =3D of_match_ptr(wilc_bt_of_match),

Drop of_match_tr, you have warnings here.

Best regards,
Krzysztof


