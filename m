Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E613FF8876
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVRlio72xleVZvWU+duz/++jEhYo25d0y78NhTHTYRo=; b=VTddYipqHw3RoVvAB4Zmt6Veyq
	Oaozr5O23yYeb1bfDGSw5fuKmjbOCHnR90CjmEk3HclLEKbw0VGf25Y6GCm8KjBWemvFHkNbpaVJX
	2C0TAW9qWUtsgYPmZHRSr/+rTWFHwsnyIiiWUxJyjkahOkQUQ+YCsWVSHxZ/W67HWbUwmMgQN6iFd
	kYrrHSLleFNVzfgvjRxXE2RXUvyTUasyVfu1IWmWaskmKWF1Qr632a2NQxP84VkEtS05j/WM9nC9b
	zjohRaQ2g2VrxuvUZ8Deb2nMeVYCM1/0C2B7uUgAncgfSI+pXwSFpGz+3951Fii8tWdf2ZW5WaQe7
	TIuC+hMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4n-00000001t2O-0LLT;
	Tue, 28 Apr 2026 16:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4f-00000001snj-03wX;
	Tue, 28 Apr 2026 16:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VVRlio72xleVZvWU+duz/++jEhYo25d0y78NhTHTYRo=; b=imyanuYHhDEhbQvoSa7fIyX89t
	1t+WZtUuf966xmx62seTIb7t9Hd8fOPr1kQfQm7AVf7dO44qg25OCbrJUxO55G1OHZt4KobM97vus
	+AHRvnjrCoRMW4J9fnTJa75rUWGm8NxTrAQi2vvJaJ1oAa6ubiezgER2Mgrv3HKkgPPy78h+eHjYz
	3jO2GV/7rnnIN0AB08HNOeVfHEa2ydaXhC/Sx87FSsWKameDcCuZJ0SinL2yL3rsj0hXHSeY3uHQN
	gyIfwkQKe2hl+fUYLW50a0Nkkzmv4/mMV0VOVk9m21Y/r5I9c6AqqfbuTV3V7haaWyezRmD7dJ2Jf
	97H8nAPQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4a-00000003ZKD-0yZK;
	Tue, 28 Apr 2026 16:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=0XX4vVa/0GPAugnfThIRtqHaHn956POvyh55GofpEvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LLCEyRfh/f8c6ZwocfwlBbkwybR71sOgPU2xaEX92cAp3+jbVit4H3LxqODmmsehh
	 vUyE9Tou3fIfsLvo8ITsyDwetys066uccZOgiC5QxHmurKmFh83puZoCxQwnNUFgFZ
	 uGoXAGsw6FglqB//WZ6FsBy0PjueoItq84g/G3hca9flERCxclVUyamxc9BN9j99R5
	 sg3HfPQQsE5lZ9YClIQW4WMBNoRnjrI5pvOK/msdrDkwoUycfrvRjHoEkb4dEEcScc
	 Onf0PHMyrx+Rps/dVfDQIacWWDh4e3rD9sIf+U4aNuf+9pCRLFqb1NBgb5D/mawDa+
	 RuRlwVrbO59/g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBB0017E1537;
	Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 849F2480035; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:43 +0200
Subject: [PATCH v4 04/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-4-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=n8lRzOlMyygGbWhWimK1M+yPX1RbWFhy4RXxCi2HYdw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MjgjA0lE+iTwOFRwAegngadQ8WC4GWmZ
 S+yAiWJpPsQ6okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzIAAoJENju1/PI
 O/qaIHAP/At6d+Rx9C0Xn01ry0teoum+lfMfUBebklnK/mfOu7IC+XbNKo866CWkwtQ+5Sq7WXC
 2p71qOtmod5u6Tz8rh0jFWM10oVFUvkY2MHCGwvKfNUPNt0FkUSciyKrZyYhec3P+pDjXUvcFH6
 xFeeiVYDJlnnmVkpLEZgsj92/ZTzZrnoF/Led4cdC2womD/CoKiaTVyx0+P8Bmvy+Yx7tlw4wZ6
 kblD9XSJBlGykVIt0Gn4EM2HBbduSLHxISQXozKadVr6CMkj6TP44punSV75TtGelC9IwxbLBNU
 QSyx3uwk0jG9nKtoUOa0OUGQJMEFBYuGzaErjYtMkD4G/PqFpPEo+RMoRFzkrxM8v12Vvne8Ing
 QLu2SZfBh5oBSvDY7cgiVWOjPuJ5/VSllQwpbcfia2E/kWEqCqoVjebs6WcAKDiQBip66AK1hVr
 MDBB1z64fgjK/P0lndVSTa7B0Ld15MMwdO2I2nWI8yIe7QGF8RD3NQHhPeXBEXiCutVtVsFf8yB
 8IRjp0oPHysxNUsM3bwagRMlPs5Zdy8o0Lv+f9/KGBPTfIdz1BjSWRLoBPTQIlPQZfuNUlhmnAE
 1OrhX5mki0fFia1kE8jlAAre2lXKlwgV+jGHAd5NlfJboDueyVjgdmSUK5Evlycdj8Zf72yCFWv
 DaelxzUiD/yBMmeO5osQqqQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_171408_473212_FB59341B 
X-CRM114-Status: GOOD (  10.20  )
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

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 98562a888b42..1f686844c337 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0


