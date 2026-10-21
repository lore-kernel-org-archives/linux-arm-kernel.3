Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XBxh/EZ5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kKuObP6e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=; b=XBxh/EZ5EQb1r5dBD1vOdY0HeC
	/4mTQIVLhvoCZihLqV/Ofi8o2dYNK97hZZM0o0nYBegRHRw3WzvGqyK8ZNyHn4aYp2W/YgsviRqBC
	KIzUfqJ0aQutW4C+23BLpiUs1BYL6e7S6KcqFG+ypp77sWTO7Of5xqDKrWef2fUHjdd3P5OFJsNVP
	X8QbsHf00nOPYhD2k5aewd/MqFqGUOzibthRDiedcZKGLFZhw/ayqIXDZTE8kK3REyBiB5ElC41HK
	ONus1B4WVmqwPZdL2Dyczb9uq3JQqOei3akf7t5vjvKPg6dBD+MprdmLQkBiOR/FEek0JmotqKhhp
	iQ+Pf0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYQ9-0000000CHo7-26zF;
	Wed, 21 Oct 2026 15:40:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYQ7-0000000CHmP-0Jtv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:40:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso9005015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597201; x=1793202001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=kKuObP6erUurPn83F6yHLn8rYkKLGP6K2mYmwsYPzXkq7WGB58DULzSjseqYdcPdB+
         nC2Gh2T3BVnqkf+ug9r788KibR7EN/mHvF1idla1Uo0+Ba3cpcex8hRDRjt+xCfMsLQl
         oNlV9CjzVbi04Dz8dxFjcUJOcB40IgrOPCIrklGz67tqAue3FDirgxV1pwjJNqWvwuq3
         qzjTGrTV1o33huC61NuivG8vuK0ltPYnDdgGjV/Gl54F2LsPsdZBSYq8DxQgcd0dZHJU
         D9XwFjF5xImGuQ5qxyMzO1dJmun7T009hgL54RHp/9Jh8HcrNHX2cMLGh7D6SNfv4ZFY
         9+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597201; x=1793202001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=NjnfnkeoFCjKcZqiIQvqzONMIpkBCCgcRbfBP5W8dNeE/JkB7muI6/rmmWddQltjmA
         LxTuOqsb2QeBP0ijmmoCWt6EVAjpRyTIlW31XZDF9Cq9qFOKLwEVL5CDzaWNRQlO1Ynv
         L/AvY5NH4+H6LlxTduH6y7bWKdxPZHmTZc/tEIEg/cif3tu0muNQtIGy/vKCkPSmqcGx
         EjGRf01BgksMkCHyqNvStp3kcfC36QoUsVBZMua6Azy1TNMqyUdRt7P+APYgO3LscG2d
         xM4l4K35DYToO40CxciyHzS+A+mEPlWDsaNOQRXyUb+6/7ixqmtR6BVDirI8mLS4D/3d
         Yerg==
X-Forwarded-Encrypted: i=1; AKwUvBxV7txtq3dCmxEJqpLhD6pfu6Ia6TMzXTxkcKe1tOv7PYh1y5GqY5mgcfRWQxJzU5/T4bhBv7F2JONYrKnip+F3@lists.infradead.org
X-Gm-Message-State: AFq9FYIvP+f3jZmRm2/FQtm0XXTNZtA0n1mBhP/H2TJWf/jJ9g6o8wQx
	Lw9qNc2t+8uXFjfYgkDrCQQPC/DTRbcMxnlDq0Yh1JtMBxopZar0ERyf8+OL6Q==
X-Gm-Gg: AYBFou1v+Q4XWCHO257zOWSY4sFotjPeeZvbrcSyiBQj+dIRwwNbYuvKGvlpiwUSx2L
	oyb7dE8kdVXC0OvdhuOc7YUKDe13bpoongi5de2r9por5LaD1nBXnjsSStrii1YzcsZUigDnAsm
	58H4blhlLf+CG3OXmBqnICgBZoyEwdmuULV5/GP+AwN3H87XVxqRtIFyppiHdDUSsfORgSSCNN6
	OHYAFz4GnbXrL7/3La6sQ0Rpe4NZj6iRDrN0s5P2btmOFNqSPlABID3mYEnn39pfKdE4fBXkJs2
	sMpltItHokZrv9pU6IDEc/JMd4Zd7JUNS4054mmtgKGksA++wj9+R1jzxD4QU0t98FHrTbLR/rY
	iSBcBcUiApgWgprqPes+7jG5Hyq4Ik/xyqnX6j3X+8QQnVKMYL8RUAxdxVhR9tErTLNCmcaKYBe
	jgc9nEUYNfAFOJP7KJ3biM0+aCExWdjeIt5EnDgsZK31j82y3JrHZR7hSGk3Mp5p1m6vPd40/M4
	5mf/vpT82CWfvkJA+Eq3/jzL56I0QfSK/0m1LvgSZQv15CH3EsHo0ZZWewEum1ZPQHfwxA1vQ8f
	GxHTL2N5SvmLR59GS8m8nXH55l52KBDze2uD1I/wvxdxcmzDprjpUc8tCMQP
X-Received: by 2002:a7b:ce82:0:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1fdd22b0dmr39355265e9.33.1792597200529;
        Wed, 21 Oct 2026 08:40:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:39:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 21 Oct 2026 17:39:51 +0200
Message-ID: <20261021153953.285222-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_084003_119115_F20575EC 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0


