Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A6FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Kxht/CeVgIuRry8Vg1Bti+HCOlDPDp7bOa9L8hq64w=; b=4uDV8oCWQtTHs3UPKMHeI0xGEJ
	xaElmAccN4arX0mneQ7cUz9OMo82q5ImhuR+gOu+RdKLMRW7IrbCOeO1d5DaATNeRWcakyz+i8b5q
	oAC7cqbGYjnBjxr7WasMKQ+OaQOTd0WnwB3mv9o6nkYF8BEgy0Emiv6/vFQ/LgxD7+s5Fi4KEW7eB
	+aeaaixILDd97jVtR4rCvFzyL4LJ82SWJan9b5kK9axb4oqqFaWBONWouJzHYw6rbYuNxmsMQ+K4M
	QKaG5mMy+mdtFShx5M2f4cs6+d77dUWQR3izFyrh6BOwBD2uYtV7NV717csX6T5JNai85JXfyDwNN
	mS6zClrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Hx-0000000GZWN-0stS;
	Mon, 03 Feb 2025 20:43:25 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf39Y-0000000GXeG-2FoT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:34:45 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A8DC025C96;
	Mon,  3 Feb 2025 21:34:42 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoNBqqeAzUrZ; Mon,  3 Feb 2025 21:34:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614882; bh=IQoBWYmg2Nz0pgK788epXwCnifq76itrILRkaT5HgW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CH12uHBiU3qdj0vVnjrghq0YRk6ejbpmfZaSVRHFEAH8xhsrMKnZRdPLlV+jTWfBV
	 plGt0WBDMALwJTdZN+e3O9t0MI8JPdekRna9Hf/3zRpz8vj5szqYtiaOCg3Oi13HkK
	 1l61iedZG9dnWr90/0UIVoQSex5RwsT2sAWPVVLXrDnSt+JTN4oiCy5P6ub4iZ2xGI
	 rDbds7YEFp8NqFZ5UKm9djEcNVQ0whiKqfX3Dzdm2Th2LMFKR6eiAgRpJzNI4IeXVW
	 oTeHWHicRf9CpGhUklmh1YIsASSCS6ekmtc+qxSN+HIo/uhwt1rjkO3OQgVLFzVNNV
	 w6qGz4LH26AVA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:04:16 +0530
Subject: [PATCH 1/3] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 exynos7870 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-mmc-v1-1-c87cfc72be4a@disroot.org>
References: <20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org>
In-Reply-To: <20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614863; l=1008;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=IQoBWYmg2Nz0pgK788epXwCnifq76itrILRkaT5HgW8=;
 b=KFz1iYVIYBoju+EX3ocQgeo++tOiPJqXolP09EnxjUk4JSP6rU9aAUyiDKQ7R4vL1dHX08f+X
 fjNYbWUhrksAqbrtTqdmwPcV2duzRn112Xj2e1ubgVoL+n2P+ZWIThk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123444_730145_2AC936BD 
X-CRM114-Status: UNSURE (   8.92  )
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

Document the compatibles for Exynos7870's DW MMC driver, for both
non-SMU and SMU variants.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index ef2d1d7c92fc8ad7456379bde498badf7b3201c8..e8bd49d46794ee19e994860564a1612bc9d6e642 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -24,6 +24,8 @@ properties:
           - samsung,exynos5420-dw-mshc-smu
           - samsung,exynos7-dw-mshc
           - samsung,exynos7-dw-mshc-smu
+          - samsung,exynos7870-dw-mshc
+          - samsung,exynos7870-dw-mshc-smu
       - items:
           - enum:
               - samsung,exynos5433-dw-mshc-smu

-- 
2.48.1


