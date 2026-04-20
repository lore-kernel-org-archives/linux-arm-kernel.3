Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BFF588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2LGdNSGtGjHxcMbk1EISweJG6PP5pNPfFgGRdosh7w=; b=NoeFvIxMTQ/kzEePVDlgcBwly8
	+RntiVhBHvcE2/FrLYeXYiHsJUK526xBRGCItQ1Kc6pGrAlTtTNmP5+YAbvqz6t0VqJKcfMGTGEwh
	+A/R/yIkpSzHt99aHkecy4lQDuz8Udb75r+bDdrILB46ZcY19Rfowd771OtshbseTeAIikS3PvkTN
	ZtOP5jcEN/9n8jK3fkkKRNeKiT1A/uF6l/W4XeDUDKIGXEuGNaN3H1Dk1jQJ0SA94KvobNtRfCN2v
	PqMGQVOvRYSIY0VzOOA3V1qK9z8T92fy9lVsPwe60QdwG8wY9RbdGZ0mvJIqIK4HMFBkgSxE3efPD
	9d47QPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoe3-000000070Tu-2hAX;
	Mon, 20 Apr 2026 13:26:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoe1-000000070S5-1oMw;
	Mon, 20 Apr 2026 13:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEC0960580;
	Mon, 20 Apr 2026 13:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B64BC2BCB4;
	Mon, 20 Apr 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691592;
	bh=8W9KPgsSAYJmRhFtq/1x0/cV+rNs9gHlmHkDL8Wy/x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jng+qS7c5Bvf3iHdlas6DToCfPgQbMgqM2yUpgDVsiAcftzeaaYQQnFMRsjCw6ZLr
	 M/POHwxPyJfIGoaixAzx4AcKvMd9m1wMD1PUvWGMX8t49A/eJklp0YpRcoyQubS559
	 41wCWxKdNDTfSm/jL3snLZ4q0muVzCb7S4AUyriA5xRctetUsxHWVoI4fduSeS1Iyx
	 NDjSlY2Zo6UrfaqrUdokLdf5B9CVt7AKDbR/2XEhsij+9LFvtiyqk83vpJR2UY0aAc
	 bLPa7EAH5jFSMZ7HqW5Dl2SnWpTZhSzt16LRFG7I5JiRehIbjYGL6flrU4ne7mvUco
	 SLVjsvwfhiuMg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 7.0-6.12] Bluetooth: btmtk: add MT7902 MCU support
Date: Mon, 20 Apr 2026 09:18:34 -0400
Message-ID: <20260420132314.1023554-120-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
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

From: Sean Wang <sean.wang@mediatek.com>

[ Upstream commit aab25984e55972e53f3e58821cb85a7101876056 ]

Add MT7902 device ID and firmware filename to enable MCU firmware
loading.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information for a thorough analysis. Let me compile my
findings.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: PARSE THE SUBJECT LINE**
Record: [Bluetooth: btmtk] [add] [MT7902 MCU support - adds device ID
and firmware filename for MT7902 chip]

**Step 1.2: PARSE ALL COMMIT MESSAGE TAGS**
- Signed-off-by: Sean Wang <sean.wang@mediatek.com> - Author, MediaTek
  employee, regular Bluetooth/WiFi contributor
- Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com> -
  Bluetooth subsystem maintainer, applied the patch
- No Fixes: tag (expected for this type of commit)
- No Reported-by: (this is hardware enablement, not a bug report)
- No Cc: stable (expected)

Record: Author is MediaTek developer. Applied by Bluetooth subsystem
maintainer.

**Step 1.3: ANALYZE THE COMMIT BODY TEXT**
The commit message is straightforward: "Add MT7902 device ID and
firmware filename to enable MCU firmware loading." This is new hardware
enablement for the MT7902 Bluetooth chip.

Record: No bug description - this is a device ID addition for hardware
enablement.

