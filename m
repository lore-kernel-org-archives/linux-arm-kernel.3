Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F200CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoL3Hf8941p4fXWRyo5Ay8D4wG5RNgLQc4Wu3GBeuw4=; b=GN9Glvu/Wg/+EwqTIvYVs4qFdj
	ls7OQIu6ohcsNT7MiXshLBa5Ybdm5hqQJwjUawWAu5UwKjv692JQYTb5pXw/VT77ZP14dnCm9M65Q
	KEBBtaLCMTfvCwFxDH23HAK3+Vtxs7/25PQUqr0rFBgoQ1eN0yBmNq+WN9NEr3H+9Mlok9Sn3KiYf
	NfcZe3xqvta4jB61eOATwUpWy9YkOD4tgTzUU+0sCZDY8s44SxH3frykmT145suAPBqNQg5JAlT2a
	SiPDKJrZGyXrRyC2YMzsdJwqQl//JArtcjGV+mSmRdgZTuCi3dA3+yi10cjIqQwi+N1q2M+b31BoT
	RmC0ZB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsDt-0000000BrPy-3pjn;
	Tue, 26 Aug 2025 11:52:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqs6C-0000000BpXS-3uBo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 11:44:26 +0000
Received: from pendragon.ideasonboard.com (unknown [213.244.170.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8EAF75782;
	Tue, 26 Aug 2025 13:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756208596;
	bh=gPWFtOfDlGNjTh65kxpE4jTt4VsFGsZ3a+MU5+Da/3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Diz3q8F8cGUQ/w/QjuhsxnJTf81qtzTaJfBzTLgJwvZfh8WTBjfEMKeNoKOn39uU4
	 L9aWe1xxOxGgpDRPD/1RExd1TjzLRbSpizQz7XJKYI3+w+Er7M5hym4AEoM5PcSM0L
	 ycbiNMe17DrMJ3bNbgmuyuY2tRbTEJBvyNPch3KI=
Date: Tue, 26 Aug 2025 13:43:57 +0200
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
Subject: Re: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Message-ID: <20250826114357.GA607@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
 <20250814140943.22531-5-inbaraj.e@samsung.com>
 <1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
 <00d101dc136c$aa037020$fe0a5060$@samsung.com>
 <41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
 <016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
 <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_044425_128531_978AA6C9 
X-CRM114-Status: GOOD (  11.73  )
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

On Tue, Aug 26, 2025 at 10:36:50AM +0200, Krzysztof Kozlowski wrote:
> On 25/08/2025 15:05, Inbaraj E wrote:
> > Hi Krzysztof,
> > 
> >>> CSIS stands for Camera Serial Interface Slave.
> >>
> >> Googling for "MIPI CSIS" gives me 0 results, so I still claim this is not a generic
> >> name.
> > 
> > I checked other vendors (e.g: freescale), and they are using mipi-csi. I'll adopt for the
> > same.
> 
> Then it is just "csi"? Except that you have some other different nodes
> called "csi" as well, so two different devices are "csi"?

This one is high on my list of unfortunate name clashes. Many NXP SoCs
(among others, I've seen that in other vendors too) have IP cores named
"Camera Sensor Interface" that they abbreviate to "CSI". They are
unrelated to the MIPI Camera Serial Interface. I won't blame NXP, as I
think they may have started using the acronym before MIPI CSI became a
big thing.

-- 
Regards,

Laurent Pinchart

