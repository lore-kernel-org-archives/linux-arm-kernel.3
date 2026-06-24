Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A52CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbvPqVl23P2DsY6H61wNv+/45EFbasMQlkmFk62Tx6A=; b=zp+5pyiTvaIUbYUGD60HvvheNM
	ZUCzbhEkejgSzKIcrBgyJfeWI7jUmv2kcDDyeBx5GNuUHfsJSTQ5eJ9d1jTTExWgDSmh/+4BZN/4D
	KqR4ILkjg+fe4lhONCgviXOCPFGpebq+CHLBLH8FNN5Yn/OJ8nTj8k6AriVg0hKbTs3ypz6kbLrEb
	0jxKcAhQzpIj9BL6fTeezzC2fWmzo0hpM654os0nuRuUs7gWQZFNoAd/uqI4Q3vGLYCPGDjXIWTGN
	80JZqe/TD3WnrM7HtpNeHAxLxvbQLp+SugzmTOeqvKy6kRXNdX6DUQzVSelWLS2oc1YqLPb3Pvc/K
	5sVYxzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM8I-00000007iHF-07fr;
	Wed, 24 Jun 2026 11:51:06 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM8E-00000007iEn-48OZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 11:51:04 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BC1831F842;
	Wed, 24 Jun 2026 13:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782301855;
	bh=HbvPqVl23P2DsY6H61wNv+/45EFbasMQlkmFk62Tx6A=; h=From:To:Subject;
	b=GzI6Ho+2HqSaGIvywvx8Nn2XInWYLXh0fV7tRcTtVPYdJPC6TROoTVTp0Nx8gbag1
	 KqLaP8FOjxEonaEKWUkHnNK80qvlkEOm32Qe/tz67mMtkXb+G/vHFswU7HRpegajnL
	 dOmAnHw9xWuQKxDctvb7+eN8iGzfZd9hIoBwd1EN6rB+b1nc+bWb1IIqiUYseQokSL
	 kEHNGxiByuB1+K/u1+bXv2NdkR0dN5WSOp8byaIN9AmnQ2UZplD3Nm21VJm19Upbkp
	 A6Un/48P3iK0WPut+dhcuaa0UqOSmh49+KMyZUVk4Ep7TZ6PfiBYZbC0TLoo1qFXFA
	 piBUUHCOPKgQg==
Date: Wed, 24 Jun 2026 13:50:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org
Subject: Re: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec node
Message-ID: <20260624115050.GA38214@francesco-nb>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-10-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624072043.238-10-nas.chung@chipsnmedia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_045103_184234_64ECCB2D 
X-CRM114-Status: GOOD (  11.91  )
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

On Wed, Jun 24, 2026 at 04:20:43PM +0900, Nas Chung wrote:
> Add the Chips and Media wave633 video codec node on IMX95 SoCs.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 11 ++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 36 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 041fd838fabb..7edd1c69966a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -76,6 +76,11 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  			reusable;
>  		};
> +
> +		vpu_boot: memory@a0000000 {
> +			reg = <0 0xa0000000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>  
>  	flexcan1_phy: can-phy0 {
> @@ -1142,3 +1147,9 @@ &tpm6 {
>  	pinctrl-0 = <&pinctrl_tpm6>;
>  	status = "okay";
>  };
> +
> +&vpu {
> +	memory-region = <&vpu_boot>;
> +	sram = <&sram1>;

Can the `sram` node moved to imx95.dtsi or not?

Francesco