**Step 1.4: DETECT HIDDEN BUG FIXES**
Without this patch, MT7902 devices that are matched by the vendor
wildcard USB entry `USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, 0xe0, 0x01,
0x01)` will hit the `default:` case in `btmtk_usb_setup()` and return
-ENODEV with "Unsupported hardware variant". This effectively makes the
hardware non-functional.

Record: This is a hardware enablement commit, not a hidden bug fix. But
it prevents -ENODEV for real hardware.

---

## PHASE 2: DIFF ANALYSIS

**Step 2.1: INVENTORY THE CHANGES**
- `drivers/bluetooth/btmtk.h`: +1 line (FIRMWARE_MT7902 define)
- `drivers/bluetooth/btmtk.c`: +1 line (case 0x7902: in switch)
- Total: 2 lines added, 0 removed
- Functions modified: `btmtk_usb_setup()` (new case label in switch)
- Scope: single-file surgical addition

Record: 2 files, 2 lines added, scope is minimal.

**Step 2.2: UNDERSTAND THE CODE FLOW CHANGE**
- Before: `btmtk_usb_setup()` switch on dev_id has cases for 0x7663,
  0x7668, 0x7922, 0x7925, 0x7961. Device ID 0x7902 falls to `default:`
  -> returns -ENODEV.
- After: 0x7902 falls through to the same path as 0x7922/0x7925/0x7961,
  which calls `btmtk_fw_get_filename()` to generate firmware name and
  `btmtk_setup_firmware_79xx()` to load it.

Record: Adds a case label to fall through to existing firmware loading
code. No new execution paths.

**Step 2.3: IDENTIFY THE BUG MECHANISM**
Category: Hardware workaround / Device ID addition.
The change adds chip ID 0x7902 to a switch statement and a firmware
filename define. The firmware name generation function
`btmtk_fw_get_filename()` already handles 0x7902 correctly via its
`else` branch, producing `"mediatek/BT_RAM_CODE_MT7902_1_%x_hdr.bin"`.

Record: Device ID addition pattern. Existing code infrastructure handles
0x7902 without changes.

**Step 2.4: ASSESS THE FIX QUALITY**
- Obviously correct: new case label falls through to identical handling
  as 0x7922/0x7925/0x7961
- Minimal and surgical: 2 lines
- Regression risk: essentially zero - this code path was unreachable
  before (would hit default case)
- No red flags

Record: Trivially correct, zero regression risk.

---

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: BLAME THE CHANGED LINES**
- `case 0x7922:` introduced by Chris Lu in 5c5e8c52e3cafa (2024-07-04) -
  the btmtk refactoring commit
- `case 0x7961:` introduced by Hao Qin in a7208610761ae9 (2025-01-10) -
  same pattern of adding device ID
- The switch statement and firmware loading infrastructure have been in
  the tree since mid-2024

Record: Code infrastructure stable since mid-2024. Existing device IDs
added via same pattern.

**Step 3.2: FOLLOW THE FIXES TAG**
No Fixes: tag present (expected for device ID additions).

**Step 3.3: CHECK FILE HISTORY**
Recent changes to btmtk.c are mostly refactoring (btusb -> btmtk moves)
and bug fixes (UAF, shutdown timeout). The device ID infrastructure is
stable.

Record: Standalone commit, no prerequisites needed.

**Step 3.4: CHECK AUTHOR**
Sean Wang is a MediaTek developer, regular contributor to both Bluetooth
and WiFi subsystems. Multiple recent commits in drivers/bluetooth/.

Record: Author is domain expert from the hardware vendor.

**Step 3.5: CHECK FOR DEPENDENT/PREREQUISITE COMMITS**
This is patch 2/4 in a series, but it is standalone for USB devices. The
other patches add SDIO device ID (1/4), USB VID/PID for third-party
module (3/4), and SDIO support code (4/4). This patch is sufficient for
USB devices matched by the vendor wildcard
`USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, ...)`.

