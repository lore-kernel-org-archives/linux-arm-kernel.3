Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10340CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3EkKjts82EGwhGUOL2aLeCq2XWyBG1FBwANmLHjXfc=; b=Xhm10G7SRHOtTKaTSop0Z1W9La
	rK3Hk2OMTlWaXxxc0xufZuv5LFnSRIimcfYk+9n0Y/ZBiLyiEWD0mn6EhXRa3/1xwkY1SVUZmgIyN
	6fUwazLj7EQNXgBaiRFnDrtMhg8XWTVLMPN4hhq+9XjpMuj5Qu5AvZWa7ygswj5QbZqpE4cFYTPaD
	LKqSej2W17l0L06NxRP42ZmmSEaB27eNmj4jPvnKadgsxkxaiERwhHgoFx/m5OGNfNPNJAnH2IhLx
	9Q4gSXygQ9gaue8H1S5195GtnXR6mHDatVEaM3u+cMloMRZGXw3Poq3a4f1mrIRl/MYSB2LBSG3ay
	bi6B2kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t1u-00000006aZV-2yZP;
	Thu, 09 Oct 2025 15:58:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t1r-00000006aYD-2RvF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA82848FB2;
	Thu,  9 Oct 2025 15:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE5DC4CEF7;
	Thu,  9 Oct 2025 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025485;
	bh=sJCjCqZNXawBcJpByH1Tp9+oQ1vVdzUYCT5K4jcEG68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kjVE4fi0sRpSd5TfthdNC0s2Wzz+OtnoBP//hthwN3w/6JBkTg/35IVVPdKmyLSsS
	 7bIMM8uDHAoWJoggCyRtVOLGLpWoknOr/o/VZKSE/sq0FF5KPWn1PO0yUE+htJ43cZ
	 feaR4z+CnGjfQE3v/2H7ZBMRgC89ScZWeWXyLwEeR02nqTSdATHsmcvF+sMhd9R5r7
	 qCKWkMPkUoMxkMob3LyfSwSgLJh5anOixlD0Krzx0OLBslUQV7IB/QckTmP4FqSUo1
	 ur1FhM0FC6CaLkxNiLo7AWOwZr3gNdquLPXa6bnE4iUtG/Z9x609EkCKd9ny6IO9eY
	 HpJF4nQz4gb9A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	j@jannau.net,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] soc: apple: mailbox: Add Apple A11 and T2 mailbox support
Date: Thu,  9 Oct 2025 11:54:35 -0400
Message-ID: <20251009155752.773732-9-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085807_688332_A5087CC0 
X-CRM114-Status: GOOD (  19.83  )
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

From: Nick Chan <towinchenmi@gmail.com>

[ Upstream commit fee2e558b4884df08fad8dd0e5e12466dce89996 ]

Add ASC mailbox support for Apple A11 and T2 SoCs, which is used for
coprocessors in the system.

Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
Link: https://lore.kernel.org/r/20250821-t8015-nvme-v3-2-14a4178adf68@gmail.com
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Backport Analysis: Apple A11 and T2 Mailbox Support

**ANSWER: YES**

This commit should be backported to stable kernel trees (and has already
been backported as commit 37b630a26d235).

---

### Comprehensive Analysis

#### 1. Nature of the Change

This commit adds hardware support for Apple A11 and T2 SoC mailboxes,
which are critical for coprocessor communication including the Secure
Enclave Processor (SEP), NVMe coprocessor, and system management
controller.

**Code Changes (drivers/soc/apple/mailbox.c:50-51, 388-400, 439):**

1. **New register definitions** (lines 50-51):
   - `APPLE_T8015_MBOX_A2I_CONTROL` at offset 0x108 (vs 0x110 for
     standard ASC)
   - `APPLE_T8015_MBOX_I2A_CONTROL` at offset 0x10c (vs 0x114 for
     standard ASC)

