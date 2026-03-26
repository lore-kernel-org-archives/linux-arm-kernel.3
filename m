Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3FF10AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:References:
	In-Reply-To:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qX+reOEVuZDx8UfWmUlNl/QyI4m0a7yMtNo+lm1iM6U=; b=xm26nAWkBRlkS8
	S1A9hOj+Wl1ZgyDFrz2rYPfaGb595Kxi2pXLnbFz0dOuZKIaQK8x8Fzk20P4L+M3vBhvAt6YpNkC+
	Xwsv72l5wRsm4rrzlTcZHsuAd+0uZCgybXZfruxrJv7Ka3SsOcf2sBmtqHMWROD7nVBB9a9P9adww
	8mZMwxcDH+7qTdrXmgNIbZ4j4nwPt6X8DzI+2BMGk8AkDvvwtUFpJwzEt7TSDID3uggivwwbTeaxO
	nbCPdbJfWjevfNWNj1oeBqazrzGTNQ3tySAtYDYs1JWBdW1M0Ra5HQ8+24HyI4An+d6B7cTFCbOxv
	ekhTZ3peMF1yP5PpTZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sx2-00000006Hpb-2D6t;
	Thu, 26 Mar 2026 22:13:16 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5swx-00000006HnC-1vxV;
	Thu, 26 Mar 2026 22:13:14 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 414AFEC021A;
	Thu, 26 Mar 2026 18:13:07 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 18:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774563187;
	 x=1774649587; bh=qX+reOEVuZDx8UfWmUlNl/QyI4m0a7yMtNo+lm1iM6U=; b=
	pGhSj7oYfDFtC4yTawBr4o9yATU1gmVXGZDEoex2dGMae3zk8OTK7Pg0uuYF7sN8
	n+smmn4tl4iewvK9BJp+OISMH52Mb6c8hkcmgzexRqsJS1r8ept8LZD8KsK2gLQL
	CZCudHIFd5D/lfYMWbo3KqZ+AbQ7J346KVBgzB+cYkv0Dhvy2KNtlAwdTAT0yMvu
	yLsUNdwlpPIj9cbsVgEqngD+HTu0inJbVY6sFNstpwSpdeglQpSCARm9Oocsosqd
	xUXZsR8wM9hFY4GReGRAMS9tZMiAoQXGcWdr/ozEkKLOMGsmhoeDfzWvfVH1xu3t
	b91/TJhVTq3BhWqwensVvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774563187; x=
	1774649587; bh=qX+reOEVuZDx8UfWmUlNl/QyI4m0a7yMtNo+lm1iM6U=; b=v
	Rv5M+/1U59VLnqKLWgzYz7vd+Gnw82id1jVvm4sLkfdlUXtJvc3l8JuAXTDUvNo4
	L3WceGQenSSYuOQMuy8H0agE2QymM1vpkYnyDgi6BQtA2iW/++ZdBPmrzKzVaBsm
	yKPKkPNrCJAUqNVtZUQno4+vOeIOCfFtTK41wRJaQB5k9gIckGSRKt2/zU6zTQvD
	6SkckaKj7kLCpq2+tIvaYaa3GVMpMwWRYa8QISzdwaVr4lo+R49cE2Qh3ALT21eh
	HwazupJQvY0bMAGhU0Jg9gCkb+KwVNsA2he7DMEWvDHI+7SduAxYSXWfqyOMFetw
	qc9i11/g07AjwZ8aIpOPQ==
