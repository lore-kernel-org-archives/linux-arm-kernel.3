Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F48D37E37
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DR9bBTsCoU/xXRrfCDqm9jLT2QzaU8vv+qHZr8GQJE=; b=YnjJWN9gMBqnbKV95Xb70nShIa
	xvVko9MNfFbJKQPwtgvKLI4gQ9i5d1NO9ZFiT0g1y0aYyoHAgrjfJqYv5ccY72L4pZ/78Ntb9WIVh
	rkGZ/pFgd4ld8hq7eDQvAHfELpP4aEPyPzSB8gKOwMz0cTu7P3ZrGj+pn99w4sY7Yh0IG3L2k3+pr
	OwIZk3BZFBXDmabt6i3yI+FbId+5FuCy6kFQsc7MKgR50VpsRE6pLIVeDJyM3ALjCApcIEja8n1cM
	wMa+8OtLjh0BYwJVfr+AxkTWIm9reFeufxpcf5Z+AwALhLtk1pcekMtJ4JL2Cul1TGyGqfwpWKr8y
	oNOVTJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Wd-00000009SPi-22Nn;
	Wed, 14 Jan 2026 14:07:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1WX-00000009SOh-3EXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:07:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E9BE1515;
	Wed, 14 Jan 2026 06:06:52 -0800 (PST)
Received: from orionap.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08C2E3F632;
	Wed, 14 Jan 2026 06:06:56 -0800 (PST)
Date: Wed, 14 Jan 2026 14:06:53 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
Message-ID: <20260114140653.05365221@orionap.fritz.box>
In-Reply-To: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
Organization: ARM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_060703_879921_DF666BBB 
X-CRM114-Status: GOOD (  21.14  )
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

On Wed, 14 Jan 2026 11:50:04 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

Hi Giulio,

> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
> enumeration during boot. When both an SDIO WiFi module (MMC1) and
> an SD card (MMC0) are present, the kernel may swap their indices.
> 
> Explicitly define mmc* aliases to ensure consistent device naming
> and prevent mapping conflicts.

So this comes up every now and then, but for sunxi it was decided to not
support this. The enumeration of devices in the kernel is never guaranteed
to follow some order, and this is widely accepted for SCSI (/dev/sda) and
NVMe. Distros are coping with this forever since, using more sustainable
designations like UUIDs or labels.

If you don't want to change the way you communicate the root device to the
kernel, you can actually use U-Boot's DTs, which adds the indicies for its
own purposes, and can pass this on to the kernel. Just don't load a DT
from storage (which you shouldn't be doing anyways), and just use
$fdtcontroladdr as the DT address when booting the kernel.

Cheers,
Andre

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> index 5f44f09c5545..a958400bcd7c 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> @@ -55,6 +55,10 @@ / {
>  	#size-cells = <1>;
>  
>  	aliases {
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		mmc2 = &mmc2;
> +		mmc3 = &mmc3;
>  		ethernet0 = &gmac;
>  	};
>  