Record: Standalone for USB devices via vendor wildcard matching.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

**Step 4.1: FIND THE ORIGINAL PATCH DISCUSSION**
Found via spinics.net. This is [PATCH 2/4] in Sean Wang's MT7902 series
posted 2026-02-19. The series includes:
1. mmc: sdio: add MediaTek MT7902 SDIO device ID
2. Bluetooth: btmtk: add MT7902 MCU support (THIS commit)
3. Bluetooth: btusb: Add new VID/PID 13d3/3579 for MT7902
4. Bluetooth: btmtk: add MT7902 SDIO support

Record: Part of 4-patch series. This specific patch is standalone for
USB via vendor wildcard.

**Step 4.2: CHECK WHO REVIEWED**
Applied by Luiz Augusto von Dentz, the Bluetooth subsystem maintainer.
Sent to linux-bluetooth and linux-mediatek mailing lists.

Record: Applied by subsystem maintainer.

**Step 4.3: SEARCH FOR BUG REPORT**
No specific bug report - this is proactive hardware enablement by the
chip vendor.

**Step 4.4: RELATED PATCHES**
A separate patch from OnlineLearningTutorials also attempted to add
MT7902 USB IDs (with the same case 0x7902 addition). This confirms real
user demand for MT7902 support.

Record: Multiple independent submissions for MT7902 support indicate
real hardware availability.

**Step 4.5: STABLE MAILING LIST**
No specific stable discussion found.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: KEY FUNCTIONS**
Modified: `btmtk_usb_setup()` - only a new case label added.

**Step 5.2: TRACE CALLERS**
`btmtk_usb_setup()` <- `btusb_mtk_setup()` <- assigned to `hdev->setup`
for all BTUSB_MEDIATEK devices. Called during device initialization for
every MediaTek Bluetooth USB device.

**Step 5.3-5.4: CALL CHAIN**
USB device probes -> btusb_probe() -> sets hdev->setup = btusb_mtk_setup
-> HCI core calls hdev->setup() -> btusb_mtk_setup() ->
btmtk_usb_setup() -> switch(dev_id). This is a standard device
initialization path, triggered on every device connection.

**Step 5.5: SIMILAR PATTERNS**
The same pattern is used for MT7922, MT7925, MT7961 - all case labels in
the same switch with identical fall-through behavior.

---

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

**Step 6.1: DOES THE BUGGY CODE EXIST IN STABLE?**
The switch statement and all 79xx case labels exist in the 7.0 tree. The
firmware loading infrastructure is present. Only the 0x7902 case is
missing.

Record: Infrastructure exists in stable. Only the device ID is missing.

**Step 6.2: BACKPORT COMPLICATIONS**
The diff context shows a retry mechanism (`BTMTK_FIRMWARE_DL_RETRY`)
that doesn't exist in the 7.0 tree. The patch will need minor context
adjustment for the btmtk.c hunk. The btmtk.h hunk applies cleanly.

Record: Minor context conflict expected; trivial manual resolution
needed.

**Step 6.3: RELATED FIXES IN STABLE**
No MT7902 support exists in stable at all.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

**Step 7.1: SUBSYSTEM CRITICALITY**
Bluetooth (drivers/bluetooth/) - IMPORTANT subsystem. Bluetooth is
widely used in laptops, phones, and IoT devices.

**Step 7.2: SUBSYSTEM ACTIVITY**
Actively developed with regular commits. Device ID additions are a
common pattern.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: WHO IS AFFECTED**
Users with MT7902 Bluetooth hardware. The MT7902 is a MediaTek wireless
chip used in laptops and embedded devices. It appears to be a
recent/current-generation chip.

**Step 8.2: TRIGGER CONDITIONS**
Triggered when a user has MT7902 hardware and the device is enumerated
via USB. The vendor wildcard USB entry matches MediaTek devices, so the
driver binds but fails at firmware loading without this patch.

