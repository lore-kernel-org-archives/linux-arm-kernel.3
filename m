Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CECFC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2cVTrac5w1oJq+2NjPNhqrgEK1meG9BhgzDbNCnoVA=; b=YK2aJCRKWls3kc2wP/vEPf/9G2
	pBYrAYa/Q+heNP34G14AFwAntHc508XIcXx4fWlQ+rUoaNqK3FuoPvQ3TNEeqXOaxtbE57Hs6kYtc
	xqimDU/jo2tz+joHEkTZ0ZYs4J/tUqYfyyNnValTVmzCMV8SSCTWim5Ej+6EfEZmpuDcg04TRT0xv
	e4aaHUPCuSDIazVRniHjIPyxdhE9JtvZN5EPhRpaW/lLikYpoJgzj8xSCOOKgNA6/UApy0G5ha4LY
	cBEzcqTZCqFp+3XV9Dc6P09Swz9zB/c6UjwEmGpCKde+LygEteLosyJniuI9gr7Bezh80r+BoQ58t
	dONVXDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcPl-0000000C73o-28RE;
	Wed, 04 Jun 2025 00:55:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcLU-0000000C6HP-0kXj;
	Wed, 04 Jun 2025 00:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 361FA629D5;
	Wed,  4 Jun 2025 00:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB58C4CEEF;
	Wed,  4 Jun 2025 00:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998266;
	bh=iLJ18F72dw8zrV5oUqsM7UMPvk2FrsAbNVmPf28P/Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WUpoLWAEuj6yTvhvjOLDHB85H9HNIwBZPdMwP3rIU5N58T9l33p2W+8ikDwhwFz37
	 yE2BFDeyxhXDo6e+rt566BAHye/g/Me9e1NdNEEva6Fo6vvlzsMSqg9x8m1FZi8q3d
	 2sveN1ZICpPKRxjpKAq2G/M/hIC4JmHaiD0J0lXznZ9uuCSVWxrwuHnbtrA9Y007Hi
	 9Y1e45EQSZLucJZKL7ZPZKZzxvyWleFzpr0jDnyoxvD/4thJLIM6bOUQ51bipvlY1c
	 2xQBS9EtD7/fst/H7zYlE1NDojk3O5c+X7588teMKCTjMqlBD9/jDaV1BXYeiS+OwC
	 ORZ2tH/ktTxnA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jiande Lu <jiande.lu@mediatek.com>,
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
Subject: [PATCH AUTOSEL 6.15 010/118] Bluetooth: btusb: Add new VID/PID 13d3/3630 for MT7925
Date: Tue,  3 Jun 2025 20:49:01 -0400
Message-Id: <20250604005049.4147522-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Jiande Lu <jiande.lu@mediatek.com>

[ Upstream commit 5bd5c716f7ec3e25d8d3b8a7566e192a26f9c7ce ]

Add VID 13d3 & PID 3630 for MediaTek MT7925 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=07 Lev=01 Prnt=01 Port=10 Cnt=02 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3630 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Signed-off-by: Jiande Lu <jiande.lu@mediatek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees based on
the following analysis: ## Commit Analysis **Nature of the Change:**
This commit adds hardware support for a new MediaTek MT7925 Bluetooth
USB device with VID 13d3 and PID 3630. The change is a simple addition
of a single line to the USB device ID table in
`drivers/bluetooth/btusb.c`. **Code Changes:** The modification adds one
entry to the `quirks_table`: ```c { USB_DEVICE(0x13d3, 0x3630),
.driver_info = BTUSB_MEDIATEK | BTUSB_WIDEBAND_SPEECH }, ``` **Backport
Suitability Assessment:** 1. **Fixes User-Affecting Issue:** YES - This
enables Bluetooth functionality for users with this specific hardware
variant, which would otherwise be non-functional. 2. **Small and
Contained:** YES - The change is minimal (2 lines) and only adds a
device ID entry without modifying any existing logic or behavior. 3.
**No Side Effects:** YES - Adding a device ID entry has no impact on
existing devices or functionality. It only extends support to new
hardware. 4. **No Architectural Changes:** YES - This is purely a device
identification addition with no changes to the driver's architecture or
core functionality. 5. **Non-Critical Subsystem Impact:** YES - While
Bluetooth is important, this change only affects one specific device
variant and cannot break existing functionality. 6. **Minimal Regression
Risk:** YES - Device ID additions have virtually no risk of causing
regressions since they only affect the newly supported device. **Pattern
Consistency:** This commit follows the exact same pattern as the
provided reference commits (all marked "Backport Status: YES"): -
Similar commit #1: Added VID 13d3/PID 3628 for MT7925 - Similar commit
#2: Added VID 13d3/PID 3602 for MT7925 - Similar commit #3: Added VID
0489/PID e124 for MT7925 - Similar commit #4: Added VID 0489/PID e111
for MT7925 All these similar commits were deemed suitable for
backporting, and this commit is functionally identical in scope and risk
profile. **Stable Tree Compliance:** This change perfectly aligns with
stable tree criteria: - Fixes important hardware compatibility issue -
Introduces no new features beyond device recognition - Contains no
architectural modifications - Has minimal regression risk - Is confined
to a single driver file - Enables existing, well-tested code paths for
new hardware The commit enables users with this specific MT7925
Bluetooth adapter to have functional Bluetooth support in stable
kernels, which is an important user-facing improvement with essentially
zero risk.

 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index df3380a8de85e..c7c3cd0dcd49e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -720,6 +720,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3628), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3630), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
-- 
2.39.5


