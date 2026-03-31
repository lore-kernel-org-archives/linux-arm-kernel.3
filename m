Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CCBFF60F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=bvEf0aawXXtYnmmqozUZeC7nxS
	EM7yF3/D4Zo0aBzbAjKFJ4fLjCCFnQd7YnqMm+4q2iVMxZPmA2uzYw0Zu6mhQr3lO75lWjj4vHfoH
	ik3S3warQjrEIKAfTAmDyn3+rSs9RQM06dXKrLG8lu+aR9dQJb/bGyumrn3JA3Vc5KykPxXKo1+jK
	Srs7711WRHVcNknqT1IZo4rCWP3mecrf/n58tG2ETDCF5gmB2j1XplPaPfwIibc70PLWmWJPu+eUf
	49QgNCsHQzlUHR3Hj4pW4AguyRC/L+thaO61V4iAkjC6ziAD+oSYqBeKuZbA2TG314E29PNSc3kN/
	RqhwopjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cbT-0000000DJAt-0I7b;
	Tue, 31 Mar 2026 17:10:11 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cb0-0000000DIsf-2ATU;
	Tue, 31 Mar 2026 17:09:43 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B14D57A0017;
	Tue, 31 Mar 2026 13:09:41 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 13:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774976981;
	 x=1775063381; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=
	M3b/tBMgg4Z16U+bfGwRPqP+R+K67hOowzgQMywws+FK3DAFRLFOwBYhT5o8Fgox
	C9XRG9UeJAKCGgT0YkA9L2YO7J9yBHXH9NrLdFRXRPAryz4qgO9mU0NMYpaJsu18
	MhUqE/d3X7CZSP+b8bKgkVOeNH/Ys8vnFWsYIsc0ezVROnB0UAoh0TDzJBNcOFfQ
	7sRPUeB11rm3bU9cwiuE7y/qDYnTR1ZSRZn03U8mhBQVGolvqw5BTDmBjRqhFrc8
	yNVzEcEX5VCiEbEUptc8wjwFiSPS2QUL7EGGLowBO5YXNsBLyc0I/mfNZpCsNaVe
	sEQJ+2Tce2zVRI2Gj5IF3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774976981; x=
	1775063381; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=U
	AuzZRxoN2MnPQVrQoBibAVgfTAdUqqWF3PySGObmnfulI7GUND8z8XAUql+KPERF
	PNfsKaqWQGWnX323Iw3lVWUw9RcUsgGpkFRlY9Vmqk8PTuMLT65VdXu1s8f0uyqI
	hggnYpyDmTKsj/R5JUl+jmKkbxjXm1GC3VvozoGFbr3V/pZiVZmkdx8GgKcpyk01
	2BRIqpGfXjlxuVer51mQwmYyx2wX5I3odqPrNCAzzSz7XqLQVsmkNII9IBmC9DRe
	Q/qADMBeEZNEwgO82Sq4EF9fmS9Ee3pZiHpHwK7XCZOYUE5YtZMS/4Wtudcsr4Sg
	qJU/nn4/SYdotnrxfWHHQ==
X-ME-Sender: <xms:1f_LaeB2WO6mx-ZylO56GkI7e5aPNfHRW5uVGIO-2Cmo3NJW3YcOSA>
    <xme:1f_LaTWxhqhG064ZrwTmXVJlPityHOx1wLnD_Jt3wgyKMRcyxlnnDAR-LNMOVjjdB
    9kA8baDxk1cOBlatodwyVX4ByQctsLxNbmqcAYuZOf99n3Zqc8lABUp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fohfffufggtgfgkffvvefojghfsehtjeertdertdejnecuhfhrohhmpeflrghvihgvrhcu
    vfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtffrrghtthgvrhhnpedtfedvfe
    ekuddtjeffhfehheffgfeftdfhueeiieetteegtddthfevfeelvdekjeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghngh
    gvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtgho
    mhdprhgtphhtthhopeefudelfeeifedusehgmhgrihhlrdgtohhmpdhrtghpthhtoheptg
    hhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehluhhiiidr
    uggvnhhtiiesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghggh
    esghhmrghilhdrtghomhdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehl
    ihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqsghluh
    gvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1f_LaTMuSePH-1VQmEGI_DSL_6U4it3A2O7R07MZwpxNcOt1JqPyAg>
    <xmx:1f_LacMDJ7kL_Z2tfI1jpYSWHEdQqsFHcuscFeFxqVhfOFqUOl_Rlg>
    <xmx:1f_LabkPEGzcvnRlQPa5fM6eueIeCHChEnr1kQubEX7IM4a9_XMA3Q>
    <xmx:1f_Laau6Z1Qmns74dJYwFKCRJt_chgxFNpy5xPnuxiAeb1S_RC9YJA>
    <xmx:1f_LaSxBwdMEA-dA9vpuTf5gaKwK-M5L1iXmnGZX8h4SiKv5eDA8rZqI>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D6B41EA006B; Tue, 31 Mar 2026 13:09:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Tue, 31 Mar 2026 11:09:35 -0600
Subject: [PATCH v5 5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790
 AORUS MASTER X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-mt7927-bt-support-v5-5-6f31b4342daa@jetm.me>
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
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpy//K6d8rMmO8njA0i/epcXe654OCOoKAItr3h
 7+lzYmdhySJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacv/ygAKCRC17sMLqGd3
 H30GDAC+SLScSlNxuyjgt1mmEKU+r5OHXCRGd2ctx/c3yqR4CHr02LSeBw+oirQOGfvVic2TATx
 5/j1SisrKXagYAd9arTm85qEJtRzLeLIFYJmCuFdUMfjy4+/vrTCYXkvvWXiyWm+Yfnjnh5AsMA
 Go645yqzJBmEI/LgjxYf7I6+2psG6bCI90MXmRe8lHLLgmas7o2lkZz9breKcBqmGfXHFZQWyAP
 MmriKtfhnGN7yJ++j4sfe27XJ+2vfZYVxNeGKarW0ELNRJN0l569IxcSsourSZ1ohD2Exgg9Hbb
 pip3xQhVY3qEtHVtu5H6butd74sJJ1vveX2HKjYGDVRgyBfuY0FVSB5n5sOSNjvm4RZ6ibGQwiM
 +VzNxJzbqyKkPTvAGm5aQiABDVWylXEh51NdVBEuY6Fimp737dfyksfQuCXkOjdRZkUZxpvO37E
 jV7dlUVDltoHUv9/3AZzaKPZfGi2rkGI98vMgbbYc2+ngWHdNmFGl8M3/VrDWoo1jKaUY=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me>
References: <20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100942_609063_AD469C79 
X-CRM114-Status: GOOD (  10.28  )
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


