Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD78606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZjjyX1hy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H1j+i8nV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Is6vUPIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=; b=ZjjyX1hydzh8VV6E5zb/WA58eR
	cYonRg+CefBg8I8xtzTmuVeT2U3qEZzruhOcw2J6NYPtZyqrYCLtxPpv47uvARwoVHlvNRyE26x+Y
	+b3YAK6KtZetOH+CljVj1KtjYt4zEK0XVaBb+/V3ur/hpaTtCPaOS6e4tW1DTqYiGt53BT7V3J4Mx
	G7E+z+N0+n+upRC5ERCNhN0wPKqzZEStNm3Cfc3Vxi+U4I0K7fasZ78ckWLrPB4hp8yoxpjiWzQVV
	k10lVS88XCchzYcZ4nmowa/lsaYBGyk/PX5Lud9iUjSDNGIYNTnojjmsLHWNrP141IikWJvlRJya7
	Di/JHLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJARR-00000009sCh-22od;
	Tue, 20 Oct 2026 14:03:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJARQ-00000009sBz-1Eru
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Oct 2026 14:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=; b=H1j+i8nVJlgva8vIfFnZpgU3f0
	Y0TASL5ThJ7eJgUHfof+Ci4VOm2ikUgdlLvXfSVoOdiftyjt7m3H/kcyhV8KbQeomuLzjc83DuUsu
	3nso9BHj4+3syW8sQOWW2aEMg1/UdUDbCzhzg/TeScP3s4VXNxMMWczvvcZdxzuBWulIAVVYcXuaV
	Hat8n9sqqPpnzYZD8Gp4kV4o652ctX1XUpUMxcJNu0aXqyIa4I+kmR/eYprgBzTzxnhlbqgEQROac
	jLlVocuQjsdwTavHTH5g5EJFexeNvkA5loGgp0YdXkNnWEYpxToCPOG9yDHpjD4iPizU+Rm+GugDi
	c5wHgfBw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJARM-00000004naj-1Be6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:03:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e9ae391a05so4845055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505022; x=1793109822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=Is6vUPIWZlMUBWQ1nJcMPcZxbezXyOmLscpxUsVfN3etmlSv9sK5uVB4p4WsjKX26m
         px18Enu7KIehLvPQ3sdX4r1fnJ4yx/9DnMuwYwotgJczE+wAvSl7vnT3P5A+158Kqr2l
         Jy5iGHbdp5/66bVm4UBS7SXN66L5MP8a/U9BWis0ikjsh67T6Z4pyWMpoS43BhEgL5pC
         b6/mK2RAdYtJMg5xpTR3IRg/o/VSFh0SsR/8HdTiSIl0yiXF26LTTlmwVnE7WbBb7ZcO
         nXXJMkGAcu1pUy2VBwob5SeQ0lrPntn8eh+ErgmBU4YfkbZS1rKDosM9cGCTyMLtT5bv
         mpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505022; x=1793109822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=Z0vdfGrGnMhrHzNl1a0jB/D/OLT6QczTdUd3WGJe7GBsdcuIjemLtua9yEYlcwZdKr
         SMF97hZJJdJG3nZ+us9cai4lhTj6PcFfBQDqfw8xn6VNWgMwd67ATV6s9jVqZrlDLM1E
         XwpJZAtm9QyJRjMQP0/LxYHPZVMENJl9pcR+Uk7IsoDuPYHAGsE7ez1OeXIZawrCYLDk
         H4W3z1a9fnVsWhh229prrmoGvZZb7wAtGNdxt0zEaWLgc8uV1Lakst4A5id1GKxIU5ov
         XRCbB0lnNf7gk0vzgQjDUqjjY181fXyKSX/R4xPwi94yXY0AT2y7PEzkA4Mb136Eilr/
         yY4A==
X-Forwarded-Encrypted: i=1; AKwUvBw2om9s5SU4hFH1FT9S02NAMLzMC4su/y98fk+xSR9EM187j0JrpRNcqlfgyYDBm76KZtnypVbcKIl4i69A8bYp@lists.infradead.org
X-Gm-Message-State: AFq9FYKKf3WF9Sw6GhHULwWezf7x5RTAiwaB5v7Gd5oq7So4Fiv/fiot
	+8R01eYS9vqtUkxeaNnRDL6oX+1jYhsEesZ1T5XcIKSXw56FW/S2xDJx
X-Gm-Gg: AYBFou1yh3//ag3jLVXTxBBOfX07PTH29knmhOSDlkbeQ1vaeC05egyIWd0zcmBcFkj
	78TnaK+8+9JogeGpap8TVPes/8i3pu/gCFUaIwaJ827fronM2ZZA4hrgHnNyhXNjekEPOpovZ82
	R+PMS+iL8an0qyP4JhPnLHz+NEk44DUn9p7fHRUgyHTFbnHeCNepDSSKh2l94jqg9CgSyKRVslR
	V3V8U+XM0cv4/ubOtpJxTyX5ffC6LEyRSh9KcZdSxRJKtQhl9Z4O3wT0ZEVF2ctt3KVu+bMLo4G
	mvVTZrKy48eh36Tcvejp23/encIcyUavkvpQwa7GJpUxjp/7P7VPu3pssXCh/ndJHJiyKIzm+rK
	mO1bkzwIJMq0EsDR/qyKO7QfUbZhYAGSX8DJGHQz2aAe90U9QNW9l1bk5N1dqt2HAD1tuaQQY+b
	XBZNThEx3O0Tyzfg0iCPzsBnYWF4fgb3pqi/dtXv8IhpnfiGgDU2v7/JQ6EnXs+CRy+POaCYMdP
	gOnbZuNOuo=
X-Received: by 2002:a17:902:ecce:b0:2df:34c0:72fe with SMTP id d9443c01a7336-2ea1dd670d2mr14819585ad.35.1792505021811;
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:14 +0800
Message-ID: <20261020140127.720-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_150344_812045_8771B625 
X-CRM114-Status: GOOD (  16.07  )
X-Spam-Score: -0.2 (/)
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 high while the system runs and low during
shutdown, before writing the RK808's shutdown bit. Mainline does not
describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
stick. Describe it in the PMIC node, with the settle time the vendor
uses.

The BSP releases GPIO1_B5 in the same sequence, and in testing the board
came back up when that pin was still high as the shutdown bit was
written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
pwm-backlight drives its enable GPIO low whenever it turns the backlight
off, including from its shutdown callback in device_shutdown(), which
runs before the PMIC's power-off prepare handler. When pwm-backlight is
not bound, nothing claims the pin; on this board it is then an input
reading low, which also lets the shutdown stick, although that is not
guaranteed on every board. The pin is therefore left to the backlight.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..210e4cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -327,6 +327,8 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3


