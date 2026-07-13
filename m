Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=; b=H9ZpmBB02RTpaG
	wFvKnhWcrCcnAeYOTr67GUQMcKUb7pMZ0Asn3qMU9LTMd4U8MjYz6e7WZ5/bdxypLXqsHAk1WSSc0
	ubTXNwHY2+yTnRVx+g0VIoK20Ss11DwsZweRq64PEUcx83AWwWYkRdpn7N/yFByNoOJw0HDPXKal6
	rNs344Fbpm2LNbP2i/F0NRR8pQ5KmkA7CIgFQYxLKow4aDV6vG6KIL4F8YoBC1lJtktFL3xD/JNRi
	CEHBibtm4MRsfFOWTV/w9McfsQ937cshppgEJt12WGVHtpUV+V4QgHfKeJi/oYiT5+LQtszlgbVaZ
	tpsPJNqz7guJrZP2pRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVj-000000099hf-3WWm;
	Mon, 13 Jul 2026 12:11:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVa-000000099ZS-1KIO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 12:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=; b=Tehc+RxSMb5Rq2SZGquuPJpnv0
	qwaTk3GaqTkkoLdYtCv4QnGa4rSRVMP49DD4bZinyk9fb5mNccxwYfI7kKa+IWiJ3QWvAYT0J209M
	o2pcmSWPydzhWYT6/Z/acpEkVe235t7xkt2yLpqUk3JgMuTitphEfo9WjRey+sTMVepW/ZJmcxPY+
	eECIZaGiSlx60FSVDxCHlB47zjXi+BMcsr0lMt8JUczmpPriCw2dP5PlJ7dFJRShBBCsbxOcWXCsG
	Mr51nqJj7QNVuwy1uG7+y2jNZpHjHvGnDq8hKgOWydOXuztzvisi2usbhpq6KRHdh1ub9OpkcEJx2
	b7zq0dnA==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjFVX-0000000BaYh-0WJS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:36 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1786723a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944692; x=1784549492; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=Iyp+QIaFz89H0yfPrDgJRlystJXYjhFEiJcf/RcShHBcxULXKwtj4K2ADa/IQzrgru
         3BbLtJznz8/XjWjdtb34mVWHPLeCTRDRffb0zmRhuRgIqDfN294YzYbv/LDdMF3Mkbq+
         SEPVIVQJWOGH0U/KY/OLLJUyf6s7qthsNijc1q38U2Qzt/eIyGxdhe5/iLnQvdlkR1h/
         g4N9J1y48WLK29JCCBJJl3oFmg4QcOMa808QMNlkUnpd2m/MjRuLtAquQSiYEkJSxoMA
         NzelZbVd2KxpDSU21nwqz7Assh6SEsLJU09sVZ3qSYizKLttynkXpM8ulFs2PDpt3O2B
         WYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944692; x=1784549492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=gQDcic6o6yTrpIHiC1/TITiqkrk9WQl/IjF2vClN8PHgMZoz6nmaJNeKbGfxLmj3/k
         jzcXZd6CFb4orD/hIYeP1nuZ5/hguR18HTRzx4dIqo8zB5ZpzIum+2pbuscRB2I53DXg
         f7KlVfVQujPmNIo9cn/tzbunLv8zbl0UxLTlRDljZiFkfGQGjeFhPCi3HqeSn20b+cr6
         hfcOkNR0MYHutSzAB4ZQd44GbooMgNQxB/oU8wgrY0d9o8TEwcKunl7MO/FZrDIJ+lxg
         mhQb6fRTqkQgO+pUyre2yRFSPkuhowUv+H5Ggpa7Mn+FPPuluk71US8H7WH6VnoIfEkx
         yyIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq07D2ZGhky+xAI23dfCF13Mkltut3XM6/gageme7bA+vWfhLeCMeGTwHPIYO+P5d9qzJ4XB1m/uNLefunsQUJv@lists.infradead.org
X-Gm-Message-State: AOJu0YzSu8g8KVXiU9GMa+KHKnayYU8jtY2+ZETEtjZAkABn/KiI5hPF
	QE7y/UI9NP6YjW6DRJA0BPfaJmkh4fp0F1YzwrkiX8oAQCJPjpgHk8/N