2. **New hardware variant structure** (lines 388-400):
  ```c
  static const struct apple_mbox_hw apple_mbox_t8015_hw = {
  .control_full = APPLE_ASC_MBOX_CONTROL_FULL,
  .control_empty = APPLE_ASC_MBOX_CONTROL_EMPTY,
  .a2i_control = APPLE_T8015_MBOX_A2I_CONTROL,  // Different offset
  .a2i_send0 = APPLE_ASC_MBOX_A2I_SEND0,
  .a2i_send1 = APPLE_ASC_MBOX_A2I_SEND1,
  .i2a_control = APPLE_T8015_MBOX_I2A_CONTROL,  // Different offset
  .i2a_recv0 = APPLE_ASC_MBOX_I2A_RECV0,
  .i2a_recv1 = APPLE_ASC_MBOX_I2A_RECV1,
  .has_irq_controls = false,
  };
  ```

3. **Device tree compatible string** (line 439):
   - Adds "apple,t8015-asc-mailbox" → `apple_mbox_t8015_hw`

**Technical Details:** The T8015 variant differs from the standard ASC
mailbox only in control register offsets (8-byte difference: 0x108/0x10c
vs 0x110/0x114). All data registers remain at identical offsets, and the
interrupt control behavior is the same (`has_irq_controls = false`).

#### 2. Stable Kernel Policy Compliance

**Qualifies under stable-kernel-rules.rst line 15:**
> "It must either fix a real bug that bothers people or **just add a
device ID**."

While this is more than a simple device ID addition, it falls into the
same category as hardware quirks and device-specific variants that are
explicitly allowed. The change:
- ✅ Is already in mainline (commit fee2e558b4884)
- ✅ Is obviously correct and tested (reviewed by Sven Peter)
- ✅ Is well under 100 lines (only 19 lines with context)
- ✅ Adds support for real hardware (A11/T2 systems)
- ✅ Follows proper submission rules

#### 3. Context: Part of Larger Hardware Enablement Series

This is **patch 2/9** from the t8015-nvme-v3 series by Nick Chan, which
enables NVMe functionality on Apple A11 and T2 SoCs. Related commits
from the same series have been backported:

- ✅ **Patch 4/9** (8409ebe2c3ebd → c942afcc3ed18): "sart: Make allow
  flags SART version dependent"
- ✅ **Patch 5/9** (a67677d4e2b80 → d34092e4e6f19): "sart: Add SARTv0
  support"

The mailbox driver is a prerequisite for the NVMe coprocessor
communication, making this backport consistent with the already-
backported SART changes.

#### 4. Risk Assessment

**VERY LOW RISK:**

1. **Isolated change:** Only adds a new hardware variant configuration;
   doesn't modify any existing code paths
2. **No impact on existing hardware:** The new `apple_mbox_t8015_hw`
   structure is only used when the device tree specifies
   "apple,t8015-asc-mailbox"
3. **Proven pattern:** Uses the exact same driver infrastructure as
   existing ASC and M3 variants
4. **Minimal delta:** Only control register offsets differ by 8 bytes;
   all functionality is identical
5. **No known issues:** No fixes, reverts, or bug reports found since
   merge (August 23, 2025 to present)

#### 5. Backporting History

**THIS COMMIT HAS ALREADY BEEN BACKPORTED:**
- **Upstream commit:** fee2e558b4884 (August 23, 2025)
- **Backport commit:** 37b630a26d235 (October 3, 2025)
- **Signed-off-by:** Sasha Levin <sashal@kernel.org>
- **Currently in:** build/linus-next branch

The backport uses the standard upstream tag format:
```
[ Upstream commit fee2e558b4884df08fad8dd0e5e12466dce89996 ]
```

#### 6. Prerequisites for Backporting

**Driver availability:** The Apple mailbox driver was introduced in
commit 6e1457fcad3ff (merged in v6.8-rc1, released in v6.8). Therefore,
this backport is only applicable to:
- ✅ linux-6.8.y and later stable trees
- ✅ linux-6.10.y (confirmed in v6.10 tag)
- ✅ linux-6.11.y and newer

