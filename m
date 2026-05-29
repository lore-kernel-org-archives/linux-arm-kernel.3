Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38348CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsUANOWLHKOer8SDTCbPpoX6AoZe8u2V4LnMwcLy5iA=; b=cByeb1bLeNMZPDHR+pk014hnAi
	sS3YDN7Jjk2hLAACcUf6j8paQS+C/kToI2N89vjWc68w2cyCMhDahXhK+KVRxxme0VLmar6rxymyD
	veMPXqSZExnm32vizjDSlo37dM6H958aKTj9zb6UEi4n34Wzch54iafz97CzCPs/zTkZ6XMQWESRZ
	KnDn/0rY2NHqUUq8g/mJy3x2aGKGUc8aE4ywvGptmjeq/IKVe32DgKqPDvG6CRVX4m1P7rlEH4azG
	l+7gBicPCPkQCBmMqhYi15f1jVZ6v6z/8InRrGRlfPmOySK5I9r3yGRWUkGowD418YYRhlhwW22h7
	b4SFH6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvef-00000007JHP-0FaA;
	Fri, 29 May 2026 11:45:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvec-00000007JGu-0LRN;
	Fri, 29 May 2026 11:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OsUANOWLHKOer8SDTCbPpoX6AoZe8u2V4LnMwcLy5iA=; b=ZoOBoPTYgtLqwe91Tke96Elckk
	2JzMPczz4LtDrQ6kqL5HiO3UT78giBGarZ2ccbzg9Ew+7SPP1yUPfKE9XQ+m42LfYELqkSe8ZV8of
	RK4quJgk1VDbZfRDM/3paRUbUwShr6YjMeOV+biHXGTzg6AwXjsj8P7xgqyG0QXqNhnaG3E+/eIJ/
	CJmFKmVsSaWX1ad9SyNxnZ09PBDojtuRm7AUQH5oPzdEVAW/n970ezm7TZ89k5yEw5FxgC7I4EZev
	QiGNOU4Mlvu8rnr2W76SNikGepa6UgD3blySqraW9DGF35a+dp5F/l8IE7uAlQiWXLRv7sp3AYu/i
	G+KjkZOg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?UTF-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2=20=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v5 0/8] media: rockchip: rkcif: add support for rk3588 vicap
Date: Fri, 29 May 2026 13:45:09 +0200
Message-ID: <178005509966.4123143.16381895849368924420.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_044530_217352_A6F0E75B 
X-CRM114-Status: GOOD (  11.38  )
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


On Fri, 22 May 2026 23:23:06 +0200, Michael Riesch wrote:
> Habidere,
> 
> The RK3588 Video Capture (VICAP) constitutes an essential piece of the
> RK3588 camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...). This
> series introduces basic support for the RK3588 VICAP unit to the rkcif
> driver, thus paving the way for video capture in general and for camera
> sensor image processing in particular.
> 
> [...]

Applied, thanks!

[5/8] arm64: dts: rockchip: add vicap node to rk3588
      commit: c7126247fb797127ced68691583932d0a05bbd68
[6/8] arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      commit: bfc2779116ab7636a08c254d76a7a43d06feae1c
[7/8] arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
      commit: a34ae4f44c9ff4f4170dd21cdb22efad63710af4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

