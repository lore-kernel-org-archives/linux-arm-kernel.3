Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6910E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJZ6rxRT;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=c8vNjXCW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=; b=FJZ6rxRTCJLu1D
	/JjMNcvi92p2d6mh/qukmwMgA282+UKlNq3RgUbeec8KM/G2Nk9hnIYJGEprZxSGfBrhdfRiJq4Fw
	1zRqrzpUMd2W4flt1/feRXwWsRdTWXUSnIIgyPebAtPfw/N+oAxHNRd9xvZrq1Kq7FUVEvI8qKDde
	qHu4N2EhjHFW2QaFvIN7f5m7+hQe7LxFm7GailM8OWfsB1TZMHp2gC8WZsD2hd/4A6jtX4xTvsLCo
	x3JFTXmQfGhmeom8/NHA7TxK0W30AJ/ETSXMSg1c8720v2QZqsFHYtA4ElVQjiH2Q+Ar+wiNs0GOc
	nniL3iG0OLl45+xuol7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3on-00000001MRJ-22gs;
	Sun, 25 Oct 2026 19:23:45 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3oa-00000001MG3-0hn1;
	Sun, 25 Oct 2026 19:23:36 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM3517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:25 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM3517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956206;
	bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c8vNjXCWxx2WmCehDLoO3eq6OG/fmCPsJ/zUhmZYR9Y6b6lA99b3vKOMZDHvYKcRZ
	 zNu2uSeWQUKE3yN8AgkSmXzLxZzdtN+A7ipiY62KgYa5jM2WVVZHOaCtITGDFuwL1V
	 o7T7uGbnC65G7i6wERqmCSpdFUoSHYDH2tKCV6ug=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
Date: Sun, 25 Oct 2026 20:23:18 +0100
Message-ID: <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122332_543003_96E5B1C6 
X-CRM114-Status: UNSURE (   8.05  )
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

The receiver can stay powered across suspend and wake the system when
a remote control key is pressed. Allow boards to mark it as a wakeup
source.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..27c89f8f8c3d 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -30,6 +30,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.56.0


