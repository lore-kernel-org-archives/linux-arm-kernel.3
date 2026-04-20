Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80059FC72A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 06:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugrejw/BFGpRqCO3FFz5D7BECiapNiJDFJdcWMeJfzE=; b=S55TdxOSK0p+N8wTD13AjEgMC3
	lDFrQoXFqY48xEwWnid/duCRGdOQ1U+Hem4nw3DkNCmGyDCH+hWD8nCoMQmhtFrhczaYzEM3ojGvH
	v9+MM5XBo8RKz7cOHvZoEEDZokDHshUMPSwnmvTY9zw6aBQ6ZmsjSXZ9ASQzQnvgWu73UoLsVO83q
	SJESo3N93AFlDx5i2X9AfyGP6UI2hBO4jdjemaIM9J/3EXwXiQMc5UZi8HbPN4Y5XPm5SEUaPupHx
	OzbRvL7dWorphe7594ii6KaUTLHV2/Ow0WU/eCco6nqsns1bkEl+64SeDi8PCQQ0qeiNjiyALG1vf
	CkehSsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhye-00000006Tpi-0TgQ;
	Mon, 20 Apr 2026 06:19:24 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyY-00000006Tni-3Cy7;
	Mon, 20 Apr 2026 06:19:21 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63K6Ito81297669
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 08:19:00 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63K6Ito81297669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776665940;
	bh=Ugrejw/BFGpRqCO3FFz5D7BECiapNiJDFJdcWMeJfzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rBodRtbDxa7ddHesEZcPOqXn2tzk8H/5ri5DB0UhAxBAo9p1+3pPt0bCSZgxA5Q+/
	 30epiv5tvBOTJs/PSrRL7uFN2kZpW9wPfvkSEza5ikAgC5FXTBKOijk/N83agXxIAu
	 gzMuPzoueHPnboMlMprHKmSWO5nGek3A/uPQf27Q=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        funderscore@postmarketos.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        christian.koever-draxl@student.uibk.ac.at
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add X98Q compatible
Date: Mon, 20 Apr 2026 08:18:53 +0200
Message-ID: <20260420061854.5421-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_231919_625326_D72859AC 
X-CRM114-Status: UNSURE (   6.68  )
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

Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a885278bc4e2..82671d58d1da 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -254,6 +254,13 @@ properties:
               - khadas,vim1s
           - const: amlogic,s905y4
           - const: amlogic,s4
+      
+      - description: Boards with the Amlogic Meson S4 S905W2 SoC
+        items:
+          - enum:
+              - amediatech,x98q
+          - const: amlogic,s905w2
+          - const: amlogic,s4
 
       - description: Boards with the Amlogic S6 S905X5 SoC
         items:
-- 
2.53.0


