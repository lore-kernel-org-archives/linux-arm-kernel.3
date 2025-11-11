Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787FBCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 06:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9FvSxcETb6qmgterhtVgRWeeCLevVfNPooXzwD8lXTQ=; b=bGzdYQMwbjl+yPUGBmo58gKUH2
	KfOtaW3elIecvFwWFpdXvoQYTVyL2STuyNf5J6099hPVcIKpZeKQE8JQTtlS8Z7tf+bTn00nEXyHd
	GjzAvow1df/kuHYUvkArVu2vabNG1P5flMUZvpWIMjxMY7ZsWcrdTqcYPrMIuIOg461GI+HvVo070
	d0jZ9ByfT3Tw8gexpFcyQ0UDcaA/xagCryCQDNFnMoxegpJhUGR3Yp3lb5raSajIx14X5Zpyl/hb5
	4kKbT44qIVX0wvYlnLMsiiOB2So1eBOVAhhxmJhmi9oU9Ohoge2oX7P51dVJfIvsYfUk8jiFXluyi
	lXniu77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhSI-00000006aaw-3Mbt;
	Tue, 11 Nov 2025 06:02:14 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhSH-00000006aaj-0cs8;
	Tue, 11 Nov 2025 06:02:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] efi: stmm: fix kernel-doc "bad line" warnings
Date: Mon, 10 Nov 2025 22:02:12 -0800
Message-ID: <20251111060212.1963608-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a beginning " *" to each line to avoid kernel-doc warnings:

Warning: drivers/firmware/efi/stmm/mm_communication.h:34 bad line: 
Warning: drivers/firmware/efi/stmm/mm_communication.h:113 bad line: 
Warning: drivers/firmware/efi/stmm/mm_communication.h:130 bad line: 

Fixes: c44b6be62e8d ("efi: Add tee-based EFI variable driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
---
 drivers/firmware/efi/stmm/mm_communication.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20251107.orig/drivers/firmware/efi/stmm/mm_communication.h
+++ linux-next-20251107/drivers/firmware/efi/stmm/mm_communication.h
@@ -32,7 +32,7 @@
 
 /**
  * struct efi_mm_communicate_header - Header used for SMM variable communication
-
+ *
  * @header_guid:  header use for disambiguation of content
  * @message_len:  length of the message. Does not include the size of the
  *                header
@@ -111,7 +111,7 @@ struct efi_mm_communicate_header {
 
 /**
  * struct smm_variable_communicate_header - Used for SMM variable communication
-
+ *
  * @function:     function to call in Smm.
  * @ret_status:   return status
  * @data:         payload
@@ -128,7 +128,7 @@ struct smm_variable_communicate_header {
 /**
  * struct smm_variable_access - Used to communicate with StMM by
  *                              SetVariable and GetVariable.
-
+ *
  * @guid:         vendor GUID
  * @data_size:    size of EFI variable data
  * @name_size:    size of EFI name

