Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B18C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DfRo6ELKt4x2198NEXG1xb6DF2p0UDmeagAQl2snfz4=; b=s1/GFslM44DZet
	+Ss0IfNqLjDuLkx69E1oMGtQvMg/LIdcpRSBDNdZ6IGWBwuD0EkwadCLB6t2qBqpLeIq34ikVJRIg
	FwRvYO23RiSR60XC8KVodUP8iNLkpHpLsYBYI+fBpPgtB/eCi99ONpADTGktcWH5ENHqtlAof3MSQ
	MAxUgzCi1R7vvgtoq49mM7Gv47wwnUDVoEc4ROIcmvxaKI9Kc7C/hFHk80h31PM0Lmi1LE3xEBnJf
	hYEKhlY7diGi6XYtRifdaTGFdRdr6DHN7B6v94vh2Qk1lMO/n8d2Gs9kqV1cgjkVulhnxaQYj/rzX
	w3MCSHxTdanDI4p/C8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdn8-00000001cl8-1UHK;
	Thu, 15 May 2025 18:58:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdjv-00000001c81-3AfW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:55:33 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54d6f933152so1695520e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335329; x=1747940129; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfRo6ELKt4x2198NEXG1xb6DF2p0UDmeagAQl2snfz4=;
        b=E+FA/2f9Glob1WKY4tDWKOALrD2wU44VrZWUyi62qtGVA354jMq33g4rsUidE3rGKL
         ckvgelGdpCw1yHRV4OXFPfrvYvoRtivcyJa2ly1PtPZFDXKivZyexyXAMpJW/9IdzJsG
         ylPlhSh/IYHe44e0rhz6fiKKyVUa0TQEk5dcrkEwjws+KInt/FW18POTjIA6T2zyaD0n
         IFzPY/3cNvQwbLP+oycX0jbUsrLE/RZpvYJGKCg6PyRl2APePocdt0UIQ5/Dts9TG+dp
         ojiKqi37sVFkEelaSW8xkwr2ztozXOQRHqYt4f1oDv/uzSdZMkCzPTLL8la7oGmB/Ook
         Cadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335329; x=1747940129;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfRo6ELKt4x2198NEXG1xb6DF2p0UDmeagAQl2snfz4=;
        b=C1HPQNFXNxjPO4W7x7o18NTRR2yDdasfKg12CmohAbmrU5Kkc8Dogpwj0vyk3sPLK5
         X46wob9PeZ6gHnlcDdygwhgyoOixtc8IB23NnvtXBx7u5E1BSEoR+JeT/XuEzmk2mQkH
         BdmfihqUFHWXW8twKznE8sazNXLG3kWmz9x+q/60eydXU/MAnVwCGDpxynh3M15GnX0W
         /kFrh/gJlRoJ8lSocN+VH/ns/gzNQzz5rMiB0x0zsvAbZdteiBey3PQC6p3GUe2CweMm
         gEkoZtEStYwOdl+ac9wfptetyLtYnECxwgAy0LGL5pm2/ygJjntEbMwi0W6V4k3k4Zm1
         /l5A==
X-Gm-Message-State: AOJu0YzigAauj7T5EIcfjiBPLLFLbmhqi/vmwkZNHqFOZNO0RVX9z5fe
	negQtjr6U4kM13W4XaHUqc06YcW4hkfhKnZMn6+ZHjSK/7ygLWCtF+GL
X-Gm-Gg: ASbGncvOf0cS4SYmfUCgDQkT+Sc/kwnt9p6VnUgKXg/OyWw0ubb6szDxJDQy1byHIjH
	VlvYJSODb5DupXiKacnuArbWgm8/OCmUV5LR7igZ5RoPbQKOLunOZLoOLZBXl22HZyCZA5EOooX
	qGSSXIxY1llknSlCLbie2BAXYIOTb/DT4DRtkqYms9fmOCyM7KB1GRgf9Xlfydmrv1FuiQFwQJR
	jeZB8wI/tD00xuPNwO2GGjiZCWVX49JISsjo7I4LLOLDmXsIhRwr3nptzumevWu4y5dk3lEKlZh
	EGpc8xDATLHlSydlxp0E0rJwfFkmIYlN0hjKERXGnPqsM2jz7ViNynqjgwbm+USW
X-Google-Smtp-Source: AGHT+IGpHuxeyZPQUJiZA8Fyu6hdqyCtqrox5jsyjBCnoFL0xTxnzkYFiQFU+a64vXBUjStPlPqvfw==
X-Received: by 2002:a05:6512:10c3:b0:54f:c505:5c66 with SMTP id 2adb3069b0e04-550e71dd5cfmr147301e87.29.1747335329158;
        Thu, 15 May 2025 11:55:29 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:28 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v3 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Thu, 15 May 2025 21:55:25 +0300
Message-Id: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ04JmgC/43NTQqDMBCG4atI1k0Zo0mkK+9Ruohm1IH6Q5KGF
 vHujUKhiy66fD+YZ1bm0RF6dslW5jCSp3lKUZwy1g5m6pGTTc0ECAkSFI+hkgA80IiOPxZrAnp
 elgasEK3VAlg6XRx29DzY6y31QD7M7nV8ifm+fkD9G4w5B64arTrdFSUYVfejofu5nUe2g1H8g
 4gdkSht3kAlJX4j27a9AX+V8l79AAAA
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=2195;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=av7MD4mMWbcjnIPPFXuPllDbb3VzklZsHYR89QcuN3s=;
 b=T29UCHGZkm/bweDhSqGMd/581k+VXd9wCK0LoUIMbTOR9DhmWr9ylFIVEFSc8Uw1bd6xcOk69
 1i26DIxiQ7xBa1MSuxhyAoBzDfmHQ/Z6y8PR38sDWmzxGt6SIhgtjS0
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115531_800403_BDF047BF 
X-CRM114-Status: GOOD (  12.10  )
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

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Dropped the DTS patch already applied by Krzysztof
- Rebased onto v6.15-rc5 as requested by Daniel
- Split out the watchdog code into a dedicated platform driver, like
  timer-gxp does (thanks Daniel)
- Link to v2: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com

Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/
- Link to v1: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com

---
Alexey Charkov (4):
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
      watchdog: Add support for VIA/WonderMedia SoC watchdog functionality

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 ---
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/clocksource/timer-vt8500.c                 | 125 +++++++++++++++++----
 drivers/watchdog/Kconfig                           |  14 +++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/vt8500-wdt.c                      | 116 +++++++++++++++++++
 7 files changed, 285 insertions(+), 39 deletions(-)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


