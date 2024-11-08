Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16287D5C0D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTfR9AhVV8McI4g4aOI6ukS+LiMUl23jlY0qQyPzn+s=; b=QdZD/H+H1O7hcEv+SGe62OzYAN
	/ReMRe0G3DduI24CT4WGBjAaVKresqkrcV06hnb6I9MPe4uq8sbRJaY29qt84tGoBwpkJVsdRyXc+
	XXWy+KCrXmcBRmFj2fv8IGZ98CFS1VohF6CCrEQrmelQd4tz0IIHSWtR7c25lyDtoIeN6+v0LDVSq
	/RTvBOL4ZkYojr5GgrH9LNV0mxIZLpMG3RHmR5kRBlLNIPkhmgP/gzLUanJUPeTCUh2S5zD35Ef/q
	NvqdU7AuPjCnMdhnGhqpZwnjwn+WKlXrVZ3Lv89Sc+1L9D2ph8gz1Vu/G3uduVqDLPd5GtUVPxvsV
	ztyUhm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QAM-0000000At1U-3xyu;
	Fri, 08 Nov 2024 14:40:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pg2-0000000Ansz-0XMZ;
	Fri, 08 Nov 2024 14:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eTfR9AhVV8McI4g4aOI6ukS+LiMUl23jlY0qQyPzn+s=; b=SKx0n5EhMqWfn+/C4Mo8k1ACYd
	DXJQeah3aR3Hd20oz1rmgnJ9vWJCRFOosRNEUlio9UcJ2oYXShmKcec+wC+oWCKPNUl++cSuhJ44e
	mwanlL6kp53EgD5b197zHXo4dcVOpGxDxxTNciz9BWhpw2phg+woANJYXIMR3K/s3tpRwJyYhVgvG
	ezPITg6HHnZtCK8BzlA1ZU/BO3uk0u1oWPIQMFOS723QGf2fRl5o0dIbIabmOkRuwpCZLchMeZKuM
	PSrcDGsvq+eC1v49Xc3U7h065Iv22j1+HzREdlaGtX+FR2NpsUufq60mFottxfYcGOF3MWeIhwBwV
	kgjhzZlQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9Pfp-0006aO-Qt; Fri, 08 Nov 2024 15:09:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri, 08 Nov 2024 15:09:16 +0100
Message-ID: <10558711.nUPlyArG6x@diego>
In-Reply-To: <3734f6a5424e3537d717c587a058fc85@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org> <13633881.uLZWGnKmhe@diego>
 <3734f6a5424e3537d717c587a058fc85@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_060930_193347_AA3B5C03 
X-CRM114-Status: GOOD (  25.77  )
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

Am Freitag, 8. November 2024, 15:05:02 CET schrieb Dragan Simic:
> Hello Heiko,
>=20
> On 2024-11-08 14:56, Heiko St=FCbner wrote:
> > Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
> >> Perform a few trivial code cleanups, to make one logged message a bit=
=20
> >> more
> >> consistent with the other logged messages by capitalizing its first=20
> >> word, and
> >> to avoid line wrapping by using the 100-column width better.
> >>=20
> >> No intended functional changes are introduced by these code cleanups.
> >>=20
> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >> ---
> >>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
> >>  1 file changed, 4 insertions(+), 8 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c=20
> >> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> index 58a44af0e9ad..f451e70efbdd 100644
> >> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct=20
> >> platform_device *pdev)
> >>  	}
> >>=20
> >>  	if (!dsi->cdata) {
> >> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
> >> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
> >=20
> > this is all probe-related, why not convert to dev_err_probe?
> >=20
> > As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
> > So dev_err_probe would be the correct way to go?
>=20
> Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
> deprecated (which I originally missed, in all honesty) makes me very
> happy. :)  I've never been a huge fan of the format of the messages
> that DRM_DEV_ERROR() produces.
>=20
> However, perhaps it would be better to keep these patches as-is, as
> some kind of an intermediate, limited-scope cleanup + bugfix combo,
> and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
> conversion to separate patches.  I think it would be better to avoid
> a partial conversion, and I'll be more than happy to put the complete
> conversion on my TODO list. :)

But your patch-2 really just open-codes, what dev_err_probe is meant
to fix. So with going this way, you're sort of making things worse first,
until that second step happens.

Similarly, reflowing lines for things that get removed in a week do not
serve a purpose - those line-breaks have been that way for years
already.



