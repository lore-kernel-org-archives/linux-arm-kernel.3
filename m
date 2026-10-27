Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B856606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUaf19Fa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeYVIqPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=; b=bUaf19FaIadW0+
	pi2q9y2eeyuZFtqp8nWLuxbhXOaD+5SOGXuhL/f9b/jFOGF5oMAEMjvyYqL4c0z+8cV+RP9dHe0Uf
	7U2xQ0MzaKJvGHh6E87Y1wqAKxqUY1Ef7tcaOzkKP51KgAa+oG7nYVaGjP4H1Coyb59WoYwhUGGUg
	3mKSkGpEPm1MQ8uKEMfBjBtH6FnirdEUdaYAmhEAb0GExXwtpcO25JlTCsYgvPU1Xuw7KhCVrCMQx
	zlDtYvvgWfkzOUNe6OfxzF8rgi/W/35kSJuLM+JHrrUmB5iSq+WdM6l2p8GYPaL7Z3UaxhOBXYRbo
	v1jRjcNgcw5jIZNdVikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcol-000000045Cr-49jJ;
	Tue, 27 Oct 2026 08:46:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcof-0000000455D-04Kw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:45:59 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1721643b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090756; x=1793695556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=KeYVIqPctwJ9+EGGFrIcUZYKeB0zrusbop+u5aWIjrR7WPVGuQbV3mBZ+GU9hkrTpq
         MCJSPHyEIfRIw9Vk2OfAjewRsQR4ly3U6N+iGiSDT1g8FED+Sq2X50+ahy3O62g0GdWr
         h8SxsRlf5gvLOCk2GYitcbvJ8A12t21bKnqnG5A8gLO96SVdgayWhAyvzKCJr5eIbMv5
         6oZANxuKGsg0k8eKWzg+sxtH0ISoXUOu+NM5j2fzlv/MtFRfeXEUl8vHlehvNOjI9rQx
         vXIDbyS/1hnJl1IUPAZ8+UxxR4m4d1DD8UcnB5rbRjiO3HAW78WStJ4/TGXf0Yj7gnEl
         jtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090756; x=1793695556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=S8E0SpAIoPqAsUEoyY1q5W60cm0huIVeDFFv0C6ILQhDRVO3O8b2lgzrJ5elLmv27k
         yk8tsGI05AOpUB53A9EQUYeTXx//kuIcmk+Cyf+aVCbhR4+uBw9HGme+4EqXVu0N7m6C
         60wbiLbyfpGRngl2bixqPpjwD0ct0v+WaPD/+yw7BIrjIcswwsoxOkCcg7dz3yRDVvij
         jppnx3kxxPGXakDBBSWyz3ieW9CCMrqzp5QBN5YLK05KX9jTE/hnfuiprtqfwVSfmJ54
         2/U8yFis7kDXpEVlrOoL5AY62o/9/o10YiT5lfjNhlfA0piQu25rl8s2zfsNqWEDRhF0
         MGxA==
X-Forwarded-Encrypted: i=1; AKwUvByRrNGZMaU8fvX448chEAhfCo7T2p8BSA5A49xE0Eou3C+75BLFRFORteuyNeRmpXsYpEbslKQV6ol+YoGPmCjJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIq/dKrSmkTyuOQoz0jIKEBHUGPXxrp6PYszltDqTFRqHfNXb0K
	7Q8Z5MpPT7yjwO9fvvRQLmOgtB1fEm14txJ/3bNWY8VUFD+pcsWzASy3
X-Gm-Gg: AYBFou1z4GLdXDT/oSRcI/6cBHJPHQ54VzT/GYGpE1rVwCqzxaYd99v0vtnq9POUdkG
	MGz4cav/FXy55Z2lC8qMCZKHgyRcZMzA8dIoMJREcyxCrJWS1er/n01lAbZJS/3RvWfMEGBZzYW
	xedFb+ZgRyNBN8H+ezH1QmLSeDpYoL3v8mF21ETzd/a2BKoF4cKBytgjgR+ySlPRNvEDqsC2M5j
	lA9hsqtrbNQrsWK5BXZg0K00hqDQoMtTMUPnaK4pUwAfaIsqmjWIHoFZ6Ho9q1swxhUrdq2gs5H
	S13EAgw33ztxf7DmPmBAVaY840f1WXKNFni5qA2vrEOjCpOA/YkJpfuU7q/DnIkQSIp/wBdjDeG
	Prs0nW31LE6mXzXe3ScD5+oqk6mTaWrdRURDP+/xzY70ilzykGA7r1ShVqUcFPjUJqX+oDmFi8Y
	afEg7MHT/fDQ/FvCgjOOSLrvHVOr+iyRDzBY94F7aV4l+xvlPVvQ87yeRbTyIcPUwmr0D4bQA5u
	xR++TcUY1PYV6XwhVe8Xp/nsjX1ZAE8Ei+h02g4z/9TBLhgxKjLjgQy6t8Sxvi5WNeHI/IMoDk9
	Nqwv24vwEJk1l4rCUQrCA46ymVtjTjgz/CATUpgGFvw=
X-Received: by 2002:a05:6a21:4591:b0:3e2:8c70:6d13 with SMTP id adf61e73a8af0-3e7cd51a7a5mr7982940637.71.1793090755759;
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
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
Subject: [PATCH v5 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 27 Oct 2026 16:45:09 +0800
Message-ID: <20261027084511.1992-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014557_111837_CB5B3029 
X-CRM114-Status: GOOD (  14.96  )
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


