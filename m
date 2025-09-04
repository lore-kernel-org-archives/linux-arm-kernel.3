Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A81CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=teV2jpoLSu15TJrcY6qtSOcJBpjP0rq3Rn64sqsXdnI=; b=Z9kwL6foIgHH3uYXZpU2TQ59Bk
	YlSrEE0FyA48FAPKdlSvF4vN9qWEN/5iNnUYz9cEZ7Cbf7S1rGWC4Z9ZSAref2Io/+zlfKOPAUyYg
	RXM9npCifTgOZR0plnlewvsEmewxI1pfjOve2+/78ZpFF0LK9nigx0czFetsZsXuuhY+3a6iLrJVH
	lK81GNIbEUquuCeZ8El/ruXK+LQOlKgjxh4Ic6NPTXhkW1GEidTTJXWMpeHQeeP2GMmd9nBKUfEkT
	wWQTlGrLEfJ94/9h6jgOsDyGngdfE9+AokYMrbPe63S9vKJsKhfUmu53YFVwKJVyDhYw8LnJqvq0y
	vqdmQ1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0z-0000000FyCh-2cKv;
	Fri, 05 Sep 2025 02:17:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzj-0000000Diox-0o5B
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=teV2jpoLSu15TJrcY6qtSOcJBpjP0rq3Rn64sqsXdnI=; b=E+obsU8rz+7A6R1Cvann6SMfVk
	jNgDi7ZQNeUsqsKyT+dI8Wz7Q+G4YqWH0fTKKBNxUlVZzlQwhik0QpvEhXkG+egR32fvzQvIMURfq
	AsQhgA9rkudriXqVZwFrJwZP1vGKeCrwNSYij7rxr4Y3Z7+mk4otfLtkVuArEE7K0lMK1vEDontmf
	fgz0WQMb/thwfJD7Bjg4uqDgD9TXWCK8LLZ2ipxHlzJ9AXrC/ovyyaD0jLBDhf/Zpcp034NzzjiOG
	1nseTWZRIyPcJb8QVVv9olO/8GOPK5mLWgaAiViXRZANfZZd6x9zUjYePmDS4K7Xkg/lW20Zsjhyu
	zPcd0yzA==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzd-00000004P8d-3ySz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011620; bh=YiGVn3w0LfGLriTAXP5UMOVqbkvD2m9utV1JR1OxSc0=;
	h=From:To:Cc:Subject:Date:From;
	b=suWSrYSH8k4qbnpLOjF4z08h9l28GZ3NVbspayGxRjJbcEelMsrPKztxxYuqsmK6s
	 GOq/u2Us5AOEU6iF9kHjN4+r98hdz0Ru1RTyrBbZ4E/DrGoEXs9rSly60DkUx6JuKW
	 y4g5pkv68TRq0wHER400JXLpVg1BzjUqXF/CiiyxMgtPdc0pjiBf5SUMoR3M5/BuLL
	 U+G/b5JXas+ollKwfRu3hgqeRovPHuqg8qcQTCtnOMvUtJXeY9HUEGVnrez55c8oVe
	 93/eg+c6zOv3+AMt0mWIdL1aOjjg307XTSnWx1eeCZYJHWDsCXX+94UKI2wS2p+kvU
	 Z+iXawk2fvoRQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id B85913D20F4;
	Thu,  4 Sep 2025 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011620; bh=YiGVn3w0LfGLriTAXP5UMOVqbkvD2m9utV1JR1OxSc0=;
	h=From:To:Cc:Subject:Date:From;
	b=suWSrYSH8k4qbnpLOjF4z08h9l28GZ3NVbspayGxRjJbcEelMsrPKztxxYuqsmK6s
	 GOq/u2Us5AOEU6iF9kHjN4+r98hdz0Ru1RTyrBbZ4E/DrGoEXs9rSly60DkUx6JuKW
	 y4g5pkv68TRq0wHER400JXLpVg1BzjUqXF/CiiyxMgtPdc0pjiBf5SUMoR3M5/BuLL
	 U+G/b5JXas+ollKwfRu3hgqeRovPHuqg8qcQTCtnOMvUtJXeY9HUEGVnrez55c8oVe
	 93/eg+c6zOv3+AMt0mWIdL1aOjjg307XTSnWx1eeCZYJHWDsCXX+94UKI2wS2p+kvU
	 Z+iXawk2fvoRQ==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] ARM: dts: lpc32xx: a number of dt binding clean-ups
Date: Thu,  4 Sep 2025 21:46:40 +0300
Message-ID: <20250904184647.397104-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184700_773569_F3F9FDEB 
X-CRM114-Status: UNSURE (   5.75  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184700_773569_F3F9FDEB 
X-CRM114-Status: UNSURE (   7.93  )
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

The short series contains a number of trivial clean-ups in a shared
lpc32xx.dtsi file utilized by all NXP LPC32xx powered boards.

Vladimir Zapolskiy (7):
  dt-bindings: arm: nxp: lpc: Assign myself as maintainer of NXP LPC32xx platforms
  ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
  ARM: dts: lpc32xx: Correct motor PWM device tree node name
  ARM: dts: lpc32xx: Correct SD/MMC controller device node name
  ARM: dts: lpc32xx: Specify a precise version of the SD/MMC controller IP
  ARM: dts: lpc32xx: Specify #dma-cells property of PL080 DMA controller
  ARM: dts: lpc32xx: Correct PL080 DMA controller device node name

 .../devicetree/bindings/arm/nxp/lpc32xx.yaml          |  2 +-
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi                | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.49.0