X-Gm-Gg: AfdE7cma9xbV2dDJGQY77mCzGZZDUxmZFpYTPKaXtI+ra0XeQgKwoSgouZLfIEG1m+t
	jMUzwfJTP3fcZuCEDCnyaYrZGZ/s8Xq96UN0yRSmTcwPhVlON9hxdWh2eb0Pd0UJ931GP7IK9s9
	SkuWPc4xdYsVbO4cEt5x3Ga2B2J5ApGGOAEngAqCa6aTL5WrY1KgejSrbzHhGmulIbXhN5FNDDW
	kHD21A1OSAq1wXRbUTup33dE7jNY/rIdSKP59qMWqzv2rWuiVn0+dcysJ6Napq8a33jSobidSkb
	4+48JSb2E8Cg8rmdiuXYxz/5WOxbxg9SvqspLwxG0bixZcsD41k2j0MahznDJg62FRaXEUhmth8
	7FDJIij6vyS6zhrut19ETrLw+xyzazWZrDmWlMWEjcgP42u8SazYE7YUA22tOYugzi361ipf2vF
	iW5c2KpP24Kg==
X-Received: by 2002:a17:90b:180c:b0:38e:fbe:b67b with SMTP id 98e67ed59e1d1-38e0fbeb818mr766655a91.0.1783944692422;
        Mon, 13 Jul 2026 05:11:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 15/19] media: meson: vdec: Fix concurrent firmware loading race and hardware timeout
Date: Mon, 13 Jul 2026 17:37:10 +0530
Message-ID: <20260713120840.17427-16-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_131135_276050_BEC8C31B 
X-CRM114-Status: GOOD (  16.03  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec_1 firmware loader used static variables for DMA buffer
addresses (`mc_addr`, `mc_addr_map`). This made allocations global
across sessions, corrupting state when multiple decoders loaded
firmware concurrently. Under stress this triggered KASAN reports,
lost references, and memory leaks. Making mc_addr and mc_addr_map
local to each load call, eliminating cross‑session races.

The firmware DMA completion check also relied on a raw decrement
loop of 1000 iterations. On modern CPUs this loop completed far
too quickly, often before hardware signaled ready, producing
false "DMA hang" errors. Replacing the busy‑wait loop with
readl_poll_timeout_atomic(),  providing a bounded, microsecond
scale poll with proper timeout semantics.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index a65cb49594465..27363c9a5af3c 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -29,14 +29,14 @@ vdec_1_load_firmware(struct amvdec_session *sess, const char *fwname)
 	struct amvdec_core *core = sess->core;
 	struct device *dev = core->dev_dec;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
-	static void *mc_addr;
-	static dma_addr_t mc_addr_map;
+	void *mc_addr;
+	dma_addr_t mc_addr_map;
 	int ret;
-	u32 i = 1000;
+	u32 val;
 
 	ret = request_firmware(&fw, fwname, dev);
 	if (ret < 0)
-		return -EINVAL;
+		return ret;
 
 	if (fw->size < MC_SIZE) {
 		dev_err(dev, "Firmware size %zu is too small. Expected %u.\n",
@@ -63,11 +63,11 @@ vdec_1_load_firmware(struct amvdec_session *sess, const char *fwname)
 	amvdec_write_dos(core, IMEM_DMA_COUNT, MC_SIZE / 4);
 	amvdec_write_dos(core, IMEM_DMA_CTRL, (0x8000 | (7 << 16)));
 
-	while (--i && amvdec_read_dos(core, IMEM_DMA_CTRL) & 0x8000);
-
-	if (i == 0) {
+	ret = readl_poll_timeout_atomic(core->dos_base + IMEM_DMA_CTRL, val,
+					!(val & 0x8000), 10, 10000);
+	if (ret) {
 		dev_err(dev, "Firmware load fail (DMA hang?)\n");
-		ret = -EINVAL;
+		ret = -ETIMEDOUT;
 		goto free_mc;
 	}
 
-- 
2.50.1


