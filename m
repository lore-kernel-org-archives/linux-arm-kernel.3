Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FE2C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKGm2ESbhsgblNomRcatYDVkkky7bNLEs5C4D9hxSvo=; b=F/Llw1jLRx8zzJB3JifFreVnmF
	hs5Ny8C1NlU0d9RGjl9BcmGOKLTOYqav4SNwdEA7MrVHKkYmQE6Ab0TV3xbdmHcJgTgAFm1U4+Eey
	5Qy9oDDZGeYNEmGWxMLe08cUnDqREVAOZTMqpMfNvOjYin7AWfmWIqIXXL1XOUCurF5kFITV1eLyq
	nOmiT3Y+D9qxQsRDFhHfBYwWogoLGQ2LgETFF31wWOw6zzZEU7CYCHdBPthJITHlCpMnTn0NslUDf
	JZ3uB+oza8n0MZ+Aa+9J/jzgDmvKLyjdys7q4rk+8f8mlqZ2iYh0LQ9bpwW4er1PZBhIH1q9eiU8k
	JaLB/7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Ak-0000000CNVx-3Yd7;
	Fri, 28 Feb 2025 19:37:22 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to69D-0000000CNEU-00it
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:35:48 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D248325E67;
	Fri, 28 Feb 2025 20:35:43 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Th-yGmHraEZK; Fri, 28 Feb 2025 20:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771343; bh=BeszhtQQ7PFRGkbfedM7GhE2NFsytj/yeq40sd83H64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BKWef5RcSg+e8EYHkT8o6EWqs/WurAw3cKOuilf9oleGaygFR+5f2PGste1YyJDpg
	 yZKx4ZuXBtisqKbYaw7PgpzkuHoMTFSnmoC2k4Dz0XemVrkYkhXBQW/N2YzZ1TkOFZ
	 4/aU9aVxd7lIuPFzt2hZKvgynthSw6vTS2TDt91F86uJPPt/t2sQ1BmNHrhAunErSE
	 4z86rM/Dcx9BYTwPMioOOj9TcFoLBiKOMJb0WnAmyccXRWNJmCWxk/Y6QW9I5tNC2H
	 BfM6buSHZVDbbwpFvV+Q/LX7vGXcBAqSs1bjIGYB5lkRWvU6sZLOdr7Nd3ZYHVjxUL
	 k2souvkSe769w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:05:17 +0530
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: samsung: add
 exynos7870-pinctrl compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-pinctrl-v3-1-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771331; l=955;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BeszhtQQ7PFRGkbfedM7GhE2NFsytj/yeq40sd83H64=;
 b=p3GEkUgn6LemQaHjNvwSFfcwE3hUGBBcxEiADrw1aIsCJw1HlJbbnUCEFsNOmzXMozlYL2t1T
 Op3GqwKHoWRAVpCTK9yeigYmwW74gdQtqaPmWvaNlp//WA3v+VWgL66
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_113547_174472_13DD7640 
X-CRM114-Status: UNSURE (   7.94  )
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

Document a dedicated compatible string for Exynos7870's pin controllers,
having 8 GPIO pin banks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index c3b82da0c4671aaa411540b13d861f4c4a9b81bc..de846085614166087ef9046cf5d154fb9dad8309 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -52,6 +52,7 @@ properties:
       - samsung,exynos5420-pinctrl
       - samsung,exynos5433-pinctrl
       - samsung,exynos7-pinctrl
+      - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl

-- 
2.48.1


