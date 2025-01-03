Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F037E77197
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 00:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B8v6uqtbrgtFXWBbv11wmm4bIaVeFWrU62HFvHHEutk=; b=gV/XH6mQKd2XTPdTnpcf84suCn
	5OIwIAcAb6VacdvYcYMR2PeIrSyjg54NGn4tSm+Gsmye9XnTgwv7UThjkl7MqDFqd29zhrM1/apXU
	G7YevioniQYhvkZ5cRiNbc0cMe45lKW0/GiNLHpNLxj5UYL0TlKO1k/pu6Re5UwnW1o2x481l6RpF
	Rx44sUoO270SznLn0hufOV6j6bfVTqMSLrELh0/0ZrRIQ4HhlpKpKAX0nQzrI5LB+WHnKqyTFGqDa
	LiTxavFIPMy1gzSferiys7g6PLv6gJzgFuJVMtsy4gp9tqOT2fgl71FplW+uKhTaRV0RWXHyTn2ZJ
	obl1PSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVmI-0000000BmIj-3s6G;
	Fri, 03 Jan 2025 00:43:02 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVl3-0000000Bm8p-0ZDi;
	Fri, 03 Jan 2025 00:41:46 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3ebc678b5c9so6494498b6e.3;
        Thu, 02 Jan 2025 16:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735864904; x=1736469704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8v6uqtbrgtFXWBbv11wmm4bIaVeFWrU62HFvHHEutk=;
        b=M0Ci/f4tdQUQNFucNWEweJY59uy86d4HbRhHlh8F3Ec2+EVQkWCf/uPj7ZTeVk48dA
         +u3WvI3X/NPvWeDqSgzoxTFuaERREjxmJBHpf43h35Edbxu8HmmtVU+dKGPtFUS7WbjZ
         +RWeJRGA/m+MA4bFR2HZPmettxkVZD67VQWa60BkHyWQ1oUQuJx0fQR5pBtiNthJPoS4
         ZUorhNsm5MztWU2psNLsLvFlCUiPl3mBW/rji628G0F+5gSQD74VKd91GxHMqmxtPGtw
         AbrjE0WRFSWJ1FewqtAIhMhWK+TKCubQDIRkq2eYoc1YoseUHT8pQRSJgvLPulezXMke
         HpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735864904; x=1736469704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8v6uqtbrgtFXWBbv11wmm4bIaVeFWrU62HFvHHEutk=;
        b=nmTlmJUCJYbuGQ8c720tHqOy/qa04wlw2zYcp3Vhj1G6CQw7O2aFy1CsJvuf2iyJDX
         XVlbEbh4zUZ7krWR564TlyHxK1QIZVf+c3Fl0qQhWaUr6bRuUh+RzFjq/zT+qT/1dsLy
         2ex5NKxs2DyAJfd6wTZ+GKa9Eign/jJU9znuEH1bkSKDvDr+SRSDwx5hI43+hlHBqpOP
         cn10jDA3b1awrAX2aATLtd4gXotxfmOUmoL+oiEQ51NBiwQ6cXsTSLIJOTBuus3i5Khf
         oJOyE4KiNufv7BvP2Yv/YzW79rN0mXNnKI6GLJ/iABIwIYoV3NsBvYeXQcZ53+uTTE9q
         RAMw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWeAaD84tJN26nDysIUWHwO7Ze9EJJNOqD1yqst321IQN2ZgzQRmwzS0Dbe0HP7t4L6W0pkMdLQTd+boJVyvU@lists.infradead.org, AJvYcCXEJlrXJAkNFlkuLBwn2jySGUvMpddk7FzCAD7+j8fYCVdadM9zJPyJ/f2L/hOiRP/yXrH+MvGkJMbAsdVoUG4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYnW7cPMwUw4tbMiF9i3uYhuDaOy8OFLhYaSnBXbN0jqCWlNuY
	dmARh63Ob0tAugvQ+Jg+IP1x6G8G6Z3CExSNoohujCXebaWL1qC+
X-Gm-Gg: ASbGncuG6hGrWIRQDEnjD09BMf7QcX14E7+Y86sEXlhIEvMRii12XjmPK43gdJ6vEh4
	UMm+PeBYBwhWJoL+UebZcEz8ehsbHfozOH1S2xJaOIHJAA4LA5eYnc3S+2lgq5/Czhs6o6tB3Dh
	yVJ/uD3CyJVutuoKxt+5QiCwK0dPAgYkW46ZBct5QpxFCH9GDx6hjkLnFkv9bcl7e2DKaxEGVTM
	w4MkrYTtoZl1HF9kHVjW/ejkiHBJwsWCClQSmeO7pQMJOdnLHoQPU/u3GF8XyU/XQ==
X-Google-Smtp-Source: AGHT+IEO+EHHquaLaJGM8mJz60yerNlQhCuDujC6QrXjn/VefwZGrwI9E2QKYbGRjYGhJdxYDlOuxQ==
X-Received: by 2002:a05:6808:23cf:b0:3ec:d34f:4c6f with SMTP id 5614622812f47-3ed88f3def7mr25419306b6e.15.1735864903762;
        Thu, 02 Jan 2025 16:41:43 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:19f2:4f54:d97c:af6e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece2549542sm8087778b6e.32.2025.01.02.16.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 16:41:42 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v5 0/4] Orange Pi 5 Max
Date: Thu,  2 Jan 2025 18:41:09 -0600
Message-ID: <20250103004114.1902-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_164145_170961_CFDADFFB 
X-CRM114-Status: GOOD (  11.06  )
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

Changes in v5:
- Include Orange Pi 5 Plus USB 3.0 change in baseline before refactor
- Defer Orange Pi 5 Ultra to a later series
- Defer Orange Pi 5 Plus HDMI1 to a later series
Link to v4: https://lore.kernel.org/linux-rockchip/20241229184256.1870-2-honyuenkwun@gmail.com/

Changes in v4:
- Orange Pi 5 Ultra was released and does not use VP0 to HDMI0
- Move HDMI0 from common to the board level
- Make DTSI to be shared by the credit card sized 5 Max and 5 Ultra
- Updates for the newly submitted HDMI1 support
- Add Ack for dt-binding

Changes in v3:
- Refactor to share common include with Orange Pi 5 Plus

Changes in v2:
- squashed commits together for initial board file

Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/

Jimmy Hon (4):
  arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
  dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
  arm64: dts: rockchip: Add Orange Pi 5 Max board
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-orangepi-5-compact.dtsi   | 151 ++++
 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 101 +++
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 855 ++----------------
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 806 +++++++++++++++++
 6 files changed, 1128 insertions(+), 792 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
prerequisite-patch-id: 6346d482f91509dec24bfe5d4f0ca0d345b90deb
prerequisite-patch-id: 4672b745f4308a7be527749279edb71625d120e6
prerequisite-patch-id: 2743fb64eba2a29eaf993ebc8a5d6ee445b69dfa
-- 
2.47.1


