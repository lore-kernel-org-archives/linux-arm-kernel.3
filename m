Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D9CED240
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKh/W1VR4/sbqk3B1lzylto9b2fnc1vfmRUI4i9uEMA=; b=iqd8LxJhQa/KbN3p2ENcPudKqc
	p5naMHl9nKKtWlCu7TFaTHkcExsh35kgGQ1SSIlKEkdmtP3ABueyK3lOtNVtPIEoz51I/1RrU095n
	EUyuh7qzNrW6yq4cSkJSjfgdplr39mBQIlYSCmkAzjPVrSWoQREeQ90j5Fp86EDnPOIb1k9oP6Kqa
	CKpcohFKMKj65yYhelIuU5utFbNzH1dj/1CnXPAB4JVZCLEEGSp8aOh1cUgtHAKntqBGi8u2kP9dv
	83zBI4vV6tCnBTSNTzrnsD+pTw8RPy5GeIMUzBYu+eVaa2EQKCpc6sY4uR4Tn+gkRLpTqWGblkqNI
	lXgccTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIJ-0000000FrVB-0qf4;
	Mon, 17 Nov 2025 10:17:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIB-0000000FrOC-3KFn;
	Mon, 17 Nov 2025 10:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 756614425A;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 343F7C19425;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374622;
	bh=OiTnsE0jCJzlTrPL2A0+faRIuD7EfqERwAylSrqNn54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BBvuMefuhmX+O9qONtda07zybuZ7B9UFFulG35qdnto0w/LKHo8SmNIcf1hLbJODV
	 x/t2NkxDxsD5Mo+aNCqtwkYnIBHVxGDSOSuP77nreCGCXH273pfDE5CqpZRpI26Cu8
	 CXaRlWnexYKVhR8r/hQ5YO2bFZqp06cH2YJdP7BGV4rXsB3kQhPnVk50N2sjwBrjli
	 r7+v3cOLBYtCqm4sucd/cLOHYwJyElEhLQhX+cZ8hMsqHsmw+doyOJ9Qhf2BlskH8j
	 YWN5NKypA3sRSUSiu1TmSQBauGDu9ky0rmrIX8SHNoYoX9EG8oE6qQrkGJscYaxAFR
	 hR3kpIvPA+OgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8A6CE8D6B;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Nov 2025 18:17:01 +0800
Subject: [PATCH 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-soc-info-s6-s7-s7d-v1-2-6ab8aab03dce@amlogic.com>
References: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
In-Reply-To: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763374620; l=1037;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lSVasbRmcLc7s9EGABIBCTu4RsvuROyKNeWiDbPy8mo=;
 b=Mk9+2XSNOsph38a0bZ2mhSrgUnOpoZqHJ5LfqLxqXhDVZOXKC7GX9NmHO16haBkbOcVjZgNxQ
 1zj5zV0flCiD6IyyZlSawNEeh0zlIqSh5exaf6tBhEnCjAzFJPIcUog
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021703_882829_BB227DFE 
X-CRM114-Status: UNSURE (   8.79  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new definition for Amlogi SoCs, include S6, S7, S7D.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 7549f1644e5e..6fbb70c8922d 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -45,7 +45,9 @@ static const struct meson_gx_soc_id {
 	{ "S4", 0x37 },
 	{ "A5", 0x3c },
 	{ "C3", 0x3d },
-	{ "A4", 0x40 },
+	{ "S7", 0x46 },
+	{ "S7D", 0x47 },
+	{ "S6", 0x48 },
 };
 
 static const struct meson_gx_package_id {
@@ -86,6 +88,9 @@ static const struct meson_gx_package_id {
 	{ "A311D2", 0x36, 0x1, 0xf },
 	{ "A113X2", 0x3c, 0x1, 0xf },
 	{ "A113L2", 0x40, 0x1, 0xf },
+	{ "S805X3", 0x46, 0x3, 0xf },
+	{ "S905X5M", 0x47, 0x1, 0xf },
+	{ "S905X5", 0x48, 0x1, 0xf },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)

-- 
2.37.1



