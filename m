Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C2D2FECD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/YiAtcCBz6Q4AWaDBeeB64E0Di3ngWVbFxM1ju6Hu0k=; b=VC6z+hNeGRbkJkY2lQmqg9jY+z
	FKfYbfSMrge9uHeBzyErlD4VMdM1mmrHCJPqd2yDbAoEx4T0s7EacM+GGl72Yq5Y3WWxqjWkuWhhu
	FP3zEwJjxrbV6FRtIVdTr7V0z72r5rIuqUxf9KRIF3/4c/Bti71Vb5ZwB8cbt+NruJhDNH4/CBl0c
	srVX92q3L4JfFKljk6uwbZIiKlTb6p2TRQhOTqSL2a9vD4k3Omw1g4DP6lVreP4Z1lPu3B4vhDK6f
	Akz1XomL1kMyYheqHmoDACPmcoYRT0LKhkJi0kLCxwPm3edZa9utF4tcmA8u6uYu00W6ecHzkYU/s
	0zfimbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknaF-0000000EnRa-01XQ;
	Tue, 27 Jan 2026 18:14:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknaC-0000000EnRB-3bIx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:14:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DF1D1515;
	Tue, 27 Jan 2026 10:14:22 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 393233F5CA;
	Tue, 27 Jan 2026 10:14:27 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 27 Jan 2026 18:14:13 +0000
Subject: [PATCH v2] stm class: Fix Kconfig symbols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-fix_stm_kconfig-v2-1-3c067e00f82e@arm.com>
X-B4-Tracking: v=1; b=H4sIAHQAeWkC/2WNywrCMBREf6XctZHeNA905X9IKTEm7UWSSFKKU
 vrvxoIrl2eYObNCcZlcgXOzQnYLFUqxAj80YCcTR8foXhl4yyVyVMzTayhzGB42RU8jM5p70Vq
 tkFuoq2d2tbIbr33licqc8ns/WPCb/lz6z7UgQyY79LdOaSHF6WJyONoUoN+27QNMEZ3OrAAAA
 A==
X-Change-ID: 20251216-fix_stm_kconfig-a72f40c7612c
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Clark <james.clark@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769537667; l=2151;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xrqHMLh+h7bTnHzxFrucYIU6jvgcxjDytBv9grxjLtw=;
 b=F4S1iXCK8hpgfWjS2PzpQd37/ljfUsDbMcr8LWKuuBFjmjd4luLA4GeklShfzjqFmkoMKgL1i
 SEZV/U6rAksB4UkFHCl9mmXP7RTPVwvzI5GvrWFZ7KcwaY8Ah63n3Fj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_101432_948386_FD7BA503 
X-CRM114-Status: GOOD (  11.60  )
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

Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
prefix for default values to work.

The STM_PROTO_SYS_T config is selected by default when STM is enabled.
However, its description currently says "If you don't know what this is,
say N," which contradicts the default behavior.  Update the description
to say "Y" to align with the default setting.

Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Updated STM_PROTO_BASIC description to align with default selection
  (James).
- Link to v1: https://lore.kernel.org/r/20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com
---
 drivers/hwtracing/stm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..8ab079785189052945521e9b0a93a0d458de37e0 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -13,7 +13,7 @@ if STM
 
 config STM_PROTO_BASIC
 	tristate "Basic STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is a simple framing protocol for sending data over STM
 	  devices. This was the protocol that the STM framework used
@@ -28,7 +28,7 @@ config STM_PROTO_BASIC
 
 config STM_PROTO_SYS_T
 	tristate "MIPI SyS-T STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is an implementation of MIPI SyS-T protocol to be used
 	  over the STP transport. In addition to the data payload, it
@@ -38,7 +38,7 @@ config STM_PROTO_SYS_T
 	  The receiving side must be able to decode this protocol in
 	  addition to the MIPI STP, in order to extract the data.
 
-	  If you don't know what this is, say N.
+	  If you don't know what this is, say Y.
 
 config STM_DUMMY
 	tristate "Dummy STM driver"

---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251216-fix_stm_kconfig-a72f40c7612c

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


