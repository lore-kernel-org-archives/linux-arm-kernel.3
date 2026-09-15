Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E9C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7YEowwxzC96iLXqgu37sXpMgmQtroSPgFffRL2QfsQ=; b=LqNvULQ6GoOgZhHImRf6xcaZS9
	litqV/PdyH2VHoK4d1C8ZEGrY2R6cnywI2YaqOINMzG3LRm+ZxbgPigbDlONrj8SpCHhZwwgplK2l
	rRkb2zUtIYviGMwCKlzLTA5VIDs90QZUNGC2oJBSC/X1lyTwdY9mM5XVkwRGdOzlzC75lG3BKCwA5
	2wNRG5gpKmUj164NwVQvD1KJM6fZuASoVNHCTRup/C330JAq6kZugcNkvNEjq2AL0BtZG0sJKRonD
	nIB5t2nsXqpW81tYIR6LTWz/qvYVfCR6KFKX62ctB9jdPgCYpGhIv2BuhtUtgvOPOsoK5X3TZtJiO
	fSBMw9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TZA-00000006ocg-2utK;
	Tue, 15 Sep 2026 13:51:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TY3-00000006nd5-3ppC;
	Tue, 15 Sep 2026 13:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a7YEowwxzC96iLXqgu37sXpMgmQtroSPgFffRL2QfsQ=; b=eNvmnjj5hKPFloKZ1uQVsUbbfH
	9xZH+ZG54pipQYHbzRSCoujGhI6To7g5z5GX0ktPpesY4M1Dnmde04b5A4xx7x30vtqct1ZgSyiOI
	2Q2JMQf5Ub+FeQnVTA5NQN8urzw8pRhmqOB13ksl7DXgoe/W7kUCJyptHyYwv3dDVeucdDf4KOFsB
	7hVgdI/j4eMq7IXVFLQNcwBrJFGyiuersH+JNr/sjVMNgeGb71lXRGoiB68lD8TnvMRQ6Z+5twNuu
	k36oPa0QFLDTdMGZgr6ZoKcwuipxDG2/az6Z51wPHaRjjxS6XY2RUwPH1Gm4Vn/cTaLNupPULlMY/
	MY45ntdw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6TY0-00000006qa5-3CKk;
	Tue, 15 Sep 2026 13:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=KvyICF3HgIcEWsbr4qstgUGWW6/KHBg57XV0O9FNuBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hwDs45W4RnRaWuipiA1+HJ1/jQ7W01+uRd3Nu2f0i8Nlq0p+KzNaj4gj65RzUumTd
	 mBQ3SwmK24RKMDYtXXLez9KdDpnWQivjyYwq/1KZufJ4AGqlWSXswRNmxb3+u/z1Zv
	 R/GhDvN3zSX5HQzjmjJ//2GYE13cJ+/uAFYAi7QoQUzPL9DRAcdFkNstCYD3BaTp2F
	 0EZl9f8T+AoF2Spns7EmvUQ+p3GqB7HrEtBzaACk+3m/3NvX1SQPsrylNANHhcHPIj
	 PPHFRnoffs4VPJR32QVpIteJMwOvA7rcP5/Akzqbb0t6j+/bDfDpHbsJhf0jkYammI
	 nGk3bWVkLDoZA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC8D817E0E61;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3CA9348004E; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:59 +0200
Subject: [PATCH v15 12/16] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-12-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KvyICF3HgIcEWsbr4qstgUGWW6/KHBg57XV0O9FNuBs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQXr/SgVMWBtLxhlK5ztWfDiB+hni4LfA
 vbTUb3qCkhb/YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaat4P/1HGWeVd3jWl/h6nyS0YmSWsGLKM6WTpyJbVgRDuNocQHPnCmNFm46amPRqDzDUG12z
 4FOuobTwTaG+P1pJBux9MM+dRfJJ8Dgq+rQx8+Aw+fPmKWLGqSV8daQ72LvsU8KHgq7jheoWjRu
 FKFZcMp8rtRXQ7N7cOg0e+/XZg0shPWdF/RTtr2I9Rx8n+wGyJgHY4dzP3uAI0xy40vdFQlrCkp
 LQN17sKFF9jqoldZomCsxybsLDjKZT6BUfQB9N6GsDlhTgNpyxhG4mVd8jgeSR7YC9Faa3xWzxC
 +jcpnsfgfItimHPbB06tjEvUxAilN8FwsrEqilulyNtDowgvr3TIRGaxwEW1/qr3Jb7lfrMKsvs
 0sRi088ccXf5gjIKr9+EOQqxFaDt2O4Con5UrxMt4NhpyZDmyfWjYv5ZGTf/kS7gGviVbalLLaq
 BFv5FoJRq4NwB38Quswq40c0zBDFgVS0+nVlhlOG4AhJW+4PbqsCMIwd3uJ37pHeOj7byrD8IR0
 ZjTMEn4AdN22HyQUh8qjVWiFPpIntCCgreVe1v75Lxw/VLVIXhx8uioKjt8rW1yAmE39WnJN7xe
 OToNpN7gxRB9N7yFShBQF41ajAJZBbUkfDcvrkUwVZVNdK61KZCpXkl3d38g3KeROuP/PPd7mPF
 WKOsDlMR4wYdXqHjh5vwvZw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_145008_920569_08FE336D 
X-CRM114-Status: GOOD (  12.16  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4fce9cd66473..2af7c3878714 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1098,6 +1098,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


