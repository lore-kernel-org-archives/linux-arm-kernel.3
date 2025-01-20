Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA1C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVZnILB4Vkk467mbrC4jxwkM2t+tY+d6ia6Hx4P0S48=; b=qtG1uBPQBrZC0+
	Y46+5ThpEQUABBZLfdhcuGGVXIa/ocMZBbuCJVbH2R9ilRpcddlKFpuRe+RwoxhAl2U7/xwta8ANx
	ecQPKdEd1G1Pvt8apZ6WUw3+hWz0ZWp8IUCSWBqaneem4KZj9ChQn3+ZygX9h7TWi3InWIXnXoBcx
	PE7Gf7kH5S+VDVCKy2E3Ur5IvCCqv7I/08lf9YycF0numqR05jEnK1IMujneG3/+6jkJysMkG6E3g
	EVmxWx1e9x5rr7+IWdQtAXmg4HERkH5R0a40/EZuJGFb2vQw55SxOBCxwG6thEJuMP/WNn6tmI/sr
	8CGyS8K03UDCJS38Tb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZngd-000000055O6-065o;
	Mon, 20 Jan 2025 09:03:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnfJ-00000005551-2WHn;
	Mon, 20 Jan 2025 09:01:50 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-542af38ecd6so4392545e87.0;
        Mon, 20 Jan 2025 01:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363707; x=1737968507; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVZnILB4Vkk467mbrC4jxwkM2t+tY+d6ia6Hx4P0S48=;
        b=H2DY3mQD5U1+Y/l/fJYIc1p+qJxVj5bZn1Z9JELzs5anCeCGkxj7DeEUfvoY8IMhgs
         HWHZV9xoqNuOFOrCIOLjQyXWySTzYhDpzz9cGLRyzZgCoPBRCdOVl3QcHllFZyhDz6CY
         83Nt3AU3Oc9odzcoqCi6CV7DxZrk9K+8ayEgFWpMDk+JD89zqkQNypD2p3zMLvqt33W0
         DI7mLZRfZKSqco9H50FP+m0jJv9Kat6qqWrEP6r5D/xcUZk5qT9sLwW+5nYNb1BLq+1o
         IpTwORISTaRUwhAZkFa+mH4KMdttSE5XEEiBRrGpZ5HRKD9vxROEpeB+Nk69r56BcJLX
         5ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363707; x=1737968507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVZnILB4Vkk467mbrC4jxwkM2t+tY+d6ia6Hx4P0S48=;
        b=B1jJ3zz7xpgzLwAtRleFVc4oGXKu9/nvAkdY6ebeJsrk2odV+CIruNR93aC1C008fa
         Wkt2rcjK6TyG7p2HIWcSwykoqzqggbg/2HyR7Qd0BxZGuKSnkxHlL5IptjICXwKl5ubc
         Xo58+rcr57ucuY6GxjsaIOuWcnChhd/pTstRlkP7YihGZoDOXYpskAp04T/l7X40lQqC
         Hz5TS3CmJzu9Ah6yUQNFSql7wXoEHaRfxBlomfJVWMANRJPEqHPUqg9Aw0uVT2yK1VtT
         mu9oNPgJsBYq6L1wdK4o9gcSTKdYQsLUHPNm9GHxFHxac4bJbyQwOnkAgNl/5gWtZmyq
         0aaA==
X-Forwarded-Encrypted: i=1; AJvYcCW5AV4gRtyg76Cpdrp8Ikn4zwVkJ8ecNr01Nq6M0Bg2st4Vd7nB7/LeS0QQWXPOXHaNTY5gK/d9/iYf8ndYDvk=@lists.infradead.org, AJvYcCXI46hRffT8I45D12d8SVkjS8En8MEgCChz+HjiWZwX+S227Tvd9RPizimz4gnpOahWPLGlE6GlR41SqONbaDlr@lists.infradead.org
X-Gm-Message-State: AOJu0YwphQZjk0RxyvNcHdsatZqUEeloxVeVL8oSOKhnupZz4q+k59Pu
	4u9RYE5+qHgyHs/UP3REk3siVMCtaI2NJRvLS6cnfa55whyH7R9hj+unrCKcVXKVmg==
X-Gm-Gg: ASbGncs66qdzMQVRsl0Xmr/c2/Q33XWWpQI5/1qxQbgkT2MzZyDU6lK30eSKP+4GvDf
	2w+ibXClxs9xXZ/ZKp2CY0q8Ab4N2YcVy83LyLVpyzsu3mW7ImLdfYmRlB3mIFXY8IE9XT5AMOe
	lWAD/Rn2CKVIS5bCvP8DPjMOeJ/0D5wIBcrE9LXrIH58T++SS4M5Rfl/zk2eQ368Yoihk6ARNH3
	89PbV1QKWhJlDUo4lV+YsAWwbBQXpmYRzz6eu//4IN3Dw+fudnue66Zj/FvUYxll5Bku5E=
X-Google-Smtp-Source: AGHT+IE49mdXuZ4W9oyw8fCP0j+zJjn4S6ovHhbMcoQ8sBN6fLRXzFYYLyByIU0EJlkdsJJ0sgn8iA==
X-Received: by 2002:ac2:485c:0:b0:542:8c87:3a8e with SMTP id 2adb3069b0e04-5439c247dddmr3375767e87.20.1737363706360;
        Mon, 20 Jan 2025 01:01:46 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:01:44 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add SPDIF on RK3588
Date: Mon, 20 Jan 2025 13:01:26 +0400
Message-Id: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYQjmcC/x3MQQqAIBBA0avIrBM0FbSrRAvJsYbARCEC8e5Jy
 7f4v0HFQlhhYQ0KPlTpTgNyYrCfPh3IKQzDLGYjpHC8XMpYy2sOFDlq5712UpugYCS5YKT3361
 b7x83JTf/XgAAAA==
X-Change-ID: 20250109-rk3588-spdif-e49aa49145d3
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=1418;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=0UIZlgWex73jxVR1tlQ/o16QXenxVxrtW++QxW4H4JQ=;
 b=kqpSvQ85E1iSmXlguVpOyE38qZuWMCl8jTEezNIyFDgMqeBZ9ncoesuhxOh5lKBPL/WUGT36k
 dtZBwA9jvu9BKlc4xb4aEZ5EkUNaq8T+Fjn42ssVUU/EX6C7MdYALq/
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010149_646294_B6CB7251 
X-CRM114-Status: GOOD (  10.11  )
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

RK3588(s) uses a several SPDIF transmitters which are software
compatible with those found in RK3568. This series adds the required
device tree nodes in SoC .dtsi and enables the dedicated optical
SPDIF output on the H96 Max V58.

Note that only SPDIF 0/1 are meant as externally connected outputs,
while SPDIF 2/3/4/5 are internally routed to the various display
encoders inside the SoC. Thus, using SPDIF 0/1 only requires their
device tree nodes to be enabled (provided that the signal is routed
somewhere usable on the board itself), while the rest rely on driver
support on the display connector side and are therefore not touched
here.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (3):
      dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
      arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
      arm64: dts: rockchip: Enable SPDIF output on H96 Max V58

 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  4 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 64 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     | 30 ++++++++++
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 24 ++++++++
 4 files changed, 122 insertions(+)
---
base-commit: 4ec376748558ba132a2a49513acd3b08774384e3
change-id: 20250109-rk3588-spdif-e49aa49145d3

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


