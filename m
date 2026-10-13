Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01B4CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of3eIH1y5cnrj5oKVfWFlqah/0p6DlvnyaqH8l/+JwU=; b=OonKvMSjfI/Td6t23LnoXPWzJw
	PdQmjt/AgsklnYGzS03mSRn0FxlFsU9aTRYqv6InEyJ0PxBkYU9eJRkUXllL7fwEE/aVp1WLefw0U
	ZStcr1HAVsuBhcEkO95XAN4zKQOXUweA21aSRN3Tlf9X4YDcGgP7bPFErPpV+jLowDfpxnEw8OrhA
	+mqvNlDglWmr+7Im5RaDdnbGUgHwhNChczgJ1w2ZXvcWDSex9piyj8ONjnQGar0ORKWMq9b3rLbqG
	21Hnku6EaPQU1mKsYZxQDgXpoCp2ThpJHJMA0Nhi0j0EOCQ0Syq3rEyNvOwvrfh8Y/3BUtq6cAAJy
	JtQpClCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWyl-0000000CDa3-4AlY;
	Tue, 13 Oct 2026 07:31:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWyi-0000000CDZK-0Chy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:31:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F0E4600D1;
	Tue, 13 Oct 2026 07:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADF61F000FF;
	Tue, 13 Oct 2026 07:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876675;
	bh=Of3eIH1y5cnrj5oKVfWFlqah/0p6DlvnyaqH8l/+JwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PCIZD0As75SdqelLRwD6fhIHXb47DK5rPFCLveWPRjElPnCpsu9iBtrEIsxg7olee
	 0FnyBAhQEktwJaNLOL/kpA9JTMRg8KWEcfIAd0k3t85MpEXLXkJcJLXJFIHJoZaXgO
	 Bgl+6FTpDxEdUekMQKUZWsAp1+nky19nZKgwCMMPJaMpJADxN8uFJkjqF5+s4c99cX
	 yqlU9I2gWX5KWuT/As7ZhNtFiIDrE8Qlrhe8e+0KFx2g9cfBjcYQAiLMs8VHOzk2Zr
	 u3EmufqOi3zXwIg0tk13gfTTBu29DatsMlczdWuA8SS519wXjwiv6zOJbHQITqiK1C
	 ZIxPykUUzSepw==
Date: Tue, 13 Oct 2026 09:31:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
Message-ID: <20261013-musical-brown-mamba-ff87a8@quoll>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
 <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
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

On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> similar, apart from the Display and touch controller.
> 
> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> variants to use overlays applied on this base version.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
>  5 files changed, 91 insertions(+), 99 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 475e1ad9116e1..7c1b61249778e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> +
> +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> +	imx8mp-skov-revc-tian-g07017.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> new file mode 100644
> index 0000000000000..33ddd08a7adb5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso

I do not understand this. This is a board, so not an overlay.

> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
> +	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";

Best regards,
Krzysztof


