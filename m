Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B902CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrt+rRcY6dwrM2UMU1Ai7w0kkOH42HULEbDPQoOM4s8=; b=JQPjkTEUw3KmvOj4cowsOHztkF
	u6e0kc7WQlSEOLW8LTXmFncK54JAC79VIgIgzkwq78omjHDLzOfEPeKXnA632eHvlApZ0MmllC61M
	Ag5ex4obz/agFBe+UuvaudYkr4MyzfDAnQntxoBIX0X1VypJDFYYxAjpvWJjQWMYVTjC8weXaF66u
	s1Y3j13u9NCFRfld8zja0g6Bo83oF+x144H7a6ee1ZQpZBSYB/QtOA/bliY17tomqoZYeo5L3Mp+J
	645qlrZbfqImDE6HgyUvDqrlVWwB4pcyGAtGEyoEnlqpiIUe7CcvuFzVu30JYbFfTx/5CI1LefRBf
	0W+0Aw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqI6c-00000006YPB-2PhY;
	Sun, 24 Aug 2025 21:18:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqI3z-00000006YK4-32MZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 21:15:45 +0000
Received: from pendragon.ideasonboard.com (unknown [185.22.192.49])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 361374B72;
	Sun, 24 Aug 2025 23:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756070075;
	bh=/4qUqPwxdDhlFuiP2I8MM+kio8evMDngLWdnQo3JTLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhkThc7rbLyiuWFGAXyuzK1h9M5YQHbwYXNB1chUbxHDcvpC5gml2JvnMksXyLuzd
	 NRYzmzzwNduP1QbaJL/oKRExekiU4VS5OExrjQ3D1YyJDeRPdKka1F2chEQM0SglVP
	 yObrGkPwvFKHhw24lCX0PtWSJ2CLvPAy1hDmmPlU=
Date: Sun, 24 Aug 2025 23:15:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inbaraj E <inbaraj.e@samsung.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.nawrocki@samsung.com, s.hauer@pengutronix.de,
	shawnguo@kernel.org, cw00.choi@samsung.com, rmfrfs@gmail.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com,
	will@kernel.org, catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Message-ID: <20250824211513.GA30196@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
 <20250814140943.22531-11-inbaraj.e@samsung.com>
 <c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_141544_220909_BE21EB91 
X-CRM114-Status: UNSURE (   7.51  )
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

Hi Krzysztof,

On Mon, Aug 18, 2025 at 10:45:17AM +0200, Krzysztof Kozlowski wrote:
> On 14/08/2025 16:09, Inbaraj E wrote:
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - port
> 
> Also, you miss here supplies (as required).

Did you perhaps mean power-domains ? As far as I understand this is an
IP core internal to an SoC, so *-supply would be quite uncommon.

-- 
Regards,

Laurent Pinchart

