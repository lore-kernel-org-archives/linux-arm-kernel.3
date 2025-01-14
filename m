Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC05C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOJbYPQZBimNQsOXWq3cwzQyGlmPM9N28opvNPMfGOM=; b=SAVooV3sOYqLvSOgSIjseE7fda
	/QcOyP3tOkeENypFt2/NVJ7BPGG7+ISVCiYSRL0WXEhI/S5i0ZT/gQFuRo3Wc9XlKsl1+rvO104YK
	mWLs5gyw4PWtqexWlyR9PA2gLot3ueCMPPO7lJ/egRMQtxmGTffPHgJ0G15MrwTn7YJj/K1kpDtJE
	f2mk1vO5UbB0jK3sEyZ4w5UfdQBJVFGU8iAvo7ES3BMVrdVslNkZjL7NHIw5xOie0CoL9Diy3YQaU
	jlMrRzXbLepE0fuydgn6jv2E8zG237H09fer821ZNfITkO9YEx528G4dxTBDRqR2S6E/HGjPlp2OE
	t02cI9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhnF-00000008emX-0ubE;
	Tue, 14 Jan 2025 14:21:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhj6-00000008dpI-2iEa;
	Tue, 14 Jan 2025 14:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736864221;
	bh=UcLT/NGwEPJZ5L1DHsFtFzF+XOJMTV8UvHS9FoikQUE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J6wdGop5G4nss4xyIPKF1t7RgMLG7uignLmWgtjyf/K7aqRNzaFLmZOLNdIgQoN03
	 mBtzE0NfcjP8UrsFiF2V36hFhuIUuS/Pwwrrr132lusduiDR6OUdojfNFgn/O+h84e
	 E2KCxWlMg/96AjAfJJ1HvgLwCevc73sjTmXVbWg0y9eU9v+GpGKZwoT+JAaBAH40NX
	 44l/ff93fblxo6G79nkFpDImkyQ9G/UAiQ7clKytn/JT3zObw37DhHGdQBDVM+L3YP
	 RbFY9HaEDzuKW2N7JPG8T+pwHMNNLsZy6WOwacukqcrxE9BIA51dW4iXT/PlZXg56e
	 YFAM0Wx6kGIsw==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 869C917E02BE;
	Tue, 14 Jan 2025 15:16:58 +0100 (CET)
Message-ID: <c71eb0c2052814f709d1cc36bd3e968d72a96749.camel@collabora.com>
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Tim Surber	
 <me@timsurber.de>, Shreeya Patel <shreeya.patel@collabora.com>,
 heiko@sntech.de, 	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, 	jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 	hverkuil@xs4all.nl,
 hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Tue, 14 Jan 2025 09:16:55 -0500
In-Reply-To: <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
	 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
	 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
	 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
	 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
	 <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
	 <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_061704_853352_4285DE6E 
X-CRM114-Status: GOOD (  39.63  )
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

