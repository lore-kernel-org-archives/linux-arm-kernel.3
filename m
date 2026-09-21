Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F65FC982FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNbDtjMpZK3YUnsj2R8oZ9TDb5EzAkrOlHovkDj3BFQ=; b=45V6AX6o66Ygre
	GCh9zsSwkhA8/59+4Fy6j2hoFU1OHu2f+zt5zWOf/9GLjiqrrBnlAGLDMLUfNWD0XL9CUEOuzX8Kk
	FBc/3hvpDFMCgRjggnreTIqqNbrMKnVUJCGAnDzoumzc6b51GYpD1H3PLtlmrL088C3RUgOjrvmi0
	Us5XvwfTAQOHMFAvLtCwivfuI1QhJo5j54+cHd8VUglskvzvhm/UZATcxAOmXwjsGjdvvhvxf/xVC
	0NWFKNkSPFSUEn9FY7KIn8UJTzEqEJ1jeW5RfGJrg2CNtLvMQo2KQeSgY6OQVyAWVn2zJmgLpSGTk
	Y9//xXtTmC9LUgHTAYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8khy-00000003MDg-2aym;
	Mon, 21 Sep 2026 20:33:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8khX-00000003Lpn-1AjF;
	Mon, 21 Sep 2026 20:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=zNbDtjMpZK3YUnsj2R8oZ9TDb5EzAkrOlHovkDj3BFQ=; b=CLrrgM4liC4Ogv1jakLNxwvQ+M
	AaArMvkRSks3/C9Bz4WyZpNraUurOMy++K0Ek0OHM/rnL761FHwBB/Bstu/0VFmYIZ7tRQeDJedRN
	D8lP3JhKk503oaHeQj/LdJ7euYgBLkSAofPzQkqCTi5vrSwNP6c/9bQy7hbN3OHcKy+tx96DMvYY4
	h9un4pugWLCqY9pXQ74LR80rjBGd2YFglCP/QNvlOEn/3OIF0Ue7o1zglZRDMnmR6NZEHMmWNGVec
	M2sAzDoZMbw8vKBLZl3PFBzR6fV9fcttyzdrQ3b+VnRF0xE/vILJVNAdo5QDpAuu110yiD1EFi4jI
	D0pxLT4g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8khT-0000000CnNq-3ceD;
	Mon, 21 Sep 2026 20:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790022792;
	bh=Y2I7vCNExECwOXoayJrB0wiZpZqDSSU8P2y1UKi5Yb0=;
	h=From:Subject:Date:To:Cc:From;
	b=Ma8IV8WMKMH+ib6pPa59xr4eqDVc3GMOyx+ho/RNfk+VqFqIiIWvRv087CjXN18eB
	 TqNyGUCqZgZUBtpFRq2K50HfIkXFGkBQv4GeukaPKOVMCu4cz8xp9qXFdUO6DXlgze
	 g1xBmeVoS5+tp5lnVd69XkaXWeWlakuWxS6WBm/ub9fJUuDKOcLlm76GenU9ID8Vkj
	 Oj3+bSUqZVH5ABNs3x9Mx4T3/Fm8nKxaX6tqofRyJo1MXM5CzMPSF+Ud+F0QMxE02U
	 zcZEoHTafKqByv+hJbX5d/qQrSxXBu/O1n/q+1Cbvi4H+HBEtwvOJuZA0ck/hlTKZA
	 krwjg/zhLHunw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D7EE17E0104;
	Mon, 21 Sep 2026 22:33:12 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E8F9E48002B; Mon, 21 Sep 2026 22:33:11 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 0/8] PM / devfreq: rockchip-dfi: cleanups
Date: Mon, 21 Sep 2026 22:32:43 +0200
Message-Id: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhCTE1deQ/DYhimMoqUtEA0h
 LsLeACXL3n//RmSRJUEl2yGKJMmDd0KxSEDbqi7C2q9MhSmsMblZ4yBn9xoj7VX5FaoG3v0QmJ
 FPIljWKd9FK/vPXsrf5zG6iE8bK3NaDQNIX723ynfvD8XU44GT94YcmeyjuyVQ9tSFSIdObygX
 JblC/0TMTnOAAAA
