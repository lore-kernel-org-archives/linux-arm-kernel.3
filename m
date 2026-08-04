Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46194C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBaGjl0IQHFKpt/VALgYXTNkr4+dRBwB1CDDd0+ACNY=; b=znC0kX/M66XtY7fQ6BE/1dLKnK
	gvnxKeGBwq1KVmGTWot44x2jCRxBOnAWA8ckuAbqKT6SJOoY3XIvFMIvZkGq2tZluIoIyq9Jbq5lM
	750z4LLg7gMs/5jZDG9WevDRQr/srnlqTbkZDyJ7WbHClNOWdZRNgxCRbfJI7gLOezh31OQ2f/OPS
	BUJ/RW9MZw3+fQ/5BA8SL8v9IjctanZboo3K1fcgm1onB8umWRpjcfRNqU1fzNbzLAPMxcl1eBbXv
	+zrlhuCUNql4E6xmBmP1drkIzcxNuRuqBPqbstxUXtIC8nxugxm2dAKO0DFFR61YHRvMVW8/Uhhy/
	VFiOXVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9kg-00000001Fpo-0EeG;
	Tue, 04 Aug 2026 07:39:54 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9kd-00000001Fom-0bHf;
	Tue, 04 Aug 2026 07:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1785829186; bh=NEF8spb5u7CiwNS+iTwEBVYL0bpl2VvikQOwHzvJeLU=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=kOZQ0H0n7b4gT77O6FBv02l9YBjBiXc3PjJevI3AcTpQiuCrJKoGdy8lThP1WN8O+
	 LYL6yXozTGg6QoO71NQ2O/8HW2d6OcbzYlnWX7KEjrdZ8wve5TZzLAvlmV4VvdTMcx
	 LQ77Q1yNMEjykXQO5teDSBR6JP/u93MDiL9nLKAU=
Date: Tue, 4 Aug 2026 09:39:45 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
	Manuel Traut <manut@mecka.net>, Alexander Warnecke <awarnecke002@hotmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, phone-devel@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: rk3399-pinephone-pro: DW9714
 coil requires higher voltage
Message-ID: <2j7ogeqj565sftp5wzqvtzi2id76fof623bifbmyu6ckhf6vm6@ya7h4tp5i4qf>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	david@ixit.cz, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
	Manuel Traut <manut@mecka.net>, Alexander Warnecke <awarnecke002@hotmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, phone-devel@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
 <20260801-pp-pro-camera-v1-2-7b4d90788f9f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-pp-pro-camera-v1-2-7b4d90788f9f@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_003951_641875_CE3B04E5 
X-CRM114-Status: GOOD (  17.91  )
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

On Sat, Aug 01, 2026 at 02:35:21AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
> Usually it's around 2.8 V. Here it matches the avdd2v8_dvp.
> 
> Fixes: 9336eb829a18 ("arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index d46cdfe3f7849..bde35d9b2263e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -473,17 +473,17 @@ wcam_out: endpoint {
>  			};
>  		};
>  	};
>  
>  	wcam_lens: camera-lens@c {
>  		compatible = "dongwoon,dw9714";
>  		reg = <0x0c>;
>  		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
> -		vcc-supply = <&vcc1v8_dvp>;
> +		vcc-supply = <&avdd2v8_dvp>;

This does not match reality, schematic says it's VCC2V8_DVP:

	https://xff.cz/dl/tmp/6253a0465329df41.png

regards,
	o.

>  	};
>  
>  	ucam: camera@36 {
>  		compatible = "ovti,ov8858";
>  		reg = <0x36>;
>  		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
>  		clock-names = "xvclk";
>  		dovdd-supply = <&vcc1v8_dvp>;
> 
> -- 
> 2.53.0
> 
> 

