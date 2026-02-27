Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2ACFD530C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lhND4v1aUy9aSZclAOzKSGnysjiQszdyXIZxCYh0ppo=; b=q4c17JyhN0I1120xqArQtynFGo
	2qdVQLzfngL5jMTgBbvVq0/TfXXIma2RffjlFzqxL0nE8y0PaR7H27uNPymC4OgMP6ISUa/0WGayj
	4+p8m6InxUrtt3uVxlLfJhuQj2TxOqJO6zNCUCFXGU/tdGcekcVN51uCueHpz736k/wdZ2+xcsBHu
	xmHqWzT0HTUY9VR7ZzzhlzDSbPDTEuUiHhgo+058EJb5kYGSNeOC8OiIqqA18uMXnDlSEUkQlfzjX
	ViRRCsFMrc3xnSvVxnwL1JinEaEN7CbgIywbTGi+K4dy/Cp8F1+H/58prvhjPyQlhGBLlWDKXVnwV
	GcqfJ+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtOF-000000081Bg-1bAj;
	Fri, 27 Feb 2026 08:40:03 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtOD-000000081Af-0XOx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:40:02 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12733603eb5so36725227c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772181600; x=1772786400; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lhND4v1aUy9aSZclAOzKSGnysjiQszdyXIZxCYh0ppo=;
        b=Qwaruw2XKUqcsHQs6ZQhv+p5lIZkuYTgCukYY4uRmVvcsX+xG+HTt6lhTrHLbMaOhC
         vJlTeWKj9iNFxwp/kyK+B+/O/IJ4/h7YGdZf8iu693feBC/taAOd0rtW7ctap8PuqFoA
         dmxNy0hXN+cJB5mcyiHuevif0Ri0+C1PoU15T4IK9wzVcd0jP1KPXjaSAFG5BAE2kh75
         uL4KUV1fKQT78EX6cmhWf6bzB6zu7HKixCa2WA15btrvzTVyOg3rOeBNAMR7hHaTmCso
         4rVBvl0/+x64LTauqT4QCOesGzWOAi9Ur+vAhVZzY7u/i+71E0PEMCtRseGLitxMHzc5
         DGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772181600; x=1772786400;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhND4v1aUy9aSZclAOzKSGnysjiQszdyXIZxCYh0ppo=;
        b=KICLs5uIzSsRF5BJeurk1XtYmWJPEBBs+6Owmi8ctifjqmLjU9t+Nqdqjfz5wA27KD
         gJ7bGCFj5cwfC6mj4/fTQSRer+t6ni+Xod/NMTzLK1LXpvAcgwh1aCGU0P0lLGqhnoUi
         VSr4IS9d9VyjCbeE1fYxlcwsQDropS3BfR9yuA7O56TPLtOI5JPlf4fYg35nePLx6DEC
         EQWJzZ0hIr58FVeb1drZmWQbUGbB2oajwPFclspX7mobrYJUguqPiKHCHKV0oa5+W+Xv
         SMXpr01v5J4I4LxUlgKU3N68ThHo6/ulGBcbPc+tn4YOtlN5LEvqzsggL3P2HnueohVF
         sAIg==
X-Forwarded-Encrypted: i=1; AJvYcCVIKLL5o3fsmYNYKi3CKMSiTDbxl5NkNV6kaJpX5HiZOErygTkiPWnSg/yqW7qmM+FY30QtXrTsrpXS5Z8pZRUL@lists.infradead.org
X-Gm-Message-State: AOJu0YxwlXkGnJN6tmKSzQKKInpYpOfIwvd6Te3MZrbrzVxWfLwwA8io
	XN5hckLUlm7j4VBboXLO1do1tAhOpi51NW6DZceG0L+ibfNsOG5Pby0YL8+76aXatAWiAbPjpyN
	PsYcz6Q==
X-Received: from dlg18.prod.google.com ([2002:a05:7022:792:b0:127:93b2:e6d4])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4590:b0:11b:c4ee:66b
 with SMTP id a92af1059eb24-1278fd6e09bmr954659c88.37.1772181599531; Fri, 27
 Feb 2026 00:39:59 -0800 (PST)
Date: Fri, 27 Feb 2026 08:39:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260227083954.3529857-1-badhri@google.com>
Subject: [PATCH v2] arm64: dts: exynos: gs101: Enable AVS APDO
From: Badhri Jagan Sridharan <badhri@google.com>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amitsd@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_004001_168885_F480AA9D 
X-CRM114-Status: UNSURE (   9.20  )
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

Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink caps
pusblished by gs101.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Depends-on: https://lore.kernel.org/lkml/20260226055311.2591357-2-badhri@google.com/

Changes since v1:
- Fixed Depends-on
- Patch rebased on top of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
- Link to v1: https://lore.kernel.org/lkml/20260226061053.2596167-1-badhri@google.com/ 
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..5a689be61432 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -174,6 +174,7 @@ connector {
 						| PDO_FIXED_HIGHER_CAP
 						| PDO_FIXED_DUAL_ROLE))
 				     PDO_FIXED(9000, 2200, 0)
+				     PDO_SPR_AVS_SNK_APDO(3000, 3000)
 				     PDO_PPS_APDO(5000, 11000, 3000)>;
 			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
 					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)

base-commit: 5d692f20de6311fa507c952adc3487c641edee00
-- 
2.53.0.473.g4a7958ca14-goog


