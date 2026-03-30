Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C031061B1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=pSHmnqB6EedbfEBWTLK/wSQgoB
	C+w3cj+TzVsmDdGpY5fnKSxY373690QKl8ntYDQ3KrNf6D7A50z+O0wnCfYlqc3t15RTCDRLWtbdQ
	Tn4hSxKsNgomS8H1PB57wC9Yd9SkRRCHiPAGK40UY/3+kot9LUd7IMcfu+xdekxEzbawyD36PcVek
	d9myZLAsQjdzGxe7nowI97dtq/FAksjRcjxqblhQ7iGMHrtbyDoG2jXw2Xcx3F8KgTCcdUCYXj70K
	wSg4u9QGU2UKjXGzHqgZ7/LIJW5cpCPVD56GEbW/SD6Db+0MBEE+TzTKU8MCUu4XSy/oVW4cP63sN
	FUlFQ9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JPC-0000000Bqvq-4AaN;
	Mon, 30 Mar 2026 20:40:15 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOZ-0000000BqMr-1odX;
	Mon, 30 Mar 2026 20:39:36 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A41EAEC026F;
	Mon, 30 Mar 2026 16:39:34 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903174;
	 x=1774989574; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=
	LTUDoagH6VkIJIpADs7Jla/zgC+W5TN8vhTU2XFDCV8Hs6IPWz+tMR2nereYD+Yc
	xJ5gqy2ygF3U5FuIcTa1ToDDMKbx/Nh6xLi7rhVm8SWmEaIRqW1Nd0jBE4v9mnxe
	SmjnJE7LL7zgwYBf+nYFLae8MttC5VBuHRxid2PFkp3S9RY0iA+mb4xjrocnhKuD
	GruVuowimV40NlcxtiN8R4FwnUHFSMo6Gzt5yUFGsRUEB8qyAjXLn1ocDaeoX9zJ
	eR1ZFMU+l0NgS99iJxth58E137U5i98IdTbTGauhE1oO39IXhD4ruJ8OjxL9juHd
	wdmSTedrdMYpf6Y8oLc5SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903174; x=
	1774989574; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=T
	+aukxX9qy6Abviq/fECn3aBFx8c/j29XaL/YD/sJagO3l49D3aE392u4XNg0Y7rd
	wdal7GQAcU5EaClKVeeau8Q2DVgvKdba9Vn1rIVB11W69k1q4M/H8lL/1Iz/YYOp
	dT5DKz7T7D4UysE1/8uWeBAayDw4JazPjXmVZcc6bFd/KW6TGFT6LplF6LWjDmgD
	n5kIjpa5N5mJfEGT6BzN571Ue3PMF1eyALuzTvPvXhaEg8bL5uSZwnm5hbzk9Qas
	as/Nxpyrjz5WXG9ZAeWIT20q+60J7YNMSVl0pzpRv4UFDQCNMBEvqT0qX5qIlMDn
	mOIi2Xw5VqIAc4Nwlyesg==
X-ME-Sender: <xms:ht_KaYjiq4HbyAOZvgZE0pdEg3Dd49UjaNNZ9-FtR8d2GyqVGRjSQg>
    <xme:ht_Kab13pER7VLPLTU7oSc0WfgORqGtqL7RYh_JsR0oU_ToAXay1gX698Erjxj4-n
    wtBwkRHOnBse_VvQwxiyd139GuBFoQ5oX7D1cYiHdo_1l6ntOnGR2TE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    grnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdprhgtphhtth
    hopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhu
    ihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrd
    gsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvghlsehhohhlthhmrghn
    nhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgv
    kheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    gslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ht_KaZsk6LIhXjFAGkbaUl1ZKcKnVct3xghf8LJ7f5CG6LLGBihACQ>
    <xmx:ht_KaQteF0kq7QPNlALMtbyLHHpbqMje0JEgNXNXLHtqKFAWd0ovWg>
    <xmx:ht_KaWEw41DwjMi68XZI8YxjtGY3TDou9FcnUvj3wn3tpaAlrQcnZg>
    <xmx:ht_KaTOSgzzvEGAFkTDcYnfnqNsYpt3NTEqQWJy1IPBNh4XjKW-2Kg>
    <xmx:ht_KadhgBVqKHOO6dOnG3pvqwtmVHJSbUI-SCQsyU_nKlPPTX6VPkn47>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7E4531EA006B; Mon, 30 Mar 2026 16:39:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 30 Mar 2026 14:39:27 -0600
Subject: [PATCH v4 5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790
 AORUS MASTER X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-mt7927-bt-support-v4-5-cecc025e7062@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229; i=floss@jetm.me;
 h=from:subject:message-id; bh=em1RqiSQd0riysmowuL1VUyKfo405wv/OJvCy5th3/Q=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpyt97MKgIx4cXnY3eqzf8uMUUC446fCf8n1tcF
 2pAPhYzX/uJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacrfewAKCRC17sMLqGd3
 H+4WC/9kZvO0/+QQloBtSzCPc/4zjIp1506hnohXVFYAXe9NV3ri0hD/7IRuG6zbyG3G8xdkxAE
 IH9KyyVsUpMzXuFmh+/w99XxqfHpSdbyNOYRru+PIqiY0gh9SnLKzb8/J8v1G00xsnM47e/O3tG
 X3Hb6I1n4jBSB9WXpDu7k6lvxleEThQA5Hv+/euQsF4TEdMNvpOzqxlc7qapH695JSlzdrGCuOU
 XlEV/ta4vMyE/7UFlQ6d0jDIyuQ89PiQtYlyps6Axonzlo2Q24yN5Isgo823w4uK+BJBD89zZVW
 NKfr8dvDZONRVvoi2/GeP0as0GWbD1KAND1vDH+lkcxNbrtPyyeSqgbmFut1R6hKb5HH9uT6X5c
 ZN4YmbbkshBn1z8zvNyelHQfTWqlRZE23IsE6L1KF/l80yFgy7UrZNlDb3BCcC1CwiyNLG6T3pN
 4XQq3Zlpqjh0X5tn9f1VF6gctjgWV/wP7iMZzm9X+TjGmMSbN9a2oWoONH89pONUUIhAA=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133935_537788_C8AFB784 
X-CRM114-Status: GOOD (  10.52  )
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

Add USB device ID 0489:e10f (Foxconn/Hon Hai) for the MediaTek MT7927
(Filogic 380) Bluetooth interface found on the Gigabyte Z790 AORUS
MASTER X motherboard.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=04 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e10f Rev= 1.00
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
...
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221096
Link: https://github.com/openwrt/mt76/issues/927
Signed-off-by: Javier Tia <floss@jetm.me>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2c9ca3d6016b..d60798331bb3 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -755,6 +755,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe0fa), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe10f), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


