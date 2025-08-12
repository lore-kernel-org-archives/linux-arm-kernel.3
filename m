Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E32CCA0EE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NJTq8lHNpyrFFGrDGzcN4lwztTfrWDLPgeOl2/nCeo=; b=QnoYZJIlS5cfS7DOMriGdWCJjd
	whueR1oho85J5IR1N32bp80fKBeYx/OyMK1UkYT8AY6NlzYU/NECATvbNv5OulMLF1F5W5eXVE/3Q
	5RzRXKklk7H8TgvmiQRjiGiVfWSxi/i2fXlCkiXs+wE1e3xRATBDEsDIAWGFNvNYq7s/muHN4TEKv
	yaxczZ9k5ZmQ444IF/Rrjn2beCIeEAzdwmoVyCHap1wv5RX+C+h+E/Umhj3BqbeKAGIxsDmPKwsZm
	BEFO7LNBuqyAVoxtrC60rN7aooeIFfydBgoHq3zuKH87mlvlSxvC/saR6+uIGvmQFjjge4Rpq+OKA
	ptsgcEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhp-0000000BHM5-09Iv;
	Tue, 12 Aug 2025 16:18:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulljf-0000000AReR-3fVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:56:08 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A7B9A3D5;
	Tue, 12 Aug 2025 11:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754992509;
	bh=Jc6UjfTcQvZWgyuziRpzBFM1KCrtVqYio7YrhWkGjvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HR/wDnWjoEx6ULy6D4nn+zWGXxDgeyYjkra3kB1vPWDoUNiH9LNSm4NLhq91Jm+eg
	 0W3+I+BKlvUc8had2s1myxVGNC/2Vl5oBrmBNmb18Ap60IBtTsVPwph/ogC/gOV+fG
	 7QnPJqG8jllMngW/Th7BLSigM759CA6JBFuS6338=
Date: Tue, 12 Aug 2025 12:55:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
Message-ID: <20250812095543.GJ30054@pendragon.ideasonboard.com>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
 <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
 <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025604_053546_3A086735 
X-CRM114-Status: GOOD (  22.61  )
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

On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 08:31, Will Whang wrote:
> > On Mon, Aug 11, 2025 at 11:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2025 04:47, Will Whang wrote:
> >>> On Mon, Aug 11, 2025 at 1:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>>>> +description:
> >>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - sony,imx585
> >>>>> +      - sony,imx585-mono
> >>>>
> >>>> I don't understand this second compatible. Is this different hardware?
> >>>> Can you point me to "mono" datasheet?
> >>>>
> >>>> Your description should explain this. Commit msg as well, instead of
> >>>> speaking about driver (in fact drop all driver related comments).
> >>>>
> >>> Mono version of this sensor is basically just removing the bayer
> >>> filter, so the sensor itself actually doesn't know if it is color or
> >>> mono and from my knowledge there are no registers programmed in the
> >>> factory that will show the variant and model number. (That is why when
> >>> the driver probing it only test blacklevel register because there are
> >>> no ID registers)
> >>> Originally in V1 patch I've made the switch between color and mono in
> >>> dtoverlay config but reviewer comments is to move it to compatible
> >>> string and not property.(https://lore.kernel.org/linux-media/20250703175121.GA17709@pendragon.ideasonboard.com/)
> >>
> >> You only partially answer and judging by mentioning driver below:
> >>
> >>> In this case, what would you recommend?
> >>>
> >>> compatible:
> >>>   enum:
> >>>     - sony,imx585
> >>>     - sony,imx585-mono
> >>>   description: IMX585 has two variants, color and mono which the
> >>> driver supports both.
> >>
> >> ... I still have doubts that you really understand what I am asking. Is
> >> this one device or two different devices?
> > 
> > One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
> > (Color). Silicon-wise the difference is just with or without bayer
> > filter.
> 
> Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> explanation either in comment or description about difference in RGB
> mosaic filter.

Works for me. We could possibly omit the "j1" suffix too.

-- 
Regards,

Laurent Pinchart

