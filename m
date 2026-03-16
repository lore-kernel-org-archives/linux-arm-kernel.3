Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532FFF53D85
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 18:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxLDDQpf4BF83qimLdzfNTiPuqDL38svemSDpOo2VyM=; b=JerDYhve5Gyvgvco7HY6+I+Wl5
	q0zqXHU43UMAAoVHRMC5xpRsKkbEO4GVmvhogvVgPG6UsCKKBjPKrpDakjYpNSpt5EQhAxr3RWQOp
	32sfJUUqwtILTwt4ajiUe0pSvo2Wlu8+ZL2aE3TGrqyhgUQXvSzjpoOm1MJ90c6ddc2PfJ1EqJ5kx
	5aQClwmQZbCRp2MiBii9cUSXN0hNhjWP+Nas5o7ggwzfue5c24v8daDpTlrwQR+cmm5O50HhD+uE3
	H1nuC25xyrE5upRrgFTK4WBtu+3tR/8dqvQcTG98TfMTYvkTiAzRKvdnSOBfrWuY+KlOgll0Qhyex
	DAp/m9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Cb1-00000004fsA-1RHO;
	Mon, 16 Mar 2026 18:23:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Cax-00000004fqC-1tOD;
	Mon, 16 Mar 2026 18:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773685391;
	bh=HGO3OOLu11jOTIotRzoqHyXFhbc0NsvCC6OCQWzZChM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QpQDV7/2fsFiMtihFTpTRLVAW1f3hxfAV1aesAQKuWWoOvLtTCeuy9TeuWdK7tb4Z
	 7RjxxbGX3dcg8+CREfnTaRJAat0fkn440Us7HgCMcN64eefxfbn9XegwirgE5LRl8A
	 cjYMSZ6kf+t2C76l/nBg2XAJE6FwkJBlG24VPKBE2Y011MvaTF7A3D8XCHyh/qLbZr
	 SYveTBSPzkIxSPwHSlJyQgzRQQ4InqxgkBTSDKrJUbCZsBFWHQosC/Oj/8225rd+hi
	 vv4WbcfSgHa0doNT1+fgpyzZ8EuTQNKQD43zan8u/lSl8oynBQgiuzOjoidYQilV8p
	 MabzMFnt+1JOA==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C48917E0EFE;
	Mon, 16 Mar 2026 19:23:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12BFF48002C; Mon, 16 Mar 2026 19:23:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 19:23:00 +0100
Subject: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for RK3576
 SPDIF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=827;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HGO3OOLu11jOTIotRzoqHyXFhbc0NsvCC6OCQWzZChM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4So5g1+1/DpTsSGBarerila7iw/g9lPMiB
 JbgHvXhFgbqnokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuEqOAAoJENju1/PI
 O/qaedIP/22o0FoajFUdurX76u/vT3Pk1FbtUsSFOcHzSIhQzW3HtmPD2j0nB2imDa0/w6mmH/3
 hEZS85aKTEtsMHdqnHwNTR2pKpUL8qKWKQ5XSW7pAUcs2l9baNE1wYfTvQumwuTMkJNXT0OQXCB
 y9k0rDpyX4IoScOwSO9eHpBT7/mdmnVDTZVbdwLCW7THxywpWbMyQmurvp29z3SlCzIQzsQe5Eb
 nYMtJ7rMoY7Y9J9i2potyUfldf6Z2dFl/E6y81LYBd3YV11L4WihpkyW8iEeHsYbW0FwFtFhjR5
 7XP4Y6fMgVsgR/9UUS7rCR1XePy4qImpCKwvxA2oPm3AAA1QEstSv1ndZwCCzQJIBvHc6pJKa5R
 XEtpN3EEFQtTKwO41yAHfdyxuIMkEU4DBYqAHjLPpowFCnunzAQx+CcXcDWVQ77ywWBLRBrprIs
 hmGp2Wz7fOHH7g8HhjQJ73URqJmOxYK6/5vSPLnRilF4JkPSPafG3Ig7Bl5ZR1rQGVR1M6H/GGT
 Rk1EwOQ15j4EoW5K4H6cVt0WBf4HQxFZ8bfKdWVWWAxVV4cdRT5hGkE5NdO8zDP0MTExeEbYiYZ
 9QOZNCa/TShELiEqImQyk5zRSTvUezI7EviutH2qEYdfPadof369hdKY87LqZlPerVo6NyVgFVo
 waryQ7tXvsrW2J/K6fdoumA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_112315_650462_35C9A67F 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Add a compatible string for SPDIF on RK3576, which is similar to the
one on RK3568.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 56c755c22945..502907dd28b3 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -33,6 +33,7 @@ properties:
           - const: rockchip,rk3066-spdif
       - items:
           - enum:
+              - rockchip,rk3576-spdif
               - rockchip,rk3588-spdif
           - const: rockchip,rk3568-spdif
 

-- 
2.51.0