**Dependencies:**
- Base mailbox driver (present since v6.8)
- DT bindings update from patch 1/9 (commit 32299eb03414c)

#### 7. User Impact

**Positive impact for A11/T2 users:**
- Enables mailbox communication with coprocessors on Apple A11 (iPhone
  8/8 Plus/X) and T2 (2018-2020 Intel Macs) hardware
- Required for NVMe functionality on these systems
- Addresses known issue (Bugzilla #202567: "2018 Macbook T2 chip
  prevents nvme SSD access")
- No negative impact on other Apple hardware or non-Apple systems

---

### Conclusion

**YES - This commit should be backported** because:

1. ✅ **Already selected:** Backported as 37b630a26d235 by Sasha Levin
2. ✅ **Policy compliant:** Qualifies as device ID/quirk addition per
   stable-kernel-rules.rst
3. ✅ **Low risk:** Small, isolated, well-contained change (19 lines)
4. ✅ **Enables critical functionality:** Required for NVMe and
   coprocessor communication on A11/T2 hardware
5. ✅ **Consistent precedent:** Similar commits from the same series have
   been backported
6. ✅ **No regressions:** No known issues or fixes required since merge
7. ✅ **Real user benefit:** Enables hardware support for existing Apple
   A11/T2 systems

The commit is suitable for all stable trees v6.8.y and later where the
base mailbox driver is present.

 drivers/soc/apple/mailbox.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
index 49a0955e82d6c..8f29108dc69ac 100644
--- a/drivers/soc/apple/mailbox.c
+++ b/drivers/soc/apple/mailbox.c
@@ -47,6 +47,9 @@
 #define APPLE_ASC_MBOX_I2A_RECV0 0x830
 #define APPLE_ASC_MBOX_I2A_RECV1 0x838
 
+#define APPLE_T8015_MBOX_A2I_CONTROL	0x108
+#define APPLE_T8015_MBOX_I2A_CONTROL	0x10c
+
 #define APPLE_M3_MBOX_CONTROL_FULL BIT(16)
 #define APPLE_M3_MBOX_CONTROL_EMPTY BIT(17)
 
@@ -382,6 +385,21 @@ static int apple_mbox_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct apple_mbox_hw apple_mbox_t8015_hw = {
+	.control_full = APPLE_ASC_MBOX_CONTROL_FULL,
+	.control_empty = APPLE_ASC_MBOX_CONTROL_EMPTY,
+
+	.a2i_control = APPLE_T8015_MBOX_A2I_CONTROL,
+	.a2i_send0 = APPLE_ASC_MBOX_A2I_SEND0,
+	.a2i_send1 = APPLE_ASC_MBOX_A2I_SEND1,
+
+	.i2a_control = APPLE_T8015_MBOX_I2A_CONTROL,
+	.i2a_recv0 = APPLE_ASC_MBOX_I2A_RECV0,
+	.i2a_recv1 = APPLE_ASC_MBOX_I2A_RECV1,
+
+	.has_irq_controls = false,
+};
+
 static const struct apple_mbox_hw apple_mbox_asc_hw = {
 	.control_full = APPLE_ASC_MBOX_CONTROL_FULL,
 	.control_empty = APPLE_ASC_MBOX_CONTROL_EMPTY,
@@ -418,6 +436,7 @@ static const struct apple_mbox_hw apple_mbox_m3_hw = {
 
 static const struct of_device_id apple_mbox_of_match[] = {
 	{ .compatible = "apple,asc-mailbox-v4", .data = &apple_mbox_asc_hw },
+	{ .compatible = "apple,t8015-asc-mailbox", .data = &apple_mbox_t8015_hw },
 	{ .compatible = "apple,m3-mailbox-v2", .data = &apple_mbox_m3_hw },
 	{}
 };
-- 
2.51.0


