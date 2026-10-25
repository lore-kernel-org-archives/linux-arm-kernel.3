Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3BF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F9aluFHr;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=BnEbK9UU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=83TKF6OdDojPyY1KN+pzZOnG66a9l945Oy7xFtIvD9A=; b=F9aluFHrixj1j3
	kdFHJL2FMC/F6KWTP3Rx5ATWBHJ6D9YkypTVl1f8jEeqUhiLEk4u40t5l+EBG7xcDsIHNFkgMtl4E
	L4SUTp4pQMYJgf2uCmgLyvwYknaMWSYAiESBNgldx5TEJB92UStYklpqwYtRQpDkFcA3/RA7HOFjy
	j8OzoAx60mVnwh6Zak/KH3076j2TCdkYwwNlXJ2/b2SkQsGhKJb3Kt5x5dVj54g8V/l7ROzsp5KIm
	HiwPl6z3MJUPSgMT1f31Ojnucv5jWm/zmq9XKn24vbizGBW6SslnzZbYMQqhavQptys8nr9XNk45o
	a0ZfxRXzJvLbVCnfwrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mS-00000001KXg-0FDr;
	Sun, 25 Oct 2026 19:21:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mL-00000001KRH-1aTv;
	Sun, 25 Oct 2026 19:21:14 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJL1Gu515970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJL1Gu515970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956067;
	bh=83TKF6OdDojPyY1KN+pzZOnG66a9l945Oy7xFtIvD9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BnEbK9UU57qCvwyEN0pfU2mltlTqSviXEx7oX5BC7t5Mq0q9eQg6M72LE9D17Ancr
	 bdzMEHSo5XEBbJGYmuAMhsZ8rSa6PnZfI9JRa4xrxymlJ0l5Zj0X/27hsMTRY/gTL2
	 NtKgZ7U7h1dbThIOfrW89w162D67kc+2zcs2msfc=
From: christian.koever-draxl@student.uibk.ac.at
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: mmc: amlogic,meson-gx-mmc: add amlogic,core-phase-degrees
Date: Sun, 25 Oct 2026 20:20:58 +0100
Message-ID: <20261025192059.208792-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -10.0 ALL_TRUSTED,DIPLOMAS1,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122113_581929_14889733 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The controller samples with a core clock phase that is fixed at 180
degrees in the driver. Some boards need another phase to work at high
speed: an SD slot on an S905W2 TV box fails with CRC errors at 50 MHz
at 180 degrees but works reliably at 270 degrees, which is also what
the vendor kernel programs for it.

Add an optional property to describe the phase.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 976f36de2091..8123375a66e0 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -58,6 +58,15 @@ properties:
   power-domains:
     maxItems: 1
 
+  amlogic,core-phase-degrees:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Phase of the controller core clock relative to the card clock. Some
+      boards only sample reliably at high speed with a phase other than
+      the default.
+    enum: [0, 90, 180, 270]
+    default: 180
+
 required:
   - compatible
   - reg
-- 
2.56.0


