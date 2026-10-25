Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7532606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GskwLii2;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=mzJibMmF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NuhksjsNAdRQMqvWLmBXY10ekQvRxyZAMILK7wtyNTE=; b=GskwLii2rd0AFW
	63qLfqDRf4EgVVRzD4brLPQXPYVWnkgcjWNvEaL+eJ7rCSHXvmAEG0QexyFa/3DOW579kf+6CW5vL
	b2JLeCps90UwmS2hGK9dDeih8HdbDo0jZd8Vwauqn/4n5mEI2NRIrAxr41XFozgWtvbbWjsrG/vl9
	hqIq8PTGInKqBIuXnu8IGJeagaMjA35m1N45a0D4dPU0IR6aTr98GNEkTOWmX4btdGMO09uDo3Ai6
	VUR9j0e6JiCGSl/MmIDbjtxJAONcIncv1wqAn/oUoLFY6FGDvYNWRix5FiecfFOuv7wkTOdQI/ojE
	ggkt56782h2C1x80AoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nC-00000001Kru-1pJ6;
	Sun, 25 Oct 2026 19:22:06 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3n4-00000001KmG-1shw;
	Sun, 25 Oct 2026 19:21:59 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko4516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:51 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko4516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956112;
	bh=NuhksjsNAdRQMqvWLmBXY10ekQvRxyZAMILK7wtyNTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mzJibMmFviPkfEtqh7tw9Kd6GqWZn+d+Te9WvzRxnp4P3RwoBY85cEleJSq8EafNr
	 /ytDFuO05JxZdTc2oT8hvpVoskzKhlnJ16QOGy0Gu3hI/+uk7jSFzbhlGmnCBv9MI7
	 DkVhnGuT0CPCbXucNSOgihj0/JwHd0ueuRibOOpg=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add amlogic,meson-s4-sm
Date: Sun, 25 Oct 2026 20:21:43 +0100
Message-ID: <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122158_679075_9470A510 
X-CRM114-Status: UNSURE (   9.11  )
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

The S4 secure monitor implements the GXBB interface, but its PSCI
SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
driver has to tell it apart. Add an S4 compatible with the GXBB one as
fallback.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
index 8f50e698760e..6ff2ddfcaf54 100644
--- a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
+++ b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
@@ -18,7 +18,9 @@ properties:
     oneOf:
       - const: amlogic,meson-gxbb-sm
       - items:
-          - const: amlogic,meson-gx-sm
+          - enum:
+              - amlogic,meson-gx-sm
+              - amlogic,meson-s4-sm
           - const: amlogic,meson-gxbb-sm
 
   power-controller:
-- 
2.56.0


