Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3531ACA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=djy6pEV1flbGKyTc0C6a/T2ViewaGMlSKIVHBckmb3w=; b=0UrX5zqaARqjSeeiYKkrTx+GWy
	GdxAfu2nZdfHkxtmAsO16H9H1gPP9ZAmq06HGMlHp59RstQeFmP3z+B80E+xpKOs4vRlbOwNe4llf
	C0hWuBsA8LRaiWwafKDgJGWIxvpy1p/x2Bv4JvntiRjnjlUtkLFc0fSO+tFYKQA/pdSwXRQNq5pbm
	QKKm3cPpYz9/BA86Bz4EXtFp9ibP/dmuyx1bxlBDuRUWH11TtnUJYV8UL40aR3YkRcxMwD0Uix8HY
	oWXNzSr1JdVw6Kkh29uS/EDn5Wrp2s7rFfYPXBck/LdQMauu7kFvjzSnx+VfvS9qt+MYQamxLfsvl
	nhn3yQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsk2-000000025tv-10K6;
	Sun, 14 Sep 2025 19:50:30 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsk0-000000025tY-1QoB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879426; x=1758138626;
	bh=djy6pEV1flbGKyTc0C6a/T2ViewaGMlSKIVHBckmb3w=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DHTV36n14DZl4xsfsOTb+RlOmen3czE2qa+1w/OwN0yI6tPyDRwPQIn15rSu3p014
	 TJ64u5yGCTKxVOa/uOGRUquba4m1y3FXcIllagNpMnViIQctoIqBqwhqJKcEpSHz/p
	 GK+4v7E8MJhdMUdfCzKbjEEo+GSbkQsImh1iN6XeBxzgNGhzkgagvJrozcahJlvrr8
	 SWeyqLzod90GsGXSTuNyTO3Ssaz6wjvYkW+LOUERjiLIpoBtS9e1MfyIQ+d4CXsBDz
	 ayohp43tk8DfJ2z2CPEB1sG95gFyxBdmC/VyqRADZlaXfoN2PrOT3zcCykgJVR1yzs
	 ESYOGmZUEZtJA==
Date: Sun, 14 Sep 2025 19:50:18 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 0/2] soc: samsung: Add chipid support for Exynos9610
Message-ID: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 39594e83b55310b1a79ccd91510238da2d85c4b4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_125028_532457_562C8738 
X-CRM114-Status: UNSURE (   5.60  )
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

This patchset enables support for chipid on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Alexandru Chimac (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
      soc: samsung: exynos-chipid: Add exynos9610 SoC support

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-chipid-b7c1600dbb92

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



