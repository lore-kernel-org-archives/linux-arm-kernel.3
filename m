Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCD4C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=; b=T1d5l8uSNhrXTbJwKO8V8S00ET
	/ImwNqboalA6UZv/Fu1CNNihTD5oFyqT793LEs2gr3J1kjO+HmRuytffWOiBA0mTwA/1p8Px1rzRz
	HeuQXRiz7hLNB7Yd0NfPtbLED/dEv9ShMl0iGWjBb0T0Lq497zGqCMvZ8V6KaoNsWyADo0OXq91wt
	ozRX+vCuQrVhAn7FbJl6wljPdGig5d5lE2/z96TR89afk5XxISi7AM/3Oo13cDWYfWU9zViiqBVo2
	WFot8uaWEkTaFdx0S8IGqYIQwtUni7u/FTJ0E2oxxzzpoujnsz4qX4Ts6zVPjhvjG7YRratz/s6Nk
	KI99Eg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlUG-0000000E0lL-3Wi3;
	Tue, 11 Aug 2026 12:21:44 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTp-0000000E0Se-1NA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so3276779a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450876; x=1787055676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=RGRMrm8IYsZfJQmLDvl0lFa8c+Vo19dVwjOd0KA6fVNiGzGcvFu7aLfukwVkFzLTar
         t+St1pIOWVjdVAY/XY8/DZZQp/tG+lX1lY6oqXC/rPNAcwZNaqxL0SxeJuXzAtSCMYWb
         Zv4XGOlWulVUYdbB9f+sG2E3QBjB3HOiuTG6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450876; x=1787055676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=qwTMuxMHc5c4KcHF/89V9dF/f8TCt3SW1SMf0MxwlAkMao56962Z5CbNiMaGUA6VNT
         4KSe5qe1XthW5B28Vq06yeryBV5Uc96Tp3W99NaM0YRJOabU0lPzyNmRBZyWkvsds44i
         kVJYmOyMgxS1qkTq1cPR/iSdKAyFZSs1LLcE7We1WdyixsWEGhyEZgzhTeLDNK4QyRe1
         MNgwYgvzw+mG/h/u2uwgo2+KP8kNhNGHBZxjytsVF8Lr1SUKRj7gvegxgdgQmS2nXJSa
         7qUYmSjegPfc3cxJwTv0AR7rhO8+GrNbQmBw9UHkJk2xrBQju3t6XHIRQSP735YXYR0P
         OsiA==
X-Forwarded-Encrypted: i=1; AHgh+RqMH7qhXrc9eFSFKFWm2PAGpHN6wUqzv2yrQfm/r0o35wxuaxzls81mjz99av0x2NSKlMSBpGcrPiJ5jaMQS0KU@lists.infradead.org
X-Gm-Message-State: AOJu0YyvQ50+NnThdTA5YnXgcuwbrIZLCn1xLzMJjs+kI98d5ASm2vOV
	lR5P45WRs9e16ZCFQIl7yvuHiXIsPOSLRgoZOJhc0yCbEpapIdc0dOjdBvLhi63Idbl2Xy5yjdn
	co+Aa0A==
X-Gm-Gg: AR+sD11er/8U4V59zeYFECD5F6k4ccxBHWCx+03lKuLMVdZMfsNdrOVLkCbF6WX+Y9y
	qfgOaXwSDWs+4Dq1ZQ7IOSsFzumlEvRgwu34XX8DKVV4pOVsDJzmJKBmsEk37Wq48b0QNTcja2Z
	MwTBHvVxvEQwJayvh8x8dbH1+vQxyX+lNeoMu/yQOpQv1IA4T/pEoppfMYXHXK6BnM3R++rXUl9
	VcdTHnKtq2JDZimy7TxUANrxJqq2uIBlWdbIWb73ADEzMjdkqRC4nz7OM8L+LmOAlO49QMWoZ4I
	uNDNyw/mKZV1+5NLTgD3toRYrPZR4Psbxoex9UOszvd4ZxE3C8LIeHXmJaTNfCfjLSi8Eo6L3Ci
	zBlsP5Jpymo/iNAHD0HE+zpqqTH44NDuBthBzE9sDcifJLOXUwp46Z+REXYZCuZOMt9BhoUCDGH
	YVqLiBXZNfhI3D5iUeKACLuGdS5hgAU7fUHrpwaWc5BGQ90pfVArldYdCD/r/N8ucfolkg6uK5O
	TMQ1BBS6kueDes9JIGlQBy1LSuXFezbgDIq7o888PHhFA==
X-Received: by 2002:a05:6a00:234a:b0:84e:915:d7eb with SMTP id d2e1a72fcca58-84fa8889f0amr2532844b3a.37.1786450876479;
        Tue, 11 Aug 2026 05:21:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 11 Aug 2026 20:20:09 +0800
Message-ID: <20260811122011.3539250-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052119_445539_A443C609 
X-CRM114-Status: GOOD (  15.20  )
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.679.g6767b8d81c-goog


