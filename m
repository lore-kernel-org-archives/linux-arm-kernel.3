Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB01D3B98F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0X2no6hqev04u5CaAup9gW8xIzYF2QpGM2IrZjwkQU=; b=3dE5zd9QKB51McZEBZwkDbXpsU
	fvDswHkmLEvtx1+0I4JSIOEvIB1dptwSvUXv8SpgmdIn1PLSsZROhp/e0m/D6NQyQ/0K+tDVwGAn2
	Ft4wcbimeveI9LJU+gRq/lvs60vlEX/PbgqkOrALyPbNwpdQdmsFwFUSQiDU1dNuN7H7AFfNvo/bd
	gfAp7eXw++4gxUG2afZ3U6+3XDRhpeHSRS/oXgE7yh4TsY0mS8308Oon2V4uGJQgUz0bZiIjTZl3o
	8ZNCEaapAcjN+jwez0TKNw2V+1t9C6yFCB81VFr4mBokFHvgcXZfFPSh5IYbC6xZkS0TQA6EzhySN
	8FpuFe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvbd-0000000AjVu-0W5m;
	Tue, 26 Nov 2024 13:27:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvTK-0000000AhCe-0Bw1;
	Tue, 26 Nov 2024 13:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732627155;
	bh=9n3DMWiNfsEPU/+nTL+NGjyuioKCWO5RjIWhEr0S1Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvD8CEB2NRi1y2GiRlZ/hRTRGq2xk1RfRWFfRYFeuKXpFRenr6DFgfgew/G/KX1gl
	 /on3JSQivwHfYIvJ8MKYAFgR1NIuv6aLsoZ6HYDwPeHPp2bXthUlabI/b4yVSTd5WK
	 tmTEhyVYAr+ohPd1YiBSpIwQDFhN/OgGJyLGq4iX6thE7WcmjRPcx/WQH5WybmzpvE
	 6pYa2nRyQWPWzp/urldLb92YAS//GDqlziYlW3UIrG0v/hyzUjJmX17VC8jTBxG4dJ
	 MOtYzDF8vL2zqa+vbKw07tl8sNsZB5YkXYuPPgDkVNjDpUs5dLtTaB5j9HB8IWGSFW
	 zOWmQahCPhESg==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96A9717E3663;
	Tue, 26 Nov 2024 14:19:13 +0100 (CET)
Date: Tue, 26 Nov 2024 08:19:11 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
Message-ID: <e3e9020b-f3d5-42bb-bf1e-6aa8da2d1708@notapiano>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
 <600f9d78-bdc8-4133-bb43-06d798bcd543@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <600f9d78-bdc8-4133-bb43-06d798bcd543@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_051918_257464_301DED69 
X-CRM114-Status: GOOD (  24.52  )
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

On Tue, Nov 26, 2024 at 10:43:55AM +0100, AngeloGioacchino Del Regno wrote:
> Il 25/11/24 22:20, Nícolas F. R. A. Prado ha scritto:
> > When configured in filtered mode, the LVTS thermal controller will
> > monitor the temperature from the sensors and trigger an interrupt once a
> > thermal threshold is crossed.
> > 
> > Currently this is true even during suspend and resume. The problem with
> > that is that when enabling the internal clock of the LVTS controller in
> > lvts_ctrl_set_enable() during resume, the temperature reading can glitch
> > and appear much higher than the real one, resulting in a spurious
> > interrupt getting generated.
> > 
> > Disable the temperature monitoring and give some time for the signals to
> > stabilize during suspend in order to prevent such spurious interrupts.
> > 
> > Cc: stable@vger.kernel.org
> > Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
> > Fixes: 8137bb90600d ("thermal/drivers/mediatek/lvts_thermal: Add suspend and resume")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   drivers/thermal/mediatek/lvts_thermal.c | 36 +++++++++++++++++++++++++++++++--
> >   1 file changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> > index 1997e91bb3be94a3059db619238aa5787edc7675..a92ff2325c40704adc537af6995b34f93c3b0650 100644
> > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > @@ -860,6 +860,32 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
> >   	return 0;
> >   }
> > +static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctrl *lvts_ctrl, bool enable)
> > +{
> > +	/*
> > +	 * Bitmaps to enable each sensor on filtered mode in the MONCTL0
> > +	 * register.
> > +	 */
> > +	u32 sensor_filt_bitmap[] = { BIT(0), BIT(1), BIT(2), BIT(3) };
> > +	u32 sensor_map = 0;
> > +	int i;
> > +
> > +	if (lvts_ctrl->mode != LVTS_MSR_FILTERED_MODE)
> > +		return;
> > +
> 
> That's easier and shorter:
> 
> static void lvts_ctrl_monitor_enable( .... )
> {
> 	/* Bitmap to enable each sensor on filtered mode in the MONCTL0 register */
> 	const u32 sensor_map = GENMASK(3, 0);
> 
> 	if (lvts_ctrl->mode != LVTS_MSR_FILTERED_MODE)
> 		return;
> 
> 	/* Bits 0-3: Sensing points - Bit 9: Single point access flow */
> 	if (enable)
> 		writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));

Wait, no, here you're enabling all the sensors in the controller. We only want
to enable ones that are valid, otherwise we might get garbage data and irqs from
sensors that aren't actually there. That's why I use the
lvts_for_each_valid_sensor() helper in this patch.

Thanks,
Nícolas

