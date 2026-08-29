Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC02C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4rJ0DhyCHllIMH7L1DGiwV3mp7tCq7ghlGuKeBd4/eQ=; b=G8NMfI6YB6bkp3AsPMcw1OIDun
	zaqo1GAf25/K5ZMJzLUWkkUOrBS472f/XuJlAhUvCAX4xuCobXK4rjd4h7unbleQ/WGh0XNH3uxWv
	gaCBL+1D1oF/lPIaoOZ8fUUetWz2X89LfsCeqt0fABAZLLOQ0r2iJsbK9LMfQie4euyF5yr41XtK2
	oN/eTBB/1up3blDyRkVHJg82D7m1v3YUlZByLbv0v0Pknisa5gT0Q5Q3j29CHpNJl1lOhOJsXa1os
	2SsbvIQ1cagYh5PhvOtI9y1lD+hlfWcuH9znEkwFAYh03utghCLcrgMh8p2nsvR3U1zt+S5Dje3dM
	mZeStP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfR-00000006tgQ-1qSD;
	Sat, 29 Aug 2026 09:48:05 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfO-00000006tdn-217d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:04 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49954b88fffso13005885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996880; x=1788601680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rJ0DhyCHllIMH7L1DGiwV3mp7tCq7ghlGuKeBd4/eQ=;
        b=qJWIeoZH/Yx1FQS4gIK+c2gVDAfU4Cac//zNBvAPbf0hv0nzzujz5q/Ba1dSgHRo3k
         FuJggK3888AB0I3vU6iTqBnF/HjcKdNVqCYxOSyQtIXuIak00Rs28V5ze9H9A2fu8p3g
         9Eib3oQgTa18Q7hvE0Kqy3Ds1XBfkB9yIqcDjoWpbUAlZ/oMRvkjLsupBkqnojykXE9+
         M4glCfCqXA0ub8AsfBXw/sJqIUILcfttTAhgkFh/ejsVHzoonqq5k8pqT4J1y2PG9dLx
         1b9/2fQiLfeUreNqv9h7v/rhGaYGw8YPnMXbGD22b0ouYX5wspi/PiI0YECHLT6ouDAC
         d0gA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7peqtE4Lbycoco3HEo8LMY0VR1nNgk+Lr4HVlnzraIBrCTBeVGVKE4DgP1sgvulsnqyQmnrj6PBSwYszYoivq@lists.infradead.org
X-Gm-Message-State: AFuF++nSskamG9OrnCtiqQSyvL2rq1/UgrwIPCj5lklXQ7RTchFlEKCB
	Ia2PVvAexwiX+OKoMXL3xsJQISZOv5U8yLlGONqdssd1bGCYyFkx1rgi
X-Gm-Gg: AR+sD11tVVCFKT7GhzTTyQTZmQ8iewiHxihofiBnfzNiCdZZ9QyTUNkpxrDald3PDXS
	RpmfecFi2Cz2wz/rN0wa91FiUxwf1uATZhci/RSfbeOOIF37jApBU+D4X5+RJ4nwmrEvC1Fvbfi
	/zTO9g/KwpPYAFsVmIkJwUHZen/LBhWipQsEamUggGyMke9JZhoOEWjUMoqCCijjctRK+lRmHxE
	ifzxptLx68TAwfj463T5lU+3MRNiSuh6QvGta4hIqRk1U2Cj1CjXFGLDQGdcfVKq2QygLJTnohx
	3osOmZrTMw2qcSFh6vpFmUUc5NAW8MvrbxHpYn97OCYqF+fFDMFNgcU+60zvvUfZMJhYbddYdYv
	ldo4VYgYMocDxpd6lKIfgIZFTY+6JtFiqKTcyz94Z2RbD8WIVSWt90tDuY3ywrLCDgF03hjT33F
	bBqrHxqZSNn/YcnQ6r5HPLLl2Dfh2zj1k85ULq6PnXpvawR3NVmhJGdTluM1te6/jGL4pI5gluA
	WNaABGjbOAG87WY4Ztaw1m3e3911GDM4GVCfg==
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr152418085e9.10.1787996879686;
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Sat, 29 Aug 2026 10:47:54 +0100
Message-ID: <20260829094758.23248-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024802_533111_EB810134 
X-CRM114-Status: GOOD (  12.68  )
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

The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
the board hangs at random, loses storage and corrupts memory, and the
failures move around from boot to boot.

Six of the SoC's PWM outputs drive the board's voltage regulators: the
always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
of them were described, so Linux saw the outputs as unused and switched
them off about a second into boot. The regulators then drifted away from
the levels the bootloader had set, which is where the corruption and the
random hangs came from. 
Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
critical.

Separately, four clocks feed the bus that carries data between the
peripherals and memory. Nothing claims those either, and switching them
off leaves any device that starts a transfer afterwards stuck. The SD
card comes up about two seconds into boot, so it was the visible victim.

Two of the patches are pin group fixes. The description named groups that
do not exist in the pinctrl driver, so anything referencing them refused
to probe. That is what the supplies patch needs in order to work, and it
had a second effect worth mentioning: the failing probe left one device
unbound, which kept the clock controller's sync_state() deferred forever
and quietly stopped every peripheral clock from ever being switched off.
The board looked healthy for entirely the wrong reason.

Tested on a VIM4 booting from SD with no clk_ignore_unused: 74 clocks are
still switched off, but the card enumerates and the root filesystem mounts
and memtest runs clean over 512 MiB.

Thread about these issues in Vim4:

https://lore.kernel.org/linux-clk/3930906f-783b-4d72-9260-ba25cc8081cb@linux.com/

Lucas Tanure (4):
  clk: meson: t7: keep the memory fabric clocks running
  arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
  arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
  arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  44 ++++++-
 drivers/clk/meson/t7-peripherals.c            |  13 ++-
 3 files changed, 156 insertions(+), 11 deletions(-)

-- 
2.55.0


