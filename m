Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5DBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0DHElIe/WTFtKTZTiw+WVkTFRZcj7hb2VqsvfdRzq8=; b=ZnW5x8dnhdtykbqLyMxeuQw3rl
	9bqUlwW8klCc1z6c28I0k9fJf0PBchGI2RwZLRQva76+ZmDZwUoV/0+DZwjGPwZAokPHof307RyYL
	XNkI+nyqYltRs77s72Of6pP/m4iwHgd9J5oE8xrInA21s7jSAljkzR8iwGOMII+lur2ZQ64aJxNSG
	aXsazl9j5BRhXmy/qIxpmec6o2PYz74duj4OX94ZMQz2TjsVHq7wsP/9P2YB5HLPKtQr0N30cDzG9
	7o35bi2dRGM0oFtgaYOi+r4ARyEOVfLI5k4Yj++QfMxiImwnH2Ocv3dRDy4wy87Ki94ti6o1go/ni
	w1+qt2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhjZ-0000000CGdR-1Kth;
	Wed, 19 Feb 2025 10:55:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhi4-0000000CGAK-3XEv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 10:53:46 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D52E6514;
	Wed, 19 Feb 2025 11:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739962339;
	bh=qkBui9Y/YZZlWr0k6NIZHQ0EzjwMCEqSGitfOdkZ31c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsDMIXgVIj+M99QzzVl0kcdX9WO7NxyJ/LheWbkb6fESOgcDOgdar+TdAi4ZrY4Wt
	 MALRsIZcOITBQ5LteJsKTEJaa9dfdhMDVJLgN98BJ5m7m3vL9vfOVdHRtQ2I4Vb3R1
	 Qv57Rv/BaGPcLqkqd4A31YvD/CCXcn6hB0XB9yJU=
Date: Wed, 19 Feb 2025 12:53:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/5] media: dt-bindings: Add Apple ISP
Message-ID: <20250219105326.GA31383@pendragon.ideasonboard.com>
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com>
 <20250219-isp-v1-3-6d3e89b67c31@gmail.com>
 <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org>
 <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_025345_016999_225481BC 
X-CRM114-Status: GOOD (  21.40  )
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

On Wed, Feb 19, 2025 at 10:54:31AM +0100, Sasha Finkelstein wrote:
> On Wed, 19 Feb 2025 at 10:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > +
> > > +  apple,platform-id:
> > > +    description: Platform id for firmware
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> >
> > No, use firmware-name.
> 
> Not sure how is firmware-name an appropriate field, fw-name is a string
> that references a firmware file, while this field is an id that is sent to the
> coprocessor firmware in order to identify the platform.
> 
> > > +  apple,temporal-filter:
> > > +    description: Whether temporal filter should be enabled in firmware
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > And why is this not enabled always? Why this is board specific?
> 
> Not every board has support for this feature.
> 
> > You miss here ports or port. ISP usually gets signal from some camera or
> > other block.
> 
> For complex cameras - yes, but this is closer to a UVC camera connected
> via a bespoke protocol. We do not need to deal with the sensor access,
> all of it is managed by the coprocessor firmware.
> 
> > > +        properties:
> > > +          apple,config-index:
> > > +            description: Firmware config index
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> >
> >
> > No duplicated indices. You have reg for this, assuming this is index.
> 
> There are duplicated indices, see isp-imx248.dtsi in patch 5 for an example.
> 
> > All these do not look like hardware properties but rather configuration
> > of sensor which should be done runtime by OS, not by DT.
> 
> Those are board-specific and not discoverable via the ISP protocol.

But they are settable through the ISP protocol, aren't they ? For
instance, looking at isp-imx248.dtsi, the first four entries are

	/* 1280x720 */
	preset0 {
		apple,config-index = <0>;
		apple,input-size = <1296 736>;
		apple,output-size = <1280 720>;
		apple,crop = <8 8 1280 720>;
	};

	/* 960x720 (4:3) */
	preset1 {
		apple,config-index = <0>;
		apple,input-size = <1296 736>;
		apple,output-size = <960 720>;
		apple,crop = <168 8 960 720>;
	};

	/* 960x540 (16:9) */
	preset2 {
		apple,config-index = <0>;
		apple,input-size = <1296 736>;
		apple,output-size = <960 540>;
		apple,crop = <8 8 1280 720>;
	};

	/* 640x480 (4:3) */
	preset3 {
		apple,config-index = <0>;
		apple,input-size = <1296 736>;
		apple,output-size = <640 480>;
		apple,crop = <168 8 960 720>;
	};

But I may be interested in capturing a 640x480 frame with cropping only
and without scaling, with

input-size = 1296x736
output-size = 640x480
crop = (328,128)/640x480

Or I may want my cropped frame to be located in the upper-left corner:

input-size = 1296x736
output-size = 640x480
crop = (8,8)/640x480

If I set those parameters through the ISP protocol, won't it work ?

-- 
Regards,

Laurent Pinchart

