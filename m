Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7861C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1S/tznoTQw+vAi7GEBuHVHmSR4dRiXITXrdjAtyCJ8=; b=uKKoKxOaHN8O+in5Q2U29yBsat
	gxbHIqC8tiWUGuv1hSK5QCuD8gHoEUPpsDXTgTN5HC5GB9wAiSZSkuKMv9CdfAPP9HBAjYe8gzjnv
	8PDWMdbVX75PBcuCPBhAqT3XLdU7ctgdUeRKuGtoh4//DKk5W/vE7pmKrub/kJuemigpACK6mbmsk
	1mLk73BN3lZ5Y1Q6sjH2q0Xvg0y5S9V2QGKDQheUMnN+3P31hRzxot6dtGPtKkKGjsn4VJ3KIAjdO
	A+6Gi1jw4x9qF2GsjfGIwSGnWZSMo9kcD694nuk6nPPr8MD/n4qP2W5sTNhn890xLXo/8dpa1x9WK
	8TCivgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WIN-0000000EANF-4Ake;
	Fri, 18 Sep 2026 10:58:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WIM-0000000EAN3-2UQR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:58:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B374660A7A;
	Fri, 18 Sep 2026 10:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAB01F000FF;
	Fri, 18 Sep 2026 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789729097;
	bh=m1S/tznoTQw+vAi7GEBuHVHmSR4dRiXITXrdjAtyCJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gX6miYZROM/WCUo/3itVv5k9IdhKCUOYp45hmLgEMGezllawSb1SK0j27sP7PNRCn
	 4i7yDH67yBdTDtQNUZqOFuPJYGe0WA4hGMYwjSOhrVM20eKubFyzoz9ZTj6WmAQZGp
	 /BSCgWIeBaeq5Ye6kmnQdQISJQqTHoonzTc/c7PiuqpunDvjxrZ5fFsBZFihX/2wh1
	 5RxQTqW6FG4hcfTu2piIweKyYI8IB6d8hZlqF1/is8ons7X1fRY2506Ne9Stii2JHN
	 3BiRmQIQlXBW5pwGxMky03hSWjCP6oLU+sMNqYWTbF0Ssie/sVgKZYhcdC6WQSY/Nj
	 SxmNIETMxSgiA==
Date: Fri, 18 Sep 2026 12:58:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
Message-ID: <20260918-energetic-cheerful-hoatzin-aac346@quoll>
References: <20260917062543.534416-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917062543.534416-1-marex@nabladev.com>
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

On Thu, Sep 17, 2026 at 08:25:26AM +0200, Marek Vasut wrote:
> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
> It is pin-compatible with TI TCAN1042 and has a compatible programming
> model, therefore use ti,tcan1042 as fallback compatible.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

I'll fix up the binding constraints.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


