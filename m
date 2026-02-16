Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76FCE81A28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBnL5Ro82QMQwqttY3lBrvEHg6LGLohS8MkpoiEXcp0=; b=i0Kwclt8DHtUpzKssdzuBycDhv
	9uOj3N26C0fC8TCpoaHxh8w06Ljzvisg2+MBOCFsMOOCdaJ63Dzg9UCoRulLYxIJe39uecP8uo4FX
	WxooPf3yPBYWLckWTuz4BhXeOH3a4JEjQUvWkU26OQ3R2efb3Zt6AWpK+z7ueuD4kuB3FtkXkQTKN
	szNKF/QY8uZo6vG8aoCDNz3XBoWAwZ2L2hyfJWa7zs6EYW5Gt69EjtUuma+nTayeiDZJo034vDVsb
	PaSukv9Xtj0ShObBEGkDlxmmdcFWlwD7h3zbDPeuRj4+twFhd2hB4kl95K+XIThVvIGKOX5nOHYf+
	jPfgWZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzAY-00000006kAo-47Yh;
	Mon, 16 Feb 2026 14:01:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzAW-00000006k9v-0SjP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:01:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AD021570
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 06:01:34 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79F8E3F73F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 06:01:40 -0800 (PST)
Date: Mon, 16 Feb 2026 13:59:27 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Adam Ford <aford173@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Message-ID: <aZMiv7ARO4TUSUTa@e142607>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260216104423.6b5bcc96@fedora>
 <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
 <4730819.LvFx2qVVIh@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4730819.LvFx2qVVIh@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_060144_231051_9F5CA47C 
X-CRM114-Status: GOOD (  59.86  )
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

On Mon, Feb 16, 2026 at 01:43:19PM +0100, Nicolas Frattaroli wrote:
> On Monday, 16 February 2026 12:44:39 Central European Standard Time AngeloGioacchino Del Regno wrote:
> > Il 16/02/26 10:44, Boris Brezillon ha scritto:
> > > Hello Adam,
> > > 
> > > On Sun, 15 Feb 2026 16:21:34 -0600
> > > Adam Ford <aford173@gmail.com> wrote:
> > > 
> > >> On Sun, Feb 15, 2026 at 4:04 AM Onur Özkan <work@onurozkan.dev> wrote:
> > >>>
> > >>> If sram-supply is missing, Panthor falls back to a
> > >>> dummy regulator with a warning. This implicit behavior
> > >>> hides missing DT wiring behind regulator core fallback.
> 
> This is intentional design of the regulator API. A missing supply will
> always result in a dummy regulator. The _optional function bubbles the
> missing supply condition up to the caller.
> 
> Catching device trees lacking supplies that are marked as required by
> the binding is done with dtbs_check, not at runtime.

I'm replying to this thread while I'm also trying to cover some discussion in the
DT patch series.

What we're trying to solve is this: the Mali GPUs have an L2$+bits power domain
that in upstream ended up being called 'sram' for reasons. The domain is important
both for ultimate power savings (you can turn off most of the other GPU domains
and preserve enough state for the GPU to wake up on an interrupt) and for normal
operations, for obvious reasons. Now, vendors either don't bother to put a
separate domain just for "sram" or go to the extreme of handing over control over
that domain to an MCU that implements aggresive and system-wide policies. We're
trying to cater for all cases, include the (currently hypotetical) one where you
have a separate "sram" power domain that Linux can control.

When we have first upstreamed the bindings, inspired by Panfrost driver, we have
added the sram-supply as mandatory which I think is turning out to be a mistake.
Prompted by Mark Brown's reply[1] to Tyr adding 'sram-supply' as an optional
property, Onur has started this and the DT patch series[2] to enforce the presence
of an 'sram-supply' to reduce the number of warnings in dtbs_check. In reality
what we are enforcing is a dummy supply that is the same as the one the GPU is using
because most of the systems don't have a specific one.

So the problem we have is: do we change the upstream binding and make 'sram-supply'
optional for every compatible string given that it is unlikely to be provided (and
the code did not enforce it in panthor_devfreq.c anyway from the beginning), or
do we accept that this power domain is important but usually not specified and we
go with the current DT patch series that provides one?