X-ME-Sender: <xms:ca_FaaHL4KrciFh0Osd_lsHQNU57zijnWZ1D8wkaHWZXYtw4mRcYOw>
    <xme:ca_FaWItpOo9rW0InPMCUn_1iyrQpMpEnvLeFbIfbXCMdm9WsoABLyy_ZllLE3lYm
    WbiG63T_fwRgqmX3Ao_rBV-_AksU5jCNmF5IpUJ8Jubvluv3HQ1qtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhufffjghfkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepud
    ejheduhfehfeehfeeuueefiefggfdtueduheetveekjefhfeefheejiedtjeevnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthho
    peduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtg
    gthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
    peefudelfeeifedusehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhrghpuhhishgurg
    hrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehluhgsnhhinhdrihhvrghnsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepmhgvlhhinhhkohdvtddtfeesghhmrghilhdrtghomhdprhgtphhtthhopehnih
    htihhnrdhrvgguugihkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigvlhhnrghg
    rgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:ca_FaSKgoS2wIHgiy66KlO8z_UHZ2r_g49qltqzHAeba29OTYTPjJw>
    <xmx:cq_FaTgGbpAWfLANYCWmXmSJVmV_5KvhPpmDhw4Vc2vTR5tppz3InQ>
    <xmx:cq_FabMzDnSFnc5QuBOouf4sfVmqv7_m4gMUyQvQ7tKqps_URLeF2A>
    <xmx:cq_FaW5Tu0vCJVtndaA6Xme_78L0iA7GtStfVVI-58SJpUupLHT1rQ>
    <xmx:c6_FaWouPJDNzLnqZS2OGx9d94liJnOckF1sAb9XNzwji8zA3p6u-Rt6>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D23A71EA006B; Thu, 26 Mar 2026 18:13:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Subject: [PATCH v3 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
Date: Thu, 26 Mar 2026 16:13:03 -0600
In-Reply-To: <177272816248.352280.12453518046823439297@jetm.me>
References: <177272816248.352280.12453518046823439297@jetm.me>
Message-Id: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3dwSc0sjc92kEt3i0oKC/KISXTNTC8tEU4NkSzPDNCWgvoKi1LT
 MCrCZ0bG1tQCSofBsYwAAAA==
X-Change-ID: 20260305-mt7927-bt-support-6589a50c961f
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Gilbert <xelnaga@gmail.com>, 
 Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, 
 Llewellyn Curran <melinko2003@gmail.com>, 
 Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
 Nitin Gurram <nitin.reddy88@gmail.com>, 
 Thibaut FRANCOIS <tibo@humeurlibre.fr>, Ivan Lubnin <lubnin.ivan@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4754; i=floss@jetm.me;
 h=from:subject:message-id; bh=OpgBAjKnDiir2AF1xHFd8B3qoKOvAbft3PxkCn8MgxY=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxa9v6PKNfz3YcaZt0nUslqXRsBppv56R6OBGt
 dSpUoVePpaJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWvbwAKCRC17sMLqGd3
 HxYzDACaoVolEfsF6bbF0o5E1HgLf3XRo6eb4/TNYcpdczqzpDrDcAcdWjFAleqT4ykM/6iRfjQ
 mvgYGQ74DFxTSElYtvkwYNtLM+6GDgSidC6jeA6wyfraSyDCCQRpNNuW1iCUwybTUXonix42l2I
 gkna77O3GjhwhGe0x+BJEWT0BfO2tM+sqZwUxaoL6KvghNrfqtuXdM0ND/2MnbO5gIvHU2Q4rcX
 lokLaoE+CGymEuxVmb4bCiOx3Vic2oXEByApThj+CErvHUO/KTSt8H8ULSCj1NsALcBTF4/Ku2K
 klvHF0xQAR+tpQMFzRbBdlLd5PU0IXFpUVN1968/pdR4Ne3/nTxKBt3WkPHqcg1GCF+g83d1oFN
 /lANyDn3vxffV6hztg2oXh1n6p5/BfayKovkXr5NqeeyXxr5JOYJWVoLFYGT/MoJZn+BEHVPjnf
 e10o2xCMfU7FR/AaxpQfn1cCq93EwUrcc7K816nn8/p+vgAWM8dmtIPLTNhpQnTEjfRmg=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_151312_237642_D7CB7112 
X-CRM114-Status: GOOD (  14.65  )
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

This series adds Bluetooth support for the MediaTek MT7927 (Filogic 380)
combo WiFi 7 + BT 5.4 module. The BT subsystem uses hardware variant
0x6639 and connects via USB.

The MT7927 is shipping in motherboards and PCIe add-in cards from ASUS,
Gigabyte, Lenovo, MSI, and TP-Link since mid-2024. Without these patches,
users see "Unsupported hardware variant (00006639)" or the BT subsystem
hangs during firmware download.

The series consists of eight patches:

  [1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
  [2/8] Bluetooth: btmtk: fix ISO interface setup for single alt setting
  [3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
  [4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
  [5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
  [6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
  [7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
  [8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creator

Three driver changes are needed for MT6639 (patch 1):

1. CHIPID workaround: On some boards the BT USB MMIO register reads
   0x0000 for dev_id. Force dev_id to 0x6639 only when the USB VID/PID
   matches a known MT6639 device, avoiding misdetection if a future
   chip also reads zero. This follows the WiFi-side pattern.

2. Firmware naming: MT6639 uses firmware version prefix "2_1" instead of
   "1_1" used by MT7925 and other variants. The firmware path is
   mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin, using the mt7927
   directory to match the WiFi firmware convention. The filename will
   likely change to use MT7927 once MediaTek submits a dedicated
   Linux firmware binary.

3. Section filtering: The firmware binary contains 9 sections, but only
   sections with (dlmodecrctype & 0xff) == 0x01 are Bluetooth-related.
   Sending WiFi/other sections causes an irreversible BT subsystem hang.

Patch 2 fixes the ISO interface setup for devices that expose only a
single alternate setting (alt 0) on the ISO endpoint. Without this fix,
btmtk_usb_claim_iso_intf() fails with EINVAL, causing ~20 second
initialization delays on 13d3:3588 devices.

Tested on:
- ASUS ROG Crosshair X870E Hero (USB 0489:e13a)
- ASUS ROG STRIX X870E-E (USB 13d3:3588)
- ASUS ROG STRIX B850-E GAMING WIFI (USB 0489:e13a)
- Gigabyte Z790 AORUS MASTER X (USB 0489:e10f)
- Lenovo Legion Pro 7 16ARX9 (USB 0489:e0fa)
- MSI MEG X870E ACE MAX (USB 0489:e110)
- TP-Link Archer TBE550E PCIe (USB 0489:e116)

The firmware blob is being submitted separately to linux-firmware via
GitLab MR !946. The firmware path has been updated to mediatek/mt7927/
per maintainer feedback.

Changes in v3 (suggested by Sean Wang):
- Scoped CHIPID workaround to a static VID/PID table of known MT6639
  USB devices instead of mapping all zero-CHIPID cases to 0x6639
- Changed firmware path from mediatek/mt6639/ to mediatek/mt7927/ to
  match the WiFi firmware convention and avoid confusion
- Added MODULE_FIRMWARE(FIRMWARE_MT7927) for initramfs firmware discovery
- Added Tested-by for 0489:e110 (Nitin Gurram)

Changes in v2:
- Split USB device IDs into per-device commits as requested (Luiz)
- Added 0489:e110 (MSI X870E Ace Max, new hardware report)
- Added ISO interface fix for single alt setting (13d3:3588 devices)
- Added Tested-by trailers for all USB IDs
- Added USB descriptor output to all per-device commits
- Removed BTMTK_FIRMWARE_LOADED skip logic (Sean Wang)

Link to v2: https://lore.kernel.org/linux-bluetooth/20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me/T/#t
Link to v1: https://lore.kernel.org/linux-bluetooth/177272816248.352280.12453518046823439297@jetm.me/

Signed-off-by: Javier Tia <floss@jetm.me>
---
Javier Tia (8):
      Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
      Bluetooth: btmtk: fix ISO interface setup for single alt setting
      Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
      Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
      Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
      Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
      Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
      Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creator

 drivers/bluetooth/btmtk.c | 56 ++++++++++++++++++++++++++++++++++++++++++++---
 drivers/bluetooth/btmtk.h |  1 +
 drivers/bluetooth/btusb.c | 12 ++++++++++
 3 files changed, 66 insertions(+), 3 deletions(-)
---
base-commit: 50003ce2085a7f7dacf2426065d1a69c84b5b963
change-id: 20260305-mt7927-bt-support-6589a50c961f

Best regards,
--  
Javier Tia <floss@jetm.me>


