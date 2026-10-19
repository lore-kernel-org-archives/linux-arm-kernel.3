Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75FCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSr45EekwXT7Gn8RorAXchQ8TsB4e3wg2k48aCXq1sA=; b=hNveUud+WzNDtlSm9v7qAxevAW
	Eadd/7FUAJbR4yLNGFlrw7xisQM4mS0LbUmxhdAjjjievNZ+nj2P/n7C78b43LQpxP8ugDnKyDJyi
	FD8eehLi4yW9JYZQRe2wlxe9s0yM9NxD/J34oqcMhh5KGvPvegbHAg5jUPflWOWg5wqS9clZtts9l
	h/uMlXx73R/0pzYlHIbGrZk3UP9knWM7Lzxer2NMNYxO+RTy7GOmQHxmGUfszFCH8rzHGoKDB5MbQ
	x9qGVkJv6l9ej2DltfCJ55/T6wrE7rhq7sLUfL+VIEeORgbRdlfNJZcOufAb3A4yKLaG2doSG4GCZ
	FEm1YPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkXA-00000007Ahc-2wxk;
	Mon, 19 Oct 2026 10:24:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkX9-00000007Ah4-24QC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 299DC4401A;
	Mon, 19 Oct 2026 10:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D082C2BCF4;
	Mon, 19 Oct 2026 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792405439;
	bh=fyHhi4P71uH3/LyPFglPqnG8fIGu3u4o0oWoEIZR58s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T7f3TpZFSH3iAr9WChg+ASCXtM4Jp+/wRJn/IX7Wt6RUKn//jIqBx5EQvJuq37Avz
	 0b+89UGFiAi8gG2vVAaO4oxvi8gk0cQkgGFMp7OuJffdZD3DS4EQx50hgbu1Os9nOt
	 I4e31lqsOefLagYwINSqeX5zNnnbu+XsHUGnw1g3zB7QsZlsxlcEE4sAlu1h4IM19v
	 8TMP202FWKs8S9TTPgl+rzNvdtm/6EQSrnvtvdK9Xr5EA7r4KzZW9xgG8xW/X8RL9G
	 +liv+NpvV31bzMsyUtqtpuIampg/H++Uy/SohGgUkUhCF6MHlF2tf+ePNGr873u41Y
	 zYeKV2cm8dQQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA6DCCF2D3;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 11:23:49 +0100
Subject: [PATCH v2 3/5] dt-bindings: arm: samsung: Add lucky7 board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-v2-3-c4ecab4b1c4c@member.fsf.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
In-Reply-To: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=7JvUn6Gsqc0cxhWub/oalXTSGokInna58PtxHScXffE=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1e+7u1fc6RiK79qTd3xcYvBPtWkFsc37Qiv6h
 VD3VsVE1uqJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatXvuxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sy/w//ZekwG2PGvYhJbYmzUGgnKyuMJ70zcEn
 cD22liCLf0te67fVNfnhsbA1UcRmJW2zVGK06m+wW2BPs8jJAfya+AxGVeW18goOK8xz3SFGPyt
 QVLZjzcr36xWYhMIGcN40ptTMxO/6BRKVljGSTC/QuzbsmNwiGnMwWz/amIljM21fl2OOsWUnp0
 6SkFlafbMevjW556pAUE7n78H52qfHTSZCY39JaeZpoWzuOy57JSTy0g8QQOu5ugpDfLvRGWlbX
 Wu3pe8D4E8UA2piQkq1ppCeNOTsJyZMxD16Fy+adp3DoXBAjhnyyU4df8AhtLV7Ls1QLntb08nK
 RWwHywhL/SRPPuGB7vrqjB6YRmzSCMSL1kt6i5dshKvvYEV0oQ0qdTcQTi/0f0xgACv68gQaXm6
 qrBGSdqWNzKaGTsQeMOwniJoZrQ0kgNJhsVwEC7wmrvvYTiC8oLA31VrSwuFEBfJ2b9Tn3z0VOA
 Fs7XFOZb2dFFbWwD8+h0Pyyz3DH5ky5elpYQ7UwK8WK0C5nybCz94SAVo29m63nJDjV2mAyhO8Q
 0bbCW98XcDt1krkOZGWJVbOy2OLO53U2BSGHgiM/k1I/+8FAt0Ht+QX4y4V5lwTkIkmmcFIg9Dw
 eTOA2BTXC21Pt+Os/E0HIiKyR92TaoBh+eSuVX87hmD97VEltYLY=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add device tree binding for the Samsung Galaxy Watch FE (SM-R861/SM-R866)
board, based on the Exynos5515 SoC.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index db19a686f490..c80fac4fad7a 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -157,6 +157,12 @@ properties:
           - const: samsung,exynos5420
           - const: samsung,exynos5
 
+      - description: Exynos5515 based boards
+        items:
+          - enum:
+              - samsung,lucky7                  # Samsung Galaxy Watch FE (SM-R861/SM-R866)
+          - const: samsung,exynos5515
+
       - description: Google Peach Pit Boards (Rev 6+)
         items:
           - const: google,pit-rev16

-- 
2.54.0



