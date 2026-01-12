Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B88C9EC72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bmL37SWFcbkglMubJcVDPsdpJrUA+r31xL6AqyqZMII=; b=uB4FJ1gacIinbkeljGKaHQKtL+
	GiQy565apSiS+5FMocqZtOTm0MDLbwNAdZi0xqWnPtOr2sfVYDP2elZSYVFYHg0jD9QaHzyFfGenX
	Pu8mWeoo1qKg7QyE5DnCTNKYWjTjAPMqe2xGRjFhYwey6Ok3PkhV5j3ehqy/M1OI4Y1bJNvC8ray8
	eelKSjk6wnBKQhWEtsLxXDjggXhy58pmhj2wUCTdqt5HcR6VxF/430cT97f76ObEyeBjeCpR4hIfd
	oSkbb+clcz7FaGjj8hEY2gJ+cOfIXgki+zVDh2BsDlpuX0pe8eIYZ7h/kfcusmrfGqEXjg+lp7NiP
	S4IOhF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfG8K-00000005GEn-1AXh;
	Mon, 12 Jan 2026 11:30:52 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfG8I-00000005GEG-03tM;
	Mon, 12 Jan 2026 11:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217450; x=1799753450;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x9yBYKu+E9haJuiNxih5HklWtFGozoP1TLTQmVVqVYo=;
  b=ecXFDjwrmqDkhXDeA+jgMEvpgSDyjjZeJSGPjp3W/lksSXKT4xDHcYFO
   JSsB0A/FFFPjzKNcf+OnOUGJA2dNPMVigexynGzc+5Zkad3zXPVFTNkju
   nDLp3O4KxMPSzie5C1Xxt3wxFyhgHMzIMknXcmVdX2ZMxuKjvFd/TZ//n
   lCLYxgcSdRLF/mCM9IEogS4X4N4drZLmTFJq4QfKh/fPRJYJ9gEfSE0r9
   C1LsHa/2AH+UBs84J+wkFqREgjsMuf2f4XmW4kJJefrZ8BhrMsQE8ZuYu
   TUfRihN1FTtoJHVOZbBTpO5gdduMX+5BId4xzKyBDx2zhhPVVd8VFNxI6
   Q==;
X-CSE-ConnectionGUID: p3I398d9QfiqggX0LZk3PA==
X-CSE-MsgGUID: YwgQyMd/Q7yorm7acqNhJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="57039093"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="57039093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:30:43 -0800
X-CSE-ConnectionGUID: yEqi1sGhSiewQaxQASZAKA==
X-CSE-MsgGUID: WccT3t8STDu6FLP/6V4MbQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 03:30:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C3B2398; Mon, 12 Jan 2026 12:30:40 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v1 1/1] CREDITS: Fix the ordering and other issues.
Date: Mon, 12 Jan 2026 12:30:38 +0100
Message-ID: <20260112113039.3759999-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_033050_127408_20D9D287 
X-CRM114-Status: GOOD (  15.07  )
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

I assume that the ordering should be done in default (C) locale
as other gives more lines shuffled. Fix the ordering accordingly.
With that being said, clearly make at the top header how it should
be sorted.

Note, I took some empirical assumptions that people usually put
their names in accordance with the First name(s) Last Name(s) split
based on the records around (before and after the move). I hope
I made no or little mistakes. In any case it's just a dozen of
names to update.

I dunno how often and how many people do really script this, but
at least one section is made in a wrong format, fix that as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 CREDITS | 190 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 95 insertions(+), 95 deletions(-)

diff --git a/CREDITS b/CREDITS
index ca75f110edb6..20362f9fabe1 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1,6 +1,7 @@
 	This is at least a partial credits-file of people that have
-	contributed to the Linux project.  It is sorted by name and
-	formatted to allow easy grepping and beautification by
+	contributed to the Linux project.  It is sorted by family name,
+	assuming the used locale is default, e.g. by setting LC_ALL=C,
+	and formatted to allow easy grepping and beautification by
 	scripts.  The fields are: name (N), email (E), web-address
 	(W), PGP key ID and fingerprint (P), description (D), and
 	snail-mail address (S).
@@ -71,11 +72,6 @@ D: dosfs, LILO, some fd features, ATM, various other hacks here and there
 S: Buenos Aires
 S: Argentina
 
-NTFS FILESYSTEM
-N: Anton Altaparmakov
-E: anton@tuxera.com
-D: NTFS filesystem
-
 N: Tim Alpaerts
 E: tim_alpaerts@toyota-motor-europe.com
 D: 802.2 class II logical link control layer,
@@ -92,6 +88,10 @@ S: Christ's College
 S: Cambridge CB2 3BU
 S: United Kingdom
 
