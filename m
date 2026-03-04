Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814DFEFCE20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9JrfG5GMhOCAv3S1GDiIukCSAD/dZZMuTewgXlbWRmc=; b=CfrueYu2urZD2h
	Y5ZwC3HM4rKU4Gc3Ih/zZeam7hJ2OamLk+0l+q11pX5d6c8iuQI944CsRm0m+aTtEZG1LHfZrFdqD
	93JSoH+qLiFIuhcM1WZkk4l9Ooe9LeEvzTKwDeXD2xy+6KL3F2bxYX1QFUYmSyL/AEr+jy5U42BGZ
	ShMgkygutrK9RDWJ/CuAwPJgpCVW5wRJ1imtl9nodS+mD1xqRNHySgG3h9b5qfn8/gvc4Vu9lR8br
	+trqjy+OfnjwcZP0T7ohTCvcwgFGsywe3aTHfNiTpJ17jhxlVHOS3uK/l7Ml9W6Ud1ZbaUepfg7u/
	kwk4WsDSkOIVdiibtImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxq74-00000000Bzr-3bF9;
	Wed, 04 Mar 2026 17:34:22 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxq71-00000000Bxu-0NTK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:34:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 29B38267D8;
	Wed,  4 Mar 2026 18:27:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-M2zj95RpEZ; Wed,  4 Mar 2026 18:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772645219; bh=7tLoMyeDuZn2+6SCPZy95el7g5GbKi9JN66T+XQCQeg=;
	h=From:Subject:Date:To:Cc;
	b=GYMQKVXqst9CMNo7FOdSD+ezExMorKvnKYus9sRLMQinqvth8k4Nl0wriWaUahUbp
	 TXzfOw893Ks1c9Uu8eVnJz27M/rxsEPv16sG0iCuREjmMNHgcahgXDYsBUqQ7/F6X+
	 3L5s8IwKfjTtfNI73Nr6i7PqLJqviorDX9e56QXgE8oDmRqH8UsjBYEG06pDD/ghH5
	 +jmhGrKc3MkEUF52A0OdqEJCquIVjbVIPOkWQ7/VSZU5jile/b2y6r2e0efFvH3EEL
	 DpNcsN7ohSBBSz5MDK28JfkdOYLI31zKERI5JgGGR09mUavu47CfKiorSg+U8mu5yF
	 R/0HMc17UiBZQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add exynos7870-j5y17lte
Date: Wed, 04 Mar 2026 22:56:52 +0530
Message-Id: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFxrqGkC/x3MQQ5AMBBA0avIrDWZKi2uIhbFYERKWhEi7q6xf
 Iv/HwjkmQLUyQOeTg68uQiZJtDP1k0keIiGDDONCnNB1+22YEqDYiluadaDRJWjRWu17pSEWO6
 eRr7+a9O+7wdQZNvyZQAAAA==
X-Change-ID: 20260304-exynos7870-j5y17lte-940a0aa66b31
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Andras Sebok <sebokandris2009@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_093419_274616_0108375E 
X-CRM114-Status: UNSURE (   8.28  )
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

This series introduces the device tree for a new Samsung Exynos 7870                                                                                                 
device – Samsung Galaxy J5 (2017).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Andras Sebok (1):
      arm64: dts: exynos: add initial support for samsung-j5y17lte

Kaustabh Chakraborty (1):
      dt-bindings: arm: samsung: add compatible for samsung-j5y17lte

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts | 528 +++++++++++++++++++++
 3 files changed, 530 insertions(+)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-exynos7870-j5y17lte-940a0aa66b31

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