Le mardi 14 janvier 2025 à 14:37 +0300, Dmitry Osipenko a écrit :
> On 1/9/25 02:17, Tim Surber wrote:
> > Hi,
> > 
> > I tested your patch with the command
> > 
> > # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
> > 
> > If this worked I moved on to a visual test using
> > 
> > # gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! v4l2convert !
> > waylandsink
> > 
> > I used a Windows PC  with a Nvidia GTX 4060 as my source for the
> > following tests.
> > 
> > > Format       | Result                                      |
> > > ------------ | ------------------------------------------- |
> > > 4k60p RGB    | Recognized as 1080p / 120 fps - no output   |
> > > 4k60p 4:2:2  | Recognized as 1080p / 120 fps - no output   |
> > > 4k60p 4:4:4  | Error: Device wants 1 planes                |
> > > 4k30p RGB    | ok                                          |
> > > 4k30p 4:2:2  | ok                                          |
> > > 4k30p 4:4:4  | Error: Device wants 1 planes                |
> > > FHD60p RGB   | ok                                          |
> > > FHD60p 4:2:2 | ok                                          |
> > > FHD60p 4:4:4 | Error: Device wants 1 planes                |
> > 
> > 
> > When testing 4:4:4 chroma I got the following error:
> > 
> > # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
> > /sys/v4l2/gstv4l2object.c(4344): gst_v4l2_object_set_format_full (): /
> > GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Device wants 1 planes
> > 
> > I could record and convert (with errors) the files with 4:4:4 chroma
> > using the command Shreeya posted, but the resulting video had wrong
> > colors and was flashing.
> > 
> > I was not able to test 4:2:0 chroma. I tried to generate an custom EDID
> > with support for it but I could not select it in the graphics driver in
> > the source, maybe this is just an issue with my setup.
> 
> Thanks a lot for the testing, very appreciate it! Good that RGB works
> for you with no problems.
> 
> Testing YUV formats isn't trivial. Personally I've a custom setup with a
> modified display driver of RPi to test them. See more below.
> 
> > I also observed that the the framerate is reported wrong, for example
> > setting the source to FHD60p RGB resulted in the following:
> > 
> > # v4l2-ctl --all -L --list-formats-ext -d /dev/video0
> > Active width: 1920
> >     Active height: 1080
> >     Total width: 2200
> >     Total height: 1125
> >     Frame format: progressive
> >     Polarities: -vsync -hsync
> >     Pixelclock: 214076000 Hz (86.50 frames per second)
> > 
> > This wrong framerate reporting seemed to happen across all framerates
> > and resolutions. Gstreamer Pipeline negotation showed the same results.
> 
> I've re-tested YUV444 4k capture using RPi4, works flawlessly. Note for
> gst-launch-1.0 you used video1 and video0 device is used by v4l2-ctl
> command above, maybe you're using wrong device. Please post a complete
> output of the v4l2-ctl command.
> 
> The command I used to test YUV444 capture:
> 
> # v4l2-ctl --verbose -d /dev/video1
> --set-fmt-video=width=3840,height=2160,pixelformat=NV24 --stream-mmap=4
> --stream-skip=3 --stream-count=3300 --stream-to=hdmi.raw --stream-poll
> 
> The I converted captured data to a video file and played it:
> 
> # ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt nv24
> -y -i hdmi.raw output.mkv && mpv output.mkv -loop 0
> 
> Don't see any problems with a reported framerate:
> 
> DV timings:
>         Active width: 3840
>         Active height: 2160
>         Total width: 4400
>         Total height: 2250
>         Frame format: progressive
>         Polarities: -vsync -hsync
>         Pixelclock: 296992000 Hz (30.00 frames per second)
> 
> Note the timing data reported by v4l2-ctl updates after launching the
> capture. It's not updated dynamically when you changing mode on the source.

GStreamer uses G_PARM to get and report the frame interval (and flip the
fraction over to make it a frame rate). I've assumed these two should match and
it wasn't worth a special case of HDMI receivers.

Nicolas

> 
> Lastly, please run `echo 3 >
> /sys/module/synopsys_hdmirx/parameters/debug`.  Watch the kmsg log.
> Check that it says "hdmirx_get_pix_fmt: pix_fmt: YUV444" when you
> connecting HDMI cable to a YUV444 source and see other related messages.
> If it says RGB, then your source is transmitting RGB.
> 
> > During my testing I got sometimes an error
> > 
> > 
> > # dmesg
> > dma alloc of size 24883200 failed
> > 
> > 
> > I'm not sure when this happened and how to reproduce it.
> 
> This comes from v4l core, should be harmless as long as capture works.
> It's a known noisy msg, you may ignore it for today.
> 
> > Then I tried to use an AppleTV 4k as source. I don't know what
> > resolution it tried to negotiate but I got this error in addition to the
> > previous "Device wants 1 planes" and no connection:
> > 
> > # dmesg
> > fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
> > tmds_clk_ratio:0
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
> > dma_st10:0x10
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
> > tmds_clk_ratio:0
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
> > dma_st10:0x14
> 
> "Device wants 1 planes" sounds like you're using a wrong v4l video
> device. Please double check. Though, the "signal not lock" means it
> doesn't work anyways, please make sure you're using the default driver
> EDID and not a custom one.
> 


