Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD48C4453E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DvRcolxJFQZQro803cBP8dU4DY4mdGf3VxudjAxfQs=; b=Di17YVByQGLNMbQ/liv+fRkyqU
	I7j/yfWEQwxMEECjh7rrGSizIqIbDZ5TmSuepLJdNSKJ7Lkx39n76TnPIhKB9jLXYAlW6C7k/gN68
	o9oz81Q3zpPXDq4xRNM90pti+8OlLR9WtoHSCYQ0hfBsv7yvhf+y+oYiN+xXyAHxn9iYPuFWRj24M
	b24tRA4ZBzxUbhvqL/m6/CPDswbGgi1HmBTpv9H9D9PAZseoWQxOR5WxsoV8jwo29DEzrkuZWBgDp
	dZOclPGj+0mzEpN0cGnTI/791R6Cgi8Nxpc5a2B39r7BiXRU0jloTZz/yMF9KoeYA9txlopvd1PJN
	AXeuFR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm2L-0000000DTmw-3ij6;
	Thu, 23 Jul 2026 05:32:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm2C-0000000DTkR-0Jnh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:31:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 23 Jul
 2026 13:31:42 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 23 Jul 2026 13:31:42 +0800
From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Date: Thu, 23 Jul 2026 13:31:37 +0800
Subject: [PATCH RFC 1/2] dt-bindings: mfd: aspeed-lpc: Document lpcN alias
 for multi-instance SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260723-upstream_kcs_multiple_lpc-v1-1-d918b5270b86@aspeedtech.com>
References: <20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com>
In-Reply-To: <20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard
	<corey@minyard.net>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
	Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784784702; l=1505;
 i=yc_hsieh@aspeedtech.com; s=20260721; h=from:subject:message-id;
 bh=3fvCknCwajnOMYIUp1uHwU+nFkwRbCJkD6DOdmYgiUU=;
 b=54NDWFbpmjgTCayZVRksXExIbQ2rB7HOlCxNsWWxw8M7S7h+43hSKjtyzudtnvt8nN6bDg724
 36wWYyTZKN7BWGSuOe/vc5BmPefUhb24zUV6FnBQslj5WmsmhjEU5rM
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=7KnU2ozXGF2IATT+Hvu7RbRwPxBA3/b+zhfM+UsPJMs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_223153_737894_6B65AA8D 
X-CRM114-Status: UNSURE (   8.68  )
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

Some SoCs (e.g. AST2700) expose more than one physical LPC controller
instance. Downstream devices such as KCS channels need a stable,
globally-unique index derived from which LPC controller instance they
belong to, so document the "lpcN" alias convention on the LPC
controller node that lets DT authors assign a fixed index per
instance, mirroring the existing alias-based numbering convention used
by mmc/i2c/spi/serial.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
index cbc3a2485a2f..81c12e0fb312 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
@@ -35,6 +35,13 @@ description:
   configuration, therefore the host portion of the controller is exposed as a
   syscon as a means to arbitrate access.
 
+  On SoCs that expose more than one LPC controller instance, it is possible to
+  assign a fixed index to a given instance (and thus to downstream devices
+  such as KCS channels that must be uniquely identified system-wide) by
+  defining an "lpcN" alias for it in the /aliases device tree node. If no such
+  alias is present, the SoC is treated as having a single LPC controller
+  instance.
+
 properties:
   compatible:
     items:

-- 
2.34.1


