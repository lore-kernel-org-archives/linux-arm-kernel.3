Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0621061B1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qHp84u4lfDr+6YeO86QEXq5X1hXYtGUt81s2Al/O8Q=; b=vIdg+VxDI0fYrFnQJnCs2LG2vZ
	mb3KPTr9IPgOnIWTpf7lkWbwne/NTZf/o3YNgdRvnAXoDdnTDD01yY9oY/uPQ4GznxV6ULJqOvNDM
	5YzGfdWjsq1bb37J14XI5G5j5+MH+dCDFCCn5g0bSQAhAHKofHdsfCHKuNM4e+AQD4VdkZnsVj4e7
	WmcvYthmq++2dO0OmwI0im2QGTSgNZ9BVqh1cNUahiPT+Z8ZJ9fek26Oai9oQYHGX9CAaLLrXfHtQ
	Q/VQifK/aJNgJS6xbu/fihyaHdqlyPUXzIj7O4u7u8BW9qTf5pHsubLsngmBIgBwK+t6k5OjSbssu
	1j43csmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOv-0000000Bqdf-063K;
	Mon, 30 Mar 2026 20:39:57 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOW-0000000BqJc-13h3;
	Mon, 30 Mar 2026 20:39:33 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 7F473EC0268;
	Mon, 30 Mar 2026 16:39:31 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903171;
	 x=1774989571; bh=2qHp84u4lfDr+6YeO86QEXq5X1hXYtGUt81s2Al/O8Q=; b=
	qzBWrBXdqobl7OWEFOHW5Ie/iW6C1XGik5e0CCJp6Zr+LJkp407jf6UAAGtNrAte
	hCcV49HDPvfTvqW23e46638OyCeOZrCoqeGZLY6o0E51KuB7cpvVNDgNe20UY+m+
	RfNk67I0ho6vCT6Ox2Cmt/HDIvRECa2EZ3RV0dnPeN8m2XVOcsql/vUgcHWMuUfD
	kSFe14Nv+1NFQIopKJ09EqhuEdAvmLRXfniy2jY79K+Jt0Sbl15iAAVZgFM818rf
	b6QQiQaItrx/wZVWvPF20vS6xBJa5wF3y9RFYXQJ48PDpTYK8ugAsOP1dOF4tVgD
	lmQASQYURKXR/Ivgf8i0uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903171; x=
	1774989571; bh=2qHp84u4lfDr+6YeO86QEXq5X1hXYtGUt81s2Al/O8Q=; b=H
	3gkvqX0LporRzlC3FcAo5nJpZl6RPYtsC+3ztrS8yx+V9SmH0m2Ilg23JHIB0v0Z
	eYi3o1Ujsxm9aa04Ou3HODaZpTVYXjh00vUenEr4D+V1/qEJSxmnKaQ1CBmYWEAI
	oHzY7+rl1sWWFuiWEq2ar/Bnc3N4S/Nty+mZbWd2jG0LZnXnoi/nUrf7Utcmtn1d
	0PPLsuHIGqui6ac9aeYsBvHh9eWCnIiBXTi6W8R8EV4+v9waVCSWs2AAKhe3Irrj
	V1NgaHDoK6YsgwRQarZLpor+xm7m5ERrXFPWvu/yt6Bw0T6L+KDKfanI+86000H/
	AEtINlQ+gg0QL0YluSUHQ==
X-ME-Sender: <xms:g9_KaSAQdl5sHgSdhiaXIwVoFehOAwaYsEpHapvDmxzjlNjNIRgLTQ>
    <xme:g9_KaXVx0MMXhl1FFX5MynmEsPCa567iXztTqP8X4kc9trjLPZyGFkDSymdmedw2k
    y1l69gUpJJp1iULk8Ily4Y2BFaR9U6e-kGM-u9BmjM7SSi44JN-b7I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtph
    htthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehm
    rghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepjhhnvghtthhosehmihhnvghirhhordhiohdprhgtphhtthhopehlihhn
    uhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:g9_KadhTOWDxGt_f4uxxRq1VoCd6d-Fp84rRGK3Cp311MYCXVDzlvg>
    <xmx:g9_KaVHEUUVwiY-af3d11gTknLVdVQ9CFbXUVrQLtzxqhs1FIhkGxw>
    <xmx:g9_KaXs0-46dD_NR3WY8XKIV3tPTaJt9NrjmlTwvF7YYJAVrk_B6Kw>
    <xmx:g9_KaedRgnZsTZ0IacTgEOOK2vq4L-_bL2QaTwSsLjXoaG3K3YuddQ>
    <xmx:g9_KaUNwJWpAyBkeOG6DXHL9wB1AAmQEupii_pPaFJ41Bjxss2LFtV4w>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 59B4B1EA006B; Mon, 30 Mar 2026 16:39:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 30 Mar 2026 14:39:25 -0600
Subject: [PATCH v4 3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG
 Crosshair X870E Hero
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-mt7927-bt-support-v4-3-cecc025e7062@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196; i=floss@jetm.me;
 h=from:subject:message-id; bh=M/B2rUsIc9XPtt7O3AdFVlNy7Muc9x3nvF7epwhHRKU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpyt96d/Lwrb45tMsu5QXFTXkhaUZ1jxz9JCX0g
 v2Apf8Hrp+JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacrfegAKCRC17sMLqGd3
 H8xoDACgoAfk/xcP5GhtLL92sxEhxGC2tIz7x+oG7YFL0Bu+73fSWu20nFFG4ky6ejnroO18cvE
 uLGda8Sk2Ilu5lU/WeWmlz5F624a/MVkGE/mzSKwLLddKLRr/ATF+cenaJ5UMfnvmW3vVjUguam
 w6uZF8kXYnR4akam+Mz3RDxT8MdVRMvj2jGVa1INafJja3Wt2Q2em5OpZjhEoplz1KS9RS5MEJh
 fDDhanRtkxQjbQjU/od1TO6K9la3NdVjH2KPQ2g6rW0r1NuCE/PKFJblLGt1GnFyWL5j7esJdON
 tSzgmnyAJHYXJVAVVMYmq8Q4hbb1YmhXzIqlaC87X9sl24t/2/0pGTcfJ5UvSxK5XdyXINLwY2E
 ubIdIrwh9ZndvD9pOoyYO3HC/Ss5Mlm0KRdEczVjjbw/gDQWoRahNXZsDLbONZMmqGcaQDM6q9E
 c/aRjRz6tyEDouqADEwig/n6IvxiqycbfCd+YeXDU/xsgKZnaIjWrarnqP7qIT4lPGU9o=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133932_384143_B1CC1B48 
X-CRM114-Status: GOOD (  10.05  )
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

Add USB device ID 0489:e13a (Foxconn/Hon Hai) for the MediaTek MT7927
(Filogic 380) Bluetooth interface found on the ASUS ROG Crosshair X870E
Hero WiFi motherboard.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=04 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e13a Rev= 1.00
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
Tested-by: Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a5e44887a5b5..58309af0f7a2 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -751,6 +751,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe139), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe13a), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


