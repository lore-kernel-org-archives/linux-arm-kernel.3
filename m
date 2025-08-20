Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA624CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQEkHOyQLuDAg4Xeifbm5M7LooZ2bfc8B8NoecbY20E=; b=hhXiInkDqZqeM6/KE1CoIKlN7f
	d3+EDcr7DEPolXx8AV5nmTqS/i6FBbaCDcLN+SC19rY8hh8pc6Xg4Jcxsne/UbIP2VvwMxbt4gXWM
	1TdtOEHXABLaamzK52LVT3epNMklLu3rNRS7XrXf5RzdWgF+SM38zi/I1QzXxI1yfAq10JNoHt7mY
	ruBo/1SbSIS7l8dYqseFC/S5nPgfl+Tns83mS0jJQZbZQQ7/rrYN02n7v4ObOmBUk/TSufCD6QPGc
	5Q+yYLgwaAN9h4bEcg45+b+0N4QfPDC4DIInN1rkUmIpPCyxN3rWEfbiV+O25gSTF3aEAQ25/hGDd
	46FiIL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiw6-0000000Dnwr-3GTQ;
	Wed, 20 Aug 2025 13:33:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiOc-0000000Dgo0-0l5W;
	Wed, 20 Aug 2025 12:58:31 +0000
Received: from [192.168.1.106] (mob-5-90-62-213.net.vodafone.it [5.90.62.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8F373026;
	Wed, 20 Aug 2025 14:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755694650;
	bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e1BukG0tYfkM3lRLUHrDsbCTSahvEvBtyBbU7mckS7GIkXfx3ZQlcFBLUD3J+A6PC
	 jkJDVCsU/k0Dd7F89H7jS0AJXFgyBGEIgOZ146LQEsiLvmLKui0pgVWhlyVcF9yYX0
	 n4pcBUeGp4KgeYSX3geAX/0+WXOy9y2ENE8+1MQU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 20 Aug 2025 14:58:16 +0200
Subject: [PATCH v4 8/8] media: Documentation: kapi: Add v4l2 extensible
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-extensible-parameters-validation-v4-8-30fe5a99cb1f@ideasonboard.com>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
In-Reply-To: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopcZskzivZR+rstQ6ZEBhq5EPSPtUaFVxobfis
 8Qf+PkD/oWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKXGbAAKCRByNAaPFqFW
 PAZ9D/4kVXCo8Hv5ncIvy3/X087jo4tqzDhadOx79YQEIaCoVBJ2iJxdtBTlAAIPNozNZX/pu7f
 eIHC7bg31mHF5a5fuS0TW1j3ErTIbBi0Q3nqe262wheNOyl/ddTF0s5iO5t23lx/m4kYRMrQ9AZ
 eaxy7Xcqy72cFd2G4SC/CRO7bQise+UDRzZLeaK7phcd6gSHxymgaDz2etI5v6HGXmr2ajuQxOf
 7x1NAMI/0zakOccNSO2NBIFw1kOoyAdYha/SU6NK8zEiiT2XCfIxN0s4UZiDiMgkHck70JmCO8z
 aa5qzzPL6lNidsrxa1w+Mzv6EeU5o1HlgjWSh29eXLBo0nyxheBNK6pw6fNKWowtZFbVqff/PYN
 uCLBYYgFmIjWkNwjB6FnsnIl9HAVQI9JpzzJjky+h30TVUtgf0rPaC6Ont3zn+/dURZ3JH4AaU8
 P2eX1M4icOReKSSj6k0OkVa7eZ3gme9nfAUPegKQwf5FBUbT4Sz2OBDSsMtUpw5fktVBU9Ueest
 o+uV6rvaJp2JAuQ51Cs2PtlMV9gUuS5XnxFpbShxmys9ExYDC5Uu42VJg2ese6xqwNrgQ9yyTcX
 dhbfPphYVCM8IWaMvPGN11jWrkFSIYfJBnUizezc7zKuSPBJYqruS12JLl86pO0KYAhcc9QBqJ1
 T/j1r5lA0PoI7RA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_055830_352396_21F40083 
X-CRM114-Status: GOOD (  11.54  )
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

Add to the driver-api documentation the v4l2-params.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst   | 1 +
 Documentation/driver-api/media/v4l2-params.rst | 5 +++++
 MAINTAINERS                                    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..2d7793298c6a2046bdd59b185a411e092b659d52 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-params
diff --git a/Documentation/driver-api/media/v4l2-params.rst b/Documentation/driver-api/media/v4l2-params.rst
new file mode 100644
index 0000000000000000000000000000000000000000..8d2a5f004d21dfc3a81255cabbc6b7cce588db71
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-params.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 extensible parameters kAPI
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+.. kernel-doc:: include/media/v4l2-params.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 008f984c0769691f6ddec8d8f0f461fde056ddb3..44598a823f084e98a9b2d2e21881665d1ab64908 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26384,6 +26384,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-params.rst
 F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	drivers/media/v4l2-core/v4l2-params.c
 F:	include/media/v4l2-params.h

-- 
2.50.1


