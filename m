Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD30CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9ePjJ+3Yd0yus3dXLpNzr9sgV/Y9hlh3yRlAMIYJAI=; b=tegno2FvMn7jSMvvJjvidRHicc
	PfB9kORwlxB/MLJnk1WbHA6gpuI2mRkn1a51FYVI1x0dnNVwtxk1kX97X5HZ0NWG8kOpvxhE43xUA
	BzJUAFeVoPw3PEhBpBdjSaj9zuyjqO6oO8VSm9n04c0jy1bIhLMYIGE1zeQ0OuyuBWo9MorDEL6L2
	em+hCEVS4AC+TxDZi4XY1+nk/gC4DYjKKK65oGr8CLop0iffns1NEmNRsZ/r8krGutQ0TW/8KI4Ls
	uuviSqVBFTL9VUOyuJwejg7CZWv0iMbbMbxvwC83JPPPd5LSP72uvb0qnIhvXtPJb9gFdG/T1J7Co
	Wkj7vWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxRbw-0000000F8eu-1G70;
	Sat, 13 Sep 2025 14:52:20 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxRbt-0000000F8d5-0VC8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 14:52:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1757775131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u9ePjJ+3Yd0yus3dXLpNzr9sgV/Y9hlh3yRlAMIYJAI=;
	b=xGd16U1/xe2ZbKz1tU1pFxVGBXvR7c1+zH1KwDgLwKzjXW4090gcDxzsrDfeKvh2fSNFB9
	/d3VU98n6oNWbo8B/ueJEGsiZqiH05SGJV92h0IkHSKnhg8YRUlXO+lj1Tq2tfn2aurNTI
	14QFTVRJ2sphVtlrVcBPRQwor1jQ5x4qjY4wOXI+UnzdY4gG1UnJSe4GIowqu8liNW2tSW
	1YwWBNHuD6t9WGsIVfWcR52pA/xKXCfDt4Csoc3jsQX2uZD+KVdHPzQjnUgBsy/Nsvz6fq
	Q6x5vyTzTFNaCy5P6kLHhumTVyyef+vNurKFpqoxWwylj8lbBFeukue0TFhdUQ==
Content-Type: multipart/signed;
 boundary=1977ff6ca28b4e071a2b6e2b88836eddf7e93d59c95b5f0edf7cdc5cadb9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 13 Sep 2025 16:51:59 +0200
Message-Id: <DCRR9XY9MT2L.3JSK4SYGMT57R@cknow.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Christian Hewitt" <christianshewitt@gmail.com>
Subject: Re: [PATCH v3 0/7] media: rkvdec: Add HEVC backend
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_075217_934095_806BC890 
X-CRM114-Status: GOOD (  19.88  )
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

--1977ff6ca28b4e071a2b6e2b88836eddf7e93d59c95b5f0edf7cdc5cadb9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 5, 2025 at 6:19 PM CEST, Jonas Karlman wrote:
> This series add a HEVC backend to the Rockchip Video Decoder driver.

I did some testing and the TL;DR version is:

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock64, RockPro64, Q=
uartz64-B, NanoPi R5S

Now for the long version ;-P

I built a 5.17-rc5 kernel with this patch set [1], which was based upon
linuxtv's next branch, so I just took all their commits on 2025-09-07.
Then rebased Detlev's rkvdec patch set on top of that.
As I have quite a few rk356x based devices and there wasn't a DT patch
to enable rkvdec2, I 'assembled' my own one. (And some more patches)

I have a patched ffmpeg [2] and with its -dev libraries built a patched
mpv [3]. Installed that onto (mostly) Debian Forky systems with mesa
25.2.2 and sway 1.11. I have a number of test files which are provided
via NFS so storage device wouldn't matter and it's also what I use with
LibreELEC (both 12.2 as 12.90.1 provided by 'chewitt').
And then I went on to perform the same tests on these devices:

1) Pine64 Rock64 (rk3328)
2) Pine64 RockPro64 (rk3399)
3) Pine64 Quartz64 Model B (rk3566) *
4) FriendlyELEC NanoPi R5S (rk3568) *

