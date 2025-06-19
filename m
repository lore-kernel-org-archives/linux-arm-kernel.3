Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD4C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ge3/1dKmjOlli2sCo/IoWSdyQdAy14557ORsoDHz+LE=; b=SMaK2zKtvPx7pIzQPS5VQ0ptx9
	z0sAyP/XNbFHUDLxo+FXPACVlVSdmfrhuP0NqfbV3KJs1ughT231FV3Z3bt3OhN8m/M3OtviJ5OA3
	e3biutqD2AF8UqcEzZAy8Y3aJjo0ryETHHjL0Qqj5KbxtnG4XD70ZGEjTd46PGEcTyO8Lj121BbUy
	XA7fyPTUg2mg3vS2A1ga9lQ9Xpy4hRDJW0CXHT7Qggp45qdZ5BqB++MbWdlxeIzArCdQLpC1cHJm9
	vLIiA/unJWE+PWw4vkna7kCoBas6jQYNSZ10kl/Ze2uTv7Ix8VOhCe5AITovQB/lKIXs2FhsWI23p
	BHpyGSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA6B-0000000CMMo-1V3J;
	Thu, 19 Jun 2025 07:54:15 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9XE-0000000CHEv-3G8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ge
	3/1dKmjOlli2sCo/IoWSdyQdAy14557ORsoDHz+LE=; b=HtxkfpH8k1iIB82ztg
	tNvThswZWG27I8lbt9xo2KM6s1z1X5e4wBqtIAvJR7KDQ0z5Y9WbvAYeb8+E5joh
	jDvdlCvDyO8x8uzq5PyL3MOwwNVu080jLwkWZ/s/kboy9LmoOM3dMMQ6UKFCHcwl
	YizXFvdqfmAmslfn4H0n51WZE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHUY2buVNow9j6AA--.3773S2;
	Thu, 19 Jun 2025 15:17:48 +0800 (CST)
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
Subject: [PATCH v2] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
Date: Thu, 19 Jun 2025 15:17:45 +0800
Message-Id: <20250619071745.149299-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDHUY2buVNow9j6AA--.3773S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1UuF1rZr48Zry5AF4ruFg_yoWxtwc_Cr
	Z5Xr48uayUJ3Wq9rnxAF9YyrW8t39xXayagFyxtF45Xay3Ga4rZFW8JFn0yFyxK3yfWFyx
	JrWqgw4YgryjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUj-ntUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiMBVxT2hTs0e1KgAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_001809_190930_22834029 
X-CRM114-Status: UNSURE (   8.14  )
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
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..2a08115d8c17 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1088,6 +1088,7 @@ static const struct alc_codec_rename_pci_table rename_pci_tbl[] = {
 	{ 0x10ec0668, 0x103c, 0, "ALC3662" },
 	{ 0x10ec0283, 0x17aa, 0, "ALC3239" },
 	{ 0x10ec0292, 0x17aa, 0, "ALC3232" },
+	{ 0x10ec0257, 0x12f0, 0, "ALC3328" },
 	{ } /* terminator */
 };
 
-- 
2.25.1


