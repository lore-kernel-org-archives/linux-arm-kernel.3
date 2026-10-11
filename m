Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F76CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=; b=2u5qp/j5jpwvlliFIVf8F817nP
	3BJS2wJsoT3lyi531zXLo5VBn9XVML1cYIeTMdokAE8yYnaSUEoYJpNLOOkHE4v5qtKNGGCm+uW9g
	jML9OqJ2L43RxWd2TrDav/C5xmk/blmEy0YZAGn9IkMzbrAuMyJk6x7ecm89tHEARaI+5fyOWdlNY
	Q6WzlVwgBxukPZW6cedTSUms9D2DtzmiZ1H4gO/DpdpX3iZsU61mtjJaq1aOWoM5jLdsfy29yyL+E
	SJDBcDWNtM401/7E8lznebsy3/3SQtc0vRGSQ0+G31capIZxyriwfjln0NifzXXYWuaNBloBXDu9P
	3+3LSMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008acL-3u1j;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x04.google.com ([2607:f8b0:4864:34::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFheZ-00000008aXX-1beF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:27 +0000
Received: by mail-qk2-x04.google.com with SMTP id af79cd13be357-93cc7e652d7so79923385a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679382; x=1792284182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=;
        b=CQCU132RW4pX4wcVovWpupWyVetpdHuzRk+dpHS4lVpCGqhVp3NSzgto0RTDEUlljJ
         SVBQyjaQNv/HPoj6SzRGBaYIbGmUOa2scVxmBCP8D790wXID/HKQ/Tg7ZRUM6zJpBpNF
         vmHmX5xwabxBGBjhyrZMlOChCecYZpakjcyHmf+/JvlOykrqEhIX67n077DayeKMKOKy
         zhyjflcThmuYgJVaZB/oa3pqZPUdvZ4ltCF+34cJwDfajS04X1iIPGgoZxtWVToPS+lh
         H7zl9+5am81NjnJNcup/82toXMnpdJ7ofwT17jtxkn59bkjeppQE/jMLvq/HvYDStXIr
         CmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679382; x=1792284182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=;
        b=26q3uw6Ebp3WF3lVRhLxe5otvwnsJ99ZVvcUtLSTVNwTiR6h01XzIN5/yW3cCnCeM3
         KTj7uEAI2utxOaEuHROIZvem4UsbEmrKHKhnZ5SVhLSA467zG4IAQ+PYgHrUTjoayHfd
         H7GQ/ry4bJLFVdK6wZQ3VXG08NMptbEz+gceQspwCtUUsbdB7rC9oQCTcCghz8BGSgPv
         XUjxOFxZorIypuD5wJ4g/o2xMpJZBYfGA3lvRTMbwKuifwe4MzKg5dqChxLb6HPZPKoO
         dbGXwIzursRYG8ZEkm/o0JmJ69N7l4RvDexHVFG6pugd2b5SMLfCf5svhv9tlSe0WcgH
         iLYA==
X-Forwarded-Encrypted: i=1; AKwUvBwldBKG8647hzSYcw2cHBgyGWhaact+kBFWd9eKfNTSM0VhUwff0h/QJ+UL9Z0eosn7IuplgmMazMhcMS25PKtB@lists.infradead.org
X-Gm-Message-State: AFq9FYKZngBd1rVxIR7iumAdqlqHRkpDqL9LCRG3dXIr2xydLxbr2lQ+
	DLX/OsX/A7992zJkOBV4ThewzqJx6ZIOM0NrLnCdkbBhJhGNd/hwYc/T
X-Gm-Gg: AYBFou1MO/xTFupT27WYaxKQdX0axubFjVkwbRzRZUfdGCJ6Tj1daeOgA3tHYi4FAjy
	m24UOzHM9UV7eoqZ2x6YV7hb/skCEMQ1QCLX5r+wgTM03+LPIFiorJ7WjRWXqBbg+IwANvN+OBn
	iWMLAW56LlzrVPhbZgp5y96T/0PQLa3CTRx17G0idnrH1Td+AkpfmcO/3VHNsUEQoPP+KqzTE5/
	+AOXD43WYATs+GfEEWYMmufaBbbOap4OhR+pK5VU+0zu2ER88EYV71rh5W2OUf/mHu8m8x19l6I
	k5/PPryshKsgVBQQPzxWHC0NBjN22EopCv3awlDBmbjbFFtbGGrYB6LZACAEcKuxFd2c7dWLyJL
	kVmmGCvEvyHbwt6ZoemO+3WsWRL6G0eL1Qo0kg1Eh3oWspXFgCoUgsGtdkrowuxbXyP+k9ArnKt
	FUrsDQlh8n4dm36G1k517YOSBmt/nQVV7h8N/zZnHDAq3L2Ye2qd/fYeQBRxxaWcNoxBY=
X-Received: by 2002:a05:620a:3194:b0:93e:942f:b8a6 with SMTP id af79cd13be357-93ebd2973f0mr1024374385a.59.1791679382152;
        Sat, 10 Oct 2026 17:43:02 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:01 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/mediatek: mtk_crtc: Fix connector route handling
Date: Sat, 10 Oct 2026 20:42:45 -0400
Message-ID: <20261011004248.1117649-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_616110_17E7B81B 
X-CRM114-Status: GOOD (  10.33  )
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

Three fixes for the connector routes of mtk_crtc (the output component
picked at enable time from the encoder in use), found while bringing up
the external display path of an MT8189 Chromebook, where one CRTC
drives either an HDMI bridge on DSI0 or USB-C DisplayPort on DVO1:

1. The route components are looked up in the private data of the mmsys
   at index drm_crtc_index(), not of the CRTC's own mmsys. It only works
   by coincidence today (the only route table is on MT8188's CRTC 0);
   on MT8189 it oopsed on the first HDMI hotplug.
2. Destroying a CRTC whose route slot was never filled dereferences
   NULL.
3. The route is only picked when connectors_changed is set, so a CRTC
   whose connector was attached or swapped while it was off is enabled
   with no output (NULL dereference) or with the old one.

All three were compile-tested with W=1 on next-20261008 and run on the
MT8189 board; the per-patch notes say what was and wasn't exercised.
The MT8189 display support itself isn't upstream yet; these patches
don't depend on it.

The changes were written with the help of an AI coding assistant
(hence the Assisted-by tags).

zoan37 (3):
  drm/mediatek: mtk_crtc: Look up connector routes in the CRTC's own
    mmsys
  drm/mediatek: mtk_crtc: Skip the empty connector route slot in destroy
  drm/mediatek: mtk_crtc: Pick the connector route on every CRTC enable

 drivers/gpu/drm/mediatek/mtk_crtc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0


