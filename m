Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA8BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUZ+q+JJg13FrFHzy6ZfeYtYvRdE7r/MNLwJRgdnPng=; b=2kUbX+Yf7Yygpqi0oVxypVQdcN
	Cl+JeAODSAQOjzFREcNXd8lRL5u6fNpdq7ELepd4Ub73e00psL3s4TDF1b4AX4YkyIALeM/GvX/85
	G/MhH1XKwH5kZCz9eY+tHBmPV6jz6yKWoi9ziO7r/tfMaHagK3YJCD6YgC8TvVMeYu9htOatoH01b
	b5CFqhkbtMxjrI9weyMli54RAqpZyRgNFsWap8K2n1CTPZ5gZGVesBm/redyh+IZKVik4H0Sf33mg
	o55iyA+ZdB6TTGypsUFzSGvhQPrwAHY1b+bz9QH0vJ7eAh1yLaIf7BE8gedMj6PcB9VU1Y3uocKR4
	dP/2cspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZs9-00000003LGn-1fnV;
	Fri, 05 Sep 2025 17:05:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWQz-00000001xMT-3sFE;
	Fri, 05 Sep 2025 13:24:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24c9a399346so17001485ad.0;
        Fri, 05 Sep 2025 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757078697; x=1757683497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HUZ+q+JJg13FrFHzy6ZfeYtYvRdE7r/MNLwJRgdnPng=;
        b=LhuPtvaYwI1UFpuAfyr4EfFEzPYthl0ntL9mo4tp345hvyY5lJsweV/1p4/gxm1yrh
         sTb2BEDQhSYyWItIWwRscZRpr/dbctJfkKcqlysCm92RobJfYnRwoTEo+FzdMNJqz8e+
         1TsI0QQR/0IvZcn44EBsfegPrsiJCT+N3bZH2mc9r56c9Pr90jFjBqLubiPK+b3XYcwD
         9AsJtYJMYBXcM4R4W0Q7FA4uOHco1WZY9F8gyEij6YwjxZkZqczYLVdnFI4AySLq82Xe
         Ea4B2lhUBpQfz+lgspz1P9GmKyeF13I6C+oWMYVfnfy1s94G3fiIg9xqyuXDLUy0wcIf
         8Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078697; x=1757683497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUZ+q+JJg13FrFHzy6ZfeYtYvRdE7r/MNLwJRgdnPng=;
        b=TGjzU0yuueM4hQyz4Jee8HkBxrEHvcN/5hizghugCQ1QO4RPCicIdSv2FJ+OBY2GA+
         uupqEKF6zNPagWq8PDjG21jR2eNSust4tJqfE2++mDO2FBjWQ04uesfLAtKWCmB/DGep
         UuYe3gmiSObOk3YFajKjf2XlFwfPMJryioh4xECpIdsTx0tsyWtygF9Luj1NckvWxK25
         Rh364G83MbmjWT+WWzv24nTRGsmJzbz/PqGhjEp6u9mTry3VJiayDVOhOCWu0NkGgW8l
         4BkDqxWfOfxPl7NIeY3zlr3wxDw529quX+qunQRHcTnRnGMQ0hAbV4f9FTbNB/tahvh4
         X9zw==
X-Forwarded-Encrypted: i=1; AJvYcCUMFDE5SVH7+BeKjNWhnmF1mBp2NJuEOmjznfZTHo3g54jVksCNc1tvHHk0vBMPp1TTfu2wQKt7HDPNeN0rbOU7@lists.infradead.org, AJvYcCUkbiglW1tKhiasoTNA0s0UMjl5nX0/EXHSudYT/+HhYiEjDwVmlw8918GqmfTs/q1YAJYYTfLYrxhEfmvnyaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxqLNuzx2pnlMQMhjDrsFQGBuG3iYgvgk8qyoqcrQypIxwEKdp
	Ev8V57WRHp8X8bgpIngX46u45An24PnICdibfWjYLvU1hRaCQjZ9Wrz/LeOLFAb6x4FfQvJB
X-Gm-Gg: ASbGncuYOFCE5+7pyNbG6L3+3D5RUvClhaSZ+MN/bDWcpgveizt22slKJP5QepLm8ik
	GAfuZv2HEm3nZIbFbO5FdDgUnts8uob4Vw9fAbnVu9eSmzdzWekY5/SDO8rcnLxvo2giVsFip+M
	+YoMlwi068hGy74YUtpIEe8aXpMWKDlIv6WaYfTYCb+t7W+/gXo8D44vEAJbO31o7OeypuqIRZL
	nwA+i0z3yO1dtjoWlCxwAjemt5j5F9YTIXb1zoBxsMqtKRcY+nLJpQ08F76jZJJI0Ppc1ByjQ2d
	7AQ2Wtmdyxwy3RswHmBbR5+BGQOT9duO9LwtFd7PmC6CkOZJDEEfLezLf0eOI3erXAZ+tojDovR
	qdavDhcjl0cHHRbY9JL5CAt8PjCg0ZHfn
X-Google-Smtp-Source: AGHT+IGUYvJbv28CQfw0PH02I1cEnjbK4o/GeReRVwIEuFF3MpQPaqUM8HGBojCALZS/4ClS+kWakA==
X-Received: by 2002:a17:903:32c3:b0:24c:8af7:6b06 with SMTP id d9443c01a7336-24c8af77cb4mr147770415ad.21.1757078697048;
        Fri, 05 Sep 2025 06:24:57 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d8d4sm76447955ad.127.2025.09.05.06.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:24:56 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 0/4] clk/rockchip: Fix I2S 8CH mclk output for RK3368
Date: Fri,  5 Sep 2025 21:23:24 +0800
Message-ID: <20250905132328.9859-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062457_960636_7E4539B0 
X-CRM114-Status: UNSURE (   8.26  )
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

I2S 8CH needs assign correct clock to output frequency wanted, this
serial fix it.

These changes were tested on a RK3368-based board with es8316 codec [1],
playback function is good.

[1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368

Tested-by: WeiHao Li <cn.liweihao@gmail.com>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

WeiHao Li (4):
  clk: rockchip: rk3368: fix SCLK_I2S_8CH_OUT flags
  dt-bindings: clock: rk3368: add CLK_I2S_8CH_PRE and CLK_I2S_8CH_FRAC
  clk: rockchip: rk3368: use clock ids CLK_I2S_8CH_PRE and
    CLK_I2S_8CH_FRAC
  arm64: dts: rockchip: Assign I2S 8 channel clock for rk3368

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 ++
 drivers/clk/rockchip/clk-rk3368.c        | 6 +++---
 include/dt-bindings/clock/rk3368-cru.h   | 3 +++
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.39.5