**Step 8.3: FAILURE MODE**
Without this patch: `bt_dev_err(hdev, "Unsupported hardware variant
(%08x)")` and return -ENODEV. Bluetooth is completely non-functional for
these devices.

Record: Severity: MEDIUM-HIGH (complete loss of Bluetooth functionality
for affected hardware).

**Step 8.4: RISK-BENEFIT RATIO**
- BENEFIT: Enables Bluetooth for MT7902 hardware users on stable
  kernels. High benefit.
- RISK: 2 lines, falls through to well-tested existing code path.
  Essentially zero risk.

Record: Very high benefit-to-risk ratio.

---

## PHASE 9: FINAL SYNTHESIS

**Step 9.1: EVIDENCE**

FOR backporting:
- Classic device ID addition to existing driver (explicit exception
  category)
- Only 2 lines changed
- Falls through to well-tested code path (same as MT7922/MT7925/MT7961)
- Author is the chip vendor's engineer
- Applied by Bluetooth subsystem maintainer
- Enables real hardware that would otherwise be completely non-
  functional
- Multiple independent submissions for MT7902 confirm real user demand
- Zero regression risk (new case label, previously unreachable code
  path)

AGAINST backporting:
- Part of a 4-patch series (but this patch is standalone for USB via
  vendor wildcard)
- Minor context conflict may need resolution for btmtk.c hunk
- No Fixes: tag or Cc: stable (expected for device ID additions)

**Step 9.2: STABLE RULES CHECKLIST**
1. Obviously correct and tested? YES - trivial fall-through case label
2. Fixes a real bug? YES - enables hardware that returns -ENODEV
3. Important issue? YES - complete Bluetooth non-functionality for
   affected hardware
4. Small and contained? YES - 2 lines across 2 files
5. No new features or APIs? YES - just enables existing infrastructure
   for new chip ID
6. Can apply to stable? YES - with minor context adjustment

**Step 9.3: EXCEPTION CATEGORY**
YES - Device ID addition to existing driver. This is an explicitly
allowed exception.

---

## Verification

- [Phase 1] Parsed tags: Sean Wang (MediaTek) authored, Luiz von Dentz
  (BT maintainer) applied
- [Phase 2] Diff analysis: +1 case label in switch, +1 firmware define.
  2 lines total.
- [Phase 3] git blame: switch infrastructure from 5c5e8c52e3cafa
  (2024-07-04), present in stable
- [Phase 3] git log: confirmed 0x7902 does not exist anywhere in the
  current tree
- [Phase 4] Found original submission on spinics.net: [PATCH 2/4] in
  MT7902 series dated 2026-02-19
- [Phase 4] Multiple submissions: both Sean Wang (MediaTek) and an
  independent user submitted MT7902 support
- [Phase 5] Traced call chain: USB probe -> btusb_probe ->
  btusb_mtk_setup -> btmtk_usb_setup -> switch(dev_id)
- [Phase 5] Verified `btmtk_fw_get_filename()` handles 0x7902 via
  existing `else` branch
- [Phase 5] Verified vendor wildcard USB entry
  `USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, ...)` matches MT7902
- [Phase 6] Confirmed switch statement and firmware loading
  infrastructure exist in 7.0 tree
- [Phase 6] Identified minor context conflict: retry mechanism in diff
  not present in stable
- [Phase 8] Without patch: "Unsupported hardware variant" error, -ENODEV
  returned, Bluetooth non-functional

This is a textbook device ID addition - minimal, obviously correct,
enabling real hardware for real users on stable kernels, with
essentially zero regression risk.

**YES**

 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 0ada5a12130dc..c56c9e077040d 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1332,6 +1332,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7922:
 	case 0x7925:
 	case 0x7961:
+	case 0x7902:
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version, fw_flavor);
 
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 5df7c32966247..b4506186b2f70 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -5,6 +5,7 @@
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 #define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
+#define FIRMWARE_MT7902		"mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 
-- 
2.53.0