X-Change-ID: 20260917-rockchip-dfi-cleanup-feae6eefae9c
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y2I7vCNExECwOXoayJrB0wiZpZqDSSU8P2y1UKi5Yb0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxlHfqKO/2pN/JvmX9JE5b+1S7bENphHyLk
 2q49h4tYveZLokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZR3AAoJENju1/PI
 O/qaMXUP/RjAjLOld60tYvyBtU98oEZLq4QKaahyomw107LJJwa0apBR84srWcmq5HRMw2CRIjX
 RzEEGZAkhjfCc8HTP3W9aMzDeCNU+ly0A2u4jkI2tuKqgdLmw/mOLJMFjs/YJcBh+tu/dHQHc0E
 csso8EQfaDTtPLYG7EW0DeYE4A5szhv8tSetdc8qlqV73LbV/ngP7K4xUteDhq9+NeHU+1FZKTA
 9OpcPx2LG40nAYlfFdP9xOxMDabm7RPXYWozvnbw4Pj7mk0S/fHOIk9pOpWhM2PI4CF37rTkZCr
 S+3WsUezMpXXJ2UlE11zfG0UmcdvT6yocmx8KD8mJu+jq8ddTNQnBhXQ/9QGSGht9HDoXUAzNHh
 dBhaBAEPgIvcrCO5/MQ9G4km6nBpWk6UsSSM47PieDDl3Pq9GStNjjBGWrud7CYtWHR1Ohf9FVc
 ONpwPKM51mX/kolV6jKcNB+xAvz5oPrJ+wKrFv5rvmkuVdD6IPRW+n5tunwxfVTlpUr6oXenLO5
 rpIzkOQo9ERYeRJ75serWVnFfei6RbbS7lkiQ+fdP6Ra2ZVr3BmGRZ8a3/ukpyjfpsJfqfZRXbM
 DklaKgLM9tAIaEfjpBZloq2N+O0ZD6//y2TnDQdlzvk4WIUqkcFOfW9I1wC7Z7nDdPN9AyN4Qsn
 TRU/b2hXUP1bMaoQQRKEwtw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_213320_247237_1443A2CE 
X-CRM114-Status: GOOD (  12.88  )
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

This adds proper handling of the RK3588 clocks required for DDR memory
monitoring, which involves adding them to the clock driver and the DT
bindings first. The change is done in a backwards compatible way by
marking them as CLK_IGNORE_UNUSED and using optional clock get in the
DFI driver. The series also applies a few cleanups to the DFI driver
while at it. This is done in preparation for RK3576 support, which
will also come with some DFI specific clocks.

As everything is done backwards compatible, patches do not need to
be merged together. So Heiko can take the Rockchip specific patches
and Chanwoo Choi can take the DFI driver patches.

Changes in v2:
- Link to v1: https://patch.msgid.link/20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com
- DT binding: Do not specify maxItems in the generic part as it has a list
  of items
- DT binding: Only set minItems/maxItems for specific SoCs

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Nicolas Frattaroli (8):
      dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
      dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
      PM / devfreq: rockchip-dfi: move to per-variant const structs
      PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
      PM / devfreq: rockchip-dfi: use bulk clock APIs
      clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate branches
      PM / devfreq: rockchip-dfi: make RK3588 use its clocks
      arm64: dts: rockchip: add dfi clocks on RK3588

 .../bindings/devfreq/event/rockchip,dfi.yaml       |  70 +++++++--
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   4 +
 drivers/clk/rockchip/clk-rk3588.c                  |   8 ++
 drivers/devfreq/event/rockchip-dfi.c               | 160 ++++++++++++++-------
 include/dt-bindings/clock/rockchip,rk3588-cru.h    |   4 +
 5 files changed, 184 insertions(+), 62 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260917-rockchip-dfi-cleanup-feae6eefae9c

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


