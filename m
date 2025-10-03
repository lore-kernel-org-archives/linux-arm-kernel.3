Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBCBCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7cyDKQoLb5v05sCvUle4+p2qhZB8eTTDBt0WH24rd9U=; b=p3WQWgOPbhfWmkv6eIhO2IlYNF
	BWLRWlvW5IadUjTODkxp6HInHU/JWIFuitsdL2b9Yt5D0KnTagPvjpSFhbfmymf0JsKaMnFVimabu
	Yk6c1Kycq1z7jSQE+0YwNAdqXpVgm1k1T7ZOEin3DL3uM617LKdnPQni8+acfX9ZLcEmantAEzr0u
	KUelI6os1hTdsnPf+gobdkH+04LQM7DAq2aave06+GYjRg39Jl+dY2/PRlfLPNsmEqwE4Fg/dBF7t
	ClUezLnYJBTd1eENj5jzv7ZLMNk1sb3eyUWSKDTfFYXlc9yxkm2WOFxVjdFYgzzI4Fbe92XUINopg
	l7x9DpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gAr-0000000CUYd-1zFP;
	Fri, 03 Oct 2025 13:50:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gAo-0000000CUY9-29Vu;
	Fri, 03 Oct 2025 13:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759499411;
	bh=APXL16u9DtsmEsPU93iOfNZjpSUSe6UPagw99C/Plzg=;
	h=From:Date:Subject:To:Cc:From;
	b=Ggt9SLWpKqSfaRytZouU7I7WygLTtSOqywnoCOk1auGHLUReQIj6aWCgHQ8ccQYfm
	 aDhHB5YCN3kY0RqjqX+g0p6FgLxWrIdvkuk9UQ0gILn276vmRRTHcJ6La+qk1OXbzl
	 tAjZ8z+1MVbys4VR4G2+QpbJSpHJqr2OqCVq2FHoDPlyVFJ+XRjXyghYX/fHsM2HZP
	 KXc5dnW+Mhqejly3DABMqGtJ6NwReWGRyk0Jsg2IsKgQrdc97h89Eezs/dYNcdsOeS
	 /ZaLUMMp1otn1oxWMsMB39tbuIYM+Lvm0ET409e5MlCrY+0l0cPlOV4aEawTOFOl/H
	 rQakgarywY3yg==
Received: from yukiji.home (lfbn-idf1-1-2269-27.w92-151.abo.wanadoo.fr [92.151.67.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8604917E00AC;
	Fri,  3 Oct 2025 15:50:11 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 03 Oct 2025 15:48:49 +0200
Subject: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEDU32gC/zWNQQrCMBBFrxJm7UASG2l7FekipmMdMGmdRCmU3
 t1gcfk+n/c2yCRMGXq1gdCHM8+pgjkpCA+fJkIeK4PV1hmtz3jnFWNpTdvhwikUeaLQlHykjMH
 psaHmElxnoRoWoXr/2a/DwUKvd42UY4Sbz4RhjpFLrxKtBf8hGPb9C78AvPqeAAAA
X-Change-ID: 20251003-fix-mt8189-pinctrl-regnames-c50d4e46c592
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759499411; l=1688;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=APXL16u9DtsmEsPU93iOfNZjpSUSe6UPagw99C/Plzg=;
 b=FtEYOCuxQadnGf2/o9O5sK78bMhzTIAs8Hdkmjhzw9XdolUDhujJGHWtbD/L0lo/zU/U1os8+
 xnXmI+K1GgUApnqB6mIta4ahvdP9cGxQllRifnouOgxj29wqyZLzSSQ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_065014_729936_14486B95 
X-CRM114-Status: GOOD (  10.84  )
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

The mt8189-pinctrl driver requires to probe that a device tree uses
in the device node the same names than mt8189_pinctrl_register_base_names
array. But they are not matching the required ones in the
"mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
issues. The mt8189_pinctrl_register_base_names entry order is also
different.
So, align all mt8189_pinctrl_register_base_names entry names and order
on dt-bindings.

Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index 7028aff55ae5869880e9e9b14a3ad8cad6780bc6..f6a3e584588b0e8a1aafa9dca74c559974a57af5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1642,9 +1642,7 @@ static const struct mtk_pin_reg_calc mt8189_reg_cals[PINCTRL_PIN_REG_MAX] = {
 };
 
 static const char * const mt8189_pinctrl_register_base_names[] = {
-	"gpio_base", "iocfg_bm0_base", "iocfg_bm1_base", "iocfg_bm2_base", "iocfg_lm_base",
-	"iocfg_lt0_base", "iocfg_lt1_base", "iocfg_rb0_base", "iocfg_rb1_base",
-	"iocfg_rt_base"
+	"base", "lm", "rb0", "rb1", "bm0", "bm1", "bm2", "lt0", "lt1", "rt",
 };
 
 static const struct mtk_eint_hw mt8189_eint_hw = {

---
base-commit: 4a7bcf9e0158d9976525370ff84401a1e955bbee
change-id: 20251003-fix-mt8189-pinctrl-regnames-c50d4e46c592

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


