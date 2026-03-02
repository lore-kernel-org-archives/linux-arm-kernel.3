Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C679E9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1/TjmwHedDtrfLCZnf/MqwzwbjWJVuijsZEID1LLZo=; b=BuD5hzcmk3XefpC2otFDEms/j4
	vtTqByFp+t/OdTkYg2g+G3EhZ+ey0lwIjSn/PvIhQEEUCghKxdyWwvj2ucF91wd1kBlxqz3xb0E8T
	BGYnwcQtD8D1kg30itg+epJ94LO0UFymY6BKg0eQi/ltXcw/hvxlBwUWEel8338YFzIeXxyZlLe3y
	gHVIm1g+LwqRUJIDL3Esg867Lluh9Ero7EOoYpLFHwhOwM3ioVI56yVDadm0G71fx8eN2GlADOr+H
	H8m8vQCvF2r3+Jv0sRXRl62K5cJaSLptQdgENOSIv5sbfZuBg7C/TF2QUHWwYmBmDUG+E0euToGwN
	Vq4RDMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2M8-0000000CxCO-3Cmn;
	Mon, 02 Mar 2026 12:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Li-0000000CwP1-3nEi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EE1241AA2;
	Mon,  2 Mar 2026 12:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66474C2BCB4;
	Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454370;
	bh=muNQEGPiM0J5Z3fR8UE87fSFRuBeMgXK4p4PO32Eoag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxBWpeWYB66i9HHzyo0YVHfcJm0p4FOpByMvmykrCeE1D8zOIz3yD7ogMjCdsTYLR
	 xokj33qW/Ci056eU57dycdPjR7s26DvF+Ki5CKYdNLtHveU+I5Ou/bRZtbZwdNEs/Z
	 Dnb1e3JF+gPj6A3daLCJ4w3JzX3y3ZfxVEZjMvrm8rfhLZPSF0f3AweBo8zHb1tNXS
	 CiBKhUuGuArt+rZA2a5FlpakfSkOgKVYZxY0uq2jQiE2OmC9gJ/LyAe01PZtCcno5l
	 ZW/78NImX8qPB1tbavFCrBECbdCFlwonDvJ8E5aNIshpD+OQda4vRzB7DYw0NAW0GB
	 WU2RKZRRiJQ2A==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/7] dt-bindings: mfd: sl28cpld: Drop sa67mcu compatible
Date: Mon,  2 Mar 2026 13:24:48 +0100
Message-ID: <20260302122540.1377444-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042611_036272_71338630 
X-CRM114-Status: UNSURE (   9.90  )
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

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit a598ae45f48d ("dt-bindings: mfd:
sl28cpld: Add sa67mcu compatible").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/embedded-controller/kontron,sl28cpld.yaml     | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
index a77e67f6cb82..0b752f3baaa9 100644
--- a/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
@@ -16,12 +16,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67mcu
-          - const: kontron,sl28cpld
-      - const: kontron,sl28cpld
+    const: kontron,sl28cpld
 
   reg:
     description:
-- 
2.47.3


