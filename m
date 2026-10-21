Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F758606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q4T1lIq0;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=IqhKyvlK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYPJKV6ncVk8Zsl1Bqc1Zv80DmTa8a6mXCW+pbyQVRY=; b=q4T1lIq0jGZVZsjksUcprN6a/k
	fhxzb53Ww1eHzSpwiuIDq0I5IWaKPBhgJh1jcRS940rLwxGSkIyqie8sKk2YNNi/6PZWdAJ4NMt/5
	+CqYPGXvoaIWAqj/V/ZasUY3gBOTpHI80i4ubx0UJPlFs6PgNZg9ijNqmuQRNVByPg9wC7yPM8ESV
	xV3wzOTtG+9ya4GmSslCyayu1onSRaYpDVXCf6YCM5BhBAwh1AzsQ8MmQjHsdjkhpdcJDnAzuXi4b
	pGI+Tx+oe+M63FVBHd+GciKC3zEeXEm/b8cZOPSTMH/wg7+eeezvx5F3cssbM9IiXKeQ5r0U8lvJo
	Vl/C+JgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWdn-0000000BzCX-3qGu;
	Wed, 21 Oct 2026 13:46:03 +0000
Received: from mx3.securetransport.de ([2a01:4f8:c0c:92be::1])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWdf-0000000Byxt-1si4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792590302;
	bh=TYPJKV6ncVk8Zsl1Bqc1Zv80DmTa8a6mXCW+pbyQVRY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=IqhKyvlKq3QxvQovUy793NIdVfJJw/FZqBdC1L2o/tf+t0nJTfwlx2kzgcXWoMXR4
	 t4PjOC88ZGEmtPFGqCwXeKXfBOhjp3EU3MAtYvaf/txY1Ax4EbdyehJWKQkjOr0DsM
	 +IJl3jRWJsTgzeEUPQIpShY70bPdGD3LvzyuEPOymd/4gkF9Lb+bIaTpwlmUOpIFlu
	 bNq+PwFNBA2zcGPH2j2kdybrcveL75nH3xwH3+PuO+a+BsD3Gz94gIEVV3UF7N7oHK
	 d7cBgpkZu56+Od1OHQuAlC7+Eqsnv8janyz/PlM1edhgmpRqk/BP2fom1drklyVQlZ
	 DPM0H6IwR2cCg==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
Date: Wed, 21 Oct 2026 15:44:35 +0200
Message-ID: <20261021134435.17350-2-cniedermaier@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_064556_934089_A7495EBA 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCB number of the maveo box isn't 525. Change the
number to the correct number, 625.

Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index eb0b91040110..bb82d97f9d84 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -6,7 +6,7 @@
  * DHCOM iMX6ULL variant:
  * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
  * DHCOR PCB number: 578-200 or newer
- * maveo box PCB number: 525-200 or newer
+ * maveo box PCB number: 625-200 or newer
  */
 
 /dts-v1/;
-- 
2.30.2


