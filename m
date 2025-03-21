Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44CAC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwsJ7KxnNGB85Kzql5aBpB16nToZe3gP5eTNRWMHdQs=; b=QW1xLnXUeyf3e2ON6wZladZ8C9
	XqTkNDlzdtGEPEh5PFIyyE2FdiglZIcxBtZ9eBu805i3NpWrpABDVdzouTqWoveh48Le8NoCd/VrM
	rKGRoVNwGFpCQezOsTxvL8FE1oBwKPxemDEVK72H2RZT8vEr5ER4/IMe9XSNGgPgh/gY/nfRhB+2r
	zEla704MHKkfBbWCHbLLDFu8QRRMdMK9JtQVVftJD3ruxaxsACBzEogxro8HRdSAMcbVqJkr12BCl
	p5BmCqj+ear+0XVlHh2Pk0uHXX9Tj8LOkBsOW8kKXqZ6oFIfvC47PsbyYvfG8l8FbIo+KxLB+Fi/j
	nTqT7NQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfu4-0000000FeKI-38Hy;
	Fri, 21 Mar 2025 17:11:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfrI-0000000FdlO-2HEE;
	Fri, 21 Mar 2025 17:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rwsJ7KxnNGB85Kzql5aBpB16nToZe3gP5eTNRWMHdQs=; b=q0aF4oSLerS/auoS6KFBVj+xiA
	A3Mk3DHaREzMedV/GQNe5jEg4VnqUUMhmgLLTtR6HpsjffkFMU0wvA2P+MlrAma/E2v4LNn/tR+xZ
	l+zEeCTgkyPQgUmyXsi2kO63KbyGCWYqg0b/2PwwJexFRJK+AAXWjSADJtb5Mi0zmv62vCso9Yiv7
	s1npM5Siaq3ahMq8atgqnYwpJIInpKnIqomrF15Nnu4favedSObOu0OYxgOtMiZaoH+IT0WBUV1s0
	T6obiNiv4shlo6ogn5UV1LXMDSMODHLfjrkh/7uOvlEqPwHKQCQRsxL43zl1ZtYU6JNnjlEvVJtgx
	HRf67xDw==;
Received: from [192.145.10.73] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tvfrA-0003Qo-2G; Fri, 21 Mar 2025 18:08:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko.stuebner@cherry.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] phy: rockchip-samsung-dcphy: Add missing assignment
Date: Fri, 21 Mar 2025 18:08:26 +0100
Message-ID: <2181342.OBFZWjSADL@phil>
In-Reply-To: <e64265a4-9543-4728-a49f-ea910fccef7c@stanley.mountain>
References: <e64265a4-9543-4728-a49f-ea910fccef7c@stanley.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_100836_604543_A5183011 
X-CRM114-Status: GOOD (  13.66  )
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

Hey Dan,

Am Freitag, 21. M=C3=A4rz 2025, 15:36:14 MEZ schrieb Dan Carpenter:
> The "ret =3D " was accidentally dropped so the error handling doesn't wor=
k.
>=20
> Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

oh darn ... thanks so much for catching that

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 08c78c1bafc9..28a052e17366 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1653,7 +1653,7 @@ static __maybe_unused int samsung_mipi_dcphy_runtim=
e_resume(struct device *dev)
>  		return ret;
>  	}
> =20
> -	clk_prepare_enable(samsung->ref_clk);
> +	ret =3D clk_prepare_enable(samsung->ref_clk);
>  	if (ret) {
>  		dev_err(samsung->dev, "Failed to enable reference clock, %d\n", ret);
>  		clk_disable_unprepare(samsung->pclk);
>=20





