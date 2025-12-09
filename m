Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89537D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 00:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BGgE3BUrwfN9GbU+a1o6ZtZ64bDmd712+qqtjkoFvw=; b=0cGhJUGGZUQUu9EUUzqhfv4Kn8
	+hmt4COxVGWz6h70gNVNpsHcX32I6NJm2xK3uYgZm7SKq8cCeH5IB/sPHIpp/br4eHSwWX3Nn0kSz
	Nsr+EIrXe8xd740XQyXXFIJZTmpilJofPUlWIyaVCr0/+/9ZYIRaqm685kxWI/AmcnC6YY5rT6ujd
	s26KY6rnsC06338wwDBGl1eRdGxrTYsYbUtF3MjPO3aI/n5htZsFP5kdk7MEJdBrDVuC1yLwM9WhD
	JwELz2hwuh/4UW1h3MSBZoHMFFSARSJvbbahPQcQ2n8QFih/73lli3555vwavisOO71UwUzwX6uEY
	Dx1jSaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlPh-0000000Defy-2GSO;
	Tue, 09 Dec 2025 00:17:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlPg-0000000DefV-0fO5;
	Tue, 09 Dec 2025 00:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8835F6015F;
	Tue,  9 Dec 2025 00:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F049C113D0;
	Tue,  9 Dec 2025 00:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239427;
	bh=8rFURERxvZ4xQnlalZg2HWTgFJMfPc2HkJeCYPf7A+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkAKv8KWxZUPkphtweZ3/vCEWKDLTvwQWGnwR49kJ024w+A1JT91G8c+pj9farzgf
	 OG9E5DAFEFI7P03GcPoq3tInqyV0fSnsnqWQkC2jEMJwY+bVV7l5EpX6vSpQnPUnBT
	 Ovjua/8tw4PofVy2tMGh31zNJCOUZOOwnVvzfWcC8ZmqPZuKvfblpeHbIsEEy1GC2Y
	 djHqOny2z0x01C8qsfu15rb21ohNX1iwFlwauomc0azsG54z5/tVaXmg3fW5wQ3UR7
	 sNjla4chrUFGIg5JRK4aI3641SoAHZka/IRoFEEfP4cfkXeYrd9XMV2+BlAvVpDBh1
	 oAKyzHeuTWV/A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chris Lu <chris.lu@mediatek.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
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
Subject: [PATCH AUTOSEL 6.18-6.12] Bluetooth: btusb: MT7920: Add VID/PID 0489/e135
Date: Mon,  8 Dec 2025 19:15:08 -0500
Message-ID: <20251209001610.611575-16-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209001610.611575-1-sashal@kernel.org>
References: <20251209001610.611575-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
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

From: Chris Lu <chris.lu@mediatek.com>

[ Upstream commit c126f98c011f5796ba118ef2093122d02809d30d ]

Add VID 0489 & PID e135 for MediaTek MT7920 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=06 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e135 Rev= 1.00
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
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Commit Analysis: Bluetooth btusb MT7920 VID/PID Addition

### 1. COMMIT MESSAGE ANALYSIS

**Subject:** Adding a new USB VID/PID (0489/e135) for MediaTek MT7920
Bluetooth chip

**Key observations:**
- No `Cc: stable@vger.kernel.org` tag (not unusual for device ID
  additions)
- No `Fixes:` tag (not applicable - this enables new hardware, doesn't
  fix a bug)
- Author is from MediaTek (hardware vendor)
- Has `Reviewed-by` from Paul Menzel
- Signed off by Bluetooth maintainer Luiz Augusto von Dentz

### 2. CODE CHANGE ANALYSIS

The change is minimal:
```c
+       { USB_DEVICE(0x0489, 0xe135), .driver_info = BTUSB_MEDIATEK |
+
BTUSB_WIDEBAND_SPEECH },
```

This adds a single USB device ID entry to the `quirks_table[]` in
`drivers/bluetooth/btusb.c`. The entry:
- Uses VID 0x0489, PID 0xe135
- Uses identical flags to the adjacent MT7920 entry (0x0489, 0xe134)
- Follows the exact pattern of all other MediaTek device entries

### 3. CLASSIFICATION

This falls squarely into the **"NEW DEVICE IDs"** exception category for
stable backports. Per the stable kernel rules:

> Adding PCI IDs, USB IDs, ACPI IDs, etc. to existing drivers - These
are trivial one-line additions that enable hardware support

The btusb driver already fully supports MediaTek MT7920 devices; this
just adds recognition for a new variant.

### 4. SCOPE AND RISK ASSESSMENT

| Factor | Assessment |
|--------|------------|
| Lines changed | 2 (effectively 1 entry) |
| Files touched | 1 |
| Complexity | Trivial |
| Risk | Essentially zero |

**Risk justification:** This only affects devices with exactly
VID=0x0489 and PID=0xe135. It cannot cause regressions for any other
hardware. The change is purely additive with no modification to existing
functionality.

### 5. USER IMPACT

**Without this patch:** Users with MT7920 Bluetooth USB adapters using
this VID/PID combination have no Bluetooth functionality - the kernel
doesn't recognize their device.

**With this patch:** Bluetooth works normally using the mature, existing
MediaTek btusb support.

The USB device information in the commit message confirms this is real
hardware that users possess.

### 6. STABILITY INDICATORS

- ✅ Reviewed by Paul Menzel
- ✅ Signed off by Bluetooth subsystem maintainer
- ✅ Author from hardware vendor (MediaTek)
- ✅ Identical pattern to many existing entries
- ✅ Same flags used as sister device (e134)

### 7. DEPENDENCY CHECK

- **No dependencies** on other commits
- Uses existing macros (`USB_DEVICE`) and flags (`BTUSB_MEDIATEK`,
  `BTUSB_WIDEBAND_SPEECH`)
- The btusb driver with MediaTek MT7920 support exists in stable kernels

### CONCLUSION

This is a textbook stable-appropriate device ID addition:

1. **Trivial 2-line change** - lowest possible complexity
2. **Zero regression risk** - only affects one specific hardware variant
3. **Real user impact** - enables Bluetooth for users with this hardware
4. **Well-reviewed** - proper sign-offs from maintainer and vendor
5. **No new code** - leverages existing, mature MediaTek btusb support
6. **No dependencies** - applies cleanly to any kernel with MT7920
   support

Device ID additions like this are routinely backported to stable trees
because they provide clear value (enabling hardware) with essentially no
risk. The pattern is identical to dozens of similar entries in the same
file.

**YES**

 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fa683bb7f0b49..595afeff4afb5 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -621,6 +621,8 @@ static const struct usb_device_id quirks_table[] = {
 	/* Additional MediaTek MT7920 Bluetooth devices */
 	{ USB_DEVICE(0x0489, 0xe134), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe135), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3620), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3621), .driver_info = BTUSB_MEDIATEK |
-- 
2.51.0


