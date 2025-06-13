Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED13C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 06:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Z4Zk6gFMiiiZCc+KOTwsC9S+QK7pJWpmIYxo8X11Ys=; b=B6lHgS88X2l3V6sB5KTB/yNtrs
	utBCQyLjGuLDIogLMgqbLCRP1WThvWGd2IQxfGa6HI1ZSStoGo22SoSX6mVoW3r+yHTb549G4JrNI
	a3Y9SOyzicMhZVlPSLjxbbW1nZnDRvJnf8BUQDCicRhS/+hGkUpBIh1pxY9fEz6HRz/75H41xKqch
	+BSvQeoA308SpjiWrIM9GhwdHFScnYoQzHlByyjvztKwlND1L6dtwvYvBtGQKwo42ok3ruwuCBHpE
	qgmC3Gnurr0VNZTyQ9dJcrRAVnQP6CaKNfmI4U81+miZJZXleC+2A4ekamhqk3ZnTfHFVP8ETTLWy
	M0DxteKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPy4v-0000000FUgj-2iuA;
	Fri, 13 Jun 2025 06:39:53 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPy2f-0000000FUYU-2H6S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 06:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4Z
	4Zk6gFMiiiZCc+KOTwsC9S+QK7pJWpmIYxo8X11Ys=; b=SL9wuNi92DVR4EZZg1
	AcrmdZhnTbCzkePXev9RZ2c9A4mBcPkVyZR1r5Sd5MfJTFIPW6EX4VxC2qGqCgQ9
	RfeqOC/NB3B0M5+S9bc7pgO5LMBRTMM7sNgfOzVP4G91LJOuOwrgi142L1QFaBgt
	Vaad342x3Z0IHqsY5D11Yb1zo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCXdSQGx0togsW6Bg--.7897S2;
	Fri, 13 Jun 2025 14:36:55 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
Date: Fri, 13 Jun 2025 14:36:36 +0800
Message-Id: <20250613063636.239683-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCXdSQGx0togsW6Bg--.7897S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr45AryrAF1UtrWfXr4fXwb_yoWkAwb_Ja
	1Y9FW7AF15GFy3AFy7KF1ava4vyay7uasFgF98tryDta4Dtw1UAr42yF1kZFyqgrZ3JFy3
	J3WDtr1S9a47JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbl_MDUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1S2mRwBrT2hLxekfZwAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_233733_939389_16614148 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

From: wangdicheng <wangdicheng@kylinos.cn>

PCM1 not in Pulseaudio's control list;standardize control to "Speaker"and"Headphone"

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/mixer_maps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 0e9b5431a47f..faac7df1fbcf 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -383,6 +383,13 @@ static const struct usbmix_name_map ms_usb_link_map[] = {
 	{ 0 }   /* terminator */
 };
 
+/* KTMicro USB */
+static struct usbmix_name_map s31b2_0022_map[] = {
+	{ 23, "Speaker Playback" },
+	{ 18, "Headphone Playback" },
+	{ 0 }
+};
+
 /* ASUS ROG Zenith II with Realtek ALC1220-VB */
 static const struct usbmix_name_map asus_zenith_ii_map[] = {
 	{ 19, NULL, 12 }, /* FU, Input Gain Pad - broken response, disabled */
@@ -692,6 +699,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x045e, 0x083c),
 		.map = ms_usb_link_map,
 	},
+	{
+		/* KTMicro USB */
+		.id = USB_ID(0X31b2, 0x0022),
+		.map = s31b2_0022_map,
+	},
 	{ 0 } /* terminator */
 };
 
-- 
2.25.1


