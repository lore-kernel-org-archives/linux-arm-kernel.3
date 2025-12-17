Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8584FD65522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BgdUX1elYh3AKogD+JpHpqQx0eOl6om4bEFsKqtnnM=; b=aH7aCkmpYeO1AbuADMG4LOLAk7
	oTvbmnOy9oIQobl/F91WyHeluDdMQRSsKOnyTc8fAHwQgCpSVViu117OcY+q0zC5m0Lti1HhSCY+l
	GyqcPKeKrfsPXBb7TZq/lEDJL1u3MdhLuK4qQ1coKfCWW0BWJfc4+sTaeH6vzKuOJy80n2ndAZ5Se
	B9mx1BT9uHwz+ViuBEo6agA0rESo9WZooJ8tQ/HwbiLyVChm+UlAz2n+rGFD0eHJ6VtvwgUPimkcu
	iiewR0Oj2PqsnlLSov5M+fuconKPPSS5bp3md2Hnx664ogrTYJNOj/BRV1FR2vEDAPOTPhWob1lMh
	LmD3kveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVo0P-00000006S9M-3BY9;
	Wed, 17 Dec 2025 09:39:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVo0N-00000006S8r-0mfX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:39:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66EDC14BF;
	Wed, 17 Dec 2025 01:39:26 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E6813F73B;
	Wed, 17 Dec 2025 01:39:32 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 17 Dec 2025 09:39:20 +0000
Subject: [PATCH] stm class: Fix Kconfig symbols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
X-B4-Tracking: v=1; b=H4sIAEd6QmkC/x2MQQqAIBAAvyJ7TsilFPpKhIittUQWGhGEf086D
 szMC5kSU4ZBvJDo5sxHrKAaAX51cSHJc2XAFnuFSsvAj83Xbjd/xMCLdAZD13qjFXqo1ZmoKv9
 xnEr5AJLfheBhAAAA
X-Change-ID: 20251216-fix_stm_kconfig-a72f40c7612c
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765964372; l=1374;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hBD8idWBRc98CcgVCOVQqftAkyoPzpkmw9z9fattHZ0=;
 b=1AiX7Sr/THMt4LwAMI+UhY6kuUfv8AHTxTP/iXxTyTdpgGrgErjqtHdTKMEIrPIS8uMSj7tkO
 KgKwB/n9Q7TB1VoxdhfWBDZG7dt09Ii7PycevFnmGrIe+TWVsuJ4CSt
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_013935_271974_55A70AD9 
X-CRM114-Status: UNSURE (   9.80  )
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

Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
prefix for default values to work.

Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/stm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..cd7f0b0f3fbebc74775d8835187e49e5bd21d646 100644
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

---
base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
change-id: 20251216-fix_stm_kconfig-a72f40c7612c

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


