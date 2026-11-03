Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358DF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MwGWyirD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzEQNVVe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=; b=MwGWyirDxMngfYiYTuOdmty5qY
	lTyoaC97/9GONXbYBkXSFph6DUvywT9qrXXsZ5X67OSDULRR7p0NZMgF0B40gRp6z20iIQCZo1HPw
	Ol4+TAw8cpgKzB0d2o0kQYlugJIfiux0jPU1WL2v86dNBgbfvAtQl2NWJTJGCEkOsOxM2WM3L7/2A
	Cp0gEpLlGaddcvSoPX0UfYrhQwkRzNKVtFsHE3ijX5VIb0z6ZNkfULQoDafXsKWQ4eCfBotjN3K2P
	Tahk9yJUXlc+/i0WScTF3TuecFfcz5AxjNqgyB2u1fEmI0JXfFxbS/NUv/vLK3QmJ6CH7GZLrKVZI
	nGKMdFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhg-00000003f3s-0e8R;
	Tue, 03 Nov 2026 21:06:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhc-00000003f2B-3wl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:05:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e3b22e971so18803f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739955; x=1794344755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=RzEQNVVeKLogNiRGzBhk8p6ohiyw+SgJrSagtNB4A49UHrIReHmcwR0vp8KTPvNb2N
         oG2fLHYY/GvVvVf9qzwfkBIg2P7qESeYrJN+CeoLSsDdYUrCwN8Az/Ne/MezXINapVgt
         N5DInOUvX1Bzmj2Gj8PLxwgnz8mdoI7H1fvKHrPc+gVU4F0OhLHgupZF5hqxyTY77OOZ
         Ix0xpKqhuQGpUS0E8yw+LuNP9OMU97QHwK2V9k5GU4xJZxsmfW2poozKf5SkDdRDbtUs
         aN6GhgB27o2INswxqHvRtwK/9d2EAon6zFQAQaDIvrBmvwUDKkINBJfRlVK1kdIwLcC+
         peeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739955; x=1794344755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=ifnoOHQjxWmh7+gjJw99yW96nnFjnE9UlyTxVyb7CXcHznNeoZCefpcfZJklm9stiJ
         OTdkdGdRHlaKpE6DqKIzCFDuASmk8exJ+UhYbstLVEIEQnwfmUWs28bKql5JJwbAshjq
         diJFOpQVzVKjaDsWs3TCxtv2SnjkGItJSyC9iEsObfmvQ05qhK7r0A7i6vvlSkPNP6n4
         0fBy9zwBbW3DJ4NejBKkTHYBoO+aZu/vKasmx/oI5qaiobe1IVp4/CWoX1roOMfRA8b4
         PCFtntkNGhzuJ7+uwrmGoTThc09Xonu0qkFwaa68Gl2jYC2Txro5ILpeEvjpajEvTZH/
         WLow==
X-Forwarded-Encrypted: i=1; AKwUvBx+RW+H25Sdl6ZYoYRoGPvPidLNLeWsutmtaxbPXXAsr8nWkVghw4C0WcWckp5c2wb1PlvrgdP2GmyqigQVptwZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8fmcDBVBJUvz8hTjNpTfX5lO0Kre3CP43s4K7rqKPstNofkO0S
	LGUdM11eMJaGkfDFAdp1HQMp+O69MU10CSDBCkDzb6KzzFXaawaFPQ9L
X-Gm-Gg: AYBFou1lgDFohEN74Q5rfJh+VcCADD1P6BKTc/8CJCZ8YN9ucHq18Amy2CepfinZ42w
	uD6fjfrpBTsGOXyK5i6laTV4yBn88E3Dc7bdHoMuH6cJ0G6TpV+SnG0dyOirKLB9xZQsstPEC4e
	WTlgsDxoUyL9fstJjXdse3ZMiZnkaByjHsm2mdzcfRY4pl/SZqR9Q3uO0YVcC0nuMQ4xGLhaGuO
	iHlfBvJ9dhzV+kBjTI6++iTuqHHST//u4WLkCMqLEE9LIwzkjLmpPvPZiLIH7TmwpbgNLlP4xqD
	2gpQhr6IEVfrhwpSyW3o8Th5JVgDLGAR+JYuNNLOpXlZ+Nb4k7a6wI2FrafW1C+xNJ17mcb6lAW
	9fsc/f8qOrZ6EL+F2Ljk2yx1dTeELhO85TRcB2oepQAIQM0uEQHN69r3Cg5GcUq/t/tFmakHlYq
	Cv7QSUXBA0XMdnX8e0dO0H0m0L2TPHY+J6qAWuBN20DEx2QqmiAmVZD+HH3sjcamvUBCV+mdxcx
	AQSdVnCQ4UL7b96KelMLKppSlY1zAz28ZYw4nns5/QOQ2HHvhfUTtTdimxRK27ilh8b+n8Hzlhv
	NWnLJgg8qNUU4jmA7PyFPA0bWhcR3feu59Y8S8AFXHbac5CYL0juFJo4I1OEkGUZ0AkX/OE0EU3
	j1KWX2dIrEmZXbF4SaBZiuBZxCH2/qMpv2J0u+N7UcEmUjsiN4Tww4/s=
X-Received: by 2002:a05:6000:29d6:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-48e6e2c2f66mr20419511f8f.6.1793739954927;
        Tue, 03 Nov 2026 13:05:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:53 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Tue,  3 Nov 2026 22:05:40 +0100
Message-ID: <20261103210542.15965-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_130556_996939_A6C8BBF1 
X-CRM114-Status: GOOD (  11.56  )
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

Add a dedicated compatible for the Airoha AN7581 SoC to account for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v3:
- Fix typo for account
Changes v2:
- Add ACK tag

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


