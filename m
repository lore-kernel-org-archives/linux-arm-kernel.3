Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3145C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=mYjgpuM2S3WYDDSWeUBoX+J83u
	q4lPKZYIs09vWESKSiqPTakoJHyvxKRGhVp58movY+8fr5GUdxwHFXsAawRBMmbuuX8XA9iQqSBR2
	xjQXS4BcipNmMams3wSG0dne62wXK43YRnw44LTExpPp5weTZd9MJdiBs9NCcKTh+a4G5Hc6/DKpn
	SbVbgooglLzH1W9sUtfMgFswfLGhKC8K3h4Zb4s2tAyxwL2RR2x3VaSXniwv7oouugn4V8oW0GQFa
	/aXadVqmElFDVSjFOIWoJbbcB17Iq0FQ0w0SOt4gxKV9AnoLDLUoJrOfgAcsFEB7u+MlsZLoZZLqp
	uKUg44Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjinq-0000000D5fW-1LN3;
	Tue, 14 Jul 2026 19:28:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimE-0000000D3Q6-0Jdj;
	Tue, 14 Jul 2026 19:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=KWkKru8GOQDDO8S7BklqEAmC1W
	lOM1UkuIOIzD8rjWsmILdHG6Siv+dn5mmimafGw/MUpR0br0XFr6Vsh0djdeCAthgkn54Q/N24pFE
	m4ggi0Sf/B59ybb0cdDUv1FxRieSUvOUcrJmJJ+A+ucnKEo/IVSP6uDUzhAzzDufECsQxrW0FfVEI
	bX2SrmfowGz/dFHA444+57eM6oZtIAS14H8lnFcRgxNPLCGOt2O93Ch9BDxBsZ7woiiLT5XYrgVm+
	3QRI9KPLWYYHHysrAXDPfjf/pzweM7qxBsozswGcqAaIhNXU6GjwHmcknUSpw5peueJzaNG0ZYNTr
	ngtXvkkg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim2-0000000Co6p-0ZDJ;
	Tue, 14 Jul 2026 19:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dwf7wU6wkFtTW/7THwJKgIn3/mERVq6oFIzJx10NIAedzlPPpIIzRVBRMSUNyAZnq
	 oWEfSZq7CFFmFGvNtNPcN6QXQGa9EoPqK+urGXzCKqA+rhVaRzPc6fiQPhIeEXjpWR
	 Lm+/3RhcKy0X6AO76O7sF+syTotHe8hSADynzDx7Gh1JOhmApqwlKWIRMatIBOU1E1
	 MqtN4HaHaOaWohNMqzbZRg/T0iycK8GZbOXO27InSvs75V7CKiWHy5ZFAwN+AjgDxu
	 amUxmwK375rmFVqiKF6Mdeh/ZSKzIg43Pz4s0fBegiiXk3TSPl/Rt5ce1hbDb8F1YB
	 Zkmbycl42IgiQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B0217E0E1C;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D35E8480031; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:06 +0200
Subject: [PATCH v13 05/35] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-5-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU/u/AyRvnUJ6L95kGIeqmze3AG8Bi7tq
 2Ggju18IsJKvIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qajJYP/A3swIfH4ymtLnJi2wi3nntQ9R4ujq1maU3ut2SGZn3Ekmn5qpkzE8Xyr7GOgV7BPUI
 VqIUCTwDLkWCtpHZSWTqxXLhTrmCe14JXf+hJaf4nSfXlESSXE1hXVqy9Z9xeS/wA+D/cqPlNW+
 J9swfnLuH7TuJZtCUheoI0MEHE11h9sRV+IBHTNwncv7xODf89kD92YFAY7yvLXYAPG0Sgk8clD
 /NpMubS/LOFCtTdsiGKcHISXH+OdKsoTZBIV6M0INdNyIzsY02EWq1gFJjW7cNR3lEZSClJYpoz
 8a07gOp8LhqLbCf4oBGqFNWz0jzt2x49X/hA2vrk9d0D8MLBH6P5PNMYYRgEWdxXhqelpeCbFp0
 pcUGFn+ErkHQf7H1Z+oMFifwbgjDIe2K+cgnYLK1xMBVw0DWWA9vLNjaFoPzS1Nk6X7YGSznVDa
 ZaLWuOzqn40/YZTvhDYTYgoW9cgZ6dV0waHa+azjWVAMkHazAKaU+n3HIr7SrF4SCrPZAUcUZRS
 v+hewhL1a+LJSlOxq17GJ3zMpuAQzY/vCEg99+ykpkw1XuMa/QTHVkoOZWrGnufsi/0Z1aaW4Xy
 XVTjlcqClW8RrHWyWI6PPjxy8FxLxiORzkl2jybtpyU1PULwS5AnxZHuFuCACc9k0hxFoSEHLCx
 3CLdUTey5n77QMXwFrcIofQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202634_334947_1B0BF008 
X-CRM114-Status: GOOD (  12.05  )
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

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0


