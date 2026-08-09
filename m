Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA3C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 07:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hodYejE10JFk4D7Yi4a8k5tJenr5IyrIF6Fo4WY6/RI=; b=F+UjaR06raiAtyRaR4FvIAOsbP
	AtXajZQrmSawqOAJR7k9KdWDcXyY5bkjge1RE7IEdftbFPiD2GYt1Agt5j7TGIMDHw+uIQDYdzHcN
	cjQPRR+T+zVT7WVD1UByz2IGaRKyzctZDmvvgHj6uxFvntKOBMKqXze7Z2DY5voui3MSw1fp9iHb9
	puiYHqriZ0egKXXnZcbpjxH+/FnUY/9M3/lIKJ5rlmpxJ1UyhRr7v2vlVLAQrr3soK7xWxkXJcqO+
	yXipEHz0IaWdrx0ha0v174RAki9uihYU/is5WHr2dGilKTv8diEeHi1fg5w1P5a5b0WBVDTE+WdNu
	U0yj6IVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsxoZ-0000000A3u6-0N31;
	Sun, 09 Aug 2026 07:19:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsxoT-0000000A3tk-35mn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 07:19:21 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 09FC142C48;
	Sun, 09 Aug 2026 09:19:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7krVjHtXELU; Sun,  9 Aug 2026 09:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786259951; bh=ikalTkv5Ibx6UZVhDzEkB2X3qHV5gdGfm5vXWpBzMJM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=HaVpSR0eV4lwJI3Zo1GkAKJhw9U43pdq8FdUwseBaQzOltKIsfqBStvT8SPjiLrEH
	 OH6v26uZYqUSWVzp1x4DZ8NH7EYYvbhFSlV4oez66uDn5TZY7GRE6ZRDMcip9rd80d
	 BOPXp4YVPvfHLMdtWTcdd7Df04txGyiFtWSFX7O/PcOKfkjyXy6Amx47OCzs1PIcSb
	 GNskEFhkSM3zcG2cQL6kSYRS4xzFw5dtT239nxsOoUKhwfgyYFV57oQYdW8FZpn7mv
	 Dp6DNbO4Bo0pRp5uEHumbM7n8Mno/LRqvWji5jiRNLg7nhBPw3S6McvNeZj00YpBF0
	 THqpME1Ne7Ncw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 12:48:59 +0530
Message-Id: <DKK8AVOYIJSO.20W3VALHO9LVU@disroot.org>
Cc: "Jagan Teki" <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Inki Dae" <daeinki@gmail.com>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
 <20260723-exynos-dsim-fixes-v3-2-0c31ae1dbecc@disroot.org>
 <CAAQKjZMP+iQAZUGG0LtbXJWivOjVXCLB=uaqmYkenvmNK=S_vQ@mail.gmail.com>
In-Reply-To: <CAAQKjZMP+iQAZUGG0LtbXJWivOjVXCLB=uaqmYkenvmNK=S_vQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_001918_344091_0BED46CF 
X-CRM114-Status: GOOD (  22.38  )
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

On 2026-08-02 15:56 +09:00, Inki Dae wrote:
> HI,
>
> 2026=EB=85=84 7=EC=9B=94 23=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 4:04,=
 Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>>
>> Stabilizing PLL needs to be waited for. This is done using a loop,
>> checking the PLL_STABLE bit in the status register.
>>
>> DSIM fires an interrupt when the PLL is stabilized. Rely on this
>> functionality for stabilization wait, getting rid of the implicit loop.
>>
>> This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
>> testing on all supported devices is less feasible, introduce a stop-gap
>> measure where the timeout has a gracious lower bound of 100
>> microseconds. This will (hopefully) prevent regressions due to timeout
>> on other devices.
>>
>> Suggested-by: Inki Dae <inki.dae@samsung.com>
>> Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy=
9NFDu13VU5w@mail.gmail.com
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 41 +++++++++++++++++++++++-----=
-------
>>  include/drm/bridge/samsung-dsim.h     |  1 +
>>  2 files changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bri=
dge/samsung-dsim.c
>> index da753ff6eed4..866cff205e71 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c

...

>>
>> -       timeout =3D 3000;
>> -       do {
>> -               if (timeout-- =3D=3D 0) {
>> -                       dev_err(dsi->dev, "PLL failed to stabilize\n");
>> -                       return 0;
>> -               }
>> -               if (driver_data->has_legacy_status_reg)
>> -                       reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
>> -               else
>> -                       reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_=
REG);
>> -       } while ((reg & BIT(driver_data->pll_stable_bit)) =3D=3D 0);
>> +       if (wait_for_completion_timeout(&dsi->pll_stabilized,
>> +                                       usecs_to_jiffies(timeout))) {
>> +               dev_err(dsi->dev, "PLL failed to stabilize\n");
>> +               return 0;
>> +       }
>
> This is the main problem: the condition is inverted.
>
> wait_for_completion_timeout() returns 0 on timeout, and the number of
> remaining jiffies (> 0) on completion. As written, this reports an
> error and returns 0 exactly when the PLL *did* stabilize, and silently
> succeeds when it timed out.
>
> Since samsung_dsim_set_pll() returning 0 makes its caller
> samsung_dsim_enable_clock() bail out with -EFAULT, the display would
> fail to come up entirely the moment a PLL_STABLE interrupt actually
> arrives.
>
>     if (!wait_for_completion_timeout(&dsi->pll_stabilized,
>                                    usecs_to_jiffies(timeout))) {
>
> The reason this still passed testing is the second issue below: the
> PLL_STABLE interrupt never fires in the first place. The two bugs are
> masking each other.

Unfortunately, fixing these my hardware does not issue the PLL_STABLE
interrupt for the first panel reset during boot. For subsequent ones it
does issue the same.

One lazy solution is to try to peek at the PLL stable bit after the
timeout and continue execution if it indicates that PLL is stable. In
that case we should be able to validate it with a fallback.

I should also remember to drop the Reviewed-by: tag from this patch.

