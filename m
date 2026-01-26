Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F031AD19508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gx2hHd3TOe3OKxkk01HpI0TbAkMwKeVhKaeUoemS8VQ=; b=TjCaqS9UNms/1TfCTQo/d5hs5m
	avL4kF2rXAzPaYZq4ip4wvHmjNQyqwLQa0uw0dqsrlt5agWRmXR43owE3V5mGxzjLNrl6iFl424ua
	XgRQ/jc/kp8Ng5yNAVNhXUDsB366UX911Mza+xf6oItRqNayZuDWsxYhT7LwmAhblFLQ5lVnhSuvp
	cEUA9PFnMS/Ko+Q7vec/thJppciszs5tG79/e5mLo5emYlTCUwzs+nrf7keleAYK3qJrQwPmmbqIL
	Wkb9ZI/W11XLKOU/ofx9tMw737ZP+Rb3pFx2Bt7j/GBaNHsNN9meMw0x1G0sRSsjRVtJN/Ym6BOQ2
	2kVitGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ5k-0000000CvuS-0rky;
	Mon, 26 Jan 2026 17:09:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ5f-0000000Cvr7-1gcG;
	Mon, 26 Jan 2026 17:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=Gx2hHd3TOe3OKxkk01HpI0TbAkMwKeVhKaeUoemS8VQ=; b=yqWvpZyASVZ9mYizcEvwvcMYbd
	iao9Pcf0sRYxYgo/in6jmJoQkN9K9PleC+1eKHnFvWvT6W4ivUH6Aj93dFseBHg428zFxDQnIF10O
	uQSX/HyEdB23nynA6MPnVVBAusJK8r0F+ol8TwRK5vGi9McN3wEfwYIKqA2nAQdg1fCmsBppIjnD5
	XJEVajKCiIL9LoeNS6sOC/nnoGP8IIwLzAWM7fyhQyYLXs4VN6XUItIkDuRYMewpoo1jkiG8hksaS
	i0iqnVeCtdinuktN/D4lsWGFtSOhjmLWDsJM8xugLRSn1+xljjt8dMqv7IkwnxndAUCC0xWD0QBcW
	zwlSCZcA==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkQ5d-004eQS-4m; Mon, 26 Jan 2026 18:09:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.20 #2
Date: Mon, 26 Jan 2026 18:09:25 +0100
Message-ID: <9936542.NyiUUSuA9g@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_090927_443608_25B81A98 
X-CRM114-Status: UNSURE (   8.42  )
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

The following changes since commit e74470cf3101da79666f20186c9406192223e9a8:

  ARM: dts: rockchip: Add vdec node for RK3288 (2025-12-15 12:21:05 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-dts32-2

for you to fetch changes up to e546c69ac54e907d0c33bc1fde55689db301981f:

  ARM: dts: rockchip: rk3036: remove mshc aliases (2026-01-20 10:51:55 +0100)

----------------------------------------------------------------
Removal of the obsolete mshc aliases from RK3036.

----------------------------------------------------------------
Johan Jonker (1):
      ARM: dts: rockchip: rk3036: remove mshc aliases

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 3 ---
 1 file changed, 3 deletions(-)




