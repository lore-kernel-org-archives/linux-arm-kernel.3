Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758FEC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fjFo4OcPQCDhs/fkG6WHOCsTe4/XpEYceoAXLfRtUA0=; b=PUA8KEsSon8qkVJ3EYGSx4o6So
	NgrNe3DntcS5iZezRCxdJAqPNknrSTh12Q9m5saENvaF/e+2OzQtax15Vlgfmdg/7ysvTgsXwvxe6
	QrRQXt65o1UCJpfnE1TK3MVeqxBWnGpb1sNhKaLq/szGMmjykVJ/j4sEEW8UXIFAwRxUiCONv6mj8
	6SDdbU2tw9I811Ff2RAsO93s92btKxX18p3V+XaCZbz2PSVfZco+xiUPtutapsVapPICb1sCxQI0B
	bjFH2SJBcIxwOOQ6tuSlLwn9Z6rb7/ieuPx9SZKavmcjOCJeMtAIZArpCUAW/dSedqn7LXtNUyXgs
	UVo6qd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSxgv-0000000HRvc-0Tiq;
	Sat, 21 Jun 2025 12:51:29 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSxee-0000000HRmE-274p;
	Sat, 21 Jun 2025 12:49:09 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-708d90aa8f9so26762817b3.3;
        Sat, 21 Jun 2025 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750510147; x=1751114947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjFo4OcPQCDhs/fkG6WHOCsTe4/XpEYceoAXLfRtUA0=;
        b=GzpwCBV5kS7UbLF56VYsu6dkHYv8RV6yNjvzvsglQYivPC3cAPdFaBLdlKZaKvZJ1l
         npT/YOBH4vQdR+8HUt2RfwB1K8dy5+wNjR13kJVb+AcXH4ps5TPtnDXf6q9q/ibXXLIJ
         EBhAWL+kCnK1pITvGPwJNFyAlzSD0uPW3eEoW24vfdxBnY1LeNdq1ZnWRT0aTh9dhYz2
         wXwgxKdpFAS1B4gS01/rQd9HvfYfwMyQPVhfI+a/pt+tP3eW6XGzxG6516u99Ei4UXEM
         v30R6sf/a+4RdM1jP4Q674SFTQqCro1nCFNZuiuKTcOAGIzpoadvKrL/QszdWtaTUNx4
         SNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510147; x=1751114947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjFo4OcPQCDhs/fkG6WHOCsTe4/XpEYceoAXLfRtUA0=;
        b=PojWylrPg/hj4UkAxE96IMSOrfItcCBKBEKt99JAZCK7J9W+TPYgzh08Elkx2HMjJN
         M8HEp3C2r6ycmZdNflIKttozwQQH6U260okbNrpE52Tzugy7qsPETK1MN+N8hHEy2S4O
         4+XVVtO7qDfzQTA5M4S8ac/B8yFZzP2IwtldVxswrfcDMKzS6t9SiKUq2xOnMlBPaF7p
         +LRsXnDP1uWovKGedLjTRXDd4egnuaW9xR/ctK7Iq4bMVJUHugNmPVnCVqgTUy/P5Llc
         fS3H5BcseLymV/CgkNzCv74dRVFOoo+V3ADT+0mM1yRgeW8Nb9RBXAPNo29w1X3HAyEo
         R2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBieEmP0GQHSfXpq7Tn3In91axDC4OGqml8s6sm9XhVTCTIALR34MVBPoYjanor6XRtnaaMlTq4zxr7ZIoyLS5@lists.infradead.org, AJvYcCXD0Bt+XgeL5hI/6huWVpx0WQXXkhxW9JRVUQXjEs84ln/3YVE2/7pXFvkpsnNJk1Izvo1ToyX3cPd5KgG/Npo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAwZaLulDLDoGpDZxKCsNHj67RWUR9BwrUVMU1ODQMrRZPeMQN
	P+qvycYGdNPvqpnaKXGm4NQLhrrX6gDH2hdCfhgm6zSLr9+/7l0Xzti5
X-Gm-Gg: ASbGncvCRHkrt5UCggJNjQGVzIbn5KA3EjUXNC+qGVLw4Ji8tDvwzvp2qBKqf0P1nrj
	c7s8XXVxJutFgX85yRh5S4cKxK4X379QSy9ZbPw5AbeIhjP+clRhItJTOKrjmlas9b3oepBdlg+
	uT98+xYEBx70JYrjhaJwJ37NAyshp8+pocN3GK5/wAN44yiHzzPfLAX9o5/QGhjPD45RcZ4Nrwb
	CmO1l73BlmO1ue6pDP+l8Q520zxr++utdotFiA9qnmMezOUcnl3y+z86EpZDVAETj4MBLpbs6vl
	t/Dwrgxj5MrowboCTAMFO3/a8qh6Z/jJb9Szg9wusv7zKsyaTNL491I3gmh6QxqdAPbGE8k=
X-Google-Smtp-Source: AGHT+IGpXQnN3tAt0kNP39OWMV3gBlwYAWIavcD6N1VqsfZCkQau6Hx5p4QBL32otzK/bnphmUSnZA==
X-Received: by 2002:a05:690c:7106:b0:70f:6ec6:62b3 with SMTP id 00721157ae682-712c6756223mr93147527b3.26.1750510147324;
        Sat, 21 Jun 2025 05:49:07 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a1625fsm8357727b3.27.2025.06.21.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 05:49:06 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Sat, 21 Jun 2025 08:48:58 -0400
Message-Id: <20250621124900.214098-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_054908_539869_354FE18D 
X-CRM114-Status: GOOD (  12.25  )
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

Changes in v3:
- Improved (even more) fspi1m1_pins comment for clarity, specifying
  gpio1_d5, gpio1_c4-c7 (clk, d0-d4) for SPI NOR flash.
- Removed redundant #address-cells and #size-cells from sfc1 node, as they
  are inherited from rk3576.dtsi.

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

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 999 ++++++++++++++++++
 3 files changed, 1006 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5