[1] https://lore.kernel.org/all/20260212100538.170445-1-work@onurozkan.dev/
[2] https://lore.kernel.org/all/20260215100302.136719-1-work@onurozkan.dev/

> 
> > >>>
> > >>> Make SRAM handling explicit: require sram-supply for all
> > >>> Panthor compatibles except mt8196-mali where GPU supplies
> > >>> are intentionally managed outside Panthor and DT does not
> > >>> model sram-supply for that compatible.
> > >>>
> > >>> This keeps DT power modeling explicit and avoids relying on
> > >>> dummy-regulator fallback.
> > >>>
> > >>> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> > >>> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> > >>> ---
> > >>>   drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> > >>>   1 file changed, 9 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > >>> index 2249b41ca4af..5f6075f18fe3 100644
> > >>> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > >>> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > >>> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> > >>>           * But without knowing if it's beneficial or not (in term of power
> > >>>           * consumption), or how much it slows down the suspend/resume steps,
> > >>>           * let's just keep regulators enabled for the device lifetime.
> > >>> +        *
> > >>> +        * Treat sram-supply as mandatory except for mt8196-mali. It manages
> > >>> +        * SRAM outside Panthor so this driver must not require direct control
> > >>> +        * over it.
> > >>>           */
> > >>> -       ret = devm_regulator_get_enable_optional(dev, "sram");
> > >>> -       if (ret && ret != -ENODEV) {
> > >>> -               if (ret != -EPROBE_DEFER)
> > >>> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {
> 
> If you really need a per-SoC branch then please just store it in the
> platform data so we don't have these "of_device_is_compatible" checks
> littered throughout the driver.

I agree, if we go with "sram-supply" being optional only for mt8196-mali then we should
put this in the panthor_soc_data payload and here we use that.

> 
> > >>
> > >> I wonder if a more generic device tree flag would be better here.
> > > 
> > > No, we don't want it as a separate DT flag. This is all stuff we can
> > > hide behind the compat, and every bit we add to the DT we don't
> > > strictly need turns out to be a liability in the long run in general.
> > > 
> > >> What happens if others do the same as Mediatek or Mediatek decides to
> > >> do this with more processors and this list grows?
> > > 
> > > That's what panthor_soc_data is for: you can attach per-compat
> > > properties without polluting the DT with more stuff that can be
> > > directly inferred from the compatible.
> > > 
> > >> It seems like a
> > >> panthor binding might be useful to prevent future bloat.
> > > 
> > > It's actually the opposite, the more we add to the DT, the trickier it
> > > gets to maintain, because we tend to get those things wrong (is the
> > > SRAM really not needed on mt8196, or is this just a workaround to hide
> > > the fact the PM is deferred to some FW?).
> > > 
> > 
> > MT8196 has three supplies: core, stack, sram.
> > 
> > For example, the Google Rauru Chromebooks use those:
> > 
> >         core-supply = <&mt6373_vbuck7>;
> >         stack-supply = <&mt6316dp_vbuck0>;
> >         sram-supply = <&mt6316kp_vbuck1>;
> > 
> > As of now (in our midstream trees), these supplies are declared in the gpufreq
> > node (the performance domain controller), and required to be on whenever GPUEB
> > interaction is needed, other than whenever the GPU itself is, well, needed to
> > be powered.
> > 
> > As of the current model, these supplies are getting powered on and off along
> > with the MFG power domain.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005
> > 
> > I'm not sure what happens if we also add those to the GPU node... for this, I'm
> > adding Nicolas to the Ccs, as he is the one who developed support for EB.
> 
> Fairly sure they need to be on as part of any of the operations the MFG stuff
> does, but I also am not 100% sure on this because I didn't take notes at the
> time.
> 
> Either way, this patch shouldn't exist, it doesn't do anything useful, as a
> missing supply from the DT can be caught with `make dtbs_check`. It does not
> need to be booted on each device to then have the driver abort probe at runtime.

So what should we do when dtbs_check catches it? Series [2] is trying to provide
a supply, but it is a bogus one because in reality the vendors don't declare one.

Best regards,
Liviu

> 
> > 
> > Cheers,
> > Angelo
> > 
> > > Regards,
> > > 
> > > Boris
> > 
> > 
> > 
> 
> 
> 
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

