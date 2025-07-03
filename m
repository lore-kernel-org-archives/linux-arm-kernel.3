Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B530CC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MJ+GMSpGxcQCQTbv7rWXaG8HgaqlgY7EUKWQNgiFWs=; b=hesw3HXCXGEt5Z
	yN/cmt3xYU+kDqtTfPoiOqn55ADrQNOFtxXDXIpKhNOc/c28CMUrS7UQx2Xym1WoG6rzgnNZqj+hs
	C84NbXKJrWrM4Y5pZspQtfsjVV5wjYgcXCycuL+EZ+72u/CofpsMWZ3aChQ1FYvqAMm7TM5K5lp13
	u5T356czq0LTakBLPEdv/0e5XujlC9BzgTCH2yoV8ZcNQ9WUHCMLXIhUifOy+8Ce+nUDsPReNdS21
	kweBi34uygOj5Vx2ZnRoCGByFkOX4n4qRNDmAei8VHtzrE4XZGbhkXup6ZMYhWjzLCp5GBf/AnqEP
	4vbx0tG0sTszJG5CVE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzw-0000000CTr2-3mdk;
	Thu, 03 Jul 2025 20:57:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM4q-0000000Brrw-1as1;
	Thu, 03 Jul 2025 15:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557338;
	bh=yC6hDoqxABim+0U/P7Lq08hxLKtYT+7rRFFFMob3zbM=;
	h=From:Subject:Date:To:Cc:From;
	b=lp4Wh9ISyxh8GAlBiZixOaSuvDEVGvLxbiUisrTfOXUh0suvB4qdQ05QDBNEzg88I
	 qYDAaRVA90p9v+vhQnkIawveaOCv6KcDeYuNrcXHTZn+jRQVtZ/EXenoKrLDlGNcA4
	 yhYe1iu5ESObGYApX0WzqCbkyTPBewZ3xOONcV5kJsTxmU7yittHc619VzpcUarLKM
	 hQrZsxLfxiCdipUvLsoI/BycRcYOt2dw0arI9q7ejzmF73zYRupeRD8JOf7DUJHqXF
	 4BW8/MGsYCJPBxIvLR4AF3RDgkwMxuhEQf7HQ6DZV68RBOnNAGy46T3mvfLI+lNOHR
	 gPxygPUU4gWMQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0692217E09C6;
	Thu,  3 Jul 2025 17:42:17 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio EVKs: add MT6359 PMIC keys support
Date: Thu, 03 Jul 2025 17:41:02 +0200
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6kZmgC/zWNyw6CMBAAf4Xs2U1aGhT4FcOhtqtuTB+2hWAI/
 24j8ThzmNkgU2LKMDYbJFo4c/AV5KkB89T+Qci2MrSi7cRFKNTWoitn1Q0YHRt80SdjnmMMqaA
 VvZCD7a0yEmoiJrrz+stfp4MTved6KYeEm86EJjjHZWw8rQX/J5j2/QuIuI+ynwAAAA==
X-Change-ID: 20250703-add-mt6359-pmic-keys-support-d08019d8d3c1
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=2597;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yC6hDoqxABim+0U/P7Lq08hxLKtYT+7rRFFFMob3zbM=;
 b=MY4zHQus25afqpRiSKmt8PqHFRihEiUuXBb1JBgogdxKIQbKxFtjdKk8JlWDR5Uh1h+K6CQrI
 Yb4r/W4tJVyD4QI4xtgLf9YLRrBX+nu2R4zhBL+3zS0jRF0gwZu6hJc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084220_568645_D4A8E569 
X-CRM114-Status: GOOD (  10.99  )
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

This patchset adds the support of the MT6359 PMIC keys (Power and Home)
that can be found on the Mediatek Genio 510, 700 and 1200 EVK boards
by:
- adding the MT6359 SoC support in the mtk-pmic-keys driver
- completing the existing definitions (only the Power key
  support was present) in Genio 510/700 EVK board common
  devicetree include file (mt8390-genio-common.dtsi)
- add the needed definitions in Genio 1200 EVK board devicetree
  (mt8395-genio-1200-evk.dts)

I've tested this patchset on Mediatek Genio 1200-EVK board with a
kernel based on linux-next (tag: next-20250703) plus [1] patch.

Output of evtest tool:
```
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:	mtk-pmic-keys
/dev/input/event1:	gpio-keys
/dev/input/event2:	Logitech USB Receiver
/dev/input/event3:	Logitech USB Receiver Mouse
/dev/input/event4:	Logitech USB Receiver Consumer Control
/dev/input/event5:	Logitech USB Receiver System Control
/dev/input/event6:	Goodix Capacitive TouchScreen
Select the device event number [0-6]: 0
Input driver version is 1.0.1
Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x1
Input device name: "mtk-pmic-keys"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 102 (KEY_HOME)
    Event code 116 (KEY_POWER)
Properties:
Testing ... (interrupt to exit)
Event: time 1751548607.957644, type 1 (EV_KEY), code 102 (KEY_HOME),
  value 1
Event: time 1751548607.957644, -------------- SYN_REPORT ------------
Event: time 1751548620.030611, type 1 (EV_KEY), code 116 (KEY_POWER),
  value 1
Event: time 1751548620.030611, -------------- SYN_REPORT ---
```

[1] https://lore.kernel.org/linux-mediatek/r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      Input: mtk-pmic-keys - add support for MT6359 PMIC keys
      arm64: dts: mediatek: mt8390-genio-common: Add Home MT6359 PMIC key support
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support

 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi  |  4 ++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 15 +++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c                 | 17 +++++++++++++++++
 3 files changed, 36 insertions(+)
---
base-commit: b803ad80123e6efccfeeffa7cd37f98f642e37f4
change-id: 20250703-add-mt6359-pmic-keys-support-d08019d8d3c1

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


