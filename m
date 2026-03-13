Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A8F107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLgV40T/B5NlziDwzPAutV6VZ7YQTKYRqnGFSFRfQeU=; b=HA8MutsjN8ZNUEgHTpHEu/Xece
	qNJ/4/u0SFxLFKYpcNjqUEdHxy/wZGGAIzaHGndjRv+s7zapj7etMmrGV4n6FrvYh4l0pl79XeIS9
	J01PdrLVr6mF5rfjACm75EWK3TEH5vL4mNQvBEOFxffplGvAdUJjStnoWYLHk1in3IlsfPZJXxnzJ
	7ZFuQV+2+TbCfYq2JqGU4DWYiKwnz8gX6vA7ZU5YDG+Qha8VAnzun1m8zk9iUploGOhBg8KFRj6Bn
	kyAEYm2EWNygFXy/2j+pUwm7F/Ha8FpFDVZ/DyJ45p87866U49W/616sU5AovqGPZTF4ZIvfr4byJ
	zw+vBgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15dM-00000000gIw-1cXE;
	Fri, 13 Mar 2026 16:45:08 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15dJ-00000000gIX-45JN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:45:07 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fXVhW0s03z9v0n;
	Fri, 13 Mar 2026 17:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLgV40T/B5NlziDwzPAutV6VZ7YQTKYRqnGFSFRfQeU=;
	b=uaRRE+TyW/kGoof96aMLEw6YPZrk4MOUpQ9fitT7pCA5mQQytcEO0AhpnO7YD95ciEV7Gt
	9A1xVGWLWCjHFCZizY7aPnXPjmqRzhCnJMNrO66miB9r+xV5JW3XF/vAybT2ZjlKecUD4B
	0kNM/sGpBSAhMTd8UBri1omNlSmnDfD6zgNJS8hNAPZSXam5mZK4vvUQlx8jTggOyJhk1u
	gN2vukyZPeCqDwtPJmeREeCa1qSKlF4RQp8F0pCWfLRn8rS2cHa1PoA16eNQ+x9BpUuHzG
	rwGKe3xOyo3HVDDWb2T9PvICCrfMSD2O7yxMIbSCaVqP74LWXfat8L/416hILw==
Message-ID: <2313c717-1729-48a2-8fc7-63b68ce0a0e6@mailbox.org>
Date: Fri, 13 Mar 2026 17:44:52 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for
 IOMUXC_SAI2_TXC__GPIO4_IO25
To: Eduard Bostina <egbostina@gmail.com>, daniel.baluta@nxp.com,
 simona.toaca@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260309181524.39423-1-egbostina@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260309181524.39423-1-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wfqcmx73jwyxskcys17yhqsdtf6eaeid
X-MBO-RS-ID: 3636750f7ea4df0c0c2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094506_185898_B09FBFD2 
X-CRM114-Status: GOOD (  16.13  )
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

On 3/9/26 7:15 PM, Eduard Bostina wrote:
> Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
> raw value is written in this register. This makes the code not obvious
> to read and modify.
> 
> Use the MX8MP_SION symbolic macro instead of the magic value to improve
> code readability.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
> index ef012e8365b1f..6ad824a7e07e0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
> @@ -345,7 +345,7 @@ &pinctrl_dhcom_l
>   
>   	pinctrl_ptn5150: ptn5150grp {
>   		fsl,pins = <
> -			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40000000
> +			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		MX8MP_SION
Isn't the SION bit at the same bit offset at least since iMX5x ? Maybe 
the MX8MP_* prefix isn't necessary ?