+N: Anton Altaparmakov
+E: anton@tuxera.com
+D: NTFS filesystem
+
 N: C. Scott Ananian
 E: cananian@alumni.princeton.edu
 W: http://www.pdos.lcs.mit.edu/~cananian
@@ -346,6 +346,14 @@ D: Hardware spinlock (hwspinlock) subsystem
 D: OMAP hwspinlock driver
 D: OMAP remoteproc driver
 
+N: Muli Ben-Yehuda
+E: mulix@mulix.org
+E: muli@il.ibm.com
+W: http://www.mulix.org
+D: trident OSS sound driver, x86-64 dma-ops and Calgary IOMMU,
+D: KVM and Xen bits and other misc. hackery.
+S: Haifa, Israel
+
 N: Krzysztof Benedyczak
 E: golbi@mat.uni.torun.pl
 W: http://www.mat.uni.torun.pl/~golbi
@@ -364,14 +372,6 @@ S: 2322 37th Ave SW
 S: Seattle, Washington 98126-2010
 S: USA
 
-N: Muli Ben-Yehuda
-E: mulix@mulix.org
-E: muli@il.ibm.com
-W: http://www.mulix.org
-D: trident OSS sound driver, x86-64 dma-ops and Calgary IOMMU,
-D: KVM and Xen bits and other misc. hackery.
-S: Haifa, Israel
-
 N: Johannes Berg
 E: johannes@sipsolutions.net
 W: https://johannes.sipsolutions.net/
@@ -395,14 +395,14 @@ S: 1549 Hiironen Rd.
 S: Brimson, MN  55602
 S: USA
 
-N: Arnd Bergmann
-D: Maintainer of Cell Broadband Engine Architecture
-
 N: Hennus Bergman
 P: 1024/77D50909 76 99 FD 31 91 E1 96 1C  90 BB 22 80 62 F6 BD 63
 D: Author and maintainer of the QIC-02 tape driver
 S: The Netherlands
 
+N: Arnd Bergmann
+D: Maintainer of Cell Broadband Engine Architecture
+
 N: Tomas Berndtsson
 E: tomas@nocrew.org
 W: http://tomas.nocrew.org/
@@ -494,10 +494,6 @@ D: Various fixes (mostly networking)
 S: Montreal, Quebec
 S: Canada
 
-N: Zoltán Böszörményi
-E: zboszor@mail.externet.hu
-D: MTRR emulation with Cyrix style ARR registers, Athlon MTRR support
-
 N: John Boyd
 E: boyd@cis.ohio-state.edu
 D: Co-author of wd7000 SCSI driver
@@ -591,9 +587,6 @@ N: Zach Brown
 E: zab@zabbo.net
 D: maestro pci sound
 
-N: Zefan Li
-D: Contribution to control group stuff
-
 N: David Brownell
 D: Kernel engineer, mentor, and friend.  Maintained USB EHCI and
 D: gadget layers, SPI subsystem, GPIO subsystem, and more than a few
@@ -634,6 +627,10 @@ S: Ravenhorst 58
 S: 2317 AK Leiden
 S: The Netherlands
 
+N: Zoltán Böszörményi
+E: zboszor@mail.externet.hu
+D: MTRR emulation with Cyrix style ARR registers, Athlon MTRR support
+
 N: Michael Callahan
 E: callahan@maths.ox.ac.uk
 D: PPP for Linux
@@ -701,6 +698,10 @@ S: Tamsui town, Taipei county,
 S: Taiwan 251
 S: Republic of China
 
+N: Landen Chao
+E: Landen.Chao@mediatek.com
+D: MT7531 Ethernet switch support
+
 N: Michael Elizabeth Chastain
 E: mec@shout.net
 D: Configure, Menuconfig, xconfig
@@ -713,10 +714,6 @@ D: Media subsystem (V4L/DVB) drivers and core
 D: EDAC drivers and EDAC 3.0 core rework
 S: Brazil
 
-N: Landen Chao
-E: Landen.Chao@mediatek.com
-D: MT7531 Ethernet switch support
-
 N: Raymond Chen
 E: raymondc@microsoft.com
 D: Author of Configure script
@@ -1436,6 +1433,10 @@ D: Made support for modules, ramdisk, generic-serial, etc. optional.
 D: Transformed old user space bdflush into 1st kernel thread - kflushd.
 D: Many other patches, documentation files, mini kernels, utilities, ...
 
+N: Andy Gospodarek
+E: andy@greyhouse.net
+D: Maintenance and contributions to the network interface bonding driver.
+
 N: Masanori GOTO
 E: gotom@debian.or.jp
 D: Workbit NinjaSCSI-32Bi/UDE driver
@@ -1448,10 +1449,6 @@ S: 8124 Constitution Apt. 7
 S: Sterling Heights, Michigan 48313
 S: USA
 
