Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE93DCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYOnwGjU9FvWidAAprn3NnZ89m+Pt/3YnDA4zAbg1Tk=; b=Up/GwHAIKpQ8NBKXZbW4eM9/qM
	7Kkr9DGI998X+J5uLKQzg/1rN9jm4QxkPIkhOx0AL1EWA5E/eP8isf898OWNID9iCRCvRHjGtbgr3
	WihcIfyaQrWJGZZJP+6Bxd3KmoT04udlhOwpgZw05hCcZyJiEOFL+2tlmMlffn6Pvbe9JrY6ontzJ
	kakyDGVCM99vfXUPnEAoUyWUf5UsLgWiqTa2vstphgRnArt5/Ipe0Mi/w84cwNCOu+FsJbQKt9sGW
	UTHgKyp8iN0C+PIMzEJtkAr7FbP/+ZwO14MvOFargJ3BGJJJKyzdhpDV3f3URE+EZpU+hhS9hxL58
	KVhfaosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VR-00000006Gvw-3U4W;
	Fri, 09 Oct 2026 12:15:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VN-00000006GtF-25a5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:15:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BF8E60DC9;
	Fri,  9 Oct 2026 12:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A281F0089C;
	Fri,  9 Oct 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548116;
	bh=qYOnwGjU9FvWidAAprn3NnZ89m+Pt/3YnDA4zAbg1Tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WvP1gpYeIki1iYEbjU6ZR3nlyFVirOe7SqIq5+qI4bBLob4GIv55ZFGf1RoROqW2Z
	 wTliFrXrBuKvO9FbYsu9ptbE/PqESi1st9zxAWgcoKslhid8SirghaC1+UhxEUx4Vg
	 qw1XGbpEAaGUqTwIfwB4tLYCR0Jtc4wPSXvtCWb+3IH46rYO7gmt3Cl6PKz42qqics
	 v7XqGUYOBuQfMy/rPNjPdF7Pudn0m0ACg2b8vDQG263Jk8geJW6JH1crEQlp0Z8jMk
	 8bEUJAxld6ehXEIeU+3NLuv5hQcMjrOt/AG9bmbO/UFxLHV+siRghzH8/Zjsfrqyoz
	 3mBUtq40ZLRaA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 09 Oct 2026 14:15:06 +0200
Subject: [PATCH 3/3] dt-bindings: arm: Add the actual power domains on
 U8500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-3-5eb1b90bc35e@kernel.org>
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
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

This file has been left in an unfinished state just defining
the root power domain for the U8500 SoC. Fix it up by adding
the actual existing power domains in this SoC.

The PRCMU code and old regulator driver is mentioning some
*_RET domains, this means "retention" and is a state in the
domain and not a domain of its own.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 include/dt-bindings/arm/ux500_pm_domains.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
index 9d94801d8b89..f7a9fc101fb2 100644
--- a/include/dt-bindings/arm/ux500_pm_domains.h
+++ b/include/dt-bindings/arm/ux500_pm_domains.h
@@ -8,6 +8,21 @@
 #define _DT_BINDINGS_ARM_UX500_PM_DOMAINS_H
 
 #define DOMAIN_VAPE		0
+#define DOMAIN_VARM		1
+#define DOMAIN_VMODEM		2
+#define DOMAIN_VPLL		3
+#define DOMAIN_VSMPS1		4
+#define DOMAIN_VSMPS2		5
+#define DOMAIN_VSMPS3		6
+#define DOMAIN_VRF1		7
+#define DOMAIN_SVA_MMDSP	8
+#define DOMAIN_SVA_PIPE		9
+#define DOMAIN_SIA_MMDSP	10
+#define DOMAIN_SIA_PIPE		11
+#define DOMAIN_SGA		12
+#define DOMAIN_B2R2_MCDE	13
+#define DOMAIN_ESRAM_12		14
+#define DOMAIN_ESRAM_34		15
 
 
 #endif

-- 
2.55.0


