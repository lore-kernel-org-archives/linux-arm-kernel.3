Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A14C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67iaMe7dRzqdmdTZ5v9Y4GVdBIwy//hSn3Sql8CF+no=; b=uLYctABGhhq5hKiiU5c5omijkd
	/59kVoJqW0O15WQJAtMfKnN3vT03S7eGCQ3bfQdQfp/D5W2//jLVTNJLEW03AOz2fTlFXNaGr6+T8
	kZcqgSGIfPK0SlJUjjINlAXSPxdyuT6SCUZIoVdPwdbEh+drUOL5N42DyNOHdg0NSE3SIrisCqNYP
	5ujhBArK+a+sg7RiqUI1TQiO5topGfnPkdgf7w5lWX+sHjz4Vjl8+GQfMfUondkp6T05ZfF+QQJGi
	lcL9G8a33TfTrEo/mLGZBS/JBTZdIn+ONHGoNW4Lm4zgKVk38EkcCgqCZPWt/FFK7B6KwRHjuHzEE
	Qik5dwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbEq-00000006Taf-1yGW;
	Tue, 04 Mar 2025 22:59:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa6g-00000006KZX-1X7H;
	Tue, 04 Mar 2025 21:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=67iaMe7dRzqdmdTZ5v9Y4GVdBIwy//hSn3Sql8CF+no=; b=vg0Z//jE1WGL7of1Q5aJ3A/0FU
	Hr9f3WsWyxNDZjpXya07ncB0gXc1w968ujfeeP1knpiF1RddY+gM54MqMLIGdrqjS1uu2nB4vOlk5
	Qj/6htp7QEHspTf8d1BKwSm5MW7HV2NWaET6JyKGaBu11oUCSVn2c7Zlkxyp12OvAu2lglHii2HCE
	9gQgzhz5CyQnFHNh5M1Lwt417y534ClWLzqqsQOGww9A6x6ubDcoVRm+MO0XeAd458ZjOg9/oCvBb
	9syDFHjxYXLkR/Wt9LN+ijmSCi5yj2crpi+m7KdmAgabdBNvyOc2V+MGQcEoG3q+7/pu3gdPWY62W
	wzRLa3qA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa6d-000000049T3-1xHl;
	Tue, 04 Mar 2025 21:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=67iaMe7dRzqdmdTZ5v9Y4GVdBIwy//hSn3Sql8CF+no=; b=LwuGfFrDvpwUU2B/5O/ULqbrDV
	oEVLnfpfhFu69Ah2JLQbY0xkmgJLtF02XMOjjT+j6hUtQIjF1n2zEuxMw03K//2AjsxukLhZmm8/s
	0G47epspd1m/oEAqwB74vAgVd3OX5Zx1Xalh6MS2jAD+6NsQn0v+nMPM6rEKT9YW/U+mFI6b+UIsW
	CVqjoYsJn1RnQwgi6WfPvIX4FjYoavZEyP+Ep5Q82IpxQY6Aq2IJUCN6mypnZKaXbZ1riCOfg+3T0
	G7qnvSdnpDszk21aAuNc4yp9TebRb9TxEl9Oo92/0IN5T4vCu8I9lOXD0j2YXWa5GuC+MhNaT0phF
	pcsq8BkA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpZXr-0006Cf-7O; Tue, 04 Mar 2025 22:11:19 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 1/3] drm/rockchip: lvds: move pclk preparation in with clk_get
Date: Tue, 04 Mar 2025 22:11:18 +0100
Message-ID: <3048640.Lt9SDvczpP@diego>
In-Reply-To: <041c5f0e2371817a27577bd0989b9dca@manjaro.org>
References: <20250304124418.111061-1-heiko@sntech.de>
 <20250304124418.111061-2-heiko@sntech.de>
 <041c5f0e2371817a27577bd0989b9dca@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_214715_529098_4A90EEE0 
X-CRM114-Status: GOOD (  14.27  )
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

Am Dienstag, 4. M=C3=A4rz 2025, 21:30:22 MEZ schrieb Dragan Simic:
> Hello Heiko,
>=20
> On 2025-03-04 13:44, Heiko Stuebner wrote:
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > index 385cf6881504..ecfae8d5da89 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > @@ -448,15 +448,13 @@ struct drm_encoder_helper_funcs
> > px30_lvds_encoder_helper_funcs =3D {
> >  static int rk3288_lvds_probe(struct platform_device *pdev,
> >  			     struct rockchip_lvds *lvds)
> >  {
> > -	int ret;
> > -
> >  	lvds->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(lvds->regs))
> >  		return PTR_ERR(lvds->regs);
> >=20
> > -	lvds->pclk =3D devm_clk_get(lvds->dev, "pclk_lvds");
> > +	lvds->pclk =3D devm_clk_get_prepared(lvds->dev, "pclk_lvds");
> >  	if (IS_ERR(lvds->pclk)) {
> > -		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
> > +		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");
>=20
> I'm wondering why this patch isn't replacing deprecated DRM
> logging macros with their preferred successors in a couple of
> places, just like what the patch 2/3 from this series does?

because this patch is about reorganizing the clock handling :-)

Changing the logging functions is a different topic and so has no place
in _this_ patch.

And of course drm-logging is a separate beast to tame altogether.
drm_err vs. dev_err; lvds->dev vs. drm_dev (there was an argument over
what belongs where recently) .

And I had neither the capacity nor time to delve into all that, so limited
myself to stuff I understood :-)

Heiko




