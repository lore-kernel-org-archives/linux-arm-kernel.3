Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21863D715F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=919og2fZuu9Xn7/z4LBKHVXp+rLjhtsx2gvRnst0I+o=; b=EKVHVcnDpn5/hPmF5t3EH/VNIL
	JpWNdcT+15ZBXVBWqqBH8Gbv1bt4CCUavvsgGDW2qFX+XXoW3lIedJqboE8nTIUXA4tqypfB0yvrD
	2Xu/TW/uiy2I5kYeQCaEPbgG7oUvBGgzmksbfaI/gMOrpCqR+pqvJuaIzPW9PKSJoMp6reimfkIPz
	FCKf1dwb/qR6P5vy5NKZpWUP5ygN2+cMqoaD14q3FFm+iCPYOHOp2Ph1ndrijgCXJQz+z3Q1QWRZL
	v4MbuDCR3hofWpDIOR+dVJLeF6H9m4El3pKx+GRZsySR+loBcUcT4CyayCcWVGzkgI8n4hAghDdBb
	9EgP5Jzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjjv4-0000000AUsV-2Lmp;
	Sat, 24 Jan 2026 20:07:42 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjjv0-0000000AUrJ-0Itj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 20:07:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C237727E02;
	Sat, 24 Jan 2026 21:07:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ1Il6ZpQfLY; Sat, 24 Jan 2026 21:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1769285255; bh=6WLysDQHDS/NxD9rZS9oYzGmPdkPu5Wzpeu6uK+5x3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c8AaXmjzlqAjce+Pc7UMyIThC+BzxvNVoKnACoNNoHWIHkFOI1E5XiLl/xbp4T1iA
	 xWMTzg8UnP1Zgb2FLcgV6s4JD/pUlDs3IOzzx89Wpq/Z8d1bMai5BWgGsFRxhptbb3
	 MGB7/1AJaIbufCPvJvVAZ/bqi2K9iZEezwFSpdjCYpjOhQIGj0OYJdFdZw34wRNo8T
	 t/mfF6wYMir/kkDPvs2bi8wBx5T9vTrSfN4rIwvAvOA1W9lB+OBLUvTiN0O/pzKUWu
	 JVefdZzNHFVIAiBYK8nOkgNTmR0orktCUlzZXR6MPIPkieNAJLDEP1UTsrYi2B+oJC
	 JiatpJZpeXApw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 25 Jan 2026 01:35:26 +0530
Subject: [PATCH 1/2] dt-bindings: arm: samsung: add compatible for
 samsung-j7xelte
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-exynos7870-j7xelte-v1-1-5cacc3042c42@disroot.org>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
In-Reply-To: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_120738_313006_102DDB03 
X-CRM114-Status: UNSURE (   8.45  )
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

Document the board compatible for Samsung Galaxy J7 (2016), an
Exynos7870 device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index f8e20e602c205..711824c0dd7e3 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -217,6 +217,7 @@ properties:
           - enum:
               - samsung,a2corelte               # Samsung Galaxy A2 Core
               - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,j7xelte                 # Samsung Galaxy J7 (2016)
               - samsung,on7xelte                # Samsung Galaxy J7 Prime
           - const: samsung,exynos7870
 

-- 
2.52.0


