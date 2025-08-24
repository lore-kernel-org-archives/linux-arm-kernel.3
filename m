Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195A2CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwTgys468jql8rVpPk9a/paDP+nmzSD0YQvFFWl46ow=; b=K51VCeONJF/10iTZCl7LGXVVlf
	k43eszPsf1KywaNLma/S+wikALE8hzDuqrgiOmaTn3snTbekUcTR0wHGfGikmVLfRmRVU3DJMFkyq
	BU9DgV5lvMb9cMtffzsTWaqEFV9Kf/wbGigkkpopbysxZK7eoJ9ChTWr6owfFNPSvwUf5GamUwxqN
	fXun1AaqUDSQ/LvROIqjpEYrxx5GFEtsa3c6dI/C15SAcOd4c+1Ka5RJ17hXSV77IwrtRmPmp5UOs
	IOxqEok3K7stxvMrz0QL/Nn5bnqodBXULYqG02LGVgosFRtCJasuE9NSHPubZq013JtP2Pg+ZP87n
	BqcKadfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8Pl-000000061xZ-2q1L;
	Sun, 24 Aug 2025 10:57:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8N8-000000061YN-1qcf;
	Sun, 24 Aug 2025 10:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EwTgys468jql8rVpPk9a/paDP+nmzSD0YQvFFWl46ow=; b=ofw47oKNMMAVQYH3GBtMoOvqJk
	GokgYOKqYabSnX/9F65crfkeNIdU558Yfi4SUxG19HW6uCh12I/pFOyNlv7tPEbXmWSE/c9hsZR2K
	yFDAQozCUytnXBB9ZNTD6P4YCKBJo3jTgXvV5l2jQsJF/OjkLhrNzetQdSpOfFW9Tornpj0Sqesc/
	MXSjv3j03tF/B/CSliwuYN9GJMmmjJg3Bv84kd/jhgo5sNSVRxwXWR+5Yc+Kish7k6OgkINoRqMM+
	1iQY2VXS/fGtvH6FCan/NKwjDor+3sH016JEbSrtSpkhY0gNhJ477LoFgsARDwfhUltIT2Hdx7dwP
	hE02SP9Q==;
Received: from [62.245.128.201] (helo=phil.wifi.munich-airport.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8N5-0005H4-W0; Sun, 24 Aug 2025 12:54:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pavel Zhovner <pavel@flipperdevices.com>
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Enable RTC, WiFi and Bluetooth on RK3576 EVB1
Date: Sun, 24 Aug 2025 12:54:39 +0200
Message-ID: <175603280232.3445205.16083508502929513202.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
References: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035450_502173_DDD07914 
X-CRM114-Status: UNSURE (   9.82  )
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


On Wed, 13 Aug 2025 00:30:22 +0400, Alexey Charkov wrote:
> Rockchip RK3576 EVB1 boards follow the usual Rockchip design pattern
> with the I2C connected RTC chip feeding a 32 kHz LPO clock to the
> onboard Ampak AP6275P combo WiFi/BT module. In this case the WiFi
> part is connected by a PCIe link and BT over UART.
> 
> Add required DT nodes to enable them.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: Add RTC on rk3576-evb1-v10
      commit: 0adaae77862932a19cc14c086d7fd15ec0ef7703
[2/3] arm64: dts: rockchip: Add WiFi on rk3576-evb1-v10
      commit: ebf8183ad08afc4fcabe1379a5098354829d950d
[3/3] arm64: dts: rockchip: Add Bluetooth on rk3576-evb1-v10
      commit: 34f7620912bb0f881a23dfea529e69fd2e8fdcf2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

