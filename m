Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F6EE498F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMmJ+VF5kiGjNL1w3rtAJ8g38qm6yKCedjvxvJiNzic=; b=itnoBpJKXNtjhVhQuohYYD0YeD
	b8wMA6+etA78kO248lryl1gWmtu9SfRE/JrD76XJqo3yRG6c4XUIZuZ8oYXbiFTiMv1GMoaQ5ovEj
	dZlq6YIdHGGGY2L4yXIYipM+iI0cPiVhjd3kAMtSHtsmvsFUnE+K7ItWhHJg+5fc5WGSL61xUnQUl
	sRnXdd7gEXaFH/TfOMxl7J2gElGDLOZdl/lc3IQGE1jqOhVWXjq3nENyMHSnECdfAU+SDKfBQ5UHt
	Bdigq3v1bt+QXCkQ6q27NfFyXZpfO/y74HUgF7V9Zl3Gavu4WQH/n0DEd2SBTHmtRkf600KMi4Zgc
	4kbcU0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadPG-000000056wY-42j1;
	Tue, 30 Dec 2025 17:21:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadOy-000000056pU-23cr;
	Tue, 30 Dec 2025 17:21:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D331424;
	Tue, 30 Dec 2025 09:20:45 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 188953F63F;
	Tue, 30 Dec 2025 09:20:49 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de,
	neil.armstrong@linaro.org,
	dianders@chromium.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: jesszhan0024@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: panel: Move FriendlyElec HD702E to eDP
Date: Tue, 30 Dec 2025 17:20:31 +0000
Message-Id: <80a68e706e869aadbdea228b207a5df52bbfd7b2.1767111807.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_092058_884409_99F1E95F 
X-CRM114-Status: UNSURE (   7.60  )
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

The "E" alludes to the fact that FriendlyElec's HD702E is actually an
eDP panel - move its compatible to the appropriate binding doc.

Cc: <devicetree@vger.kernel.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
index b308047c1edf..afe7dc54ebf4 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
@@ -44,6 +44,8 @@ properties:
       - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
+        # FriendlyELEC HD702E 800x1280 LCD panel
+      - friendlyarm,hd702e
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
       - innolux,n116bca-ea1
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 24e277b19094..a01cf025aad1 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -144,8 +144,6 @@ properties:
       - foxlink,fl500wvr00-a0t
         # Frida FRD350H54004 3.5" QVGA TFT LCD panel
       - frida,frd350h54004
-        # FriendlyELEC HD702E 800x1280 LCD panel
-      - friendlyarm,hd702e
         # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-- 
2.34.1