-N: Andy Gospodarek
-E: andy@greyhouse.net
-D: Maintenance and contributions to the network interface bonding driver.
-
 N: Wolfgang Grandegger
 E: wg@grandegger.com
 D: Controller Area Network (device drivers)
@@ -1512,6 +1509,14 @@ S: 44 St. Joseph Street, Suite 506
 S: Toronto, Ontario, M4Y 2W4
 S: Canada
 
+N: Nitin Gupta
+E: ngupta@vflare.org
+D: zsmalloc memory allocator and zram block device driver
+
+N: Justin Guyett
+E: jguyett@andrew.cmu.edu
+D: via-rhine net driver hacking
+
 N: Richard Günther
 E: rguenth@tat.physik.uni-tuebingen.de
 W: http://www.tat.physik.uni-tuebingen.de/~rguenth
@@ -1520,14 +1525,6 @@ D: binfmt_misc
 S: 72074 Tübingen
 S: Germany
 
-N: Justin Guyett
-E: jguyett@andrew.cmu.edu
-D: via-rhine net driver hacking
-
-N: Nitin Gupta
-E: ngupta@vflare.org
-D: zsmalloc memory allocator and zram block device driver
-
 N: Danny ter Haar
 E: dth@cistron.nl
 D: /proc/cpuinfo, reboot on panic , kernel pre-patch tester ;)
@@ -1918,16 +1915,6 @@ E: sjenning@redhat.com
 D: Creation and maintenance of zswap
 D: Creation and maintenace of the zbud allocator
 
-N: Jeremy Kerr
-D: Maintainer of SPU File System
-
-N: Michael Kerrisk
-E: mtk.manpages@gmail.com
-W: https://man7.org/
-P: 4096R/3A35CE5E E522 595B 52ED A4E6 BFCC  CB5E 8561 9911 3A35 CE5E
-D: Maintainer of the Linux man-pages project
-D: Linux man pages online, at <https://man7.org/linux/man-pages/>
-
 N: Niels Kristian Bech Jensen
 E: nkbj1970@hotmail.com
 D: Miscellaneous kernel updates and fixes.
@@ -2072,6 +2059,16 @@ S: Keplerstr. 6
 S: 4050 Traun
 S: Austria
 
+N: Jeremy Kerr
+D: Maintainer of SPU File System
+
+N: Michael Kerrisk
+E: mtk.manpages@gmail.com
+W: https://man7.org/
+P: 4096R/3A35CE5E E522 595B 52ED A4E6 BFCC  CB5E 8561 9911 3A35 CE5E
+D: Maintainer of the Linux man-pages project
+D: Linux man pages online, at <https://man7.org/linux/man-pages/>
+
 N: Karl Keyte
 E: karl@koft.com
 D: Disk usage statistics and modifications to line printer driver
@@ -2447,6 +2444,9 @@ D: and much more. He was the maintainer of MD from 2016 to 2018. Shaohua
 D: passed away late 2018, he will be greatly missed.
 W: https://www.spinics.net/lists/raid/msg61993.html
 
+N: Zefan Li
+D: Contribution to control group stuff
+
 N: Stephan Linz
 E: linz@mazet.de
 E: Stephan.Linz@gmx.de
@@ -2506,11 +2506,6 @@ D: misc. kernel hacking and debugging
 S: Cambridge, MA 02139
 S: USA
 
-N: Martin von Löwis
-E: loewis@informatik.hu-berlin.de
-D: script binary format
-D: NTFS driver
-
 N: H.J. Lu
 E: hjl@gnu.ai.mit.edu
 D: GCC + libraries hacker
@@ -2539,6 +2534,11 @@ S: Puistokaari 1 E 18
 S: 00200 Helsinki
 S: Finland
 
+N: Martin von Löwis
+E: loewis@informatik.hu-berlin.de
+D: script binary format
+D: NTFS driver
+
 N: Daniel J. Maas
 E: dmaas@dcine.com
 W: https://www.maasdigital.com
@@ -2589,10 +2589,6 @@ S: PO BOX 220, HFX. CENTRAL
 S: Halifax, Nova Scotia
 S: Canada B3J 3C8
 
-N: Kai Mäkisara
-E: Kai.Makisara@kolumbus.fi
-D: SCSI Tape Driver
-
 N: Asit Mallick
 E: asit.k.mallick@intel.com
 D: Linux/IA-64
@@ -2871,13 +2867,6 @@ S: 12725 SW Millikan Way, Suite 400
 S: Beaverton, Oregon 97005
 S: USA
 
-N: Eberhard Mönkeberg
-E: emoenke@gwdg.de
-D: CDROM driver "sbpcd" (Matsushita/Panasonic/Soundblaster)
-S: Ruhstrathöhe 2 b.
-S: D-37085 Göttingen
-S: Germany
-
 N: Thomas Molina
 E: tmolina@cablespeed.com
 D: bug fixes, documentation, minor hackery
