Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51476EF586D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EK56X4yUyK6p90PJP+pf1u3MX2f+sfz3TRR04+2G4T8=; b=DWl8ceSnm+ztnwa9FD4jc4dAu7
	NpAPMLl5UX/q66z7+0gTLWUXOSww31MjwBUwPZnfwhxU6BaRRYLXrZjDx1kU+5STscH3mB+k0/jBM
	b/iYPHx02gQ0GTBZT+lJnWD795YZc6yuTCz6f9VlWAdsiEttgR55hpXVOTbzexdTHrjQ+copbd6P7
	7WT1jxXLiWxdEdzRF0ftA1LGKlnGtWuXZZ/utcWPr5F7HizDUlx1sJK6Hai0THxMdW3fYdb/9b8NE
	83lBy86U277rD/Ji/zFqY/xlYRbOGrfaHVtuKpdFQoTpzfYNzcE5IRMl726BPcMOaGUezDY8ZJ/6/
	NZhByReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrYxc-00000005JZh-01pa;
	Sun, 15 Feb 2026 10:02:40 +0000
Received: from forward101a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrYxX-00000005JYq-2phw;
	Sun, 15 Feb 2026 10:02:38 +0000
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net [IPv6:2a02:6b8:c17:2010:0:640:2180:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id C762280C19;
	Sun, 15 Feb 2026 13:02:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 02U6OQUG14Y0-rqjbwYxY;
	Sun, 15 Feb 2026 13:02:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1771149745;
	bh=EK56X4yUyK6p90PJP+pf1u3MX2f+sfz3TRR04+2G4T8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=B9UjE9SzXK5scnpObCqr7CuifSEFqaFsMpm86WX89Sf1FM6OjeTWgWmEl5Uc/IX/1
	 k2hRFfCdjZ6yTOm17+R2SxqNFY3wsYET9Rtzh6lN3nbUrIIBAEkPKKRLRc3/anF3jw
	 YpvpfGJW/Y6mrAB3bLVLw0tpe6E+UurPtKGuJEks=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 0/2] arm64: dts + drm/panthor: require explicit GPU sram-supply
Date: Sun, 15 Feb 2026 13:01:56 +0300
Message-ID: <20260215100156.135374-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_020235_904110_A460A207 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi all,

This series follows the discussion around panthor's SRAM regulator handling
and the DT expectations for mali GPU nodes.

Today, if sram-supply is missing in the DT file, panthor falls back to
a dummy regulator with a warning. This implicit behavior hides missing
DT wiring behind regulator core fallback.

As discussed in [1], the agreed direction is:
- Update DTs to explicitly provide sram-supply, when no separate SRAM
  rail exists, use the same regulator as mali-supply.
- Make panthor to treat sram-supply as mandatory for all compatibles
  except mt8196-mali (as that SoC manages SRAM outside panthor).


- First patch applies the DT updates across affected files.
- Second patch makes panthor to treat sram-supply as mandatory
  except mt8196-mali.

[1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/

BR,
Onur

Onur Özkan (2):
  arm64: dts: add missing sram-supply to mali gpu nodes
  drm/panthor: treat sram as mandatory except mt8196

 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts    |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts  |  1 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts    |  1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts     |  1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi      |  1 +
 .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi  |  1 +
 .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi  |  1 +
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts    |  1 +
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts     |  1 +
 .../dts/allwinner/sun50i-h618-longan-module-3h.dtsi |  1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts   |  1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts    |  1 +
 .../dts/allwinner/sun50i-h618-transpeed-8k618-t.dts |  1 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  |  1 +
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts    |  1 +
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts     |  1 +
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts    |  1 +
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts  |  1 +
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi      |  1 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts     |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts         |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi      |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts     |  1 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi    |  1 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi     |  1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi    |  1 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi     |  1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts         |  1 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi      |  1 +
 .../boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi   |  1 +
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      |  1 +
 .../dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts   |  1 +
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts      |  1 +
 arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts |  1 +
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts     |  1 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts     |  1 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi    |  1 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi   |  1 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi        |  1 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts           |  1 +
 .../boot/dts/rockchip/px30-firefly-jd4-core.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi       |  1 +
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts     |  1 +
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi   |  1 +
 .../boot/dts/rockchip/rk3326-gameforce-chi.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts          |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi        |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi        |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts    |  1 +
 .../arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts |  1 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi     |  1 +
 .../arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi   |  1 +
 .../arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts |  1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi     |  1 +
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi    |  1 +
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi   |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi   |  1 +
 .../boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi   |  1 +
 .../arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi  |  1 +
 .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi      |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi   |  1 +
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts    |  1 +
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi    |  1 +
 .../arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts     |  1 +
 .../boot/dts/rockchip/rk3568-wolfvision-pf5.dts     |  1 +
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts    |  1 +
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi |  1 +
 .../arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts  |  1 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts  |  1 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts     |  1 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts   |  1 +
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts    |  1 +
 drivers/gpu/drm/panthor/panthor_devfreq.c           | 13 +++++++++----
 138 files changed, 146 insertions(+), 4 deletions(-)

-- 
2.51.2


