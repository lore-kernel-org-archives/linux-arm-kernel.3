Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF44C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 06:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrNosHeJWdXsV+nu34dlZfulTCotBTrcAUvtUHsZWpg=; b=Lwq3+j6fJ6J83Jwuv3mPfWTft2
	7c8BmXS3lppcxXF3/TLs+MnhB8G+5bTXnkIGL+VfUDpF7a9mDRo+4w1ds4+EUniBt2Hvmrz72Cc4f
	GA+uM3UnBmIG/gnkCdp5vHluBZDB3DmECWi0bclp1q8npmEIj1HCsSMzSYt/TNouWb76g3/GtCBRp
	E0v8BYwhMAMQ+SZPqWns53Dz5qn3lVLCzUm97sdOeyY0jhyG73vLMOW49xT88Xs6j/qd4KuQAiogS
	aDpmFpvMqs/rHY44bLViOzoYx+9ecWU7WXCP+JnyNh3TunE8gkWixphA+FSDxOSx2+FoURh/Ys/LP
	a+qeq96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW83o-00000001KwI-1deS;
	Mon, 30 Jun 2025 06:32:12 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW81U-00000001Kjl-3R0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 06:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XrNosHeJWdXsV+nu34dlZfulTCotBTrcAUvtUHsZWpg=; b=vJV8G9TuBT5ty7y8epGASfG6fD
	yOj3bxw8xBc+vnmuEUQffA2IZJrHZ46Ic61tXvQXFSCDqKdvGMvvyb0r5954tcNlq0NwylwEWovyb
	6KnGsW8349pYBPdEAESEvN0MzG1YkOSi+4zXjEtDaJhVUEgEEUn45Qwj3nFnXwzG937xGuq+Mcj14
	MUlASuAsCqv3GxepjncV8B4SgtPCIwIkFzRCZr0eH4WoDdafEuIuE8rTkY0QUAzrWjM3wjqbEkvrv
	cL3HNcSura6wcowpEUkbkHUc3oyEgFvPlfZB/XefW4RUwYkzyIzID931cpsg2QMjD46yiVp7mbSVG
	SmXrHyRA==;
Date: Mon, 30 Jun 2025 08:29:09 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, Marc
 Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>,
 Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Message-ID: <20250630082909.74dd386f@akair>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_232948_864986_6E1F3DBB 
X-CRM114-Status: UNSURE (   8.38  )
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

Am Fri, 20 Jun 2025 10:15:51 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>


