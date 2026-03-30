Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FBF1061B1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVHd+2ZauyHwNk7khM0QiFJuTBAS85ERsapbSIu9KaY=; b=s6NcuTntSWKpJd9VRPCL0bc9PZ
	PMFb8VKID6S43qAgiOsCzIuKSRGw4XW0TjuhqECt1Jcx8QwDYBma2xofRXt9Swl1V70cGy+tjyTJA
	bxheGTDgK9RzTwU3LP+bg5UL96HNPjuo8IWZVDW9Z0TqIiKRqIxrxoOmgbo45d7TdNBflm6q16si1
	03F622ESbfRYJXJqEVRlByG5Xq1JgOXwTN4DFqxFAZ9GOG90+smTYfAITDH6E92HQPHs0JAPy82HH
	6CMdwA/bA6WfQFicGzM4dkZ11nlzqpCCXWn6oSqap1CiwAywRuVouabeFC+TyFZa8KN046A+CBp1p
	846LxjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JPV-0000000BrBK-2b6A;
	Mon, 30 Mar 2026 20:40:33 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOe-0000000BqRk-2NAU;
	Mon, 30 Mar 2026 20:39:42 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AD54A14001CA;
	Mon, 30 Mar 2026 16:39:39 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903179;
	 x=1774989579; bh=XVHd+2ZauyHwNk7khM0QiFJuTBAS85ERsapbSIu9KaY=; b=
	SZU8bp4/CnfussehePm8wFSakP2oKoaIxlS0QJpZifY0Obo7AvOcjSkR93xTM8Hk
	qf9FGteiNFzA2xAcdY9ej8OLc1hUzBabiqCX29wMBmZ5E1XqgfTGlAhcKrxoLyub
	7i9S9k6zT0iSFZh0OmHFiCktj4TwjUfRPgp2K1qBctxC817gFcUkPFz6wTbyMO38
	WNY80glYe7D9Soesc9rwJWVyL899tDWmpRG7BLJ4JN7DxIXiUkhNY56Yq/7f9CWw
	oGkv05niUCbr3LGQOPqIO2jDp8MYoDW/VqtGTN1Pz6mT6rpamTJ/vOMz/Cz0xUrL
	mz/1D9KJxmH2bRC03NziFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903179; x=
	1774989579; bh=XVHd+2ZauyHwNk7khM0QiFJuTBAS85ERsapbSIu9KaY=; b=C
	XOwmOLMf2e9OPAzouQhueQpTwx5PR3NVsPM2t7UsrEVmMd09+1fCCTibAwW7vsF6
	BMMrX5XLjBMF6h8h7vkmjFdyfE/w1HVU/tEXtMzwsoKHyAIE27BiWgX5NjzWJpSi
	A15zN0yZgYYHQsRfrwt3Ae8PsNurRZiPYwMpqxr+1vsveZTMVgXOQjbmgxq0AnTh
	mA1fPUDVGhA9ejtF1YnmeNe8rXM4ENIL5bn78Fh92TdQxBwRISdAaYJfu6nYcG4y
	LdigCKYeYEloOdOvT8FEKiGyzvwKrgJ/Cqz+gLSkDG06UngpcDYNhAJ7p3rxk6AQ
	NjHA9st9Dj49WlPIE3X2Q==
X-ME-Sender: <xms:i9_KaWsuK7sI-CSz8yTlISri1a76FR6BnXCMu1zB-eGEeNVq4adlcg>
    <xme:i9_KaWS5Se0-lL59-1ZPMVyKls1aFMmQxZ9_V8AseTjRD4w6keLe5I4rYAK2nQgjL
    vhWigh7TYdoSC_6yNFlpCWIJh2owJC9NHyS9YthYNjDG9JJR358Hlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    grnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtoheplhhusghnihhnrdhivhgrnhesghhmrghilhdrtghomhdprh
    gtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtphhtthhopehm
    rghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrtggvlh
    eshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhn
    vghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepjhhnvghtthhosehmihhnvghirhhordhiohdprhgtphhtthhopehlihhnuhigqdgslh
    huvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:i9_KaWZMtvwiSaV3oMdxz81gYFL-0bhT0xW9A96htLWIQC8OmzBUeA>
    <xmx:i9_KaXqxwqYDZbnesTbFc6M5V-VQ_9WHP9OvTjsSmFlDeITSDYmlWQ>
    <xmx:i9_KaaRwH0zkmH1UstqNuOL4h5TdoxHtZZhiv04Nxooq5ppPLy7oCg>
    <xmx:i9_Kabogq649JyvFyh0jlfvzJkoitKktuYN2Z-Su9lu8DHCsgGsHWA>
    <xmx:i9_KacYhqgQXoPJy5lqQc7nNBhIKZ5H7-oTdr9DIES6y9C6SU1tdis0U>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B9231EA006B; Mon, 30 Mar 2026 16:39:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 30 Mar 2026 14:39:30 -0600
Subject: [PATCH v4 8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E /
 ProArt X870E-Creator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-mt7927-bt-support-v4-8-cecc025e7062@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>,
 Ivan Lubnin <lubnin.ivan@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2450; i=floss@jetm.me;
 h=from:subject:message-id; bh=lWryKhkw4iLj5N6UVE9I7cEeZDeTwxGqMUn3iSX25wU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpyt97rBWwMqDQ7qO3qxmhUUEg+s/H5giLy0upE
 tGaC75+vASJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacrfewAKCRC17sMLqGd3
 H+KZDACAqOImrKTW9otpDSSRGq15Rxkwz3aLm/97ClqWaN3eN00yjUYh956afQW8T9Ng14TZPKY
 5cr6NiZOGuM50kkLHl/k+drzpuBK/AJOgajLg0/EGtTcdxDj+oJan2uBkeRiQr7m/MebfwVZ12r
 hGOdiBsYFO7edInINi6Gwm/8VCBcISYJT5Icgy3Nmaw+sBgt71VeQtf1mmEKvdx10CJDIZkAozB
 Lmw+4WVvfXbJTgml2Fdhi9gKDQodSEB7WTiI2An6Xz3i/tdyqobycKR801TFL2hquSpRIFRmepb
 9Yf9UlT5cHSwOrdCBcga4XO6rkrNn0xNMRNP/rVD8gEtHemoLagyF5CbMmD98+qXYL9z7Y4sDTz
 XlBSR5/9PMOwOLJEue6nN1YuQ11LkHA6vsZjo2+krLki+eix2tU3pCVguzmzkUhYyqlwdYbpzZX
 GofklKL6kiOJBlsUy7CsyKdV0xBDRvXyCYYo0Zl2/49TfVsrCWi1oFCFJpae7dI2V6Teo=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133940_727255_EE5EC54F 
X-CRM114-Status: GOOD (  10.69  )
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

Add USB device ID 13d3:3588 (IMC Networks/Azurewave) for the MediaTek
MT7927 (Filogic 380) Bluetooth interface found on the ASUS ROG STRIX
X870E-E GAMING WIFI and ASUS ProArt X870E-Creator WiFi motherboards.

Note: boards with this USB ID report only one ISO alternate setting
(alt 0), causing a non-fatal "setting interface failed (22)" during
setup. Bluetooth still functions but initialization takes ~19 seconds
instead of ~2.6 seconds.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3588 Rev= 1.00
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
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221096
Link: https://github.com/openwrt/mt76/issues/927
Signed-off-by: Javier Tia <floss@jetm.me>
Tested-by: Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>
Tested-by: Ivan Lubnin <lubnin.ivan@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 55a000540439..45ef0d008bce 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -761,6 +761,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe116), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3588), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


