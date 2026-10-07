Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26668CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SrZOwOpPGvr682qtQj7v10hg9Xb/9XHviTt5U6/kQE=; b=Xq0PkdZjoQ+4lzlzny0EUawS+1
	WEXoo2q1+G9pVME8VDIGCOwwkPKLYD8DVHQzb2xhIXxyPT0E0UOEjybCkw/6cFD40hmJ2p1Zys4c4
	1yS6gLRYCUNorCcTsJ5qSeXERWTpYMXMuZoTg5Vh1i5OWcgFN/qmcZI2PPUo9FU1PtKVZN65mUmna
	11I2P7D6SXTA4/H8vK8toHCUw9eJ6utkWl1lxksAsOVSU4/aZ1IAQ+8f7woh89U88NNoyfZNwPSF4
	DQMo2ImAE3c7vXA3ax86TsVgSVQ0vwOWgGXD+vWqS1eg9QbkXbrKViXuC1U3V/ZUbs08ghVgDsrpo
	1hFBsDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKuY-00000001l8I-17d0;
	Wed, 07 Oct 2026 06:13:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKuO-00000001kor-06mw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:13:45 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 Oct
 2026 14:13:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 Oct 2026 14:13:20 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 7 Oct 2026 14:13:26 +0800
Subject: [PATCH v5 9/9] MAINTAINERS: Step down as Aspeed AST2500 EDAC
 driver maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261007-edac-v5-9-5c31fc5df4cf@aspeedtech.com>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
In-Reply-To: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791353599; l=2899;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=bDs78TovOiEla5SjPmAGjuluwjR862LQa8Dvh1qFJ6U=;
 b=iJI5S86hmwv4qvKvUcIM3lFjKMoRFbkmbTC2kFDjUIulT0PBF8xF1sV49SVSv08vAZ9PmmVP+
 5Nm+nCS9sPIAUF/ABG/Z5sbzekLvbhwQ9gaP8Kk7CIUAeIc4goTPUz9
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_231344_086312_9008907C 
X-CRM114-Status: GOOD (  12.72  )
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

From: Stefan M Schaeckeler <sschaeck@cisco.com>

I am stepping down as a maintainer for drivers/edac/aspeed_edac.c and
Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml

Move my entry from the MAINTAINERS file to CREDITS to reflect my past
contributions.

[ ryan: keep the EDAC-AST2500 entry and list myself as its reviewer
  rather than removing it, and take over the binding's maintainers
  field ]

Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Link: https://lore.kernel.org/r/20260920225846.4039017-1-sschaeck@cisco.com

---
Changes in v5:
- Also hand over the maintainers field inside the binding, which
  get_maintainer.pl reads directly for .yaml files.

Changes in v4:
- Merge Stefan's step-down patch into this one, keeping the MAINTAINERS
  entry alive with a reviewer instead of removing it.

Changes in v3:
- New patch.
---
 CREDITS                                                           | 8 ++++++++
 .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml       | 2 +-
 MAINTAINERS                                                       | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 091412875a66..28e5b274bc28 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3655,6 +3655,14 @@ D: I2O kernel layer (config, block, core, pci, net). I2O disk support for LILO
 D: XScale (IOP, IXP) porting and other random ARM bits
 S: Portland, OR
 
+N: Stefan Schaeckeler
+E: sschaeck@cisco.com
+E: schaecsn@gmx.net
+D: Author and initial maintainer of the Aspeed AST2500 EDAC driver
+S: 2253 Anna Dr.
+S: Santa Clara, CA 95050
+S: USA
+
 N: Eric Schenk
 E: Eric.Schenk@dna.lth.se
 D: Random kernel debugging.
diff --git a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
index 685b6815f293..971d4c862fe7 100644
--- a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
+++ b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Aspeed BMC SoC SDRAM EDAC controller
 
 maintainers:
-  - Stefan Schaeckeler <sschaeck@cisco.com>
+  - Ryan Chen <ryan_chen@aspeedtech.com>
 
 description: >
   The Aspeed BMC SoCs support DDR memory with and without ECC (error
diff --git a/MAINTAINERS b/MAINTAINERS
index d413dac5c8b3..2001466fd6da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9283,7 +9283,7 @@ F:	Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-sdram-cont
 F:	drivers/edac/armada_xp_*
 
 EDAC-AST2500
-M:	Stefan Schaeckeler <sschaeck@cisco.com>
+R:	Ryan Chen <ryan_chen@aspeedtech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
 F:	drivers/edac/aspeed_edac.c

-- 
2.34.1


