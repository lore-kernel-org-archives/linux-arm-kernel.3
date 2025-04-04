Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11530C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7icjT4hnNbVUYyVtUY9jTBftnCPTulGYef6GcFZC1rM=; b=ij37aJ5LymF7rE+UjA3mvl2/sI
	qEUiAczsBU5Q4akfD2dwt6MFsVL8owy2xqb7IVuHetAZd9zFp0NICHos9btRMJddfaksiWrfDVAdm
	Vg15O2Qgn03FpqdmWNqOoi6RQ+RxxF9+TpxfgQokTBA0sz9fENhfxkR9Ku7d1njtf9D2FF4Wz/XnC
	cJnQAOcmlmfr7jnbdYKV6ZArCXy3BCmO7vAkAd+jPlpFn54T0w4BurxrFRHdLF7WPi0CPfbvEGiUb
	eNiWkq7oavGHvS3FlykKcg+0N+IWY0fTDPpDIsgxWGZelN1Od5dvx/klp0mv/vxFL7T7hpHIx//qu
	4ee5mpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0n8B-0000000ChUU-2zY4;
	Fri, 04 Apr 2025 19:55:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0n6M-0000000Ch6o-0EqX;
	Fri, 04 Apr 2025 19:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743796395;
	bh=dBBa1o7eH67G4MV4jyizlfxUVGGZZ6ge+FKvW5APsak=;
	h=From:Date:Subject:To:Cc:From;
	b=I2O8XO5m2Z6qJy7xkjqT1xmeKZb/ge+K8MUWTuSKo4sIwpvMxNl1N1Ldwb8HhcvFF
	 kokWn28/+aGQnV86vfSoTrtDjXI4u5oEB4trJ10/R3udEMGtF8p2LJCEcEUbH1KBf8
	 u99RRsI5JYvqSPkBYlcWST22KOhV7YSdW4oCf8FODvEQUpXQgXAl0THS5vw0FnDvqd
	 /wMniK7nHw1b7wvHW0NwzReWxQkdR+DWZl1yW94jTnLvQndAbZv1Fm6Fhj065FoNTW
	 zYK0gOH+xgwntEG9ygRtJ7TrIEaFzYX63C3G0ccszrZdvpiVpdP9bxggZQI61CYx5b
	 AsOJ9n/1z9LNQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D98617E0FC3;
	Fri,  4 Apr 2025 21:53:14 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 04 Apr 2025 15:52:07 -0400
Subject: [PATCH] MAINTAINERS: Add SCM for MediaTek
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250404-maintainers-mtk-scm-v1-1-95d1f0c3f60b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGY48GcC/x2MQQqAIBAAvxJ7bsHMMPpKdBDbagkt3Igg/HvSY
 Q5zmHlBKDEJDNULiW4WPmKRpq7Aby6uhDwXB610p4wyGBzHq0BJMFw7ig/oOkNaq9ZSb6GUZ6K
 Fn/86Tjl/MUnktGUAAAA=
X-Change-ID: 20250404-maintainers-mtk-scm-a54e22037e87
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_125318_276973_E39CAA32 
X-CRM114-Status: UNSURE (   7.56  )
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

Add SCM entry for "ARM/Mediatek SoC support" section.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 78467ad7a8feffda3a6909dc5f8d9bf0b0dee3e6..8375b95348906d3efa953d00bc224174ab56c910 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2739,6 +2739,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
 C:	irc://irc.libera.chat/linux-mediatek
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git
 F:	arch/arm/boot/dts/mediatek/
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/

---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250404-maintainers-mtk-scm-a54e22037e87

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


