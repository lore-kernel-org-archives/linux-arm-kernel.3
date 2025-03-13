Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EABFC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YptjuuJF5rh7n2lSjL9tFMkO7p44p4Xg8AOU/ox2Yt0=; b=LPir8NdVqUK6pYSwGXGLAf85+W
	nLvnp/E8mwbbFeWxkPpMG3/RidkgrrUzja817vTeyNuqN8rh6mcsMqACC/xzAeg0VMZHZ6RSv0eCC
	Od+N80t/sVlr2lhp0G6En5lh6K1dMnFc1uxC8Bvj2ITqljA/fQXTsuNOObh2Mpx2KjcQklwqSmnPD
	rMQIURFgVPM0/rrAlB+3BDBzKocAfdMihqS++UE1mtsoP8SFNKEjDwsXdq2W0qmlYGFrag5895dpR
	16F1NuJl4dsFBnAq9kMrPJRYDOsvSx/KkIUFP7rrHilx+2vTFJVsxtSmOQy5q7Mw3eA0sB2QUVgg5
	pntsMvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tse8Y-0000000AaBV-0xPB;
	Thu, 13 Mar 2025 08:41:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tse6Q-0000000AZWg-02eP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:39:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6F-00085s-GA; Thu, 13 Mar 2025 09:39:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6E-005VQ8-1o;
	Thu, 13 Mar 2025 09:39:30 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6E-0003Oq-1h;
	Thu, 13 Mar 2025 09:39:30 +0100
Message-ID: <d6ba31482a0a220bf0c413e5b3c1661498c1485b.camel@pengutronix.de>
Subject: Re: [PATCH v8 5/9] dt-bindings: reset: atmel,at91sam9260-reset: add
 sam9x7
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Varshini.Rajendran@microchip.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com,  claudiu.beznea@tuxon.dev,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: krzysztof.kozlowski@linaro.org
Date: Thu, 13 Mar 2025 09:39:30 +0100
In-Reply-To: <cab4ad68-cf3e-4385-8721-837372df2e12@microchip.com>
References: <20241010120142.92057-1-varshini.rajendran@microchip.com>
	 <20241010120419.93043-1-varshini.rajendran@microchip.com>
	 <cab4ad68-cf3e-4385-8721-837372df2e12@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_013942_047895_CE842CAA 
X-CRM114-Status: UNSURE (   6.48  )
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

On Di, 2025-01-21 at 10:41 +0000, Varshini.Rajendran@microchip.com
wrote:
> Hi,
>=20
> A gentle reminder to merge this patch. It has been left out while the=20
> other patches in the series have been merged. Please do the needful.

Applied to reset/next, thanks!

[5/9] dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dd41f0d0bbd79

regards
Philipp

