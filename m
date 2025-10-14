Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17605CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuqzPscocXsv4QGjyp5D1JTIpMR6i71bIBd2xUs9GwA=; b=UnBLyKWPzT37wsQTJQ674JfQ6l
	wAWAPJ3C/PnFMZTsS944gei86MhIQbvlrAxdU/M8vupBtbrIBVlDUC1Mo22lEHU9Wf85n3YRinVCU
	2kLS7kCozHV7ShENuvGmbS7T/cqhb24NFNPEb/LWd3bkwn1HSrHIJBFvy7NpDF6FSHf846woUC1CT
	RphppxqBVhGgYP/xJpcbfdzcJKqWqzT2ZekGeD6mtCtuaZzB24qIlCOrSJXcWtd7Uhvhipc/Rzw7M
	Fx/pvSa+Xng6xg+4ReMfYN5UE3uPLDrOwb1q+DRxzaDgsgzfEX0KopBQRYb6OoXKiAseMLILst6w8
	0rba3ueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8lvI-0000000HNmo-10Gg;
	Tue, 14 Oct 2025 20:47:08 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8lvG-0000000HNmC-0PXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 20:47:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A2EB102E6F;
	Tue, 14 Oct 2025 22:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1760474820;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nuqzPscocXsv4QGjyp5D1JTIpMR6i71bIBd2xUs9GwA=;
	b=AU+V64vLJIS8nNCskYQUQ6xa5LNBOJsrT6MDC0ynISJ+E0kFKF3GtvEtSz185FJmQxjXj5
	NMdf69XtvShQojk/cVcN0D0hWzNXGhBW8o/URYh2/xE2BBRDlAxYewSODWq/h2u9CNj4Fo
	EC3iVycbEEkQ4M7YamcnnIY0kkj3GdfvqfxyhrUkt4mhIjXPwa8lM+Ay0rE1yNDkCRKvN0
	5ePw+RoIlzKOMiy9rDshvnVvYr3CQxvwwoBXhcEPbJm6ZwD9cnAubrZfjYUFOVvJhAS4ON
	Cquol+3D3I13/Kv8RKPivc3yPZDAt1uZCb0pEh6zLHYURMD6Y9HRd63QQd2o+A==
Message-ID: <ddc44948-4816-452f-8b78-b1dfe44d507b@nabladev.com>
Date: Tue, 14 Oct 2025 22:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] ARM: dts: imx: add power-supply for lcd panel
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
References: <20251014-imx6_dts_clean_2-v1-0-508b36e5a3fd@nxp.com>
 <20251014-imx6_dts_clean_2-v1-1-508b36e5a3fd@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20251014-imx6_dts_clean_2-v1-1-508b36e5a3fd@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_134706_365008_200348AC 
X-CRM114-Status: UNSURE (   8.41  )
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

On 10/14/25 9:38 PM, Frank Li wrote:
> Add power-supply for lcd panel to fix below CHECK_DTBS warnings:
>    arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: panel (sharp,lq101k1ly04): 'power-supply' is a required property

...

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts
> index b29713831a74489e8cc0e651c18a40d85f9f9113..04e570d76e42cd67a38e0f3b2301598f712e6bd4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts
> @@ -199,7 +199,7 @@ touchscreen@38 {
>   		reg = <0x38>;
>   		interrupt-parent = <&gpio5>;
>   		interrupts = <4 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
> -		power-supply = <&reg_panel_3v3>;
> +		vcc-supply = <&reg_panel_3v3>;
This looks like a different kind of change ?