*) I blacklisted the hantro driver

My testing showed that the 'classical' Big Buck Bunny video worked the
best for testing ... meaning it caused the most 'problems'.
I used the 'Standard 2D' 'Full HD (1920x1080)' '60 fps' version which
you can download from [4]. That'll give you an 8-bit encoded x264
version of that video. I have converted that video to x265 with a script
I wrote (quite) a while ago [5]; instructions near the end of that
script (no hdr no resize 'branch' about $TENBIT_PARAMS).
That resulted in 2 test files:
a) bbb_sunflower_1080p_60fps_normal.x265.cf24.slow.8bit.mp4
b) bbb_sunflower_1080p_60fps_normal.x265.cf24.medium.10bit.mp4

Testing went as follows:
I logged into the device, started sway and opened a 'foot' terminal and
navigated to my NFS share with the test files. Then I used

  mpv --hwdec=3Dv4l2request <video-file> [--fullscreen=3Dyes]

Without the 'fullscreen' param it shows the video in the right part of
the screen (1080p monitor), while the left part shows mpv's output.
This made it easy to see 'dropped frames' and any audio delay.
I played each file twice, one using half the screen and one fullscreen.

This had less of an effect then I expected; only in a few cases it
'pushed it over the edge' and the only real effect was with Rock64 ...
which being the least powerful is (kinda) expected.

The results of the 10-bit x265 files was uniform: only a blue screen was
visible and OSD (with 'I' or 'O' in mpv) didn't work. Interestingly it
also had no frame drops ... except when doing 'I' (with no visible
effect), then it dropped a couple of frames (one time quite a few).
Mpv showed this error message each time:
[vo/gpu] Initializing texture for hardware decoding failed

For the 8-bit x265 file, the results were more varied:
- On Rock64 HW accel worked, but the videos had a red 'glare' over them.
  None of the other devices had that, so maybe related to 'lima'?
  On LE it did NOT have the red glare. It did seem to have quite a bit
  of trouble starting it
- On Rock64 it dropped 970 frames in 60 secs and 2480 in fullscreen.
  This resulted in quite a shockery display and noticeable artifacts.
  That was not (or at least a whole lot less) the case with LE.
- On the other devices there was not much difference in dropped frames
  when it came to windowed vs full-screen, but the frame drops were
  quite high ~2000 when HW accelerated and up to ~3000 when not
  I got the impression that ~3Mbps bitrate was a tipping point.
- The original BBB file (thus x264) had a similar high frame drop rate,
  so the problem seems unrelated to this patch set
- Audio delay was sometimes huge (>60 secs after 60 secs :-O), and HW
  acceleration fixed that (due to free 'CPU' capacity?)

The 'scores' for my other test files were actually quite good \o/
All my video were HW accelerated; 8-bit with nv12 worked good while
10-bit with nv15 was very blue. But all were corrected detected.

So IMO this is a massive improvement! Thanks a LOT :-D

Cheers,
  Diederik

[1] https://salsa.debian.org/diederik/linux/-/tree/cknow/media-next
(Salsa CI fails as it can't deal with the ~ in 6.17~rc5)
[2] https://salsa.debian.org/diederik/ffmpeg/-/tree/v4l2request-2025-v3-rkv=
dec-n7.1
[3] https://salsa.debian.org/diederik/mpv/-/tree/v4l2request-support
[4] http://bbb3d.renderfarming.net/download.html
[5] https://paste.sr.ht/~diederik/52b81ebc4c14b5146eb9b687bb1e8c1d62787991

--1977ff6ca28b4e071a2b6e2b88836eddf7e93d59c95b5f0edf7cdc5cadb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaMWFEwAKCRDXblvOeH7b
bgaMAQDSV7WBRzhLckmCR13bF/J2ijaueIDTC+eBIfrBN6GE+gD9G+PoK+5Pfngy
Vo3RPYc+L8VodVWniGaQmL1sOUOZuwo=
=A6/3
-----END PGP SIGNATURE-----

--1977ff6ca28b4e071a2b6e2b88836eddf7e93d59c95b5f0edf7cdc5cadb9--

