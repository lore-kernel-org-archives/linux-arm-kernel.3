Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FF2CA5FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z44YXzKmyMtQgvTiaKGbV8un2m5fsA276LfQu7lOjC0=; b=c+nnEQ6NavF7hA1c+U5WetZ9Fq
	n8w12DOuS8IwyKkXBNZYT50fvR1r5dFscYwmocyiRMDOre+rKcMJpXpkq6Ogn6rXqK5WedLhWIuG/
	JpPj3kxrxMqNYas3L1MVlSKC0HDyjc8E8Vr+PdIvuenjX/iOccEpXeN5v4ekPt0aICA9vsubWP5xW
	FtyMbyHDkb48sXphJ9qlPT6I2SoqcdVaUW9VgUIW3/p9J9yZ5MxcbhbR6FSIjifsKVBDORvTm10gO
	MNnA87wAE/6HicB06wffso2eSf9yU6GqWG/JZKEsEX5pf+ZQW4ipix0NgjSKa1ilItX76nAs1hZnf
	LOX59Gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMAj-0000000EyRn-0jPg;
	Mon, 09 Feb 2026 07:59:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMAg-0000000EyQU-3uWz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 07:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACF4540A70;
	Mon,  9 Feb 2026 07:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80C45C116C6;
	Mon,  9 Feb 2026 07:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770623941;
	bh=EvZLo8yBPuNQ2ZWhWlIOFY5LAjRlRTBuCqsicIyWtNs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qZfUOlTnBdSEk5iVMZaxtqVbSDShf99WcsVyOJB1R3Spo6wkhqwHL1Bp7qYhmRe60
	 nn6V5EVP6IeO0DirysjrtX6BcoxPO6HwUkGm2bVwY1CGiWXjJbI3gJ3ZdoqQkC9oN+
	 StMtBgVJNamevWZ2eDjIjTc46vmKsg45faAF5zyytTndnfZSMvJyJcjwqZXIPLOUN4
	 3b5EpSsEj2AoERT3A6RCyoQbtkTINk7z9PK/jK7JwpcuE3zRoXzxlNQ8NIleOiYO0b
	 g9itA46W4LbnMaSFCtxsojx4dCRLdPALdZbB/ZNi3eira4KQ+4Wnap9WD/RA0V+uLn
	 uaWNy1gjmq5UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5436AEF0711;
	Mon,  9 Feb 2026 07:59:01 +0000 (UTC)
From: Dirk Chen via B4 Relay <devnull+dirkchen.amd.com@kernel.org>
Date: Mon, 09 Feb 2026 15:58:53 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com>
X-B4-Tracking: v=1; b=H4sIALyTiWkC/32NOw7CMBBErxJtzSLbmF8q7oFSrH/ERZzIjixQ5
 Luz5AA0I72R5s0GxefoC/TdBtnXWOKcGNShAztSenmMjhmUUBfBgUYjJbK0ELq1YIhvVOIagr/
 TyQgLPFyy53qXPgfmMZZ1zp/9o8pf+1dXJUp2Om2ElPp21g+a3NHOEwyttS/r+y4osgAAAA==
X-Change-ID: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dirk Chen <dirkchen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770623940; l=1517;
 i=dirkchen@amd.com; s=20260202; h=from:subject:message-id;
 bh=q1pvDHup26t2gWq6fHUSx5KhOyJaw4CQELJ2qKSf88g=;
 b=+d5clqSgm87rC1q9Ol08GoDm3+lw2SvRxI9fXdTjZLhpFf6cW2vjFrUdJO1WfZNI5XmE+g+Y/
 MM6fJ1mG6qvBV6X7Na2+2Ueg2+YOlKAL0bUl9n0YQWIk4i4HvpKoSGY
X-Developer-Key: i=dirkchen@amd.com; a=ed25519;
 pk=NBIyLsVg/YYtGLruq9XLdLWx2PP/1MH4jDDQ1V+7wes=
X-Endpoint-Received: by B4 Relay for dirkchen@amd.com/20260202 with
 auth_id=622
X-Original-From: Dirk Chen <dirkchen@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_235903_017482_2AFB7021 
X-CRM114-Status: UNSURE (   9.79  )
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
Reply-To: dirkchen@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dirk Chen <dirkchen@amd.com>

The Anacapa board features Atmel 24C2048 EEPROMs on i2c0 and i2c1, which
are used to store retimer configurations. Add the corresponding device
tree nodes to support these components.

Signed-off-by: Dirk Chen <dirkchen@amd.com>
---
Changes in v2:
- Improved commit description to clarify that the change reflects
  actual hardware as requested by the reviewer.
- Removed mentions of other platforms to avoid confusion.
- Link to v1: https://lore.kernel.org/r/20260202-b4-anacapa-dts-fix-v1-1-20d4b0114854@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..b8d248d99d7c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -328,6 +328,12 @@ i2c0mux0ch3: i2c@3 {
 			#size-cells = <0>;
 		};
 	};
+
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
 };
 
 // R Bridge Board
@@ -362,6 +368,12 @@ i2c1mux0ch3: i2c@3 {
 			#size-cells = <0>;
 		};
 	};
+
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
 };
 
 // MB - E1.S

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c

Best regards,
-- 
Dirk Chen <dirkchen@amd.com>



