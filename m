Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05544C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkNXs3GhWdHth8Ond4pR/dBWfV4pNErUlmCE/YZ+b0k=; b=MFQrBBBCVwSUBCM0ph4a2CzQVM
	jAdYNLzPNbeucS8665Z0YNlN+FsQ1oa/56jCytMdh2xOaIAnIGLLj1t1S3vH+j/jbIXvympBT2l5i
	9meGPGGy5C7aypNLBTxtvk9KRkSBPxj4oUq8fxiBNG6fAzhku0hYJ4g2ap21Rrlq9E7kcb3u5Jfjn
	W1pbypOFb5HTYJaPYhzQTi41GgQOitiiPksQhDpFOmiTgs0JkgsXovMP75PZcm8L6dAOt24cU8XvI
	Y33fKinWN76ufKCmSjgUPL0TncZUhSRwq/Lhr2yE6DpO7nBzU6NRisxNIfZPBPBvKcLvfRgbbI4nf
	xeXgJAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KOk-0000000HUUy-1Wig;
	Fri, 25 Apr 2025 14:51:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HxM-0000000H5LM-04RN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:15:01 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 183A082E;
	Fri, 25 Apr 2025 14:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745583292;
	bh=hXVxzv2BEfGt9maqV0Cdf0h/9YhMXC57kWNciCKGBKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTcp93ZsMQ43V6m58Oy1GpAMWsWYLaT26xS6LndaKoq+G3xqOv/onC3x+d8OHhAjR
	 15rX3unqAaRxUPiz06jtjFUqaZrMo04ZsXRNKdHrEmBBbOXgz3ZrZQKpuq+Dys/1Hp
	 TNGBZlScy5Aue88ppNVxollbOo9xb2gl8PXfrgNw=
Date: Fri, 25 Apr 2025 15:14:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: i.MX8M Nano ISI Channel Question
Message-ID: <20250425121451.GP18085@pendragon.ideasonboard.com>
References: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051500_192692_4F01EF8A 
X-CRM114-Status: GOOD (  25.86  )
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

Hi Adam,

(CC'ing Frank Li)

On Thu, Apr 24, 2025 at 08:59:18PM -0500, Adam Ford wrote:
> NXP-
> 
> I am trying use Libcamera to capture video on an i.MX8M Nano.
> (Hopefully, this makes Laurent smile)
> 
> I noticed that it has a maximum capture of 1080 lines when I query it
> with Libcamera, but the same camera on the Mini can capture at higher
> rates.  The multimedia overview states it can handle 1 unprocessed
> camera stream at 4kp30 without scaling.  The Nano's Ref manual later
> states that each processing channel has one line buffer, and each line
> buffer can store up to 2048 pixels.  It continues to describe when
> processing higher resolution images like 4k, the line buffer from
> other channels can be combined.
> 
> Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
> explicitly goes into detail on how to capture up to 4k image
> resolution by combining channel 'n' with channel 'n+1' which implies
> there are at least two channels.
> 
> Section 13.4.5.1 states the registers are dedicated for each channel
> and spaced 64KB apart, but then the following table only shows the
> base address for one, and Table 2-6 shows the ISI size is 64KB.
> 
> The driver is currently written to only support 1 channel.  When
> reading through the driver, it appears to require one IRQ per channel,
> so I looked through the Nano's IRQ table (7-1), and found there are
> three:
> ISI Camera Channel 0 Interrupt - 16
> ISI Camera Channel 1 Interrupt - 42
> ISI Camera Channel 2 Interrupt - 43
> 
> I attempted to enable a second channel by modifying the .num_channels
> = 2 value in the driver, and I modified my device tree to assign a
> second IRQ (42), but when I query the pipeline with libcamera, it
> still doesn't show an available resolution ov 2592x1944 that is
> supported by the camera and work on the Mini without the ISI system.
> 
> Can someone tell me how many channels are actually available, and
> whether or not  4Kp30 video is really available on the Nano?

My understanding, based on the i.MX8MN reference manual, is that the ISI
has a single channel. The ISI features list (13.4.1.2) reports

• Supports up to 2K resolution at 30 or 60 fps (24bpp) on each channel.

If you look at the i.MX8MP reference manual, the same features list
reports

• Supports one source of 4K resolution at 30 fps (24bpp).
• Supports up to 2K resolution at 30 or 60 fps (24bpp) on each channel.

There's no mention of 4K in the i.MX8MN ISI features. I expect that the
documentation about 4K support by combining pixel buffers comes from the
generic ISI documentation, and is not applicable to the i.MX8MN.

-- 
Regards,

Laurent Pinchart

