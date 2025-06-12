Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E47AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izp3A2D7MviA7DEfuquCTIWg6buME4Wk3xa9/55flAA=; b=MhyfvoLJ7mZcPU7aw79b588vL5
	uhgpnSi15VO5zf0dJKMGCuLuK+2QFf+VWrtDc7Q4WtkQ1ajHV4EKhmE8uXNtV+EF65Q3AYb+iN/M5
	2mymHjBqK7bMwcfH487WYJrw3JvjwEm9UGOpr5B9XpQDx/pBPHSMkMex3fNcajaIMHGPpJuz3jJsz
	h+H3cTbiRCsdbSmA7Cl1Vgzbzzy1VmHZzxuVuCVnZ98vWAip5J27KSnVPoOOQ86dnfb/Zk+jP+qgr
	ljGnHVpqrEVuv+EHD9uMS6iiwAheLXdkaOpsV5q0DbxQNEinSDParIeCbXxZhUDQer4JGIZ4wf1RJ
	/8Q3uoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPox5-0000000EYib-1pbI;
	Thu, 12 Jun 2025 20:55:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjmk-0000000DmGU-2us6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:24:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8998C20E0F;
	Thu, 12 Jun 2025 17:24:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSAyWYVMuSkv; Thu, 12 Jun 2025 17:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741847; bh=vZFKzYhN2DrVkkIle6hsFg4Z4nvKKm9w3O+sgcHdcAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gpuPRYKsMeh35gmSCTygaKqoXBaMM6VLCJP5vEOhPTswarxsD9kA2zvVdFJm/y7Iw
	 y7JGQpdBVm/kUkvClA0kkPYKWz33sidRi1KmDhs7SblKXGH7otBxfv2CuHkInXekaM
	 q1Kp+RRKYsvaDGt6bfpJpDw4WsqKFUDbjjMczHJs67HHpUUKKiHWD1qNxjPtTQJH+Q
	 7w5Vf+yE7jyXbgIQel5q17B2mYDmKBOT5fTBTCpoJ/Vdwvgm6zOtMopQ5gVXuJqTkO
	 UL19R2Sg+2lkI3W5c2pFv3gNdL3NKiXjoDU+fAq7St4i0vUUw/5JOmnI5W1YogjpCw
	 y/elZEvNx++Mg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:37 +0530
Subject: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1176;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vZFKzYhN2DrVkkIle6hsFg4Z4nvKKm9w3O+sgcHdcAg=;
 b=+jdfMpMZAaml03kl+O9oxwB4hvxqVIwWj/a3gYQQyXavGQtwZ74FOFZFlIOoaEWgtgPj/7x+2
 bDMz1ewKhI+Bt5zsU2fYptUJR1dhut8s/H1TNurHKL+9YP+lCUrxpZm
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082410_867940_0C94CA93 
X-CRM114-Status: UNSURE (   6.78  )
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

Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
added, used for the SoC MIPI PHY's CSIS and DSIM blocks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -52,6 +52,12 @@ properties:
               - samsung,exynosautov9-sysreg
           - const: syscon
         deprecated: true
+      - items:
+          - enum:
+              - samsung,exynos7870-cam-sysreg
+              - samsung,exynos7870-disp-sysreg
+          - const: samsung,exynos7870-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos850-cmgp-sysreg

-- 
2.49.0


