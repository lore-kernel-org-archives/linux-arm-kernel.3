Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A714D39430
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxtEjHG73DXZxNYMmv/PdwPbUpgvuCGGi2YCx+ba0dA=; b=UAa1bMXyjuOCcKmWu7XKjRNy8q
	FmubYmuZ1zotbx8vyGWYMBd93YTp8vIswgmPw7Q/yB7pDc7wEtcHyr2kJBmIirprfuSMEhvy1eeRe
	maT9bz1Z73arCeLmgkG9dsHiZowiBkz3EytBkng78+oPcILFHauG0abR0avU4A+aucHLxiJb9mouH
	MQOhHCmv/7gZCKPS8LgzQoqGR4d1qCbY/YjNG0oQmEwACmS3UIMqTptlVZDJDAOCFB76XsJQuVvYg
	gw1hO8bxGNETW5Eouhg1w/PwiAji4KKTcn2H9ETosw7wI9wQxoOz9sf+5hAfZETWXWL/3mO7iy5pQ
	3aqbjuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IhK-00000000F2K-2mZ0;
	Thu, 02 Apr 2026 14:07:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IhI-00000000F0T-1Rrx;
	Thu, 02 Apr 2026 14:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mxtEjHG73DXZxNYMmv/PdwPbUpgvuCGGi2YCx+ba0dA=; b=Bh6CtbMbMxMNKcMtNNLPcmUmaX
	HoCLukjul1Q7A8k2Hz8JDHVsNKbZ+k2MpA8WpooUNRjo106fX1cheCk19ww3jHcAsRCX605XNGf7d
	CWmRhNgrqeXC4pDWspMwe8VXU1kd+BelBLFjelDSGdwKHVvZNhhn2rMQPYYg9T3EYzUUZz228oA90
	kOdU1Mt8xqQsLDKWP5oEwh0laH9uZUi+GfpnDhLsNHZRcTDzbxF0Vw6w1WUmM+1PFvjTeanMfAq3D
	o1X7HSO5JvTGQ/5m2v64LVoDnXizqkLhTW2lrEPCICley03hBMwLA622bB799hxFEjRfJhyLFcDdA
	hiqLQhfg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IhF-00000002ctl-1qwS;
	Thu, 02 Apr 2026 14:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775138812;
	bh=As7/gVu1sJ+y6ys4Y3SKwdd1ZSGMxwdpofSGLrL/FaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LX3jvb0p6JCmd2NTfa2tsvkqCOq71dyjBav4oMr73Ki45+G8rhNIosQGZ9b2pZoi2
	 H8w+Th1PaIauWvjegWhSU+3LtO+FTbIG5y5ARFQESdDeY6o+fk7eufG6E9xQo3y/Zt
	 cAM/dfkoRW/ZQb9lB1B1wdSSZC9EYNE2ea4D1yZucdW9SK+527M7BJdUlpC4DRT5UZ
	 OICnWDB43EgnCW3OqVD6L0guSfkU7FsNbV7ygiUfAdDOMWnGl75Nd/fCXs8jdJrm0K
	 L6vkhEmxY6TlQOcmuEcIeOARNgfiyqIeELEA7sgKoBgsyWR/Yrkcstp7aOFUj9x9U9
	 jFkTE4jPOqoLA==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1AAE17E7828;
	Thu,  2 Apr 2026 16:06:50 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 02 Apr 2026 10:06:36 -0400
Subject: [PATCH v3 1/4] media: rkvdec: Introduce a global bitwriter helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-rkvdec-use-bitwriter-v3-1-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_150657_628140_04AAE304 
X-CRM114-Status: GOOD (  13.88  )
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

The use of structures with bitfields is good when the values are
somewhat aligned.
More mis-alignement means that compilers need to do more gymanstics
to edit the fields values.

Some cases have been reported with CLang on specific architectures
like armhf and hexagon, where the compiler would allocate a bigger
local stack than needed or even completely freeze during compilation.

Some fixes have been provided to ease the issues, but the real fix
here is to use a bitwriter instead of heavily unaligned bitfields.

This is a preparation commit to provide a global bitwriter interface
for the whole driver.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
new file mode 100644
index 000000000000..2a5c271ade91
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Video Decoder bit writer
+ *
+ * Copyright (C) 2026 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#ifndef RKVDEC_BIT_WRITER_H_
+#define RKVDEC_BIT_WRITER_H_
+
+#include <linux/types.h>
+#include <linux/bits.h>
+
+struct rkvdec_bw_field {
+	u16 offset;
+	u8 len;
+};
+
+#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len })
+
+static inline void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 value)
+{
+	u8 bit = field.offset % 32;
+	u16 word = field.offset / 32;
+	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
+	u64 val = ((u64)value << bit) & mask;
+
+	buf[word] &= ~mask;
+	buf[word] |= val;
+	if (bit + field.len > 32) {
+		buf[word + 1] &= ~(mask >> 32);
+		buf[word + 1] |= val >> 32;
+	}
+}
+
+#endif /* RKVDEC_BIT_WRITER_H_ */

-- 
2.53.0


