Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C25AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W5j43MkTtuhs8sLgSYF06e94i28Dyh1YdNYRzVhcD+k=; b=prtP/nSa4RnNhdknSaBYQgYpn5
	vmy6Y0OyfjuMQd0pgLwVjALsyNVoJ2Y9YqmiixKmcdDvGFr1u1QMzz2tu9X1KrhrSX+o7AHHQJEUM
	ZvibkE2xDWCZ7jR6jvsn1vixl+8+RwMThFC4xn4m82f67riwrG9zELiYr8JgzvdmEVn2L3bIHydA7
	oqWAC9SBovcqZb7ezLUjxdMF3V8jhZ2tQgXNGm57ghbgVXjtxUxw7+wdbCrrscywfpuduh7XJXwEm
	ieDrE9oJrONY2+2D41feHgXmkQHt3J8vur3yIuf403vVu66+vHkTHVAgCoKwQIUvkrDntSkaA20Vc
	NBnuTUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4sN-00000003k9m-3LIY;
	Mon, 16 Jun 2025 08:07:31 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Xg-00000003gn7-1QBZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W5
	j43MkTtuhs8sLgSYF06e94i28Dyh1YdNYRzVhcD+k=; b=AnnBijBVVxkVB0n/id
	LVlTpE4ey75AQ1TwAG+xGen99uajIa+EJ6OJZ9StTC/QpqU79mdMMet0QLVQrNCM
	9R0TppduEUHGdGBWxLrz3UkMvXQncERgK5A/Fmsrn1eOp3G5t8siUBg/gKc+YFQf
	Lwp83xJ9PLs1I/wqLjZWGV/pQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHXoSgy09oddz2Aw--.42840S2;
	Mon, 16 Jun 2025 15:45:37 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
Date: Mon, 16 Jun 2025 15:45:20 +0800
Message-Id: <20250616074520.582138-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCHXoSgy09oddz2Aw--.42840S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW5Ww13Kw4xCF1DKFW7Jwb_yoW8trWfpF
	45ZF48WFZ3XF92vr4xKF4UuF1rC3WkGFyrC3y3u34Iqw1kZ395GF4jqF4jvFn3GrW8Gry5
	Zr1qva4Yqr4Fqr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUku7UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbBDRBuT2hPyE1ZWwAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_004608_694376_42474ECD 
X-CRM114-Status: UNSURE (   9.11  )
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

Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d3c9ed963588..e18b2a2acba8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6712,6 +6712,13 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
 		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
 }
 
+static void alc_fixup_ft_alc257_rename(struct hda_codec *codec,
+                                 const struct hda_fixup *fix, int action)
+{
+       int err;
+       if (action == HDA_FIXUP_ACT_PRE_PROBE)
+               err = alc_codec_rename(codec, "ALC3328");
+}
 
 static void alc294_gx502_toggle_output(struct hda_codec *codec,
 					struct hda_jack_callback *cb)
@@ -7799,6 +7806,7 @@ enum {
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
 	ALC294_FIXUP_BASS_SPEAKER_15,
+	ALC257_FIXUP_FT_RENAME,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10143,6 +10151,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
 	},
+	[ALC257_FIXUP_FT_RENAME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ft_alc257_rename,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10715,6 +10727,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
 	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
 	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
+	SND_PCI_QUIRK(0x10ec, 0x12f0, "BXC NF271B FT board", ALC257_FIXUP_FT_RENAME),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.25.1


