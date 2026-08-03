Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E72C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2fN6ntjrESShwh7QN9tna8NHQ9oGxG+wl6dsfHUeOEw=; b=0cn69Ozc88i5UZ
	WN4Q04YI3TjKzghGvehdPZIkzRgEig7JgrPa8MIea7tL/KYCRslv/cKupDkaYQ1o/CADpXZh10r5X
	ohi+cz0iI3AJaqT6NpxmwgX/UB4Ph+KPkuVuXMW4cKcDPvtVMyccLjsJTEo9yXSfZhvMkrFbuDp+L
	LAECj7LQwISqCKR7lcV2PuLYbSW+D6sKoBYnP0zet3ca8P+OEEgZ8WYG+ILXHoM1AFXSse3ntdijy
	Z9hlWyGlXYDGeIUu8X28QfEWkmJhl/4Gx6bStphLFqSUKi8sw4K3Fjwz6L/m3OR0ne5JAfJdbhZFa
	/uTUxmgWKJXi0t0LAW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpZO-0000000GmD1-1W59;
	Mon, 03 Aug 2026 10:06:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpZL-0000000GmBa-3ge0;
	Mon, 03 Aug 2026 10:06:53 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2fN6ntjrESShwh7QN9tna8NHQ9oGxG+wl6dsfHUeOEw=;
	b=EBzd9YJfRxnyN5mEdCw4Jzyo80PuCND9p3mD920nis8D24c3SiHNKCvi0tDm4JdpkXSMoD
	8Gq/oFid5uOT1vZ2Pnzaby1F9cScFx1stvMaOlhS/wPSAG+ZoqReE3vsvdxaRH0lbUyvGh
	R+5Tlne52F7Kpe0zPhY0+7AJHXZlJyBMr5ifkYyAiq1gyvp/pIRWPp08PPGWlWX4n82UJU
	HF6O6skXNOe0mEhbyiWPgKiU+VqSyW+pyXHqPcNhZT6j30rkczJii4eZbkV0YEgxHmOVcd
	gzzcxptg7Ovo4jLuysQfylmMMKHa55reDYHpvSr6tMRLVDdWJSPbjQXpzgxjTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2fN6ntjrESShwh7QN9tna8NHQ9oGxG+wl6dsfHUeOEw=;
	b=Z1/Zq1i5EICbdDU11F5KL/SR2alYyp1rZZjwvrvhSHTlSbeSPhtJLvsYoIk7Ppkr+FjT/3
	5BndHVLKJQ8fT2CA==
Subject: [PATCH 0/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Date: Mon, 03 Aug 2026 12:06:40 +0200
Message-Id: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBocGoC/yXMSwrCMBAA0KuUWTuQxGjBq4iLfKZ1xKYhk4pQe
 ndTu3ybt4JQYRK4dSsU+rDwnBr0qYPwdGkk5NgMRpmr6s8afZhMrw1GlEo5cxoxzFN2lf2b0Hq
 rBhWsj+4C7ciFBv7+//vjsCz+RaHuKWzbD46xMeeBAAAA
X-Change-ID: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751607; l=1082;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Z6bjOAc+VesJ09Rh3jKGmkudCEj95FEUNIdMg+ymMnM=;
 b=JqGd9SEdRpx8wmAytjUfYiV4RQ8yx+/xrP3HG2mMSbBp93i7YyBu1LfvzEBjqXCLGF16Bxsgt
 YB35wTnrB2xBu/A8Jljl33VSAEWy6mqfiRp/curybTW+RqDGMuNQIBG
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_030652_079206_A8AEEA5F 
X-CRM114-Status: UNSURE (   8.23  )
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

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

---
Gregor Herburger (2):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible

 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 11 +++++++++--
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     |  5 +++++
 2 files changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


