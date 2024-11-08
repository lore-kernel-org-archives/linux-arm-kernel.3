Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F866D5C0E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03Fc1fmCF/avRthU6lr7E9Jhe4IxFOTMxCL1KW92V/s=; b=fYjW4roT+SELdOdqxG/XcG8LD8
	PHqAJHyJEIzyTjVnFx/n6ZkjupoYAUS9zBYUqWPmqIc+Fbftuuk8/TxXbOQXi+AFRfVpmmLuCOFXl
	3QutFcTfzaR8rS1y/0euPkZzlIAjBvU0UdXvHG+gAJbqSI1pLyq+9D1XtFD6gN4P4peajjxSsMsyr
	XNnoM6QNV+yLzci4IogukZvKQm+TJBlpncwbAeovcIPgqn0r+JqqpROmV7p+hsc4tcBEHZQKZKMlA
	cZLOfw/2HbpPgTyG/ZdjxWDaEbCe5TSnVlLsz5u0cUtwCHQIh2LcRvg0sFxV83mEyrbzNczq/BYcZ
	alkNc7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qfp-0000000AzQA-28f0;
	Fri, 08 Nov 2024 15:13:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pt5-0000000Apwt-16Nw;
	Fri, 08 Nov 2024 14:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=03Fc1fmCF/avRthU6lr7E9Jhe4IxFOTMxCL1KW92V/s=; b=lOrhdASv7gsImU9H6JBn4Q7VGa
	XTYrdXLQU1uFqre8mwmKTU7BL2IA7FOr7KlJ76A1TbEIegqSCvTSXNKT/l9kZMWoTxTpYx27f7Lll
	qy0ozFX8Xg7whfsMOBbBdnbdTbZTFzikQIkEahETI5qUNDkcju+wqjl7d3+kiLr39B02sOsphjH3z
	ostzHmMz/d9kSIVBTyJPXTeKs6UZAj4GEreNDzVcy+ZgNs1IjUZQ6sKLYeMkFdvcAa0QKVMrT1Ivn
	fHaWaUXlB5+aXZwemkFDJsQGjoS9Uwhb+LB2BNe/7o+20laNwsWIGnD/bkKQexJCELnxmRN1tG7Ju
	xbmAkMGw==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9Pso-0006fc-4s; Fri, 08 Nov 2024 15:22:42 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri, 08 Nov 2024 15:22:41 +0100
Message-ID: <22484879.EfDdHjke4D@diego>
In-Reply-To: <047164cc6e88dcbc7701cb0e28d564db@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org> <10558711.nUPlyArG6x@diego>
 <047164cc6e88dcbc7701cb0e28d564db@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062259_310377_A7907C41 
X-CRM114-Status: GOOD (  31.39  )
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

Am Freitag, 8. November 2024, 15:13:33 CET schrieb Dragan Simic:
> On 2024-11-08 15:09, Heiko St=FCbner wrote:
> > Am Freitag, 8. November 2024, 15:05:02 CET schrieb Dragan Simic:
> >> On 2024-11-08 14:56, Heiko St=FCbner wrote:
> >> > Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
> >> >> Perform a few trivial code cleanups, to make one logged message a b=
it
> >> >> more
> >> >> consistent with the other logged messages by capitalizing its first
> >> >> word, and
> >> >> to avoid line wrapping by using the 100-column width better.
> >> >>
> >> >> No intended functional changes are introduced by these code cleanup=
s.
> >> >>
> >> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >> >> ---
> >> >>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
> >> >>  1 file changed, 4 insertions(+), 8 deletions(-)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> index 58a44af0e9ad..f451e70efbdd 100644
> >> >> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct
> >> >> platform_device *pdev)
> >> >>  	}
> >> >>
> >> >>  	if (!dsi->cdata) {
> >> >> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
> >> >> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
> >> >
> >> > this is all probe-related, why not convert to dev_err_probe?
> >> >
> >> > As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_e=
rr.
> >> > So dev_err_probe would be the correct way to go?
> >>=20
> >> Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
> >> deprecated (which I originally missed, in all honesty) makes me very
> >> happy. :)  I've never been a huge fan of the format of the messages
> >> that DRM_DEV_ERROR() produces.
> >>=20
> >> However, perhaps it would be better to keep these patches as-is, as
> >> some kind of an intermediate, limited-scope cleanup + bugfix combo,
> >> and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
> >> conversion to separate patches.  I think it would be better to avoid
> >> a partial conversion, and I'll be more than happy to put the complete
> >> conversion on my TODO list. :)
> >=20
> > But your patch-2 really just open-codes, what dev_err_probe is meant
> > to fix. So with going this way, you're sort of making things worse=20
> > first,
> > until that second step happens.
> >=20
> > Similarly, reflowing lines for things that get removed in a week do not
> > serve a purpose - those line-breaks have been that way for years
> > already.
>=20
> Hmm, it makes sense when described that way.  I'll see to perform the
> complete conversion in the next few days.

just a note, as written on IRC earlier, I am sitting on a dev_err_probe
conversion for dw-dsi-rockchip.

I was waiting to see if more cleanups turned up, so didn't sent that yet.

Don't want to steal your spotlight though, so not sure if I should send
that or wait for your conversion ;-)


Heiko




