Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB960A2611
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nADcDGHV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2sP1Nwp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zqJI2dfXZF9d7B4udVpGK9vuvnRf2AkQaNV2frtpzOA=; b=nADcDGHVhvlZAPuZGppcaQBKs9
	qU5NYXy4Xc5wWXLA00myZISbwPAB3kN0Yh4InrZ2bi9P7wjh0zJt6qU7svEM9frI7I2ORNitRXOOP
	iv2UJYLrEyp4SqXgFaU6SXJOj2NYAycY6JxD145U96paUK1m0Nq9AL7176IFj2irsQxogw7Ab/eO3
	RMTZCfwzUri+n7+WgLjkrfe3iYfPxY8aFPLXx/xillEty0PXwcXUzp3/zD0zQI+gUzWpiVxcR7Lom
	0MyWBNHT2ysSbgwWBVOHqyWvE/fgqawvCWZCw58kWkg1qpO05JET+bkQnz4ASDIUybTzm1T701zV/
	gWzSHeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfsG-00000004YBJ-10Eo;
	Tue, 27 Oct 2026 12:01:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfsE-00000004YB2-47zG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:01:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BE3343BAF;
	Tue, 27 Oct 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793102510;
	b=MXlvWZEomAVTpgBJAhvfl/qvIrJ4sOeR2d6ZKOfny9YWritwUhBQ3XhGAOy4QClwmH7L
	 xVnX9OEk7ZiWgsRX+EEkDx58IG38MGPbKquNpuc0VA4WC3J6QbhPaeLPEu5KoHjThq2ow
	 4v2ct0JSqImyCNuHRlt0Atifq6l9s1D2whbdvJrCC0aYSqHpwGWaNUexwllAnDnr0UAJd
	 +67uKn4J6lAVlz0xMdLJZbrxVBBBTFc1awFoAFqiSATi6RDPd0NcgigOEbWhvGzngxsPe
	 QElXV6NfZvc3SDzHjA/oC786RqLRoPsZgQAc9HmFp7EhogWC5QtWe9WftQ5Akolyeog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793102510;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zqJI2dfXZF9d7B4udVpGK9vuvnRf2AkQaNV2frtpzOA=;
	b=bwts3hVor18X3WhDgWgyy6EBg+B8LpLfHLBnWQLYOm+hfqAzy0ayDWtV7n4i9nIoT8L/
	 yNODwxCWm+L5ffRAHVil6wHCRdacMLWM5t/a50n5E5Ryqcruc9v4s17Bp31qTUFWWZIB4
	 jiyhxcHkNpZwwLpvyUbaEN87XvhUoxB5v/ZyQk8akaVVRG2WwWcRPzhUmWz7Oh0FqFG3m
	 TwwDU5GDyxmQ7q5/j4URIhM5MAIMu/VKq4Gt20LwFXM10SB1N0n//kfwiIcC2U+4pfEBx
	 C1DfIpIfnYkiVHADkcLCMvuxMpSdm6++2AwPUEMOIY6KvcnH1ty+7al+c2wH9XJUS0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CAF71F01242;
	Tue, 27 Oct 2026 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102510;
	bh=zqJI2dfXZF9d7B4udVpGK9vuvnRf2AkQaNV2frtpzOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H2sP1NwpadDkSF/T/wPTiAPS5LiNzI4w8slcALqrAQVD8ry7ETA6wWX2yjigKEARK
	 /9e8LiZ5imPzrt6L6UGrnsNj6Msk05msUKsB4rRQOphzNgxNcE8R9jUQlfbrZIC4sd
	 nEvgy2K7wfi8O2bu9q9kA5iUJjf7i25gIzNeU28quQ47vIOQy5KafXNkqPSeQWaVsu
	 NGd+RQaJmjm1nsB0tKQUVnny+l4FmKkmtA3BXNqtfoWRqccav1zFXPN6E8Ol9J4Q8t
	 bMt+QxLDvI63zAbgenjKSyqVUuVHgE2NG3Brq69hrqEs6IN5vVsG5BenncdAfff+gx
	 5QGJqcszPQWYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F4060450A4;
	Tue, 27 Oct 2026 12:01:48 +0000 (UTC)
From: Alexandre Marquet via B4 Relay <devnull+tb.a-marquet.fr@kernel.org>
Date: Tue, 27 Oct 2026 13:01:42 +0100
Subject: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Henrik Grimler <henrik@grimler.se>, Hendrik Noack <hendrik-noack@gmx.de>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793102508; l=3293;
 i=tb@a-marquet.fr; s=20261023; h=from:subject:message-id;
 bh=nz55NJx/Uu4x8f9w96Y5Aa8FlPatjRYi6gKldhgQyRY=;
 b=BDjAFMaKETqfYfJDRQJpBK7xZFOxJgEGoGMJlMGVBvYhrnwcpZ9mpeTxzvfsuuFikzLLrsANn
 tOK2NDejgz7ArsLISEgxDV35PlcTAfDn3TCjdD1oERf5G+PMKd04fCS
X-Developer-Key: i=tb@a-marquet.fr; a=ed25519;
 pk=zVRSO6FDK46rqmeA2GuzAhM24eFlUq1QpmXi9/KCFyk=
X-Endpoint-Received: by B4 Relay for tb@a-marquet.fr/20261023 with
 auth_id=1334
X-Original-From: Alexandre Marquet <tb@a-marquet.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tb@a-marquet.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexandre Marquet <tb@a-marquet.fr>

On exynos platforms at least, calling
analogix_dp_set_analog_power_down() to power on (with enable=false) CH0
to CH3 or the AUX bus currently produces no effect, unless the function
is first called to power on everything (by setting block to POWER_ALL or
ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
(which is its default state) renders every other register bit
ineffective.

This is particularly an issue for AUX bus initialization, that tends to
happen before anything else (e.g., to request EDID), and thus, before
anything has any chance to request a power on of the whole analog
section of the chip.

This commit allows analogix_dp_set_analog_power_down() to power on any
block, by deasserting DP_PHY_PD if needed.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index c1344a3f013a..9f634d4e4793 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 		phy_pd_addr = ANALOGIX_DP_PD;
 
+	reg = readl(dp->reg_base + phy_pd_addr);
+
+	if (dp->plat_data && (dp->plat_data->dev_type == EXYNOS_DP)) {
+		/* On exynos, register AUX_PD and CH[0-3]_PD have no effect if
+		 * DP_PHY_PD is asserted. So, when powering any of them up, we
+		 * need to deassert DP_PHY_PD first.
+		 */
+		if (!enable && (reg & DP_PHY_PD)) {
+			reg &= ~DP_PHY_PD;
+			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
+		}
+	}
+
 	switch (block) {
 	case AUX_BLOCK:
 		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
@@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		else
 			mask = AUX_PD;
 
-		reg = readl(dp->reg_base + phy_pd_addr);
 		if (enable)
 			reg |= mask;
 		else
@@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH0_BLOCK:
 		mask = CH0_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH1_BLOCK:
 		mask = CH1_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH2_BLOCK:
 		mask = CH2_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH3_BLOCK:
 		mask = CH3_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		else
 			mask = DP_PHY_PD;
 
-		reg = readl(dp->reg_base + phy_pd_addr);
 		if (enable)
 			reg |= mask;
 		else

-- 
2.43.0



