Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE331CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKrIBJHZD91OGHEHVz5icU8jb2dXEwclJl95UpuDS+U=; b=C6VzwXvQIYW7MP0kxLpohTbcTl
	Mkz3O8zJzKsCnQURiJN+5pw1nbrRXkQZAR09xLpQNTxOZjXFiLajd0y4zYX6wwqSTvFh1HPaVNR7w
	RR1P9oxuNvMq8KF1VFy4ePoqzrROp0Ik/f0VjYOsy6mtMWaJSWs/j1HfhVynOA+ge+AtmUfouVjAO
	n3FFDJjQdFCR9QEp/r3TugxPla40n+17RD7QwzzmsB+fgLOWyuY/k9Rtd8W0ycbnTyYVHgCru3O0p
	FNJehubCsK328BydWJxBAWE0A+IU0LieYOYuUhCdyQrM7Z0SqtWSeisLuOp4uJb2Yj32rVYHZjmqy
	OlRFpZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJtS-00000008lkW-0720;
	Sat, 30 May 2026 13:38:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJtP-00000008ljl-0Vce
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 13:38:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 891CF1A3750;
	Sat, 30 May 2026 13:38:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 490586073B;
	Sat, 30 May 2026 13:38:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C663610888CC8;
	Sat, 30 May 2026 15:38:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780148298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HKrIBJHZD91OGHEHVz5icU8jb2dXEwclJl95UpuDS+U=;
	b=0Ec7yLjHV7F3GfRWpGS/Jh45rOIY/RCXZ6DwjKTCVXMkdaD1xzjp6Y9XyRUkjyFtFZfuOF
	3P9QhCvry/SyDVW4RyYe/KaOzIrbL6MJgGDQ/YmLYcItXJI0fH33gfSrAON6P+dq6a/m3r
	JZRwfZNaYNZNdiyb5cMRN007pFtXOz6LowX1oNqXurum5rFfxcHPTmmIvDzdTI8XOanlfZ
	cTlS4RLyJ1pv0NiT+gTpGvH4u+J6JRbm5ElJ++gnZLG/8jfkzAjakCKu/hZBH91W3Ga5nu
	ybQ4NtweDzYbPMWJAs2u08gXQlqMmVNoiygSG7yri/prWlXLGR5JTurKvIYDRw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 15:38:05 +0200
Message-Id: <DIW1WGLL0GW5.1BGU194UXN0HO@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Damon Ding"
 <damon.ding@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/3] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <nicolas.frattaroli@collabora.com>,
 <cristian.ciocaltea@collabora.com>, <sebastian.reichel@collabora.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260529040530.741336-1-damon.ding@rock-chips.com>
 <20260529040530.741336-3-damon.ding@rock-chips.com>
 <178014803941.21632.16225608049285101452.b4-review@b4>
In-Reply-To: <178014803941.21632.16225608049285101452.b4-review@b4>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_063823_286551_4F9F537E 
X-CRM114-Status: GOOD (  16.59  )
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

On Sat May 30, 2026 at 3:33 PM CEST, Luca Ceresoli wrote:
> On Fri, 29 May 2026 12:05:29 +0800, Damon Ding <damon.ding@rock-chips.com=
> wrote:
>
> Hello Damon,
>
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/driver=
s/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 8cf6b73bceac..699a7f380c56 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1260,8 +1261,16 @@ static int analogix_dp_dt_parse_pdata(struct anal=
ogix_dp_device *dp)
>>  		 */
>>  		of_property_read_u32(dp_node, "samsung,link-rate",
>>  				     &video_info->max_link_rate);
>> -		of_property_read_u32(dp_node, "samsung,lane-count",
>> -				     &video_info->max_lane_count);
>> +		ret =3D of_property_read_u32(dp_node, "samsung,lane-count",
>> +					   &video_info->max_lane_count);
>> +		if (!ret) {
>> +			if (video_info->max_lane_count =3D=3D 0 ||
>> +			    video_info->max_lane_count > LANE_COUNT4) {
>
> This sashiko report seems to me valid.

Meh, messed up with 'b4 review' :-/ Apologies

"This sashiko report" [0] was about an enum being signed, so '=3D=3D 0' cou=
ld miss
negative numbers coming from bogus DT values higher than 1^31.

>
> But I'n no DP expert, I have no idea whether this ther one is valid.

And this was about "Additionally, does this check inadvertently allow 3,
which is an invalid DisplayPort lane count?"

>> +				dev_err(dp->dev, "samsung,lane-count =3D %d is out of range\n",
>> +					video_info->max_lane_count);
>> +				return -EINVAL;
>> +			}
>> +		}
>
> As reported by sashiko, 'count =3D=3D 0' should be 'count <=3D 0', being =
an enum.
>
> Additionally I'd avoid the nested if, and I think using dev_err_probe() i=
s
> correct here (we are only called by probe functions), so it all could
> become:
>
>    if (ret || count <=3D 0 || count > LANE_COUNT0)
>         return dev_err_probe(...);
>
> There are other sashiko reports to patch 3, and at least one seems valid =
to
> me. Can you either fix them in the next iteration or elaborate on why the
> code is correct there?
>
> Thanks!


[0] https://sashiko.dev/#/patchset/20260529040530.741336-1-damon.ding%40roc=
k-chips.com

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

