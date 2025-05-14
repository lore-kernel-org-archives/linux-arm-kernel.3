Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1E1C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGd2Mb+X+sAvNL8H6B+LyWY0TSE3weRAb/G35yG6LQI=; b=C9dDEqjGgo01esg+kA/xmshPGP
	QaNHdeNF515z5ImOqQZPuaX7xAMPSFnPEIqycgwqiL1GAMBdxED4rzqm6K2vWJSREvJJ1X/PJXQyT
	eQY2Z6u1NmRcZ2NPbSQbtUTkhUkKFbPjc5HZ4ihCEPfcyFCg0LjrisZCoUsD1R84ELWBebKOQSbGx
	Q4DfGD/DOf0AIzIDgb5rFSEjGxOC+l2IWbxiVOxLKcTi0J/zrRCu2+s7Agg1YtuGzwYSRZ4gTV2wp
	SXlHdQp23TiJcEXxL8d76Tj7rYtY4teSnYOnNYEFPToL6usA84ORrd/rxmFuBGdnqquShkNzE0SjU
	wlCW4nIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBd-0000000Fu3N-2WDi;
	Wed, 14 May 2025 17:46:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEVM-0000000FfAN-0SqB;
	Wed, 14 May 2025 15:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747238325;
	bh=HP06nWuxTmL6ZClR4puw3sVL0ndk41lusHH26XdkLtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NgpPAltUzBWKcnOQ2MJrfk8yEa3QL5pB8YivdGG07OwUkZaZlWSle+mvlg9FQGOn2
	 DzA5cnnKZC7fzIp87oQVFHav3mGqmtJS+VIG/lN0Pbyqo4mSkT/zxz151/ynSTdSOO
	 g9H3BEKMgZ7nD+dEv/zdyAt77P7g/Hqk4DASYocyQBLfLkwD4attQG5iRryxEDkTtq
	 90kRN1NKVzlzcdDDaDmbCPpQVNuULw5MqVpuzT1MB+artuYISzTquY+f0V5MgsmwA/
	 pkYIzIcCLV/GC42Tx3lzpLAeo6Nhi+EES3Fs2Hx2y5/1MOMzYtLiNPsiWXjhXULMeI
	 2S4TQtinE99Ug==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3497E17E0CD1;
	Wed, 14 May 2025 17:58:44 +0200 (CEST)
Message-ID: <344fe705-d1f7-45d0-b540-93fc8718f8e2@collabora.com>
Date: Wed, 14 May 2025 17:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/14] media: rockchip: add a driver for the rockchip
 camera interface
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085848_310629_402AD6B1 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Hi all,

On 5/14/25 17:41, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> [...]

I believe the cover letter is already long enough, hence I send the
v4l2-compliance reports in this reply (please find them below). There
are two of them, one for the DVP and one for the MIPI CSI-2 (only one
stream/MIPI CSI-2 VC).

Best regards,
Michael

$ v4l2-compliance -d 0 -s
v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for rockchip-cif device /dev/video0:

Driver Info:
        Driver name      : rockchip-cif
        Card type        : rockchip-cif
        Bus info         : platform:fdfe0000.video-capture
        Driver version   : 6.15.0
        Capabilities     : 0xa4201000
                Video Capture Multiplanar
                I/O MC
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x24201000
                Video Capture Multiplanar
                I/O MC
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : rockchip-cif
        Model            : rockchip-cif
        Serial           :
        Bus info         : platform:fdfe0000.video-capture
        Media version    : 6.15.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.15.0
Interface Info:
        ID               : 0x03000006
        Type             : V4L Video
Entity Info:
        ID               : 0x00000004 (4)
        Name             : rkcif-dvp0-id0
        Function         : V4L2 I/O
        Pad 0x01000005   : 0: Sink
          Link 0x02000008: from remote pad 0x1000003 of entity
'rkcif-dvp0' (Video Interface Bridge): Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for rockchip-cif device /dev/video0: 55, Succeeded: 55, Failed: 0,
Warnings: 0
$

$ v4l2-compliance -d 1 -s
v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for rockchip-cif device /dev/video1:

Driver Info:
        Driver name      : rockchip-cif
        Card type        : rockchip-cif
        Bus info         : platform:fdfe0000.video-capture
        Driver version   : 6.15.0
        Capabilities     : 0xa4201000
                Video Capture Multiplanar
                I/O MC
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x24201000
                Video Capture Multiplanar
                I/O MC
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : rockchip-cif
        Model            : rockchip-cif
        Serial           :
        Bus info         : platform:fdfe0000.video-capture
        Media version    : 6.15.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.15.0
Interface Info:
        ID               : 0x0300000f
        Type             : V4L Video
Entity Info:
        ID               : 0x0000000d (13)
        Name             : rkcif-mipi0-id0
        Function         : V4L2 I/O
        Pad 0x0100000e   : 0: Sink
          Link 0x02000011: from remote pad 0x100000c of entity
'rkcif-mipi0' (Video Interface Bridge): Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for rockchip-cif device /dev/video1: 55, Succeeded: 55, Failed: 0,
Warnings: 0
$


