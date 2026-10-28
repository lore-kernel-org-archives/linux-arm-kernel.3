Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDF260A6F59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pzGM+CWD;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ryl5KhXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=; b=pzGM+CWDy3eGyA
	sGTmjA9zAs/sQGEopjp0UMsMXyMKlTcJV3+HSVrGPOZRH9PXvVm0L9OjT9njxT91EGURe6L9s9kih
	DV5M1jLC6g5AaQJHYxxIttv2WbwZbMfgmzdgYqFuC3mDVmkjHhY5VtmatoGyTUIwQAwp/fXYqErRa
	rMn6vIGr0XdXyqSV4UEfj28wCflIP7C+pJDrDRYH3ORmW4II+ZI3ZS1mZ5dd/4OzPyxgnCKcDBzY9
	QGK3vmkcb+8gbYWNWpg1I8zhF7OReleKywaXxYlU/M9pY7rSWWXgLE/oTAX45EvsjUZG8U9koa08Y
	nur8XxnJYpjcMGgGGC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Ai-00000007UUd-3hMT;
	Wed, 28 Oct 2026 16:06:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AX-00000007UMp-3jfy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12921415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203587; x=1793808387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
        b=ryl5KhXkEwTQVcZMBYZ/lDh3HbchX+cv5v8rSyXlljEeSSG9a40RrUhyTjN+5IQnUB
         UB3+kXp97dUxyw/I00Ty6fpOKpdaHxEi6l8HFZRMJmmgNsYM41q+gTy1retSwZm5wRQz
         xKR76pFqgQZ0Uy9+yGbISps/r0chbw6kxVsJis5LxH9jukR51SIBK3bTuBQ7PTJMses7
         HyDmHPwg6MI0wnL5g0YxDBAQxSq3OjhoxhzuBxYIJA0OCmF5jPB94T+988XTX2DPP5Al
         buixJMqA4pctdaHBFk/Zgenp0APgdmapEBuUchCoto+ZrPw7JiM+OUyW29qejq438ueu
         z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203587; x=1793808387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
        b=Btujp6rNzgmP76pyCa5Rr59f9vBcCoXD1BoOqxELsen1J53trcIlkCu7x8WX7xIQNM
         k8EpbbVyFydfG9BBb7HgchaPnSMNqg40B9ODpho2QVMct4xwvyc9Ja6reXuifUco72Dn
         MQtMwYx+pvDQthZ0GMUZAKQg0nAjIzTsxL1JukQylZsyMmLtgW7I2Ehv4XKJZPCPI8XZ
         wKVDrDswl3STIeIlyYrZ5jCleZIzqO++WehX+tvIqg9dBigMf8DN+n9kUW1Pgz2bSYn6
         VLI/pD6RFouD1M1ZM8odsBgJykjcs6vcbIU2FWLUJh33Dyoq3h/M0C2QBCI7morGbv5G
         Q7NA==
X-Forwarded-Encrypted: i=1; AKwUvBzTfXCo7WhGjCz6PaI5RD54weT6KWGWoNsCD99WKS+tuWNJX8P+W0hJquM0L3hWYOBlB/iU3VTnbHRfP2t3EV5z@lists.infradead.org
X-Gm-Message-State: AFq9FYLi/nN6VYM/V2RVYW7gyat+DYAyuMiqIR4jwwJ7KlxsAG9s1rPQ
	gB4uNhl5oCNQaEqMDhe/EE0XXCRTAKRPnhM/nAO2yTE2wORMbDL95NKheuiHYxUxmCTQMQ5W/lT
	HvXncpnmjvQ==
X-Gm-Gg: AYBFou0olQH44WTjP5IyP7oWKb1qJ6l0wnytoEyIV8/cnqfX1evr8b9LZMQWKniMsFL
	IGSv0NSdrCizDkzpIKR1dyZZ6DZA0BSeH/xQ7GHQfQJHbMSrU/BxEX42JF7ZX+ljBE+reIDqHYk
	rSnKcuYCznO/+SlFxrh9pM/veaRcWtkzE7TzslZOR/OQIdqykCpjWdqhecXUhFa7uqPUdBNN/Dw
	Z/FYSq9mH9YyvQSI18OQ70pY1Xw3YqyVX/CuxfdvFVk2+/QBkclctYEoVv7ip2O5Z/dvjL55AoQ
	iqxsZdoTpNg2JrERDC2JvS2U6flbUX+YXH9shwzYaEovJdwMwZJoJYCdewfKmqgalaHtDibjCYn
	fLgmi5dcq4Y0wpqCs5eSjW/7v573KoxapnVxHWQZatMhvOY5Uokgg/kavIw8t0nKraunpQSouaO
	CNyuj40y+0ibidu3ft86TDyP76AVwOaeoUsZ1qmQ8X+aBxollegn5y3i4nShIG3i0saZjWg3D2S
	M2AmlE6WnPPLElKoYP4hanFZCJCbE2UrWXgT4g1vuCToxsBcAoJov9O3Kugf1equmIUFDpSBTgj
	zxbv0eAh9nAdIXWvC1VCa5rQqBtg6uqkXiAHkSVb6QQIBnLUmNbs3W6EyQhQq+TeuRxJqN1T1Rz
	Cb8H/+6j0Ay1KaTNjMiH+1vJr0Q==
X-Received: by 2002:a05:600c:34ca:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4a967202e8emr63277675e9.24.1793203587385;
        Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:04 +0100
Subject: [PATCH v2 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-3-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1216;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=l89+KyhDD7zp4e3bcIBRXS/O0eyS2NPYdXJ3nkvpksE=;
 b=FRIsaf92TWQOagF+GOv8n6t9aT9JwhYIl1hTYOAJmhh5eb4lmXgIOUlXafuwYpqaXP0CZzzW3
 cxWCAzBrZVVAGYkE4JwhQ10VVBHHlU2jeyyfH71jwum/JRrFs++azkm
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090629_955335_83729BB2 
X-CRM114-Status: GOOD (  14.80  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 261ebca8863d..fc124f9ecfa1 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0


