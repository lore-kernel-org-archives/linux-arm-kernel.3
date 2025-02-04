Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A8C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kI4NP1tXV9aem3hXqN6Du1n50W7pEZF96SEVciB8Ko=; b=sO1g7aYtI/KfqvtY+xNWA/5X1T
	XY0qIqoa4adctLAv/qsRLtDv8yAp9mnJvK5sejpfWZNTuhYzTesiehX6+/8H11i2pv5GgQos5D729
	944KByoU5Tmj8LtCyAbfsAcPfnoNWhWCm6IgzKArrxVlg/ezINtu6fwp3VKa7ksqUxxGLHC+WzMfj
	CRQghztQ6BYEYJVcGojbw8G5Wr5rXNXe0QQ6YUEGCaNRafjoXGaCps+qIcc06Wnc7YEYHKeZRuhlD
	vKUU5mxWOCJpqwGw9g3GPmQvZX+ILDrHF61sIRuz8+ZUyHqTX0BQkf5bBJi7Q9ruBVIfmFsoP9rzw
	0QZ62gpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEt2-0000000Hati-29jv;
	Tue, 04 Feb 2025 09:06:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfErg-0000000Hapo-1ltS;
	Tue, 04 Feb 2025 09:05:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so985887966b.3;
        Tue, 04 Feb 2025 01:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738659900; x=1739264700; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0kI4NP1tXV9aem3hXqN6Du1n50W7pEZF96SEVciB8Ko=;
        b=eNibUN8kP2VFmRlVDiZNXZKJqqQtctueXo7ckeiDU5uYAvFyLd6l6tGTCGkb+VVjnD
         m6xbNpHeEwQunUjb0715y0Gi7nsnBKct1UxK2W7PjqLr627Rx8se9jfojEC6Pdeu8b/g
         ZqnZLu45HT6Pt4JZ8vFRZD33tN2FlIJ3vssrwdg++lFQaQjBhPfi4bHg5SV2hilkDQ2L
         u+D8TKXwjkQKiXtGwuHlraNAfk5x/xJCHLcx/QzeEUHOCIvx5rSaobIoLJy8PYhATGla
         GcIV5TDsy83xczMbEddN/8ysTxyOLnyLhQU+dLSPzn82pFFvRvLF9d7k92kOJq/4g9pg
         PHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659900; x=1739264700;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kI4NP1tXV9aem3hXqN6Du1n50W7pEZF96SEVciB8Ko=;
        b=bDLTqWlFr3Rv2/X+pdp8X+hx9JMspmSDMNaxLxvaeSf6Ef0fWSg5wyFx0QgPdzPcn5
         xSiGKpZLOYFeMBWWsIsnzEFpkM3VPXZa7taEEaOolXhTDI86QAB6x7LWqTRg6XmOgPfx
         86o3DQjqbPI2jenMmS07kOX+rq2teVdeUXPbkIRag++NqQy/kR2xbF0sw2095dSnSWr9
         /VOxq6gHr/rjEI0qlH0Rva2emj3d6O2mJJr+7WuDLbHcrTE0Frn9oVUHxmrRuCjuzOIq
         oxWIdtIx/ApbHbIe2oHlgNEkILz7YPaqIWEXzl3gLtdudk8PWAnMBOzllayrUbutu3Du
         MWyA==
X-Forwarded-Encrypted: i=1; AJvYcCURhiiiuILPcQ3gN63CeP4N/ovcKfaEAao0QaYcMlYewB0ANazNlCGZGmPguaVvhQzXxB55nbsLTWZHP5pGzASr@lists.infradead.org, AJvYcCUiAtGcTINngLL0//AN3As7doveI3uoIEDBczqoXFpJ/GfhMZClDMyCzyYBRo1c1OGb2I5Z+7cWi1AQAsBk61A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7XAa/2zUIagZ32GiktH5trjJNBpq6Q2rRIQyoj2gByIxCIT77
	7EtROu1bSDjGMbof5lTS1Wxad9+HNmPQ/T4162k4hWwK+YY58rGK
X-Gm-Gg: ASbGnctosp4RBahMMnPQaP9meGbZHEFSK0PTS+3eYG8fgMHuT4VqoYt0S+IZo3c9W6g
	qclDffuZiCthFC7Vr5V7bKSyTdeUvJlxdJ2y2loC72VOtxKIcqMiAIfQp5mcB8ho6vfT3CZ6aCv
	pWMQvHF2cymG7XQ5AN+ogidX1wVv01lpVwmebGaKd60ljYXDl42428GR0iARrjinZLv+g7T1p95
	9UJge4DsVaWyCk+Ok09q3fVbEyJCUnrn+8fxOgqP8tgJeqzgTrOeBwnkrd6m8xGwd+YWwSNvaUB
	TsvxUeQPWLWAMbpikzPr62XmdQDRhm79h4MQ/KnU4rvfvmap9avo
X-Google-Smtp-Source: AGHT+IG2j3iFTdYHrAUTP4K8oi4lYb6baPp04EFcHZ1LuOZiK2yq5dv01V1NQAJCbpvlrCZIAd+NOQ==
X-Received: by 2002:a17:906:f5a4:b0:ab7:4884:c804 with SMTP id a640c23a62f3a-ab74884c871mr289566366b.36.1738659899876;
        Tue, 04 Feb 2025 01:04:59 -0800 (PST)
Received: from [172.30.32.150] (bba-92-99-174-191.alshamil.net.ae. [92.99.174.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a326e6sm880773966b.157.2025.02.04.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:04:59 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 04 Feb 2025 13:02:28 +0400
Subject: [PATCH] arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKPXoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMT3aL85Gxd02TdkuKM0hJdQ9NksySLNEuzVBMjJaCegqLUtMwKsHn
 RsbW1AMMYKURfAAAA
X-Change-ID: 20250204-rock-5c-tshut-15c6b8f96e42
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738659896; l=1575;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=NDwu4ZrRPISU9qi/wnZ2zADZ8PQ6etk8lPQhZfxwq4w=;
 b=Z6SwL2znsuKUTw+uTTQ1+B4YWdVoaboy494h1y9Lv187OXEHVdaqeY76XpBkIVRLSt+U0dZlv
 GOmN+F8BhIQBQLSlJzSTFd+S5KOTPxqIgCLxOYV/d3x82dB6jUaLcaP
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_010504_469384_EF52A81D 
X-CRM114-Status: GOOD (  10.92  )
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

Radxa Rock 5C supports both CRU-based (default) and PMIC-based reset
upon thermal runaway conditions. The former resets the SoC by internally
poking the CRU from TSADC, while the latter power-cycles the whole board
by pulling the PMIC reset line low in case of uncontrolled overheating.

Switch to a PMIC-based reset, as the more 'thorough' of the two.

Tested by temporarily setting rockchip,hw-tshut-temp to 65C to simulate
overheating - this causes the board to reset when any of the on-chip
temperature sensors surpasses the tshut temperature.

Requires Alexander's patch [1] fixing TSADC pinctrl assignment

[1] https://lore.kernel.org/r/20250130053849.4902-1-eagle.alexander923@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 6e56d7704cbe0dc06242cb39df56b2fc9d6bc774..00b2d87a6bce4af883a3e7c7e606ea5b96c68b19 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -873,6 +873,8 @@ regulator-state-mem {
 };
 
 &tsadc {
+	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
 	status = "okay";
 };
 

---
base-commit: 6399b505aad2531d6244f3e943ad384b56095710
change-id: 20250204-rock-5c-tshut-15c6b8f96e42

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


