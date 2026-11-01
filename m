Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wTvEVev7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzBk1dFt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=; b=wTvEVev7xdbRG9
	AOK6kcnplmN050xomsCuQ7FVMZZ7LJzGHrOrkdGScFoZ+LMnE+Irk/EteuJHVZNhgDvpL1kXU/16w
	vZs26T8U8B4Gdcnlu1GILNl2VndXrPoSio8iBcAZIQ7zktoPdiV2zBkFanx5yjBnL0d1UKGRlBPmE
	hEKqwqw6cW0VH0Q1G0NCmPw1wL/NVHWmUKJLebQnA4aIcUzuu7TY0akcPlNA5KBLlc0d+KQD8YZNT
	lTjD48WGitjmXFHthoXi/o9r4Zn2mmSBftsrRo2wJNLCLhx77J0wRVaaKuK5cmOMbZvhb7d2dRUMP
	SmN1B68k4mpKtTI5by9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXgY-0000000Ed3u-2QUl;
	Sun, 01 Nov 2026 15:41:30 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXgT-0000000Ed02-020m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 15:41:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc758830601so1313819a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547684; x=1794152484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=EzBk1dFtASq3nqCqRwn5z5UAnib+RyNOoYs0pkc524RYiH/GVvGbprMja/yXyoQxV5
         t9k1kaEv4TDazcvuH/aodir0bDShDwx/AtRaQYj9Ngoibm6Um+m8YutX6K8jIrT2Du/3
         WslEoQ7zxI1EMYGocGjseNUzub4VKMrCPHRioHGQVryVhupfwnVG15c7GED5/sLlbWUB
         png3FVripFoIUykAQarMQlzzV2Nh97TWld5FoBkyIHfDLXBULqPCh24UF9KOjAD6mvp/
         dJhViclJhDmWEZ7zu6tJXw8YVY2gIrkkPcS70tPIlFx68C7Jw/ff6nA+DzeY91oIv7kS
         wLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547684; x=1794152484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=WJMGo7Owfu+9SL5MdxRzf/C220+yyFYxkjtz69MEMfrUXDpZfUsQL+wjhJsKVdV9rl
         cw4nIR9XJI5AknPjvZmm+nr82mXSoW9naFMCuEHjJvRDPsODDsrnJh1udj7enLlPzDrZ
         ed1zoCv0d/TCEO+jzQ3DhLkCtU3lOdM5zPFrCGI7CmFR9+KprKCYz19fTO74e6Ws46kD
         YONjBeXwU6Bt+9RI5lIqmVq84LOoNmetDt1cTAPNnRs/6k3qbBgkWWNvhVOV+DrnroNt
         MqLchLswq7IOR0h3zuh1AMGHTFejWEXPP91tlHBhGz3gYb1HMm/az5+zG/Vmnzbg7c8w
         cdgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZOMC+32EsoQrsmM04jsxlDG4FXbEW7mPx4pOLSYH1+QQUilwCIUOMaLJDQtLNh5bLSVMsHmOClQvtk5GSTYKJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/5hJUG3s/5tugpBqz2HZnCm34yXO2GNkhdJBVHzgSGMLg5/zjb
	I4nJTGZAUjWAp5ow5fV4a+iRit7nEDSKhV3HnZGYCZN1OzjF2j+Neo3w
X-Gm-Gg: AYBFou2SFLlrFGypIoxgFuO8akmRyES+W9kl26JhbMjrohgNED5Na1PNsaTNovJIcRy
	QwD2PosuRPOOwtPt0pdguLNIQX4wYOTrXwm77xuEqPneAVgMlQ8XJTXl6MSKhwdYG1eB+2nJAEU
	X7zhN8EljkquVIm8DYLOIWPhwdKIn0rC+69jC2OZ/q2L8jQjJU0+nuL/7q9wPRklHy0QppGuDbC
	Kt+u9SL7ZpMENpdWRgk+H7u3PnYFdraURGzZpbTuActFOgvs0ys8gFOmn/sd6efuKtDuoLQV+wA
	eiYpMvjm6rL1qBsxl1k1t4EP8LiVshteadFz2P8cHHWIIJRYa9TxjvmInYceD8aVK+zrfa15f3d
	tharBFg4w07F9h4dGL0m68Ee/EFtY5HuetB20d9EYQJYucKkrXsjGRYabS36gbkXjPX+C5lhi75
	hXhlnVq5w0S3JgIyHXgJ0sv59lUeJFQ/SmoMewUxFmVq/NR5bi/c2grnSxMI+JnMSDP1LoZyKDx
	1JoC9yTRR2yftNoAz1Jvyb1VtII0rAtoKF9vI34+g3sOhBlMApCHgTtH334U1lR88z9qWd3JIAX
	abcmt6GtnyfdKVl7p8/eQv4ylUxn/+i2kHc6FnnulQ==
X-Received: by 2002:a17:90b:3c8c:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ae8983126bmr7130051a91.49.1793547684390;
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
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
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sun,  1 Nov 2026 23:40:52 +0800
Message-ID: <20261101154053.3874-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_074127_773366_375A1054 
X-CRM114-Status: GOOD (  15.13  )
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


