Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE19C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=711z7H/Mfv5T8ZZL5MDq4LXidXe9YLYpVhYpSRj2AKc=; b=Fo61QmiPlFFhDA
	ipTxPOrXOXnHCTsMBwl34tm9Ic5LFGEKlEzHm12krCGpGj8SA0pViGwGx2Oo6iifN6n0PRgUT99sE
	jJeq2+QCBU4XH4T+CusI7k8tpOtQkh9Kv3OTc1Nb+jKwX2SIVuUKC41YPLjHwSKyZnMirbS+ViU0F
	xwu6sGifjBzUuiC3RhKrOHw2Gl7hKl3RMzBfMTSUWCMga/mM3hnT7ssf2Q/se5uQHIEWCAcIh2xkZ
	f6y//zpEHflxzL526WvtCY5uwMxDmdJjN2RZWZA82klwV27+1glr//RtU7qTI62AjwFn0s5Rq2UMM
	MbsHA6QKKayI2bCojLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf38t-0000000GXVc-0Ujl;
	Mon, 03 Feb 2025 20:34:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf37Z-0000000GXHw-2D4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:32:43 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 62A4825BB1;
	Mon,  3 Feb 2025 21:32:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvAOHOSqMBCO; Mon,  3 Feb 2025 21:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614754; bh=NeQcw5rrhoA9bA5UTKSw3syXrmeuhQwUW7S3N0b3KQU=;
	h=From:Subject:Date:To:Cc;
	b=c2vTYrymOaujh4T/+OU36Wex/6DpyinJUMXrQdJrlb3eBEZXznX/U9L7WyEtTmfCK
	 lXXi1JNw1DXwcZyNGdZlC0BUSjymliMR5zBQnYclB60oyL5ulFwmyy13+txrHwYgzq
	 LRC3VGSaSUA5U5bZDT/R1T8h5xEFOn3lZlhFhGaK5fcRlwZPPUCtL1Gn1i3xA/59xN
	 zVL9DlhvD9mDrkLHrZn31kyTLTEt72Ze4xaknkyrMpO5vaLwf9rJiSKZuED2dtS4HR
	 bMGNk1o9ml6amOkO2n3GgEGUJCPR4UPkG1nvG44AUEoIm2Z+zrLTiMyXdInV2VTRVt
	 AnHZDiJkNta+A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add chip ID for Exynos7870 SoC
Date: Tue, 04 Feb 2025 02:02:18 +0530
Message-Id: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANInoWcC/x3MQQqAIBBA0avIrBPMLKurRAvRqWajohCFePek5
 Vv8XyBjIsywsgIJb8oUfEPfMbCX8Sdycs0ghRyFFAPH5/Uh61kLbi+K5LidDqnMYuZeOWhdTHj
 Q8z+3vdYP3D/ueWMAAAA=
X-Change-ID: 20250203-exynos7870-chipid-c6f24a9a814d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614748; l=669;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NeQcw5rrhoA9bA5UTKSw3syXrmeuhQwUW7S3N0b3KQU=;
 b=4fi2GlMBwPdxvLlv0ut4beRiUG8bQwm7b+MzOCl95ltxb58PjnrGf4Obu0Voao6rKyLMtzzPS
 myowzHHGdGtDd7V22l+Uek37yEL8AgeK9vMgDwGTDxH/1eVMpQdJyEl
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123241_711002_4D8349B7 
X-CRM114-Status: UNSURE (   7.87  )
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

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      soc: samsung: exynos-chipid: add support for exynos7870

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-chipid-c6f24a9a814d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


