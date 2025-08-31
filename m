Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA848CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Apk6KML4dyqZBQ1Buqld5ww4xwE9iSu82US2UzeUrjc=; b=uR61t5emsONOxE7JcOz4lImZFA
	BJT0jZovxu2DDo+yoCDTSz7JyrIernhziyT02IDOJPmme7YQdPkhNHhzHFbnhi9knBps8JVo2zeIu
	+Q3nOhLTBlkO+ddo+Wc4DjvN1WS1grs+LmipsS8jQzu6NJyO6UqzZEG9/jULKA9ioQ+FM9AjmXcVT
	vDt88sUADiG10O585zb31Z1aJkzcjlYMZbfIcVNzz15pkiqC9kW0onzhZ8CqwEffqcY9pgI+GiTLn
	B88A64T3RAnzXHxDgS9cD0kLC1KWylZgp+WSFPSdmMboRuBKwFuKd3LqLRAFRANiMHpJg3gfvOYu/
	8ubCz2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfpt-0000000A57N-1cPY;
	Sun, 31 Aug 2025 11:03:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfjU-0000000A4Nq-2NQ0;
	Sun, 31 Aug 2025 10:56:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4c72885c8bso2261203a12.0;
        Sun, 31 Aug 2025 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637783; x=1757242583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Apk6KML4dyqZBQ1Buqld5ww4xwE9iSu82US2UzeUrjc=;
        b=cy/xDFbxKCWnxCAbAq++fKCMDJUrhI8GPRYn+DUAvkyaQViwq0ZCpDrk9ynOlEPOA3
         S+rMjiIhLoV3smweM++8PeZbDAkoolIZKAQZKPtEhMUagFqU5O6U9JCTv48//F5GecZ4
         2I7pitu9MQl8XJsKqzY7VoeRyHxIBo7RwMYtV1jnG3DkFHpMCmZ2UGeW1gzZliyCfCp4
         Vuq0QG4zvEgmbDVik90o2ageoMCUwWh+pNEDHxOHZvh58L1aZOhY5fj7OAjxsbpspCqw
         j7NIYiJS84XL977wT4EZhczActJHrJKAg+rgfxS+88+CjpTGD15gFlKG4VsjFYuDQ9K/
         5+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637783; x=1757242583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Apk6KML4dyqZBQ1Buqld5ww4xwE9iSu82US2UzeUrjc=;
        b=oW05ROnoAypcgQTorfftHbUeskYOEgc55MO8C2+VnVSEXNyQCVg8AwZYUhEGtEZY7L
         qZN1fB/zJf0RB9lNEtYwiY+Pzk29GftOYg/RJ4VmxUhm5aS/gkxaJMbBCrj/dIopSuy/
         YaD3YIslnrQQcjMtGMCfgMqtPIx0Yg7m4sWKPZLMDkDrsn/SYbGKcyXlfDhenn3t679w
         //XJbv3nDaNyinhKKMhuGma05kx1/x3ZnUQpKBkwUJnxMJ7IevV4QeJuLNqXW30O7rJx
         o/NINorK7BwRw//oFpOP2ZqHVvf5eKHWlwXoBH11tksOOVrGTtRb05F4MZvjYD+RSDtG
         cAeg==
X-Forwarded-Encrypted: i=1; AJvYcCXiCWTzHE5gCHPj/9MfXcOQ7HuqMl7cdagspFCthVGjXXuSdXX98EhVFuWmb7/pbnpTHx1WmEXBc8m3CsRZ0ifG@lists.infradead.org, AJvYcCXuXqma1qQTH1axjk4IMXarM7LmsISBMRZ+s1HeydRBCtJhC+mTtwW43QF+9IjRRzZysrbv1d1yXFl8lszxoxc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXQ+EBrLr2szf2FKX/9MzRZMlMq8uQ1bBFjGovurIrfuhbUDeZ
	I09Ie2Mi9YubKGtyk7f4Rlm9BFKgfaQBALPW8Y4x6lccANchf0zUUwdi
X-Gm-Gg: ASbGncsp6mvL2HfQ5JxDdEj1vcGlN2ScpPg/aG3XeuLeb18pttLnsavJ98R+jz5qRCZ
	y+4uJ2P19ctv5FXQmKyaql8nN6MWmBTRBvS1McmwyU5K7nmAvK7jwL0FEcZmq9TD7AuiHAHccig
	HddRE0HeWOeFOQLAi6pm/gaN0GSkBjbQopZ0Wmp+mlWmxB3mboKe6k755bt1qvtpm05EOh/uR8M
	4rqyZBVfjtpFFhGjpuc+cHojr0DSKuDm0246ZV0s5rgQJrsyUf072iiR+BuIBLIBlEHu19UgOUI
	hyhb8DL6mTzcgQCRGhCn2EErqSuyJpvDSl7DtBJAGwJeorXLpHY1h7kP5OpAx3d8ZLCwrYvKQI3
	EZR0t8t3GUPAEupLqphN0kYxbkgGGuGRG5JMfb1u79vZ0eNNhdQ==
X-Google-Smtp-Source: AGHT+IErGK7FJc+FCPGEwd2GnQFzRtcOpYSLZTpB8rjH79fTnlx1bOGmzhq6mdWM8W7i0rZcH9ZkcQ==
X-Received: by 2002:a05:6a20:9191:b0:243:9824:26f0 with SMTP id adf61e73a8af0-243d6f3b97cmr7135848637.46.1756637783407;
        Sun, 31 Aug 2025 03:56:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:22 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
Date: Sun, 31 Aug 2025 18:48:48 +0800
Message-ID: <20250831104855.45883-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035624_605316_46D04474 
X-CRM114-Status: GOOD (  11.83  )
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

This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
native display connectivity through the MIPI DSI host controller and
PHY. The changes span multiple subsystems, including clock control,
DRM/VOP integration, DSI controller binding, and PHY driver updates.

Key changes:
  - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
    phy initialization.
  - Add missing lut_size of vop_data for RK3368.
  - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
    which is required for enabling the 24MHz reference clock.
  - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
    and register mappings.

These changes were tested on a RK3368-based board with a MIPI DSI
panel [1]. The display boots successfully with console output.

[1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368

Tested-by: WeiHao Li <cn.liweihao@gmail.com>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

WeiHao Li (7):
  drm/rockchip: dsi: Add support for RK3368
  drm/rockchip: vop: add lut_size for RK3368 vop_data
  dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
  clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
  ARM: dts: rockchip: Add display subsystem for RK3368
  ARM: dts: rockchip: Add D-PHY for RK3368
  ARM: dts: rockchip: Add DSI for RK3368

 arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 79 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3368.c             |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
 include/dt-bindings/clock/rk3368-cru.h        |  1 +
 5 files changed, 102 insertions(+), 1 deletion(-)

-- 
2.47.2


