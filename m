Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA93C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMTRhkU574qVjZXuo+7cCRh9hKDg8zny1F4V74vS+A4=; b=Wys4iY95fs9kthi4x+o4dg9RLt
	26wdZ5gsQN6GL8UdK0vxxYFbISwK3RgWirDtfRwZuRHqVUUckvgsEoBql/5s2VvtB5yywtcPUuWqt
	+DzkpwkBzRDOXAmLiSha1EGBFQblVNQwTycMvYik0gH3oS/EexejUvgMWV4S0jqwxefX0x9D3e93i
	WqsJQVSWRfSBEXGBqqUPbozhGuKz2F38jON7gEhIZNBt4pSGWpJFHl4C+/jDAfkACazR1Rp1jIszE
	B7Ih6EhPQiJzd7FVbN0dkVBpjlO1qCD02D64OcHTKV23wLo6S20WUGs1gTMfsUyL35PBY1hM7DjaI
	+xv1RL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOq-00000008wrf-2jpJ;
	Mon, 13 Jul 2026 11:00:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOh-00000008wkH-2huY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:35 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84874b52eabso3878200b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940427; x=1784545227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMTRhkU574qVjZXuo+7cCRh9hKDg8zny1F4V74vS+A4=;
        b=huXmeE5n/a2prGmIxSTkQiHSfbpkxoo7UNNtpbO/L6prK+PXGLhxAcsl/ebMl0uI1s
         2XT7HDUiYOcllzIKhr9Ys1g4+s0jakzLkoyxTSCntu7WcYKaRNDEnEs0xGKBhcQEJ0ZA
         AtH9xuGJxUCFB9Q20YcE0dnHMAcvcKm/ONGkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940427; x=1784545227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMTRhkU574qVjZXuo+7cCRh9hKDg8zny1F4V74vS+A4=;
        b=GWLMORDd+THlesMMRCmZ2aXA/pTTkDENYNj73a/U2gDcOjwEQvWKo/GK0hjckH1oxt
         03zJLkneSUiKnOtOUPx41GrSUQlH9FtVhIkReN4SLaBFpZPvxYqzgjrA3Z0D48kFnshm
         18Vk1WfaKjA/rS1oOPbHicVfgYn6o5qaC6PVIwaAWeMsaDPPhlAEd/a+NFQiZEXBDb25
         2Bu45mmdQdWkeo1yohHMhe/SZFBx+G0rXzNb+HVSYIjR+rIGB1k1YqP7kJxWHx5qHGXH
         cp6rmVPLCidRVqjvWGjb4kDDYTt8NMaDrbckteA75Xn/nrilSMED4huEhiJ9Fi+YAqrg
         CiLA==
X-Gm-Message-State: AOJu0YyYEy9XRfA5S8xxd7xRZz1PjdI7G7zh3SZXiNf6BvCQZxQptHlF
	JFAnsXTPD5T3wTVBQHnd/66wGTLip/0nhNNJcbys3hkfwN0ehQage6736RacWvpRAcmYyctj2Xy
	HSyON
X-Gm-Gg: AfdE7clLflqYhQxVd7V9gH96JoNXu3IZY1Ef61rQ7TlifTGAE7I4YWVRe5GMgcKNhkl
	MRi7vSi0sEl0JcEmEqCnf2dgojAUJ2V9X203NKQFt3bZ7XZGmCIrPeBLUvwFX+DWshktY8DSc8c
	i9oUVGHYgZ0NJSa4yaXMJOyq2VFHsA0wDJS5cwRWedCl43eW5c2wMv6f0gP5xg4VAuVnTdE3ECP
	reKJKgZv4Y+BWJGdSTIE07Qc6Sv1Uumuv+v98Cm9ZnVmyNGW/6A0wFf7RA5r3Hg8B9Nn4W7i9b7
	QOP8U3YeXPasg838YeXl+aoi1dRKabbSSRsJmkJdj9w3RalVQsjBg7+jrvwCqvfOKAqP/UAeZUA
	GVrynHD9cvc9b6OvJFe4uaeE4XbBRPlwcR/c8Nfm/rfFutRUbX4aTQLiS6LJBtQNPpTIWI/Pfny
	EZu1FcpTSzIhH4qIZ6AZZmvRMgCVM5LxSKA1wD
X-Received: by 2002:a05:6a00:cca:b0:848:2f77:e2db with SMTP id d2e1a72fcca58-8488979fc26mr7420812b3a.68.1783940427049;
        Mon, 13 Jul 2026 04:00:27 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:26 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 7/8] ARM: dts: mstar: sbc2d06: Add regulators
Date: Mon, 13 Jul 2026 19:59:49 +0900
Message-ID: <20260713105950.1346962-8-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040027_716397_81627318 
X-CRM114-Status: GOOD (  10.09  )
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

From: Daniel Palmer <daniel@0x0f.com>

Add the board's fixed regulators.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 ...-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
index b15c40762bc0..8dbff5e53e5f 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
@@ -20,4 +20,21 @@ sys_led {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	vcc_vbus: regulator-vcc-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vcc_sd: regulator-vcc-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO90 GPIO_ACTIVE_HIGH>;
+	};
 };
-- 
2.53.0


