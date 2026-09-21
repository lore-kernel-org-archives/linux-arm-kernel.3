Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5DFC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJRvcCNaoXZpA2vKZW8mNtfRDLV0GNYvJEp7NrjhqiI=; b=DVarIqQ5AIpLNbZ3QVdpCjErdv
	rnXww9cH0tLiQ4CkR4PIoZy0HtFd9jIfuq1GwNokx5rHUL7fwHTxiGCOmtp9WGptowlLMOwgKxgjK
	snYFPUCC1zDuj3eMBbUWosjdUoMAHO/autec1IJhkD5lgR8ROgM6TOL4YqFQzPB46ShfxlBJTLMT9
	W2Emtl5arklFk7WLhv5Pc3Gl51hCPiEKtkl45ANJv/uTWKGloSqipe8FzBzhtzJCjHQDdMFL9VeBS
	kpylbx8o6EYrrOEgOAN6EUxzE+MP9YKk6REGcGnAaqHw+n0ffQAZ/gxVSeaTimnagDyjywETBhdMA
	PvF7LZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8khz-00000003MEc-09qK;
	Mon, 21 Sep 2026 20:33:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8khY-00000003Lqg-2B3S;
	Mon, 21 Sep 2026 20:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bJRvcCNaoXZpA2vKZW8mNtfRDLV0GNYvJEp7NrjhqiI=; b=aPidtKE3js7VTdrdtILZm4Whkm
	Pl+89q01BJo0i0kuVYGzPBlpkmPalFI2JDrWga2VMVlJoXjXmppe1Ygq1QompZnRKw7JEC95OLTt2
	PC11c0dlmrE3H+kDTKqoys3+7CD+ymINoWGAq43w3KCKlMJhoD7+bexNM4H0FDMHEyurP7saqW89u
	r0BMza8UDPZ2MDc7ciSasMcAdok0pSsq2DBTyrgHng7UITUHjVy2Zqo2NHOvsAALiHZR1jS3BM1cc
	u/KcK9bBNFlGwNxa93yOTntUwjNTOQbfba4p8hkHbRRsB90OsOmL4jO7bFTyc4eydvKU+WaaOZtGa
	aHXKNLSg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8khV-0000000CnO7-2JQm;
	Mon, 21 Sep 2026 20:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790022792;
	bh=tiAXtxGxkrnKvU2eq5NeqSXpRtY5IBhw2szF9OLHTKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PrteYN7M3bX4I2j26CG+OeV1cQhyOJImo22FSqS9oDKRLNb9FS09y5XTXrdC7F0Wq
	 /0YC/LcuusP1rGxT2rvaOmsh2JMjbTL9zCmluyWR4uaHPjkP2rtdNjXOxjoRcEkii0
	 fwxi1Fg/4mmu43PwHPMKXMf6OZ2xAdg2J/1VmClMtMTFSmimGTE9VLtRmQtiTwErjv
	 jFBd2lsQcFDhTCZHHeD7VPR52aYprJDcbamFxxD8qWa6C9cpfyYgp7/oAbCYVp+1X3
	 qKKjWkuzzFOoWZ7tDkdP8fD0WZR/fJ/nOo6bXkxU923nrtFtv/IURtKj/mD8SPzGFh
	 xxAZc70gdaZFw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9806D17E0DF0;
	Mon, 21 Sep 2026 22:33:12 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F3D3B48003A; Mon, 21 Sep 2026 22:33:11 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 22:32:50 +0200
