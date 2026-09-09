Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB1DC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdaO/fxaX/wM98oLF3knAk6udkfoh4snwThvT3XID84=; b=vpV9OLw7II5C1XlXH622zu7LX5
	+hymw6U3zw655TwChMytvapSaA9oyxcMpzSV56uQmNMQk88nVDPcgNTgcyfNvOWdNLb/YSYwtK5TY
	vw9r2pAiuTKxKcZbhY8nmdX5x/WKKWSYAlRvj0OVp+XuHpC447tYdCZ1fbf6FFyJ+FnNLYJ+OX33S
	srJJ/uYqGYnjdSdEDUeLSpWYn4y7tK0NmAIg8SPLx3F94THVnRDLVVuPgoBpZOYt6S3zOTiogLWFo
	RJvqq03gxOaeg+K/l8bb+924UypWAHHkkPYG4yBe5Ngci0SbsqoLAaTQFaAX1ITL0OoJ/OrmjH48E
	dVCJbzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4L2N-0000000CI6u-0RXF;
	Wed, 09 Sep 2026 16:20:40 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4L2G-0000000CI6E-3kC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:20:38 +0000
X-PTX-Original-Recipient: laurentiumihalcea111@gmail.com
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: s.hauer@pengutronix.de
X-PTX-Original-Recipient: frank.li@nxp.com
X-PTX-Original-Recipient: festevam@gmail.com
X-PTX-Original-Recipient: elena.popa@nxp.com
X-PTX-Original-Recipient: consmin.stoica@nxp.com
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: imx@lists.linux.dev
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: afa@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4AEF620007C;
	Wed, 09 Sep 2026 18:20:30 +0200 (CEST)
Message-ID: <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Date: Wed, 9 Sep 2026 18:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_092033_089796_BFDAA643 
X-CRM114-Status: GOOD (  20.22  )
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

Hi,

On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
> 
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * up to 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
> 
> The support targets revision B of the board.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

> +	chosen {
> +		stdout-path = &lpuart1;

I would recommend instead "serial0:115200n8" here. This introduces no
change for Linux, but for other consumers of the device tree, they will
be able to agree on a common baudrate.

> +	memory@80000000 {
> +		device_type = "memory";
> +		/* actual size filled in by the bootloader */
> +		reg = <0x0 0x80000000 0 0x80000000>;

If the board has at least 2G always, this is fine.

> +&usdhc2 {
> +	bootph-pre-ram;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";

Looks unexpected to have same pinctrl groups for the higher speeds.
Are higher speed modes even possible on this board?

If not, I would suggest dropping the extra states.

Cheers,
Ahmad

> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +
> +	status = "okay";
> +};
-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


