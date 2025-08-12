Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD23CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpt2q1VVawx7RN3DHXgKomnidZFs0KWZ5Y4PeN/MWV8=; b=F2zo/IzDikaCtSssebqTDNPp4d
	OMMWve/KsOBS2JR0zHQJHmbFSH1GyK843fWmtDio19mWqi4noRC1e/Nh05J5CtY2rgO+HcEtiKQka
	fLpEpz/5CM9Pg6vqjLLwnvq0Q0bwzc3J7IH61ivCHrvjVi9Ce9wJFIR+qcJJOcPFftROB/K7OllpJ
	6CTgAElVvU77/7AQET89vWApJBrvWDgk72Zb6wm5HqjQYxEMUGKlo7fu4ohj6J1Vesi2o3UZZBSBo
	OEMqfTrTHjUIsj0nO4rpvrGSG9Xe1DLZwe9AQzOGlM1QarZRaiUq3bW9TfmHC8k6uX7W9rlulfqRd
	4BlRFdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgo-0000000BxMk-1BbT;
	Tue, 12 Aug 2025 20:33:46 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultkD-0000000BiB6-1Cgr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:29:10 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755023335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dpt2q1VVawx7RN3DHXgKomnidZFs0KWZ5Y4PeN/MWV8=;
	b=XNhSR2c6W5vbltKeZ64FCBmBbLFbku0Fv+4E0E+qN/OhvaO8m5hvk7zJxeYa8n403i8XWB
	X2npk6mQILoQQcl8PffQjcNzQev2Pysg9gEEml3fgjge2SN2rvIbKIQhDF5Ca+vWwm7GqT
	5Vu0BBf1n2kA/5c7qsfuwo6MdXFi/+X2E66L264EaNacskzXeYNoVBeJ622AIubk9eoztp
	xy5OEceRLk75dV9b4S3QHK8DRSeVLLZiS39A3LXR71DP2kHJxGBJRV/YaCCiQxuZEWvnYO
	JF/VU1W0jmmwENfUiErOF4TEHm/liX9rE9KtqSQg2G6nWhNTKC3kIYuGa3Vknw==
Content-Type: multipart/signed;
 boundary=617e8f59b1ff50d429dd9df48218ad6990c7a2b892c3d1eddd6a2f382fbe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 20:28:43 +0200
Message-Id: <DC0NUGDTCUYD.QT1BLJEGXYFG@cknow.org>
Cc: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Alex Bee" <knaerzche@gmail.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
 <64d551d7-924a-48af-96ca-224fa94543d8@kwiboo.se>
In-Reply-To: <64d551d7-924a-48af-96ca-224fa94543d8@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_112909_468403_CFB4B29B 
X-CRM114-Status: GOOD (  25.30  )
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

--617e8f59b1ff50d429dd9df48218ad6990c7a2b892c3d1eddd6a2f382fbe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jonas,

On Tue Aug 12, 2025 at 7:11 PM CEST, Jonas Karlman wrote:
> On 8/12/2025 2:11 PM, Diederik de Haas wrote:
>> On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>>
>>> With the dependent H.264 High 10 and 4:2:2 profile support series
>>> finally merged there is finally time to send a v2 with minor changes an=
d
>>> a suggested code style fix of this series. v1 of this series has been
>>> fully functional up until recent unstaging of the rkvdec driver.
>>>
>>> Patch 1 add the new HEVC backend.
>>> Patch 2-3 add variants support to the driver.
>>> Patch 4 add support for a rk3288 variant.
>>> Patch 5 add a rk3328 variant to work around hw quirks.
>>> Patch 6-7 add device tree node for rk3288.
>>=20
>> It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
>> locally and that also had this commit:
>> - media: rkvdec: Keep decoder clocks gated
>>=20
>> Is that one no longer needed/useful/etc ?
>
> I do not think it is, could possible be to keep power consumption at
> minimum while decoding. Some parts enable auto gating and then we
> disable it when decoding is complete. With auto-suspend the entire block
> is disabled anyway so this probably did not make any noticeable
> difference and could instead introduce new possible issues.

Makes sense, thanks.
=20
>> And 'chewitt' also had a commit to fix 8/10-bit selection:
>> https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df92=
6d435c7c
>> "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>>=20
>> I haven't tried that one (yet), but did  try an other variant with
>> changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
>> in my tests. (Can ofc be PEBKAC)
>
> The format selection in kernel for this series should be correct,
> however to ensure 10-bit works you need following for ffmpeg-v4l2request
> to select and use 10-bit pixel formats:
>
> libdrm 2.4.104+ (NV15) / 2.4.118+ (NV20)
> - 10-bit drm formats, ffmpeg v4l2request test with a #ifdef
>
> linux headers v6.16-rc1+ (NV15/NV20)
> - 10-bit v4l2 pix fmt, ffmpeg v4l2request test with a #ifdef
>
> FFmpeg v4l2request will not negotiate use of 10-bit formats without
> DRM_FORMAT_NV15/NV20 and V4L2_PIX_FMT_NV15/NV20 defined when ffmpeg was
> compiled.
>
> That would be the most likely issue if only 8-bit formats is working.

Thanks so much for the detailed explanation with which I can check where
my stack wasn't doing what I hoped it would :-)

>> Would that be useful? I do/did have consistent problems with playing
>> 10-bit encoded video files.
>
> Looking quickly at the 'fix 8/10-bit selection' commit the issue is that
> rkvdec_hevc_get_image_fmt() was incomplete to begin with. The
> rkvdec_hevc_get_image_fmt() in this series has been correct since v1.

Thanks :)

Cheers,
  Diederik

--617e8f59b1ff50d429dd9df48218ad6990c7a2b892c3d1eddd6a2f382fbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJuH3gAKCRDXblvOeH7b
bvUTAQDzWJwxbYcSqq4djUea9n1kNb8PO3n1pspIxNcYxUolOAEApwmwMbrefnCW
t0RHEpbTOmEqnCD4VF5oaIZ5BmWQbgM=
=QdkM
-----END PGP SIGNATURE-----

--617e8f59b1ff50d429dd9df48218ad6990c7a2b892c3d1eddd6a2f382fbe--

