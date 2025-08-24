Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5217DCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtiKJv/Y5OZYZLw+XrUHuMx2sdh2NKHMX5ykW3UdaY0=; b=E6QtCqIsoBEMDV1HIhLwJV3aaD
	8tMlLRL05o0xFwBrV51sVZUi/jgYab/eUb1CqtfvA9yqTP7TEuTH/3GdLjtvS/+p/POpvjRKJi9sJ
	ivZscHDinZijYxhWQDsZ4mfimFxA4vi+YUXY5GKWtluHBhlEgbegWbN8b57Kw/9HdvIRwKdQQd1NN
	3VPr84U0Z+wqQicLA3NaaS5HKs6vyVnG0YNwt1zFS+p87cYhyf/LsQcagQEO+FmNyF0qxKoE2RlOk
	m8SjRQ9EQQSNu2fk/6db/UobqtubnG+deHdu1p/JN1morgI8TgO00V25K2b0uOVyUESw+w3imonyq
	ucTrMQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4xT-00000005opA-0XG7;
	Sun, 24 Aug 2025 07:16:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4pd-00000005oHK-1uft;
	Sun, 24 Aug 2025 07:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HtiKJv/Y5OZYZLw+XrUHuMx2sdh2NKHMX5ykW3UdaY0=; b=OHYVko0Va9SwkRsggxfy+Vt+vE
	6dw2jekzg41QyaAwq5D4LG4N7+1U4EVfrjfj+IZn73SwgRlOEYdwaZYkdx5D574SWm3S2NBNg62jr
	HJ1nsWw0csydHuWgz/lA9x2tSws2wqgNpGOc45MQ/8CU69iV1dAwhSaGKNS/SANo9wzLV6XbSy/GE
	8lrf7IbYiIVTV+PbJYFT8eBhT74+TUmSvTQeSEhjknlrZqMFuPw2d2+DvOKds3cX97wgYXXDcRHQF
	K3bWazDWdrnkCxHGaOnyFIaOnKCOWh7ILyk8HKhQfHSCWTxFiroHLLKixhGoHoU4f5TCpzfWqGuah
	8xa8QcvA==;
Received: from [212.111.254.164] (helo=phil.aerolan.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq4pa-0002Oo-VS; Sun, 24 Aug 2025 09:07:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: kylepzak@projectinitiative.io
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588s-rock-5a: Add green power LED
Date: Sun, 24 Aug 2025 09:07:51 +0200
Message-ID: <175601920181.3425909.2234398602548147657.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <175565703702.6.15498212790604388615.862782045@projectinitiative.io>
References: <175565703702.6.15498212790604388615.862782045@projectinitiative.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_000801_495789_61FE4C51 
X-CRM114-Status: GOOD (  13.76  )
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


On Tue, 19 Aug 2025 21:30:12 -0500, kylepzak@projectinitiative.io wrote:
> The Radxa ROCK 5A board includes a green power LED that is defined in
> the vendor device tree but is missing from the upstream kernel DTS file.
> 
> This causes the LED to be uncontrollable from the operating system, as no
> entry is created for it under /sys/class/leds.
> 
> This patch adds the missing node to the leds block, creating a
> "green:power" device and allowing the LED to be controlled by the kernel.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3588s-rock-5a: Add green power LED
      commit: 5487086c4dad869af0eeca0ee24d1ba5fe382b3c

moved the "power-led" node behind the "io-led" node,
please sort nodes alphabetically in future patches :-) .


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

