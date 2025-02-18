Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761BFC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vWS+jJLGaUznhkUfulRmF74wnw6+simbpz7/+3zlNU=; b=OqCKhB1mhhWYTN3Whwp8UUNIHk
	SoYWqTSO2YbX/GuxLHLkdSZ1JGJoXlv06i2eJBmNKNc+Q+waTtS1zGuwrxu5UGtg5ZGnkiz9zwICv
	hzkagkUE7JN2edkpcpLsvKULPDPG3ZF0RX4PDWdgnV1O8Idm1BefDvmIhP5NeEsSuAbFWU85xcypr
	3BFCt3sJyrSRwA9c0nlbQ9n36tAr2q7PyOCK6HXUtm5NsBPLJx8IzQWDmDYCHCZRCil6N0Rs0QtC+
	JrPYFSk52XaNgmjaFAnFWUVgo4wBda04SwRjFdaEwbUdcX4/lQLG/vwJQeGGuQvvmFdafmCjwcoB0
	/eWl4TDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP4Q-00000008f5a-13q2;
	Tue, 18 Feb 2025 14:59:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOyL-00000008dgt-19KB;
	Tue, 18 Feb 2025 14:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0vWS+jJLGaUznhkUfulRmF74wnw6+simbpz7/+3zlNU=; b=yCHNif8/OzKbJ8qOOHLZC7ehTA
	zdS8Ay0sBcb8JU2WO/UQqqsK68gdfuNU0GOadhvfFzsvvbJjgwWUmCPjoLBXYXVCfWkAClMQ2hCMv
	PdJk1AYucpPORfkt3caFGB1hO1/Ovl8P1W76OSLXbFRg+M0bSYTBSMcERhZDq2L5JXKU6AM/yoWUU
	uTEM13NnKraf0E1QhGoPLP8LWNWELxhHs2WsPUkU9IuxgXJeHVDfBeueJ58YMIcabdv8YFa0LEgO0
	6BUKBEGgN2ODQLuuVe4eto3M4Ba5Xjz4DZ7My9cqydE6khcMBrsiN1XNbTA8LYu8hQEmet7cmoGAW
	R4NEnpzg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tkOyB-0005uw-A9; Tue, 18 Feb 2025 15:53:07 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2
 on RK3588
Date: Tue, 18 Feb 2025 15:53:06 +0100
Message-ID: <2425191.NG923GbCHz@diego>
In-Reply-To: <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
 <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_065317_306424_43337B2A 
X-CRM114-Status: GOOD (  34.19  )
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

Am Dienstag, 18. Februar 2025, 15:13:07 MEZ schrieb Sebastian Reichel:
> Hi,
>=20
> On Tue, Feb 18, 2025 at 08:17:46PM +0800, Jianfeng Liu wrote:
> > On Tue, 18 Feb 2025 11:00:57 +0100, Heiko St=C3=BCbnerwrote:
> > >So I guess step1, check what error is actually returned.
> >=20
> > I have checked that the return value is -517:
> >=20
> > rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy=
1 with -517
> >=20
> > >Step2 check if clk_get_optional need to be adapted or alternatively
> > >catch the error in the vop2 and set the clock to NULL ourself in that =
case.
> >=20
> > I tried the following patch to set the clock to NULL when clk_get_optio=
nal
> > failed with value -517, and hdmi0 is working now. There are also some
> > boards like rock 5 itx which only use hdmi1, I think we should also add
> > this logic to vop2->pll_hdmiphy0.
> >=20
> > @@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struct =
device *master, void *data)
> >  		return PTR_ERR(vop2->pll_hdmiphy0);
> >  	}
> > =20
> > +	vop2->pll_hdmiphy1 =3D devm_clk_get_optional(vop2->dev, "pll_hdmiphy1=
");
> > +	if (IS_ERR(vop2->pll_hdmiphy1)) {
> > +		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->pll=
_hdmiphy1);
> > +		if (vop2->pll_hdmiphy1 =3D=3D -EPROBE_DEFER)
> > +			vop2->pll_hdmiphy1 =3D NULL;
> > +		else
> > +			return PTR_ERR(vop2->pll_hdmiphy1);
> > +	}
> > +
>=20
> This first of all shows, that we should replace drm_err in this
> place with dev_err_probe(), which hides -EPROBE_DEFER errors by
> default and instead captures the reason for /sys/kernel/debug/devices_def=
erred.
>=20
> Second what you are doing in the above suggestion will break kernel
> configurations where VOP is built-in and the HDMI PHY is build as a
> module.
>=20
> But I also think it would be better to have the clocks defined in the
> SoC level DT. I suppose that means vop2_bind would have to check if
> the HDMI controller <ID> is enabled and only requests pll_hdmiphy<ID>
> based on that. Considering there is the OF graph pointing from VOP
> to the enabled HDMI controllers, it should be able to do that.


I was more thinking about fixing the correct thing, with something like:

=2D---------- 8< ----------
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cf7720b9172f..50faafbf5dda 100644
=2D-- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5258,6 +5258,10 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *c=
lkspec)
        if (!clkspec)
                return ERR_PTR(-EINVAL);

+       /* Check if node in clkspec is in disabled/fail state */
+       if (!of_device_is_available(clkspec->np))
+               return ERR_PTR(-ENOENT);
+
        mutex_lock(&of_clk_mutex);
        list_for_each_entry(provider, &of_clk_providers, link) {
                if (provider->node =3D=3D clkspec->np) {
=2D---------- 8< ----------

Because right now the clk framework does not handle nodes in
failed/disabled state and would defer indefinitly.




