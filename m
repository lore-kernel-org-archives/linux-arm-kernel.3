Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D418E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X0WBBqCGRGq8C7ulGGLTNywZC6aKr6ETbimA2Nz/ns=; b=F8sVUsMXZ5kEGQR8S2S3ZJKCaK
	7OHsnFEFSIOTW7bjj2vAzJVJenRlIBEH74GZf6KyWPJHQXtiA7DmnTGWT5McW3iiPNpqqEUpS3jaf
	Ptb50/Q9coBcD8EBOyG3UcpZLpQ6zB+t6Xm2XEFnvcv+Z9sZ34BA8dBvgPm3KlTyCSeM6YZnzc/DJ
	biODJ1RxPfF38qDKBdiVE8f6qZLAYMvkivmnidbdFMvVToGm3aBuzxO106W34pqaJyVMUrGay0fOa
	H5PfWHAB1ugjJhx8LDBPYmvyRe9+PeoHqdEUslICaRMRFoym/04IFpk0PS2BYjC1f4ogX+5Yl4HfY
	ywAgkXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfLD-0000000A8Q1-3j2T;
	Wed, 08 Jan 2025 23:19:59 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfJo-0000000A8G4-2xz0;
	Wed, 08 Jan 2025 23:18:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YT3jZ39S2z9sWt;
	Thu,  9 Jan 2025 00:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1736378258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/X0WBBqCGRGq8C7ulGGLTNywZC6aKr6ETbimA2Nz/ns=;
	b=JAfvD+pdAeKiUoArfy+4UiHiMzwvFhIWF4V+OQwYFiWD/VVanEpTe4A8wZyA1kbIX8BJUo
	SAAr4juuBaNYIFru96NwPHEUIKW+huo2bLKGcpeDJ+4NpMhlIZ6txOMtBSWQQeGy4OyQk2
	+bkUXr4rLVN355a1wSzrClAizugbundksLMsHnAZANUGDfa0vzbl7DujtfKduX2wNX3VeB
	jk8aC5a/47RI/z6NprAcs4FVPw9zvAlsqTQIi3BprYTgOYRUMBguoKJbypnwcCIWQy5U/b
	0l2eK9G1+vT48+OCF1P3MVrSIvSoZZx7ll/rsvGQp3LAFaGueuary2JZNmhjtQ==
Message-ID: <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
Date: Thu, 9 Jan 2025 00:17:32 +0100
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4YT3jZ39S2z9sWt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_151832_890466_74A7F3C0 
X-CRM114-Status: GOOD (  14.94  )
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

Hi,

I tested your patch with the command

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink

If this worked I moved on to a visual test using

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! v4l2convert ! 
waylandsink

I used a Windows PC  with a Nvidia GTX 4060 as my source for the 
following tests.

| Format       | Result                                      |
| ------------ | ------------------------------------------- |
| 4k60p RGB    | Recognized as 1080p / 120 fps - no output   |
| 4k60p 4:2:2  | Recognized as 1080p / 120 fps - no output   |
| 4k60p 4:4:4  | Error: Device wants 1 planes                |
| 4k30p RGB    | ok                                          |
| 4k30p 4:2:2  | ok                                          |
| 4k30p 4:4:4  | Error: Device wants 1 planes                |
| FHD60p RGB   | ok                                          |
| FHD60p 4:2:2 | ok                                          |
| FHD60p 4:4:4 | Error: Device wants 1 planes                |


When testing 4:4:4 chroma I got the following error:

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
/sys/v4l2/gstv4l2object.c(4344): gst_v4l2_object_set_format_full (): 
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Device wants 1 planes

I could record and convert (with errors) the files with 4:4:4 chroma 
using the command Shreeya posted, but the resulting video had wrong 
colors and was flashing.

I was not able to test 4:2:0 chroma. I tried to generate an custom EDID 
with support for it but I could not select it in the graphics driver in 
the source, maybe this is just an issue with my setup.

I also observed that the the framerate is reported wrong, for example 
setting the source to FHD60p RGB resulted in the following:

# v4l2-ctl --all -L --list-formats-ext -d /dev/video0
Active width: 1920
	Active height: 1080
	Total width: 2200
	Total height: 1125
	Frame format: progressive
	Polarities: -vsync -hsync
	Pixelclock: 214076000 Hz (86.50 frames per second)

This wrong framerate reporting seemed to happen across all framerates 
and resolutions. Gstreamer Pipeline negotation showed the same results.

During my testing I got sometimes an error


# dmesg
dma alloc of size 24883200 failed


I'm not sure when this happened and how to reproduce it.

Then I tried to use an AppleTV 4k as source. I don't know what 
resolution it tried to negotiate but I got this error in addition to the 
previous "Device wants 1 planes" and no connection:

# dmesg
fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, 
tmds_clk_ratio:0
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0, 
dma_st10:0x10
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, 
tmds_clk_ratio:0
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0, 
dma_st10:0x14


Best regards,
Tim




