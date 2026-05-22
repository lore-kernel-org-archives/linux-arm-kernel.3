Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F049CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQfUzeILNu5tcktKZdX1Dp06noZVwCjrBQxp9UsjPno=; b=frAVQNIGrwP8zXUo2WSk8yKF4x
	s7sm7HD6VtQb0tQoshHMFCosvrPHRNBdYsssgmnuEhOjr3QCed0uwj2+4NyiMpX+yNIQ4yVb3l6RM
	6Ur70tL4a3L2KfksTi8QF4RvWq79NEHcchqdINc7Lnsv28J0wKyJvtb3azAfpbYUCDpL6KpsyGmmO
	Wg59KkgUE0kjQ2rJsLVENH7sHwpNx/e6xjR1ivaV9ZlXOg1Zjw79YILldT2dp/Ap0W/rRJKiKQ0ro
	Jpq3bsPVTZdmyF2Z1FU5kkQWwLZWL65oM/nFe+onjK5896CFTBOQZaN07n44wq66O60HveKuGQ+Gv
	2VW7Vdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQT2-0000000B4hr-0ams;
	Fri, 22 May 2026 14:03:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQSy-0000000B4gf-01DX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 14:03:10 +0000
Received: from francesco-nb (93-38-247-131.ip73.fastwebnet.it [93.38.247.131])
	by mail11.truemail.it (Postfix) with ESMTPA id ECF911F81F;
	Fri, 22 May 2026 16:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1779458584;
	bh=aQfUzeILNu5tcktKZdX1Dp06noZVwCjrBQxp9UsjPno=; h=From:To:Subject;
	b=iy8YrBTrKvM9jFeXPgme3Laz8+PEoMqJufzTCq0Rl15cX0EjncveuErsbv2FyD/AV
	 HD3E7dH21SGFSibTVLc8JaNqku7hCeyD4JXOm8PGljjOqScxzWzO7iW4mikL2+qFbh
	 DXGZgaVJs6rb7CTFZ5UJaUl8IxcEHMXrks+N3MLHXzBavEZRP87p0grvzodlGSpDrj
	 UwzEI9CKcskxWgKh09aVYRS9rTS189LdqHRoG6XdjuiNfgXxUZv7DgJiM2jllfGUWN
	 gVwYNY9OjYbhbMYs8cRHdpz0x0dxve4e/Z8078dANCCcHFfXXgWvliep7414eivNIJ
	 TQqmQb2Mbj61Q==
Date: Fri, 22 May 2026 16:02:57 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
Message-ID: <20260522140257.GA93826@francesco-nb>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522111849.783-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_070308_939755_467BA41A 
X-CRM114-Status: GOOD (  11.06  )
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

On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The CM7 remoteproc configuration is common to multiple MX95-based
> platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
> Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
> channels using <>.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

...

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 3e35c956a4d7..f8760ac067fa 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -272,6 +272,13 @@ opp-1000000000 {
>  		};
>  	};
>  
> +	cm7: remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		status = "disabled";
> +	};
> +

As sashiko noticed, this is introducing a regression. No-one is enabling
this node anymore.

Francesco



