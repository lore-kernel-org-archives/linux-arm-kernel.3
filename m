Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fFLbqb99XY/4p3kGQ/FKtOO9I8ts9rQ7PGKFEyAjmE0=; b=QNTvjQ/CmdVVuG0doEDQ6fYDiV
	N3eyFpbdMVNEtJV5Ca+dVACaD2CEMBKh1LItKu4t3p2wr0BsLLFeM5VZ2RChDYEZpaUu2HLMxdIqx
	VATdDh0XAqExJNMU2vJjg1Yd0ce8ady6OMOTq3EW1EF8MSLNyJuz/xcmrtnVYSmPVdxhG1NYnAUuB
	OU96ZMlAvAqTbLDU7BnOMXKiKOJPTktF0DUxI9XdEYabpgIrfqHCtSfQ0sLDN460Lyj2uqYG62lJ0
	ubjGRRdgNGACqnp9cs8zEkR9joMC4YxPmUIM9T0jxexes1OH3umJg8v+Pqe/hNaVvVfNwOjesk3xl
	O/8ejhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriVD-000000033q6-37Og;
	Thu, 28 Aug 2025 19:41:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgF1-00000002OLA-0S4e;
	Thu, 28 Aug 2025 17:16:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b4d892175so8102805e9.2;
        Thu, 28 Aug 2025 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756401409; x=1757006209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFLbqb99XY/4p3kGQ/FKtOO9I8ts9rQ7PGKFEyAjmE0=;
        b=nYDrsAXu9iFrz+sT/d9WLxdLn+GdzOKSYyncPbaQ9uqOklWAdyGpFFSrUsWyrdmkMe
         JRef7zRCgG8xzv/V8MIi+oCZa6bzVdcxwZBoqQ3Z5r/EbgJHD1ilwRGzvdFg/61zMbcP
         e4uVJG2NQaLJh8DLQAWpPFHvMbvOeD58FeCBiyPeIZHVu0l7vfTiNDBVx6uyEYj/IrXQ
         GxB2Th0YSzgLRy6LlWDVKFBIkNWeL1AnEmGt2YopJp7RJO4Y+7hzTXQRx/JqN2jucfGA
         l5iyA8EFurs94U83rt1uuZpx5akgYA5OHxEqyUyjc4nrITpC8yastcZeTHBfdITwClQX
         hg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756401409; x=1757006209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFLbqb99XY/4p3kGQ/FKtOO9I8ts9rQ7PGKFEyAjmE0=;
        b=frw83rnH+NgfttJ8eYh6rDk7NAonmZuYCPIYgxnCJif+t0GlVm1oOq5OfUMa/edJo9
         E7G4TpaGyye53PcqRFQZbxujvpdAjCYWQTdTsg9TdNsTP9A0NpnNwwmDInqH5C8nX+7z
         38rth0EwNa2OGslDrmhNVsB4ARC5rhdUA6vq1Jg1TgEeCpEaMxVkXog3Ycrz+WoLC6ol
         +UJS2LAMAGLRjCaL8y4deRp/OAOnf1trhZyyBR4nqmQpC9YAj8l3XDoh5++7Mvh9gNxF
         //vx2YvQQbYhjPzXxPrReauQ2l+tyDYrPISJk3K2XijB/OmPHZiW/4LR82TpwfrMWzYm
         XQjw==
X-Forwarded-Encrypted: i=1; AJvYcCU3owe6I876OxKS6rUsLQOD/ZOsLHNHN+BR0TH1MjZgxlEeLjqhhC5ahFdPzxxRMr17/rBUQbIY4KB/51lO7nyQ@lists.infradead.org, AJvYcCVK0loMzrBXIfN2+Sp4L0DPImqUUSaNYbTJUfZiRbXMIGYggTLUG0jZVqoMnq80Tw/GxEgtdmA4wSjedoh6Rv4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5DttnX5wdZX18hniaEH88P4TXsrV6tP4oaLF3Z+B+56R7k8C/
	82h11rmJc9GcBgyETH9jY6yvnGymU4TD81ISRnjiK7Na2IKpbZj1zAMz
X-Gm-Gg: ASbGnctWIFExrp+yQapVJoURp50Al3HMUbBLSYZxYWc8F3Gs5ze7yDYeXkrTRGFjfXa
	ybZjB8+BUVDR2/c91iUkNyfP7z60zQQn7UFV6DzFS6zvmMh2ezcbcerndmWQx2/DPR6vAmw/bYd
	mxxE3ORZvF//EIPu73MzyiKJysLKdcfFUgJasln71VzfF1B/4Z76MdTTCAD+xts7ONwyHBjIipw
	yPL+Zf1O0m8SAIwdg3i7SFDJDY8UvYeuWNa0zWVDUSYMN6FbWkGnDTcDU25ftOVQDs4FRWjsfjD
	kD1Xm/AuXFdrrgM5c+qrMHmYywO+xumu/CzK8dFloQU2mcC9GlH0RqZ4hz5u7gqSm7p2sr/n5aR
	slIqybMh1a9QK8z4yLog9BZbg/KNAGj/UNdk9FnDhZINgh00t
X-Google-Smtp-Source: AGHT+IHf2zrhqkImFnC2Ql49KDCTShn9uK3ZVmRNtWFi3YICQvp5eHq+etZ8QeXQZIfouCJFRYZXPg==
X-Received: by 2002:a05:600c:4f12:b0:459:dde3:1a37 with SMTP id 5b1f17b1804b1-45b66343ea2mr95635395e9.25.1756401409276;
        Thu, 28 Aug 2025 10:16:49 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f30fe02sm80653665e9.18.2025.08.28.10.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:16:48 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: add USB3 on Beelink A1
Date: Thu, 28 Aug 2025 17:16:45 +0000
Message-Id: <20250828171645.3830437-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_101651_147555_C2028C38 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

From: Alex Bee <knaerzche@gmail.com>

Enable USB3 for the Beelink A1 set-top box.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
index b276a29bdd85..632b0b22c52f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
@@ -381,6 +381,11 @@ &usb_host0_ehci {
 	status = "okay";
 };
 
+&usbdrd3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
-- 
2.34.1


