Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC226C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZdbguPgsJ3dIsjeAE1gh4r/OS8eReNScxmzTOcJkw0=; b=RWbzy60CJ0A9ROgB15xi4YDPD9
	5HzDNpbBprKBD7TU+ZxrWO5UeGswq93fWk0RGvjJAA0pkUCGDtudNpBQihyhutcgCHyLHxTIspacN
	FGBxJndB340eP9V5eYNhnH62Ovc/EPCYnf5u8doV5CzY/1gmx+eu5fQyPEk1WT0KT9nDMGo8s3w9k
	Vm6rBRzcnrRREyQIlbKJyjCD0/x5xkHTMmYqMpg+7v++/z72NMCyPKWW685vyKvPGuFkXNauXcScQ
	AtYu820ULlLPDVZKuzrRajEiE/y1O0aGAs4mGR055yHSskwVW+wiV6/wYD1glJhiwOrOv26hBnc3T
	lLs+pp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MLT-00000008Hrc-2Ovg;
	Wed, 23 Sep 2026 12:45:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MLS-00000008Hqz-2T2B;
	Wed, 23 Sep 2026 12:45:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B67C1600AA;
	Wed, 23 Sep 2026 12:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CFF1F00898;
	Wed, 23 Sep 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790167505;
	bh=iZdbguPgsJ3dIsjeAE1gh4r/OS8eReNScxmzTOcJkw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZWvVoI8hZ3VQ7pXstaTmhaeuG1NaVmlCIac6mZadqV8O0+rfux++2YxN5Lk562IJE
	 sl8Tpy750tF0AMfTcGXFpmuKAqYXncBQLNmesl97xPmVJixDqDasCqLUaR1YfL7/c1
	 +BBzMIQnCaGd2wONT2Lb878P2lppFKrRMQekkdjiDyIr7wxHapZw15SMIXA+caXHmd
	 EOOJXnWLDOpNI2ZHkKbAWZTZrRUTO3YdcMdpt9SKffSTO0JFJ5FRrlMAK/P1m6Z/VW
	 mMhF3Yk+lireckw24FTO7kUZHauR4xqidCJvphQhc+3rGsjG1gEQ+AIYNa/hLkOs8o
	 +tgk2otcLM0LA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Aswath Govindraju <a-govindraju@ti.com>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: Christoph Stoidner <c.stoidner@phytec.de>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260907150420.18787-1-wahrenst@gmx.net>
References: <20260907150420.18787-1-wahrenst@gmx.net>
Subject: Re: (subset) [PATCH V5 0/4] arm64: dts: freescale: Add chargebyte
 Charge Control Y
Message-Id: <179016749941.155868.1810345055482953110.b4-ty@kernel.org>
Date: Wed, 23 Sep 2026 18:14:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 07 Sep 2026 17:04:16 +0200, Stefan Wahren wrote:
> This series adds support for the chargebyte Charge Control Y, which is
> an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
> Charging System) charging stations.
> 
> sashiko reported in the first version of the series [1] that X_nRST_LAN
> is available via GPIO line names, but there is no reset mechanismn in the
> device tree. This finding is valid. Since the reset line feature isn't
> implemented for LAN8651 driver yet, I like to proceed with the current
> version. The LAN8651 handles reset via SPI commands and in rare cases
> we still have the possibility to control the reset from userspace.
> Btw the pin has a pull resistor in hardware, so it's not floating.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: ti,tcan104x-can: Fix property constrains
      commit: c7f2322431cb6d108b18fb4154606b49e2bc50f7

Best regards,
-- 
~Vinod