Subject: [PATCH v2 7/8] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-rockchip-dfi-cleanup-v2-7-43ff34ac8599@collabora.com>
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qvocAYEOUWCK+4Q9yI0ZwLs4Fy1aQdG/tLvtq/e+Jqc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxlIf3CNUAFPMYVqFNp4MFUI2A8pkyMRxRs
 vDRfPJNPvLdL4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZSHAAoJENju1/PI
 O/qaN9QQAKiUaLYg3S8VlvBCe9XB6jUao/EllJMQHzYAOeMb3mtOwshB4meRmSKtxzdqt5AEv1I
 CIZubGuKNNG6rzy+WRZGX7fR6Ii2Z8UVtiNvlT67HICA2wy8D9mTSuOmi9DV8P6zZYNEdjoULtK
 R2EdJlykZCpawXNpfTC9hEtkUnn7lnQzRmHQMas8sHeHQHUgyN4798GmrNwYdbcEXYOPsmkMZJT
 dX+zt4WhWJdx70RLgfpk4oYC5WS0A3X6ckP1gRNKGP/H8CIUSU2ljiDjqWu2bczNqqEj/3QlZnq
 cnTT/ooa6U98Mh3q0TK6oSjtUYeoL+GM3EPuGPNcixl7wh55TiKYwXdMCwWT91o/doG9CUg1fJM
 0GUB0nj6guKaBLTBbdnC8cjW1w09/1kNltEY5nk2NO1Py+1vyGSLkb7s8Maar+a2yr6IkRgogz1
 KCD02uZxAbDCQk4khrfE6TL4OWaYlV8eZU8xXi0d+gvD6hPuRUS2EahR/KZzxkH7Bkn8oFeB3+s
 Q42eXzI6meD+ITq3qwM3TM7KNcKsUrF/FRiUgNTKCwCcojftpLcuwFTlEeSlepwyaxuhjt/EIzM
 btUxd6h0P1AheUFlR2k2YDalKya/8dmSPFybMl0scBxAEPhhV96wu4sAOrUP/1HCwTPBfywv9Dg
 5KyyU0WWoW54KcKVv6cwiIg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_213321_719081_309CE386 
X-CRM114-Status: GOOD (  21.71  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

So far, RK3588 doesn't have the pclks for DDRMON used in the driver, as
they weren't modelled before.

However, they are now correctly modelled, so the driver should use them
when possible.

Instead of unconditionally getting them for this SoC, add a new variant
member that specifies whether the driver should let missing clocks
slide. This is needed because we want old device trees to keep
functioning, as otherwise we'd be introducing a breaking change for
literally no functional difference here.

Fill out a clock name list for this variant as well, and hand it to it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index b61ec500eaed..380361a231a2 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -117,6 +117,18 @@ struct rockchip_dfi {
 	const struct rockchip_dfi_variant *variant;
 };
 
+/**
+ * struct rockchip_dfi_variant
+ * @init: pointer to the variant-specific initialisation function
+ * @stride: address offset between the DDRMON per-channel instances
+ * @ctrl_single: whether only one DDRMON instance monitors multiple channels
+ * @max_channels: maximum number of memory channels for this SoC
+ * @clk_names: pointer to a constant array of constant clock name strings
+ * @num_clk: the number of elements in the @clk_names array
+ * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
+ *                   DT binding for this variant didn't require clocks in the
+ *                   past, so that the driver remains compatible with old DTs.
+ */
 struct rockchip_dfi_variant {
 	int (*init)(struct rockchip_dfi *dfi);
 	int stride;
@@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
 	unsigned int max_channels;
 	const char * const *clk_names;
 	unsigned int num_clks;
+	bool clocks_optional;
 };
 
 static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
@@ -804,6 +817,11 @@ static const char * const rk3399_clk_names[] = {
 	"pclk_ddr_mon",
 };
 
+static const char * const rk3588_clk_names[] = {
+	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
+	"pclk_ddr_mon_ch3",
+};
+
 static const struct rockchip_dfi_variant rk3399_variant = {
 	.init = rk3399_dfi_init,
 	.stride = 0x14,
@@ -824,6 +842,9 @@ static const struct rockchip_dfi_variant rk3588_variant = {
 	.init = rk3588_dfi_init,
 	.stride = 0x4000,
 	.max_channels = 4,
+	.clk_names = rk3588_clk_names,
+	.num_clks = ARRAY_SIZE(rk3588_clk_names),
+	.clocks_optional = true,
 };
 
 static const struct of_device_id rockchip_dfi_id_match[] = {
@@ -883,8 +904,12 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
 		for (i = 0; i < dfi->variant->num_clks; i++)
 			dfi->clocks[i].id = dfi->variant->clk_names[i];
 
-		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
-					dfi->clocks);
+		if (dfi->variant->clocks_optional)
+			ret = devm_clk_bulk_get_optional(dev, dfi->variant->num_clks,
+							 dfi->clocks);
+		else
+			ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
+						dfi->clocks);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to get clocks\n");
 	}

-- 
2.53.0


