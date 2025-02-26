Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D658C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0ORTswxQwCb7Xs6ZOEVpPSKiYjB9Ja0d+rK+jRWXLA=; b=ZUqiE2LSbR/h8zb3bYGZax6olW
	Ztkp+kGAryVynH9KqXCLzSdgXpzCE1WsRMghdCnGVUVwdAhxjqxD/Tn9fnhKaFUZSi4xTBQJgIOp7
	pJi1T6vSrSmwzojMOVD9cweLeSvC3U14iOrLTXx7vG7chObz6LGzaePUnGasac9kqmgwcyvg+XmE3
	jl9rRGLEeWyL+bfdTxnD8iHL+/Vdvq1j95vHWIPltZ2pRcf6yeNB5GzClQ9XjuyYiTvjQ1WNqMt/V
	BWR9OhUxQ+8MVs6ak1NcdPjbfMPlRGODcYSQJuYm892xHIVlEEsemBuhR8OvTjYxifKCSIinebWBP
	1Geiz88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIHs-000000043YM-0BlZ;
	Wed, 26 Feb 2025 14:21:24 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFt-000000042zg-1X8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF306612F5;
	Wed, 26 Feb 2025 14:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7BF0C4AF64;
	Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740579559;
	bh=5myc+unuv0mfBhimUhk1emfOfhdL+1INGKDKqdZalcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cy/ZKe+dXQfPLf0vUoeRR9WETiyy2RiQ7Xd+Xge4uigLKfm/GPsx7q5MsKJQrSo1n
	 QrbPE6HX4tu4EsOZur3tXBknn1qVBmHt+Sr8KogZWONRvaEdzkpnmKe9vKjZuVbsmC
	 ddywj9YmE1e5CRLmnN9D540ZMIEMBSRe9L0lNbL66Fj/sCk1ZKVHqd0W3Mrezif6ym
	 NYahznXq+lQ9hjyt6OYNjVOMiP8oLmCNgWs15sLLfrkZA4Te4+pAsSajz85of2lgT0
	 NlTjm6qsf9G0+Rr7150FjJLi9hfo2P+PPp0knFVIT4gBI3CFk6d+pnSIt8WB9ItbNK
	 PfEdymDN7/96g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ACAC021B8;
	Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:23 +0100
Subject: [PATCH v2 12/12] spi: spidev: Add an entry for the gocontroll
 moduline module slot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-initial_display-v2-12-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=1586;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=Tycawk+/5vgO1pNpkUXDG2S/Gx+HvpTkRpC88dFEYj4=;
 b=6lU9pAT+NW5qS57Ca9Rq3dfeMU83IRh/BZe/VuSTJYVbPvx7jK0+WtZGOd/B0b9I4sWLR6PIy
 tXF7iNFpYdOBRuzUcoSSXasaqTMdzZV4nzvxZDYI0xNl1lpeuuKb90+
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The main point of the Moduline series of embedded controllers is its
ecosystem of IO modules, these are currently operated through the spidev
interface. Ideally there will be a full dedicated driver in the future.

Add the gocontroll moduline-module-slot device to enable the required
spidev interface.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 drivers/spi/spidev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 58ae4304fdab155748e66117f7ceb050da95afed..6108959c28d9c7505be63583e8206519275663ba 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -706,6 +706,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = /* cisco */ "spi-petra" },
 	{ .name = /* dh */ "dhcom-board" },
 	{ .name = /* elgin */ "jg10309-01" },
+	{ .name = /* gocontroll */ "moduline-module-slot"},
 	{ .name = /* lineartechnology */ "ltc2488" },
 	{ .name = /* lwn */ "bk4" },
 	{ .name = /* lwn */ "bk4-spi" },
@@ -737,6 +738,7 @@ static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
 	{ .compatible = "dh,dhcom-board", .data = &spidev_of_check },
 	{ .compatible = "elgin,jg10309-01", .data = &spidev_of_check },
+	{ .compatible = "gocontroll,moduline-module-slot", .data = &spidev_of_check},
 	{ .compatible = "lineartechnology,ltc2488", .data = &spidev_of_check },
 	{ .compatible = "lwn,bk4", .data = &spidev_of_check },
 	{ .compatible = "lwn,bk4-spi", .data = &spidev_of_check },

-- 
2.48.1



