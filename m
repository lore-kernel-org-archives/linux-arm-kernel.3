Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B74F9B602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNeBbIqYIqxlRsKdVhiR6F22VabQkzDog8hf9Yzq+G4=; b=BYiQvAGqyxQj4ZuxFwnkSdUy4g
	4F5mHdtS0MPLwg6eKFhe+myuIbW18SWm6AUZbxKQxLDWGVSnhgXS/XTIQ8w4yZ+3QU1u1yY4armDP
	8ELHoAKvX7NlyOFRqni3gYdhrqt0Lnyf0SdhRN/WdEItkV9CmavP7B3o4/VevmfO3cm4oGS42zTT2
	CmdFqNrgzH/y/3GVhLBkmhnSozgkhLhXfRbHzHIswgl3erKEFR0ZtMNrclFiq94Trz98FTREpTl3b
	+9zBHycsqclaE7l/6pgotM7NrBPHSM3CP+uKbocMMOHw+5cFvxKQxgnnh9K8WLOH6wlsbUC4c2lKM
	EBD9aYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUN7-00000009uCW-0zK4;
	Wed, 22 Apr 2026 09:59:53 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUN4-00000009uB6-1izv;
	Wed, 22 Apr 2026 09:59:52 +0000
Received: from surface-pro-5 (77.119.189.253.wireless.dyn.drei.com [77.119.189.253])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63M9xVO43161132
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 11:59:39 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63M9xVO43161132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776851980;
	bh=kNeBbIqYIqxlRsKdVhiR6F22VabQkzDog8hf9Yzq+G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpSd64SBVkcOAdrNcX2umDMV722PvBB5QXCdtQgFTNOZlBmFWHMfQbOmzluXTqhcW
	 ycXcjdw8NgcBjDfGil7+s4ZrllQ+1bpfHrHLKcfEI9Uf6Lf6/csKXCt/OjyZ3Am4+0
	 sPSVk8Kd+mD+AB86WY6clnZmf4z0frCuVPiTJ0DI=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: amlogic: add support for Amediatech X98Q
Date: Wed, 22 Apr 2026 11:58:39 +0200
Message-ID: <20260422095840.26139-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_025951_056539_4CF15BC8 
X-CRM114-Status: UNSURE (   7.06  )
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

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Add the board binding for the Amediatech X98Q TV box.

Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a885278bc4e2..c0167fbc310a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -248,6 +248,13 @@ properties:
           - const: amlogic,s805x2
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905W2 SoC
+        items:
+          - enum:
+              - amediatech,x98q
+          - const: amlogic,s905w2
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic Meson S4 S905Y4 SoC
         items:
           - enum:
-- 
2.53.0


