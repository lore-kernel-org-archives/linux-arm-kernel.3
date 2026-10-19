Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A8CCCF2E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=; b=Rof6JBRVCCd49+1RpzThmtZ6le
	vl0X8awADqs+9R9pBzNW9ZJez2Gz7mm+dnQ6hUP4stpCwtBi7ArqADxUI8LCPDd0IAmTX4+1PSU3U
	dT5EN81TLYVS7EhnD5tILIQUnZyzmH6sbnAcuGcS6y6VHUa0GHKkqkaX1ATRFZqnrLratJn4UN0lc
	3832rRLBcIZnoLF6qPAD7cMwdg1UB06ZtBD6YJzbMdlHxRNC4VAyR+n7RRz3El9I3zVKPA/m30ArZ
	SBZRxYDQgo27lhhvrBm5MjVHoZyXqdqDAPYxW7FoUvBXG8i3MKZ+W9Jjfr77d6FEDeDD7biiT89v9
	a0gSDrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkXB-00000007AiW-2d5a;
	Mon, 19 Oct 2026 10:24:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkX9-00000007Ah3-2ISv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0F1D43D4C;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3BB9C2BD04;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792405438;
	bh=7Mv+oJW/mPnKR3svLelXXrT/qOxMYXOtEWSTjcCySOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SYTOc2+OnGwTPiktILEYNuQxI+m56ROM/ovXr7os4s8jbmt6uAhntPKf74Fqvuiu1
	 lpG5Sf1s2MTWKcBVRld0KrzNqkNL/creOPr2O40m9cTigN7a3ImuoTNrHgdTZOwFOk
	 a2A88DH6B0Y6VvnAaNwuGQXh9XuQk03KRF67k5qwMHX2Lfddbp7zwDXlhsaPwjeFcD
	 QId0bT1eh+F3i5of5CH4/pnUckMl8PuceYdAyRViQDeYBQ37l/hLJhG/6u6qEsIb/d
	 oL9aUrNrrjFG2bPFCxkiv7zUkhJX2MwuME9oHiZMKO594EM48oWrgrHIoAFzm8tCJD
	 CGCFyj874jfGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F95CCF2D6;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 11:23:48 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: samsung: exynos-pmu: Add
 Exynos5515 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-v2-2-c4ecab4b1c4c@member.fsf.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=u5w9oDBuV+q/JxmEewB9ecAjYkFIvHtUgbXKYE3snfg=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1e+7qKwtn/AtJxY1XoSwej2KfOWWVj/ql3ZhS
 0epIVrGOwWJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatXvuxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+uhdhAAs6wYyfqFQE8Kf9EhnMzIlElTCyjVbxs
 5gvWepRuxfRjVHx2o+HU5iNRveaO69wHCxgZ53q90nV4VMEfqTYSU5pS/B4cpLXfs7fztUFX//Q
 6kVUG1cl6zNj6Aw5OePRWrYntLSvxj94rUqR0Flu8J46ZxVtVcY6rMxm53ahzFuDDh0l+FLVvhs
 E5ISks01UnNZ+Ac6NleHOiZ3/XpEXUC5+PwDUPDJh/gdUShy46hsF4y4eX1535sUC1+XVjwLyRs
 HPkHFeQtl6zkX35y94ILJNpD7bK45VfQEWkh4foTbKSdxfeQW79QcO/RrHa3XAhna+BX/LWDeqw
 m3IQEaHA+6OrVoOTyzI1K4X9gKMXetHt9A6pKsixv3r1aFzYt1ZnXZMPhLUUOUoeBEj3MmzAdc9
 iMD6kvXRha3T6nQhrR0iqYWWillS8UKJYK2zy25nsPsTubQ+Xxoa7nZDaq40DyjM87W/LynDRKk
 wlMhQRt15CVQ9HEEwmWHXxKhAaWr9oqX4IpnYg4drWKXEtgjpHWpIpucmgsBnwu12oxre59mXN2
 UL4pJaKMKneosaaeisppdjsvKyg26JTZO7q4Mpfq+VB8rSLaYj4FrNdRIb0GXrJi7BwBmbJ17Ln
 Vwn9JrgbG7tT+zQLs8RXhxFitAx8dRy6em6UUPwcxbg+NgjhLdbs=
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

Add exynos5515-pmu compatible to the device tree bindings documentation.
Use the samsung,exynos7-pmu compatible, as it works the same for Exynos7
and Exynos5515.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5bd39876e3b3..1a0d9de79696 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - axis,artpec9-pmu
               - samsung,exynos2200-pmu
+              - samsung,exynos5515-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8890-pmu

-- 
2.54.0



