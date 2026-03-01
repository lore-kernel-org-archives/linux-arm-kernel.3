Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A6FD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YY+xekhdVJW52itkHKARbbf+ZUuL7gL0RFcUCSQ6pI4=; b=Gu5ciiZDIh+X/odhf9Ye29Co/M
	Wrh+G2nDZoE69pvTyEcjUfRnxc2KNObLfl1AvXuDGhT01SySLsy4gxL+GHDBRIAyvBpsFh8IgHtf9
	crKM0aVOUdW+wNZLnCw9aBW0nLfxn4qSw55zeDLyzlbU0s7sOvRlwJhWaxDIxHY8Oc94aXdsn6QN6
	16ES8C8lFbSMnsLjQmFSWJD+Z0HhlRfyYxEiDoN8C8knZYcEZeALsTEsP8lVPVZuWyH0q7ekizqyj
	9hzv/E/76XmGEMavN/d9j4auMiNIxz+QkRK9v8tYgf7fdfxzdUBSLvn3B7vQUBTb2K9PyFgidw4tM
	Yqk1SALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVun-0000000AeRD-1eq8;
	Sun, 01 Mar 2026 01:48:13 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVum-0000000AeQq-0sau;
	Sun, 01 Mar 2026 01:48:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: nomadik: repair some kernel-doc comments
Date: Sat, 28 Feb 2026 17:48:11 -0800
Message-ID: <20260301014811.3133250-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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

Avoid these kernel-doc warnings by:
- adding short descriptions for enums
- using correct (matching) struct names in kernel-doc short descriptions
- using the correct struct member name for @nfunctions

Warning: include/linux/gpio/gpio-nomadik.h:116 missing initial short
 description on line: * enum prcm_gpiocr_reg_index
Warning: include/linux/gpio/gpio-nomadik.h:125 missing initial short
 description on line: * enum prcm_gpiocr_altcx_index
Warning: include/linux/gpio/gpio-nomadik.h:146 expecting prototype for
 struct prcm_gpio_altcx. Prototype was for struct prcm_gpiocr_altcx instead
Warning: include/linux/gpio/gpio-nomadik.h:156 expecting prototype for
 struct prcm_gpio_altcx_pin_desc. Prototype was for
 struct prcm_gpiocr_altcx_pin_desc instead
Warning: include/linux/gpio/gpio-nomadik.h:212 struct member 'nfunctions'
 not described in 'nmk_pinctrl_soc_data'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org

 include/linux/gpio/gpio-nomadik.h |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- linux-next-20260227.orig/include/linux/gpio/gpio-nomadik.h
+++ linux-next-20260227/include/linux/gpio/gpio-nomadik.h
@@ -114,8 +114,7 @@ struct nmk_gpio_chip {
 }
 
 /**
- * enum prcm_gpiocr_reg_index
- * Used to reference an PRCM GPIOCR register address.
+ * enum prcm_gpiocr_reg_index - Used to reference a PRCM GPIOCR register address.
  */
 enum prcm_gpiocr_reg_index {
 	PRCM_IDX_GPIOCR1,
@@ -123,8 +122,7 @@ enum prcm_gpiocr_reg_index {
 	PRCM_IDX_GPIOCR3
 };
 /**
- * enum prcm_gpiocr_altcx_index
- * Used to reference an Other alternate-C function.
+ * enum prcm_gpiocr_altcx_index - Used to reference an Other alternate-C function.
  */
 enum prcm_gpiocr_altcx_index {
 	PRCM_IDX_GPIOCR_ALTC1,
@@ -135,7 +133,7 @@ enum prcm_gpiocr_altcx_index {
 };
 
 /**
- * struct prcm_gpio_altcx - Other alternate-C function
+ * struct prcm_gpiocr_altcx - Other alternate-C function
  * @used: other alternate-C function availability
  * @reg_index: PRCM GPIOCR register index used to control the function
  * @control_bit: PRCM GPIOCR bit used to control the function
@@ -147,7 +145,7 @@ struct prcm_gpiocr_altcx {
 } __packed;
 
 /**
- * struct prcm_gpio_altcx_pin_desc - Other alternate-C pin
+ * struct prcm_gpiocr_altcx_pin_desc - Other alternate-C pin
  * @pin: The pin number
  * @altcx: array of other alternate-C[1-4] functions
  */
@@ -193,7 +191,7 @@ struct nmk_pingroup {
  *		numbering.
  * @npins:	The number of entries in @pins.
  * @functions:	The functions supported on this SoC.
- * @nfunction:	The number of entries in @functions.
+ * @nfunctions:	The number of entries in @functions.
  * @groups:	An array describing all pin groups the pin SoC supports.
  * @ngroups:	The number of entries in @groups.
  * @altcx_pins:	The pins that support Other alternate-C function on this SoC

