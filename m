Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A203CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d8nA96xwr34cLO0GbWv9spU6pHzjrky3Sx5bHtvE/Hs=; b=zog850Avqf8HMniBwGxB/hqf4X
	F/BbiuURkLzvvwURuGN8IT5bYLv856k0MA3ghuJdSy1ZhXwm210WNrnXyLyq4tpzMifwcyhUgIYJg
	dmjJE56fsMS59hPNYXdYxDjN7nBzN/ffNJ3zENC6NpAXc96O8JcI4NARd0mr926SJoAxE1gmK7sHw
	3OPTtmIApKFyV6Sb5T13Mbxh4xdpK2BUWCpJ/B/95QuLabufBU82cjKaoMPGG4IwFqk/LIIN/bJOz
	0pv/6ZWeofEvOrlVVMiSRyPlN0ya910a+2e1v3IO1gv4r1v4xqNIvk0bKm83F9yxNMEqqg5gh84cr
	ENH6BhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gLi-0000000CVWC-0FdI;
	Fri, 03 Oct 2025 14:01:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gLf-0000000CVV4-19c7;
	Fri, 03 Oct 2025 14:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759500085;
	bh=cPM9JXOFF7ibYCync3LVv1ejPvu2H2nbyMWY+uEM8fU=;
	h=From:Date:Subject:To:Cc:From;
	b=Jqn+Dkpm/6ZZ4hoK26JhVgFO+BgPcu2yKhvOdOLJ9s4p64cRHMjPyg067uVA4p2xP
	 YC216rYbMMlz2URqwyzEmfm2aSBkto2O8EuwaxFa2xjJDul5gkc9ABYFguXOMPdaNE
	 bMMsu4RWd+HpC99KBXa1+w6oEBaaP4YlC9suVWD6C1swgsFKU4EW9rfyHBRs4Ts0tB
	 Nb0afsfdenqo6Ld2bNsVWB4QIMZouhkcgOLtKa2Ve8mGrH7hemRcCEz2xVfbv0ikVz
	 U9U2TcbUayoEgpSQDKZ1Zdex9BrgoZqiCQLpwU3zSFdxsMZ/SRwINS2ekvj8l0IMxl
	 1y83eqj3Rb17Q==
Received: from yukiji.home (lfbn-idf1-1-2269-27.w92-151.abo.wanadoo.fr [92.151.67.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A6AF17E00AC;
	Fri,  3 Oct 2025 16:01:24 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 03 Oct 2025 16:00:28 +0200
Subject: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPvW32gC/zWNywrCMBBFfyXM2oE8sNb+inQR07EOmLROUimU/
 rvB4vJcLudskEmYMnRqA6EPZ55SBXNSEJ4+jYQ8VAar7dlo7fDBK8bSmmuDM6dQ5IVCY/KRMjZ
 6cLq9uOCtg2qYher9Z7/1Bwu9lxopxwh3nwnDFCOXTiVaC/5D0O/7F5BslyeeAAAA
X-Change-ID: 20251003-fix-mt8196-pinctrl-regnames-60d30873ca23
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759500084; l=1688;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=cPM9JXOFF7ibYCync3LVv1ejPvu2H2nbyMWY+uEM8fU=;
 b=JXCauQA7P83lu0MWupp+csOkf8/00iSvFsB4NG3QcNCOYDGebAwMM4pGIw8azXZaBdIdsbgz4
 6zaoOSPcvTtATRzWZCKGcIjBG96I2R03fKa4898kgQb6oyAQafqHvD7
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_070127_478573_E706C15D 
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

The mt8196-pinctrl driver requires to probe that a device tree uses
in the device node the same names than mt8196_pinctrl_register_base_names
array. But they are not matching the required ones in the
"mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
issues.
So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
ones.

Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8196.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
index 82a73929c7a0fc0fb841b5fe313d905c8478044a..dec957c1724b014522a70ed38057e162fe9e25af 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8196.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
@@ -1801,10 +1801,8 @@ static const struct mtk_pin_reg_calc mt8196_reg_cals[PINCTRL_PIN_REG_MAX] = {
 };
 
 static const char * const mt8196_pinctrl_register_base_names[] = {
-	"iocfg0", "iocfg_rt", "iocfg_rm1", "iocfg_rm2",
-	"iocfg_rb", "iocfg_bm1", "iocfg_bm2", "iocfg_bm3",
-	"iocfg_lt", "iocfg_lm1", "iocfg_lm2", "iocfg_lb1",
-	"iocfg_lb2", "iocfg_tm1", "iocfg_tm2", "iocfg_tm3",
+	"base", "rt", "rm1", "rm2", "rb", "bm1", "bm2", "bm3",
+	"lt", "lm1", "lm2", "lb1", "lb2", "tm1", "tm2", "tm3",
 };
 
 static const struct mtk_eint_hw mt8196_eint_hw = {

---
base-commit: 4a7bcf9e0158d9976525370ff84401a1e955bbee
change-id: 20251003-fix-mt8196-pinctrl-regnames-60d30873ca23

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


