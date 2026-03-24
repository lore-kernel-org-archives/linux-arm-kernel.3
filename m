Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE08F54AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ws8gnjoF4i5AoJRWVzVh7quYkJpi5YBeM5lgd/FTWtM=; b=gD8ichzyXiJhoy55kYKTOtuUVZ
	19yweDE5fOx2Yo4BtFSEjfi4L7psATHSAm2gcYSGR08tVZJfKgC9FhlZC23LWkPef5HTp+l02g80F
	ux1DYrsjZGXUWWoHpBTihh9IIrb0JO754vDWuodB3isd2EYDJXcovWXFNOu/+OMaZTjrWt4/RFj4/
	wRNWRCr1WAIuUe2docL1cODjjChp6vmOLKckjGptk4502X7T+ozgPgQwFtrTfD55jPtsD9el+oUHR
	vcS4qyNJI3FT25m/5A+w0nb0upQXiYcRyOQFBYtfifRjeRSxofAu6M++cRHy7XEnTooStw4nIGXtv
	3X2GsQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54sx-00000001vEc-2Pep;
	Tue, 24 Mar 2026 16:45:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54sr-00000001vBG-1s5y;
	Tue, 24 Mar 2026 16:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ws8gnjoF4i5AoJRWVzVh7quYkJpi5YBeM5lgd/FTWtM=; b=ZUgozKg+7/Ozw0MZAj14bc2Mud
	RF250v2ZZZ/QL2u7ThWUQe8+i8EmqBpQtFcZaIcv/t/abW96jZMbv/NmXcD1jxvhABmY3RtJCbUcU
	9vj5ZzFoTeQRHrHpTw0vVnwXDR0qQRgJy80AWAqtxytOtoFueLqKncqSIoaxFdpaiTnj9Gph5GjOr
	SwcGzRj6LWnpudS/GZp9si6m4cT1TZJhmrrXAGDTTLUY0NcPz98xGlAUACP7zOEqJ1LKroru4uPmR
	G3Zsj3oE5DdSYUjsgRqYCCH7fmnYLS/+H4oDGM9GsOFN6sgS/JkCC/lpKkgh07wf0twJ/bAFkaTRx
	JddF3CJA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Tue, 24 Mar 2026 17:45:30 +0100
Message-ID: <177437057319.780275.6126712599317976655.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313131058.708361-1-festevam@gmail.com>
References: <20260313131058.708361-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_094537_480285_E069FD97 
X-CRM114-Status: UNSURE (   9.72  )
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


On Fri, 13 Mar 2026 10:10:55 -0300, Fabio Estevam wrote:
> Add the PMU GRF and IOC compatible strings for the RV1103B SoC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
      commit: 25c2721f18ff97226a6561aedc9f8f76a51fe2e8
[2/4] ARM: dts: rockchip: Add support for RV1103B
      commit: b4dc241c68f5a2a6e312259bf23885d693f91960
[3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
      commit: 2ea01fbb1d29d2349aa489eb884938898f10a84d
[4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation Board
      commit: 683192d7d5b47e89d920867f7c6997d2c0d1a0ad

Now that the adapted mmc binding went in, this is also ready.

I've reordered some properties according to documented preference
= largely { compatible, reg, [alphabetical], status }

And dropped the watchdog node for now.

Please resubmit that one, once the watchdog compatible went
into the watchdog tree (and drop the status=disabled from
the wdt node, as the watchdog is not dependent on supplies
from the board dts)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

