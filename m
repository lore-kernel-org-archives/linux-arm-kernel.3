Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAF5E87857
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3VGg504G3cQPpoih1XQjOxr/w/r3kYf3MN3VPcw+vI=; b=OlR+lcr/hNht9Anfmg9BrQvQw/
	hZfbEfEx07v5WEAF+abC3iSOVIKFGTrRNw1KUMdtGyAAow5r4bh7dBDxUuiPfxkKgErBWYTlhorFp
	sSl42eDy82cg85py4dUTV1rFJAbjdH9XUJO6/z6D3g2LE23yh/ADD2T2yEBaUtFCI3lgHgDPJZ/JU
	YwQO3r7zwsPHrMtz+YvLZ+Lo8OIhxZ6eRmE16ImIGoxDLJaM0qbLg+Omt2GbN7/EAvpE1HCrDDPw0
	5O6dduquWXaiUOv9lgNVShNmkLDbw2Uz+IkGk2LNtqjhyw543bWvmyYbdysPD0gs4Acs3aj+sKxsi
	ZD/eeSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLx-00000007B8N-2gNb;
	Tue, 03 Feb 2026 18:42:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLs-00000007AxI-08Cz;
	Tue, 03 Feb 2026 18:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m3VGg504G3cQPpoih1XQjOxr/w/r3kYf3MN3VPcw+vI=; b=lKk0u0JpgBHppgiKSlw+9vuCHF
	gRjrqnUQ9F7EyyBWEAixmjXQhLwo927NQ3mGpv6YHQM3GWGazAkmmqzRSV3eZCuG9OO9UWkwvX80n
	tCCFSLmcyYReSGHkN74w4S3bPSMkbWQdLaJ9Rzw6VDREEb7D8J0sAAPLexlN4AypDfCluGSQ+hhU+
	mcqdblkE2CY1yZH6jKLR6yt1eljoUm5k4HxOKNERck7kYoJz6zYuC8MyctNdxtZi+A+RVHlsIs7VV
	xmtIEggAlmi1d2GqCdj8JdCVyYtUZt6wfu0crBbw/6KUUzWJ4+Bf6f/OY10oH/XzvMcw1eBLP4nwy
	Kv2QWIqw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLo-0000000GsBc-3Acw;
	Tue, 03 Feb 2026 18:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144125;
	bh=fiS+Dsf7kejX8rScYfkmaaLrPJb2gNjvgY69POQjL74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qJCm4VpzioKSrLqOhsnrXy+XjjfgZLRcdFMPKUg57jnrcJZTQuNF/Un0LmagglpFx
	 bbaqqJUbgEHRfdFZ5FC+pC9E/QjSbqhjSDTaLwVuXz/gBdbyaBae5MUZ+hpRNspIKT
	 J9PbAtfD8hlfrwEvJLlfAjTJehKIPMZYCvAEj6jQPB1sGVmJTRSxv3G7d0oR0RGbc9
	 kiLAi8FML7lfbGUMLfgBPh9OlOcNajNQIaoAMFDWOuOZ6NpcsexTqEH1c+P8ug3Xto
	 DR/E7R1XDmc75g4xlGVVDmeM1Jo1TgiYVboYQ6WyhPPFKKCsmEgKAy/pi5kLtB5JEs
	 VTkFdXbeL7xGg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81F6B17E0927;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 4B637480027; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:28 +0100
Subject: [PATCH 2/7] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-2-16a6f92ed176@collabora.com>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
In-Reply-To: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6KTsI7g25/YTK5NqGxPQGl5yWawgw8+Ad7FeccmRckk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX0N/sukoZNN81S2a1Xt9AvKmgNodU1mh
 f4X/sB6QfKB+IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qaN2sP/jUtS/35QjGdbSsXIl9TsKYB2ct9jnfFprR4enUwqpT5vMrJZ1ygscdBtqbflVn41q9
 WkUQ6VArXS2Tep1zAlaC03XvUcKt93Yk5zehyjQrlmO8x+ssXzNmTC/Y1CNrD5FuVr2GEMGyEK4
 pg78ZH9orwsCq0Umw1jQZlOH0UEH9NceerQ8s00Ek6rsDm6FMJoe8/bKBnFb6CeodPxh4/d3Ao7
 anpUGarJxBSle1whl4n6th9fxpgQZ32Zycn386lXg0HuvfQoYQLZ91ujCNWY7jT94ZEpiAxytPR
 cGTyzY5OipVxrYOhPz/vN0Oh2uk73zDom3fmh6w2rR0NkYA0TBXgjnXdmWNwB9YXey2ZTtKI+b9
 1xsqVoJtbqDaRPGWuDLrnpUtg8hJLWaKF6Bb/ge34+g20RBiecF3NzXWsR+gw/B+7PoqqZj56do
 /Qlc0Js8Lsm5yrnbLqJfCHd0UBhVEJJzCrj+hp11k7U1Yqufi2bvKLiszpKYsIdkEIM7KlMOppx
 CWoCOFYBKpeK4IOK5jc7oKmV9SjFjTnid6K5olMKRKhRUqIrOpMEz4NXivHohnhJ5e1kBJU1djZ
 nha4I4WfabKI+cvL7F2F7khBrVzXQVgeu+j0ca8kKtiyaP9hyMt2tjhtU4F8VnnQaS6ugpHwzVK
 1HRqu9O2iEmjBu/a8Fuo7AA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_184212_944731_3077CD6D 
X-CRM114-Status: GOOD (  10.50  )
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

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b494819be284..7e4142aef192 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.51.0


