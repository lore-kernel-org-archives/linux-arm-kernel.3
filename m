Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDFAC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fvS3KMtz9AvK+cQpsMLXwD2ffJ5jVL2vkB80StYNZLs=; b=AjU6e7fVpP+5orbEr9nQ9QHVfn
	rTe4OkFmJ3u81usWZjvlY1RLiNZ8e/8fEbZC8u0o3ats8X6qgHM8rdAbYXnKDjXnTMLbQfExnkbaW
	7SVnhaSpujittgOvRW9IQ5p7KdcTzDvuU3nRfkEY5ysyow5SYW0dSV1OgxoDmQhNcF8m1QbnPT/OW
	6hh66Uh+P4iz0Vg/+M+UaRjZJ+zGCIQdN1p9uXD8nzd5I5b5zK8WsanNOX/HoPPuZ/ZxkhKBcC/dc
	61FMctub/zFIjqnR1AM00Msp8olq58EPTJzNuy41TGo7C3IsvoSV7lQpYlh5dgce0jCiXvpwlzxin
	GszhtXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfTC-0000000GE32-48Ye;
	Fri, 20 Jun 2025 17:24:06 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfQx-0000000GDkh-3Qkc;
	Fri, 20 Jun 2025 17:21:48 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-71101668dedso18147877b3.1;
        Fri, 20 Jun 2025 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750440106; x=1751044906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvS3KMtz9AvK+cQpsMLXwD2ffJ5jVL2vkB80StYNZLs=;
        b=gL2wcLyLHztyaafv4l714nqB7Ga8S25UpHkIZ28/JcuwSR2aKef9FSU8x4gGrZy4mK
         z2DBYDO2SC2z5/iY+Aesq+Mvly+CKuKXTK1d0I4RVlj/aj6I6sLT1g13SDhaWg9pNiAb
         8uCa2UVJPRb+ARjLTNlWqTFB32L/2ZH7r2BL9SeVDhb+md+ZGf0c6USBhi0LolY4/OOJ
         hgICWylnXWpMYTdKMmRqu3oUUenqRFf28eWaFgCPRoHMuS8j5cwZs1G/oI9OzIq0RSZR
         yzu5LN8VkHQ8JQ1SYTEl1zCecjJlkjf91gZPNTQekNdHeWxsL/NdlroNUWL+dmgCc5l8
         kBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440106; x=1751044906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvS3KMtz9AvK+cQpsMLXwD2ffJ5jVL2vkB80StYNZLs=;
        b=SBVxrjUuY5Hiu2ISy6GXrWddX/zigmaihbOJobDFaCaCNi2ud8G62fkaJDRSpO0K3z
         JZ9dZ36vNhBkcnZpQE5f66OFWyY9H/CPX0hHCLz4iasuG6Y3wQpjhX/0lcAqp7AJTp3B
         lwwrZEzkBwC/mtIDvMlgozGr3WzOvOC8WLpBUzohJ1SKgB/hhAEjje7p1pW05HlxRnHB
         qP6eGVb+4aLYChR2S0UyHhUgpSLWJlQegZwkdiYXbfdIF1TB0H9rMuJ0IREbLn3qf3vd
         58tMKSBIA3JwFoxp36QtZAdK7jjrzd/n2al+jjOhq5vsHlDhSgh15t8IxfZWDUpuyASa
         cljg==
X-Forwarded-Encrypted: i=1; AJvYcCWYS0LGxnexRUUp0XDIqPy0k+VSCBJTfLBDIAeRGHkHsTEc7PUnH+hbwRPwUPot1ODEvp6RZthRKVvFdQ45ecBC@lists.infradead.org, AJvYcCXXajUHstMblOiupqkQsGnrgtLhiqocumC9HMPCq+/U25DcCq2nBO7ugsFOj7zhuBrUQqXG8aFt+GW8BaqUgEY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzM4Y7Yu/SH+LXwIZHtjNoA8A6fYIX+YptsR3gVdY1ahFofgqSz
	jO+RvrrQdgBjwTz7nu0p7wpUr/boQTXgPAOH+/WmSh5vDm2DAu8EcYlK
X-Gm-Gg: ASbGnctZgcdvs2dNWJfKyZdJk7J1dZMK9soAYRlj/CIqWoDi07jodfAyJ3IfCETaYvO
	7gtyLJulJemqYPE8b9XHU6Zyw74NUoSux4E4pDQ+5KNkNrK+RbIRjSJ+iEyTiiKcEmKa0+FoTUF
	2lEyXCYgntDzWgUVpW6OjVqcJAt82PKDVXud3wHwH8eL+5/xEomXrcFMYlmJFOfIv15bhrO49il
	ZX/JIygh8lZWxTZ887LMfTjsVZMpfilUoMMwx7hLoZFmj0sl6HLbKvyIrLpXL0KAaytU0biZRmT
	59iWU+6np91+z+k7GibalXKsqv6ww65Nmb9jR3tNK+tFtsaBMtPZzfdXHWcPJ+P598iW3Zo=
X-Google-Smtp-Source: AGHT+IEHjO40uKSkV7nfam+/N57foyW5wCOVz4cX1+zGDB4XHw1dSOQQdikhvdY9IR7c5chzXB9wCg==
X-Received: by 2002:a05:690c:6f86:b0:70e:7ae4:59f4 with SMTP id 00721157ae682-712c6517768mr50267987b3.17.1750440106089;
        Fri, 20 Jun 2025 10:21:46 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a4a7besm5004037b3.52.2025.06.20.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:21:45 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v2 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Fri, 20 Jun 2025 13:21:39 -0400
Message-Id: <20250620172141.173266-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_102147_856526_BDDC14F8 
X-CRM114-Status: GOOD (  11.52  )
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

This series adds device tree support for the FriendlyElec NanoPi M5 board,
powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.

Changes in v2:
- Fixed DT schema warnings (Rob Herring):
  - Renamed spi-nor@0 to flash@0
  - Renamed pmic@23 pinctrl nodes to end with -pins
  - Renamed hym8563@51 to rtc@51 and removed clock-frequency
  - Renamed button@1 to button-user
- Addressed Heiko Stuebner's feedback:
  - Sorted non-addressed nodes alphabetically
  - Added blank lines in regulator nodes
  - Improved fspi1m1_pins comment to clarify SPI NOR flash pinmux
  - Moved status property in saradc to last

Patch 1: Updates DT bindings in rockchip.yaml
Patch 2: Adds NanoPi M5 device tree and Makefile entry

No MAINTAINERS update needed, as the new file is covered by the existing
ARM/Rockchip SoC entry.

Tested on NanoPi M5 with successful boot and feature validation.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (2):
  dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
  arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 1001 +++++++++++++++++
 3 files changed, 1008 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5


