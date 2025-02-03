Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD74C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRf7/gxcUrMFZG7Gu3Jr7wpSUOhn76rk/VFig5eqqcc=; b=2MCvwfX2HoOO7sNkGdGyAlMOGd
	rc0PR9v8ckZB+fJCTzq1bLuHcHPqjls0dM9X5JnN28tZDzJvF7rdtpub8cn7EakMjLRvMsKxh0ceK
	sBRztU2GOu2u8x16euGIygReNfOJoBa/glWuGPGEY4UXHn1Dmpqa/ym/BZDupk570gQK5vjam7fXZ
	RGDmeTu+BCoSCvfqMahx4PXtOItK4EeUnqCawp1xXRPibInPhfWjgCmgre/+4qufJhP+PVLVxb/hg
	OEQjHdtjpslVXTnYktr/ZYDQUpQ0X/Hjun6EeTmNQdZuNsRr7kVxOUkR2o/1bJLSxsVw2PCwoC58v
	3THYDIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Zy-0000000GbdL-2rGV;
	Mon, 03 Feb 2025 21:02:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Dw-0000000GYZV-1Dii
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:39:17 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A5BF925BE3;
	Mon,  3 Feb 2025 21:39:14 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IP7yUFp_xi-K; Mon,  3 Feb 2025 21:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615153; bh=EzyYoUZps3zDjCcM6n577kaxIQx3hsLmnb8iBzOF4mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XsDdfqFulOHI6M/PHcABgbYQ3SwrwoGhTshDD5stfM3SdzNfJbgl/3G0eo+SLh0Av
	 rFMs9amYmUbKR+0+RgV0WIdVYN+A3cNLNdIF0w9QR2jNYvjo0uIC+EZ4qXjXs2JKHv
	 Zbh+6RhWNL4D2Bw1661OR/g1wRHix0p4DUdjSxaeDAaJdPBDb8FE0/PVrBkUlMxUVC
	 /ByKRg8eI9XM5xFlbg4r6M+cSsDTXfSt1qlNaMSoapt9EsczkZ95qlmekPI7D/wlsi
	 ywPJ38FaDHlvd3B8KZn7d78f9XKdMLzcfwkTyDd1aetLpUebhNuVKJVO2hehensIkR
	 xyKeHQ8DeR/hg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:08:45 +0530
Subject: [PATCH 1/2] dt-bindings: serial: samsung: add exynos7870-uart
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-uart-v1-1-06be6aa96284@disroot.org>
References: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
In-Reply-To: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615135; l=1217;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=EzyYoUZps3zDjCcM6n577kaxIQx3hsLmnb8iBzOF4mg=;
 b=P9dF4R9Ip6IzJ0/AQCOHBV+sLHek/IaozMBORHpLkVhVYEa3MDZTC5084SwGH7gcBEZqwQNYx
 eEtFShn/p4fC40WE8S/qJVbJdqtXEHaWaa5gIlPjTlKSwn41ObfhTr0
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123916_466744_7377F38C 
X-CRM114-Status: UNSURE (   9.41  )
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

Document the compatible string for Exynos7870's UART driver. The devicetree
property samsung,uart-fifosize must be mandatory, as the driver enquires about
the FIFO sizes.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 070eba9f19d3e039090c58a82f93d02eed58ab84..e4387d504407778ffddabeb674c51c984a1179b7 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
           - samsung,exynos5433-uart
+          - samsung,exynos7870-uart
           - samsung,exynos850-uart
           - samsung,exynos8895-uart
       - items:
@@ -161,6 +162,7 @@ allOf:
           contains:
             enum:
               - google,gs101-uart
+              - samsung,exynos7870-uart
               - samsung,exynos8895-uart
     then:
       required:

-- 
2.48.1