@@ -2960,6 +2949,17 @@ S: Dragonvagen 1 A 13
 S: FIN-00330 Helsingfors
 S: Finland
 
+N: Kai Mäkisara
+E: Kai.Makisara@kolumbus.fi
+D: SCSI Tape Driver
+
+N: Eberhard Mönkeberg
+E: emoenke@gwdg.de
+D: CDROM driver "sbpcd" (Matsushita/Panasonic/Soundblaster)
+S: Ruhstrathöhe 2 b.
+S: D-37085 Göttingen
+S: Germany
+
 N: Matija Nalis
 E: mnalis@jagor.srce.hr
 E: mnalis@voyager.hr
@@ -3151,13 +3151,6 @@ S: RR #5, 497 Pole Line Road
 S: Thunder Bay, Ontario
 S: CANADA P7C 5M9
 
-N: Inaky Perez-Gonzalez
-E: inaky.perez-gonzalez@intel.com
-E: linux-wimax@intel.com
-E: inakypg@yahoo.com
-D: WiMAX stack
-D: Intel Wireless WiMAX Connection 2400 driver
-
 N: Yuri Per
 E: yuri@pts.mipt.ru
 D: Some smbfs fixes
@@ -3165,6 +3158,13 @@ S: Demonstratsii 8-382
 S: Tula 300000
 S: Russia
 
+N: Inaky Perez-Gonzalez
+E: inaky.perez-gonzalez@intel.com
+E: linux-wimax@intel.com
+E: inakypg@yahoo.com
+D: WiMAX stack
+D: Intel Wireless WiMAX Connection 2400 driver
+
 N: Thomas Petazzoni
 E: thomas.petazzoni@bootlin.com
 D: Driver for the Marvell Armada 370/XP network unit.
@@ -3279,14 +3279,14 @@ N: Frederic Potter
 E: fpotter@cirpack.com
 D: Some PCI kernel support
 
-N: Rui Prior
-E: rprior@inescn.pt
-D: ATM device driver for NICStAR based cards
-
 N: Roopa Prabhu
 E: roopa@nvidia.com
 D: Bridge co-maintainer, vxlan and networking contributor
 
+N: Rui Prior
+E: rprior@inescn.pt
+D: ATM device driver for NICStAR based cards
+
 N: Stefan Probst
 E: sp@caldera.de
 D: The Linux Support Team Erlangen, 1993-97
@@ -3925,12 +3925,6 @@ S: C/ Federico Garcia Lorca 1 10-A
 S: Sevilla 41005
 S: Spain
 
-N: Björn Töpel
-E: bjorn@kernel.org
-D: AF_XDP
-S: Gothenburg
-S: Sweden
-
 N: Linus Torvalds
 E: torvalds@linux-foundation.org
 D: Original kernel hacker
@@ -3984,17 +3978,6 @@ D: Linux-Workshop Köln (aka LUG Cologne, Germany), Installfests
 S: Tacitusstr. 6
 S: D-50968 Köln
 
-N: Tsu-Sheng Tsao
-E: tsusheng@scf.usc.edu
-D: IGMP(Internet Group Management Protocol) version 2
-S: 2F 14 ALY 31 LN 166 SEC 1 SHIH-PEI RD
-S: Taipei
-S: Taiwan 112
-S: Republic of China
-S: 24335 Delta Drive
-S: Diamond Bar, California 91765
-S: USA
-
 N: Theodore Ts'o
 E: tytso@mit.edu
 D: Random Linux hacker
@@ -4011,6 +3994,17 @@ S: 1 Amherst Street
 S: Cambridge, Massachusetts 02139
 S: USA
 
+N: Tsu-Sheng Tsao
+E: tsusheng@scf.usc.edu
+D: IGMP(Internet Group Management Protocol) version 2
+S: 2F 14 ALY 31 LN 166 SEC 1 SHIH-PEI RD
+S: Taipei
+S: Taiwan 112
+S: Republic of China
+S: 24335 Delta Drive
+S: Diamond Bar, California 91765
+S: USA
+
 N: Luben Tuikov
 E: Luben Tuikov <ltuikov89@gmail.com>
 D: Maintainer of the DRM GPU Scheduler
@@ -4033,6 +4027,12 @@ S: 44 Campbell Park Crescent
 S: Edinburgh EH13 0HT
 S: United Kingdom
 
+N: Björn Töpel
+E: bjorn@kernel.org
+D: AF_XDP
+S: Gothenburg
+S: Sweden
+
 N: Thomas Uhl
 E: uhl@sun1.rz.fh-heilbronn.de
 D: Application programmer
-- 
2.50.1


