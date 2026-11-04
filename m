Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016AA606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qalk2b8E;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1YaLd0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=; b=qalk2b8EyJSTjD
	KMUXWaMzheXacR5eddn2XHi21ha/wHqXiBBVUwvVuhEtwhhZzZmFWxVcDNLmCnrCjG5w8KLlTjrDs
	cp+/tURTWjTNzdvsSV7OG/uGVjdHMPGVKfRIcyByEj7U7Cs6UNb/zJcECOdKRa0MrxjbfmPtMxlFb
	kBKOXhvuyBL4EMPM9KvKKWIT47EHTL6KXK7zcfh/rz2DGMH4QArVHyCQKmqmrRyoC5xaeSWusF5f/
	az4p9bqRJcoKrPlBfyTBPO9KZ7TwwlwiRrTRKQJuKl4LVtthXrEaTCvPUOJMRYOIDd47xDzkcKvFC
	cPq11AEqQjdz2pQnjCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe7G-000000062n9-2Y6G;
	Wed, 04 Nov 2026 16:45:38 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe7A-000000062fk-1GYN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:45:36 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36d6765756fso713718eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810731; x=1794415531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
        b=X1YaLd0PiFl9mo6hNZ8D+OnO72Xb4gowHgWn3+3VupNo4sCLlN63A2yQ28t2sGW2qf
         6CcVjNjul1x2yRjn2k/DlIWSp0Ir+3D3jRP6DStzleSozVMhVgYZWeZyfosvAmpvqfVe
         ekG8x/F9lXNVnbQvCFFwvhoXDFXukZ78Ffji+8HSp3dDk4NbXuXiL4fx+WPn537teDoj
         U3SuxT38acPEJSeZHz4yxT15KYGihh5jolldbpSiaHc6wshTjmxDvVbokpWb7eFwp8UH
         3aCSOFLvoIYrs5HxvrGO1Szg0avGmm14FrZ5J+DtD4AYcuLDENtkxO+Epfy8jQ8q7Wnc
         zpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810731; x=1794415531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
        b=mo4FcsAp8XY1OYmrVVWVHnViE90yghlryfDiK31WeQ4wcB/XSWvhqWlL1JcE3Hi3Up
         rH4bRsN6PrzPJkqsDvbzr1+7SvWqnluLDdEuiUQrX2KHNZvBYFwRvI85SNVs/SVOS728
         Pqp1Hy02wCNoWjETWaSUt8jrPZiTb+TA4mFCiaogY0SPWqyfRDUMwTp5u9ifObH7M8v2
         S/VNUmGHo3H7VIXK9NJd4Hhl0jygsaQf+K1/Zs01JyXNSWvL1zVPiyxqYwzOZ8gDrfpK
         +II04D0Dqv5ijhqrJfVnwTXq9jc57vVMFKTk+uim0sObwj5HiOyuKHIeEcCR1JsDYT0b
         1sqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwls+4s8DsiuIGO3zFIG0/vSIfXAUaNG3EanUVeiNSk2CiVyxNWhvwj6a78AYFZUv0SOG8EWL1Joh95QQMO4+tg@lists.infradead.org
X-Gm-Message-State: APuU4Z+AyzmgrUMfo/4aeZEf52U8wm0aYt2ar764ZwoDXD80oxzGwayj
	8QHRddbQphcGrYdwYJ4ZjRzTGJwRCe46dgjy85fQtip722kZu/oXLZhH
X-Gm-Gg: AYBFou2q4w/RiZ7b+GvF8N7Oa+DcsijnOJjmu1ELoM4L1E8mX2gujuBjIPlp+rEJGrx
	JC1KidIcwaEI6p++VoStvjS4v8J/i3xirCUctAvIbMYq8+335EgSsQWl9ASQsVd50PX+uuBDGpY
	+N07IzYFoj2zCUL65TL8DQQLHTxXvF2+EN7OeMCRUWStu19uJIj8wZ4goKoXaVj2EfE9ov3BP3s
	j8MYzMRycz1GgYeH22G8E/CiOMVtyEmjgiecipGJYXmSu8E2IIWPFSo/ZshveYpI6LFrtJCDj6v
	pZsxSGtrCvpizrihNU1EsQIxRWiKFmRt+67OC4fgbrmeSB/3u/xRLgkotTph1AXBgkPp3Oj6aBy
	5ABPGaUyqVWqSY+S2odS9sHi2dm5Xi7+xN4g7T+riBJ95YhitHc7YzS/bUQ5gz4UDnVY2+VUSPH
	Vn0EexsFtTnKxArikov7JbM0+Mnkuz2WAjcg724xtK5iVUfgv5fbgbt9Uht+GJUonEcw7RdgVtf
	clnZsx1bTkQGWDq2Ia/p8ch+VlW/NE6ajz0t2eMeGqI9ghkZLMrfRAZ1N5ABV2V+BkuG18oflDw
	poyG17gN221p9Cr2M3t3yC7mbX0VKGcQi32UVLdoGP1tdfL1JdjBvmGKWWK2O/eSBepF6E6cbv6
	XEoHtO2et3jJaB97Mr1XAUYchATkxBu4ff9RUEZedDkhJ0koDTJ44gTDpH3UIuUK+mF5NYR2XBr
	ruCXlXWgyVmRILYZAQ3UVnZrMQDUqPgMlWhyYwr2ef9g==
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr28669874eec.41.1793810730934;
        Wed, 04 Nov 2026 08:45:30 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:30 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to 30-50
Date: Wed,  4 Nov 2026 22:15:00 +0530
Message-ID: <20261104164510.105359-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104164510.105359-1-kapoorarnav43@gmail.com>
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_084532_396400_3E0AA82B 
X-CRM114-Status: GOOD (  13.06  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Channels 20 to 29 of the PL-SYSMON block are its fixed channels (PL
temperature to VCCADC), which the driver always provides. Only channels
30 to 50 (the differential input, VUser0-3 and VAux0-15) are external
channels that can be described as "channel@N" child nodes, yet the
binding accepts any N from 20 to 50. Listing one of the fixed channels
there only makes the driver add it a second time.

Limit the child nodes to channels 30 to 50.

Fixes: 39dd2d1e251d ("dt-bindings: iio: adc: Add Xilinx AMS binding documentation")
Suggested-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 .../devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
index 3ae1a0bab38f..0872f5f314c1 100644
--- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
@@ -160,17 +160,18 @@ properties:
         const: 0
 
     patternProperties:
-      "^channel@([2-4][0-9]|50)$":
+      "^channel@([34][0-9]|50)$":
         type: object
         description:
-          Describes the external channels connected.
+          Describes the external channels connected. Channels 20 to 29 are
+          always available and are not listed here.
 
         properties:
           reg:
             description:
               Pair of pins the channel is connected to. This value is
               same as Channel Number for a particular channel.
-            minimum: 20
+            minimum: 30
             maximum: 50
 
           xlnx,bipolar:
-- 
2.53.0


