Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3855DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RlBH3Qp6HPjNbjhCNObXkvE9dt830vcRgHg1hGq3pk=; b=wjlXOvZRkU8+Nsfrufucb8Jf8a
	PTcD3EfAY4GZtdpVLNePqiYlZCCy0TTZFDMZpEVWpxQM6f+ozZ1q9Q5iDBfo9VlUMygwpBTneDNoU
	ud8CeS6X4kvUE/Mu5t+oGDpPeqMEE75omhRUPr8jb72ZPpjKR2S+w/315vgJUVPX1WELfeCyp4QeV
	7tP2/3t/aGKr85RWeiiPm5bHBg3t2bMnIVjNOe7DP+xv9uSe1ZQFkXgKRbIFBCGw4qrbfjCJFBiz4
	0EcjqV3hLGXMTgqBU1kARNbziNc+LkDyDwAMqaZrNVP5qT2hpaNXOGgMaItec9wstBSMrXtwm0xN7
	ZKrb7lTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSq6-00000009Tj3-0HNN;
	Tue, 18 Feb 2025 19:01:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSe7-00000009QQt-1LEd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:48:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B904525FA1;
	Tue, 18 Feb 2025 19:48:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNog1CxFu2AY; Tue, 18 Feb 2025 19:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904517; bh=Wftp7MvsLHIwZb3fOvJ0W49HFyWbpQRWeey9OqYXAME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OfYLH2/6RVtJyn5DA4KOqwNwpkm4900+aC1aXIhRfVmz5bdi1Qg5fac8G8oIRrvgV
	 hDImMkouqWxyWqPNLUwKCkJB+3JKiccxAku1GkT1unH6/TmwR3Ijo0WO7ZIut0ClPQ
	 WGkZlw/RtZsK+eVbEvPKPY6I3SIkkdlidyRij3/l02++B2KlaTCr3ONdSeqyWY0/WF
	 1EehaOdrHLE9SGjnul/pfF8rnflbinJrPukRkoQVrWww51NGNiRM/SB9kELI3drSB2
	 IlmEHeGCLyE5UfGkE6P9/ezr7OsAy2x/nJC7xZrNBscQBpdjKM4vSfhNHKHBiHANFO
	 SjxQDnDjb7fZw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:17:47 +0530
Subject: [PATCH v2 1/3] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 exynos7870 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-mmc-v2-1-b4255a3e39ed@disroot.org>
References: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
In-Reply-To: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904507; l=1075;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=Wftp7MvsLHIwZb3fOvJ0W49HFyWbpQRWeey9OqYXAME=;
 b=9tuGtTjedvLmLgkheSktSM8qsQuCnfnX2opXXbt1t35cYbJZPqOH3FWv+RHB665dj07x7NA2v
 1oJIaOeZuJtDzpu2PGXZ1NXySiSP7Vksn/GQodZFORqV7MErTJJQofH
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104839_493354_63C35F14 
X-CRM114-Status: UNSURE (   8.85  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


