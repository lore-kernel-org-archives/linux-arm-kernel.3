Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81B8C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DekVWt4JqE2MWMnc0nd0jq5dcOkTPfi3mzHRwDsYmM=; b=Rere1hNcbLMEEWcbrx6Gqc1tk1
	7ZYRi6tB6Yn2AQpDwZyW3FUFjK6m+xUwETGuKNO23483ltLYlv5smJpwk9DIuIjqKFHBatpW32/HF
	4ex1ToxVVbpGeziZpg7guxhpygd44HcYpJ/OTRhdPi9DGHOLccB0FMbjTaM8u184lMbX5INIlBT3u
	hHdUM3fJcR/JoziiUXNdnRNLVmMtOL31v6Hbs7Oy18rxR8xnjyHty47kLvchfio1ec+o94LQ0Qa5T
	LV1ECK12xrILfkzf8HHVlc85WSapYZJf4Suu0ChIU2EOTx048fpVi8CjrZZiIKiY1IJc+SOPmGZeV
	J37rok7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgDq-0000000FGRb-1uV9;
	Mon, 24 Feb 2025 21:42:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgCK-0000000FGI1-126X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:41:11 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642C2220;
	Mon, 24 Feb 2025 22:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740433177;
	bh=Q+CujMAdg3JdeG0AwSNgh4CB8wuFVGWqju3Cnisvqoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex9pL1tbcP/9cY083eTsnpcO0wzf98asX+w+AW8acupb/SVwqRCSGxLbmDFZ/xewl
	 f/Jh2aA+64s6hv8ndxkexpeyr+m8Mx2ZuurdIrH6xArS9w05GNb+lrj9C+clo6Olvg
	 pNJ+ScFu7DYSeoStUg/i1AGBNgaBi84C+5AB8CVE=
Date: Mon, 24 Feb 2025 23:40:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
Message-ID: <20250224214045.GA9516@pendragon.ideasonboard.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
 <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
 <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_134108_426248_2473BA5E 
X-CRM114-Status: GOOD (  43.51  )
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

Hi Cosmin,

On Fri, Feb 21, 2025 at 04:27:55PM +0200, Cosmin Tanislav wrote:
> On 2/21/25 10:38 AM, Sakari Ailus wrote:
> > On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
> >> Multi-camera systems often have issues with receiving video streams
> >> from multiple cameras at the same time because the cameras use the same
> >> Virtual Channel IDs.
> >>
> >> CSI bridges might not support remapping the Virtual Channel IDs, making
> >> it impossible to receive the separate video streams at the same
> >> time, while the CSI receiver is able to de-mux streams based on VC IDs.
> >>
> >> Cameras sometimes have support for changing the VC IDs they output
> >> themselves.
> >>
> >> For a practical example, GMSL2 deserializer chips do not support VC ID
> >> remapping in tunnel mode, and neither do the serializers. Allowing the
> >> cameras to have their VC IDs configured would allow multi-camera setups
> >> to use tunnel mode.
> > 
> > We've tried to avoid having virtual channels in firmware and in UAPI,
> > I'm not yet entirely convinced we need to depart from the established
> > practices. Let's see. Apart from that, please see my comments below.
> 
> Can you think if any other way of handling this? The most useful way
> would be to have it accessible at runtime so that devices upstream of
> the cameras could assign the VC IDs dynamically.
> 
> This would be useful when having more cameras than the maximum supported
> number of VC IDs (4, without extended VC IDs), and streaming from them
> selectively.
> 
> For example, for 8 cameras, you'd have to prepare your VC IDs in advance
> to fit the streaming selection you want to make. If the cameras 0 to 7
> have the VC IDs 0, 1, 2, 3, 0, 1, 2, 3, you wouldn't be able to stream
> camera 0 together with camera 4.
> 
> Dynamic configuration of the VC IDs would solve that usecase since it
> would assign VC IDs based on the routed streams.
> 
> v4l2_subdev_pad_ops has a .set_frame_desc() that could be used to apply
> an updated v4l2_mbus_frame_desc, after retrieving it using
> .get_frame_desc(). Cameras that don't support VC ID remapping would just
> modify the v4l2_mbus_frame_desc to restore the VC ID to the original one
> (similar to how set_fmt() can modify the passed in format to what it
> supports) and the caller would have to handle that situation how it sees
> fit.
> 
> Does that sound better than sticking the VC ID in device tree?

I think a VC allocator would be very interesting development. It's
probably a bit more complex than hardcoding the information in DT, but
it would also be much nicer :-) I haven't really thought about how this
could be implemented though, but I'd be happy to discuss it.

The timing is slightly unfortunate, as I'll be travelling on weeks 11
and 12 and will have limited time then, but I'm sure Sakari and Tomi can
also provide guidelines.

> >> Add support for specifying these Virtual Channel IDs in Video Interface
> >> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
> >> Although the CSI-2 specification allows for up to 32 virtual channels,
> >> most hardware doesn't support more than 4. This can be extended later
> >> if need be.
> >>
> >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> >> ---
> >>   .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> >> index 038e85b45befa..414b5fa8f3472 100644
> >> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> >> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> >> @@ -231,6 +231,17 @@ properties:
> >>         shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
> >>         busses only.
> >>   
> >> +  vc-ids:
> > 
> > Other properties aren't using abbreviations, at least most of them. How
> > about "virtual-channels"?
> > 
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 1
> >> +    maxItems: 4
> > 
> > Shouldn't this be 32?
> > 
> >> +    items:
> >> +      maximum: 3
> > 
> > 31 here, too.
> > 
> >> +    description:
> >> +      An array of Virtual Channel IDs. These are unsigned integers that specify
> > 
> > I'd leave out the explanation on the data type. It's redundant.
> > 
> >> +      the VC IDs used by the device for its data streams. This property is valid
> >> +      for MIPI CSI-2 only.
> >> +
> >>     strobe:
> >>       $ref: /schemas/types.yaml#/definitions/uint32
> >>       enum: [ 0, 1 ]

-- 
Regards,

Laurent Pinchart

