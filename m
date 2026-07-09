Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E13C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUEICyFd9hJYgIsWkM2wHAP6nZzNUjjiPvGzBgziImE=; b=kxJCXrnnw1EfR550lo6bYbnobu
	l45i6cGUPrshAgmuFopWd1CXbUz/D/4gLfwBQ88HgzVUa5kfnoy1mHtOztYucmT4/MX+CiMO8+fid
	xicizzQg0isVwPgbqON9Mgjw5EGKvJ/H51T+Se2bR0TLeQ1B0MDbpc63EBkIdVFUj8Or7VPLUzHUl
	L5oiWNDlt4KMr5Tgl6qXV6ufMW+HmV8Nr5zpBM0hBAtBdteY0HR93sU6AXtfBbRu/wkrS8U834Euo
	GnUQX9Q7glLTfBbXKguB7VI5I67Og0vfx7XxucK2lWfr4qnhO2k+AJsXLD767R7JmaV6K5kWoCfoe
	kLFwAehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1o-00000003N3Y-1qsC;
	Thu, 09 Jul 2026 19:03:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1K-00000003Lkp-3Mvx;
	Thu, 09 Jul 2026 19:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oUEICyFd9hJYgIsWkM2wHAP6nZzNUjjiPvGzBgziImE=; b=N1FcYJj0frU+4gcORCKI4Inv+y
	t6Upg0cF77V7MeLJINYJJUlQs6lPvuCr9zSmCQRh9JblCuOLpRj4lgJDyvRGrYfG6yNa5gVr2MlQ9
	QuuGOl92p0FB0Z5KJSwADD//hisJrfnVedq3qFvKtXwH/aJ8bBfuEHsEAwp2eoAssQNADTQut29nU
	XGJ5cAJTi9ij75G4UTjZ+6dNUJFZ8yc1de1IC5IBmObUaBMwsk61IbPfXNOjoT8756O66bsXL2DKQ
	jLSFYJ2KiUhBnThOxjrPgfKbFoh890K3VTtUR3M3e0NVzao5a6+M8O5MlAc1r6LC2ECrYNnRm2Krk
	BYFe+Scg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu1C-00000009TNl-1f1J;
	Thu, 09 Jul 2026 19:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bsavkvfqfk7U+KmFxvK2iGha8gxgz26PL7F92PjiDdk1YOJ/pTm8Ky374d0710EYE
	 Be8ZXsGmIOepl11lPBvRv5eP67yVXd8OpTzfWUw0CSvjPrWlVUfMobP+sf7W8rh+/Y
	 60zaDzs4/DhP7qXrbiUCteEIEy0hKomm83qucVEQa6KYa3xIr0MZj6JouSfvKNMXbn
	 3OHojuzJIpBNNcPCEkg5fRt+Jr5uuy6/MVSgT8nxwY1gQq9OfQgjuQUu64B0NX5ZsT
	 +WAx2O7YW2DXGoMa9Aeevfs8lawrM1es9i+0OorycDLNJvTm9Tti+91OjrJkiSZ9Av
	 GruoRN/PnCmmw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2694117E35E9;
	Thu, 09 Jul 2026 21:02:31 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D72BD48007A; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:58 +0200
Subject: [PATCH v11 35/36] phy: rockchip: usbdp: Re-init PHY on mux change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-35-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EVQ/kYx8UKxwMtjY7KAcn1uKo8K/PD7o
 vpiP+OnsoaPjYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaME0QAKi1HDuNxKKV3gbcu6nndZtaBC/N4LXKwSnyMl5LHWILuK2MtIc8HthmoltBeJKqN2G
 rmY/Ofz1XlhsoDB6jFhHB4SP72EM2qgENNXjDGoMkCaqeaXvt8pJKgbtrqtWOfd82FYC1oROcwR
 q69kfcJysefMtAu32dtX6nlKD8yJFMfzhhZt1QiVR1skA5tmKnm974zJF7puMe/zQZwur3LDEMV
 NLG5sa1VJ/xeWpItYaLPAYAkLVIMG0+IozrELKPNPTVCQ/uUpGqZNAVUNGWuHLQiWztPv96dttv
 5QIpPi0lwkoKBDBO3esJkaFJ4zo9fsn5Ek4PwjepBNcZZEXsgLizKX+BoMz6wnPtdzpQ7USyNsQ
 6ky/sxqClA9z7d/XoAhUoF1QZyaJM9s2pgoFgAoeaT9qkEDpluqQekTNVEBJsHCIfdgabeDO5f5
 5KLboVCoUkbwurtnYSbvsSnGWhU3/n2A4WgolvmiO02BB5RYAkICQ6PTmv+Kz/0VSio7hiwLlpg
 zjLTj5Koj7kQrz/2u3jXwH3Uonk9LnaBViD4R1XX94WBCo2Td9ZO/F3awz57W2ODN9J8CeHNDIX
 FLpZFsQ/unwwrQjAbaPcf93yklq89DOmQyGbuHgOsmQ5rJIJv0pl2zyjJZvpfzBX5EQlzPB3ReA
 zgLCtPRim0wjT54QAw4cpWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200242_543447_8A9DE5CC 
X-CRM114-Status: GOOD (  12.66  )
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

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c5ad300620a6..ecf0ed0139f6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1383,7 +1383,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0


