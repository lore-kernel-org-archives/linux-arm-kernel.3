Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A87606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTIlAErt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pwT+MWNS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZdaM4FJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=; b=ZTIlAErtMzuCASKUHXf9YD4YR/
	8FD610HAFXomk6aTQIY7VndEiWuzmh6cQs+di6WVl+2Gi8SzZGBut1rR47xIgJsOoi/iPZi5pptBl
	MbE4PJDex1e5axnUpG8+ntYK1k9l7GpYpbEuRXeg/+sYCuyta+KlFARIgCTUyB5ysKM96WZAi/AnT
	nQos4KCoxNoW+S6MahV2Ofg+AcNXKeEIJkmagaHH4Ou6TwOydI3PlfAKGLpbZHdpJhwnnXvhVQpwZ
	pTo1KzWSvK3in0bhJif/lJtO4Vr6iu330TjcIDs+TjdCbjrhGxiszHjuPF8FM0DF0IFBvajDQdD4q
	4nqqvtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAf6-0000000Fvp7-19jO;
	Fri, 23 Oct 2026 08:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAf5-0000000Fvok-0ZNf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 08:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=; b=pwT+MWNS55B2EXELe58kFwhWBo
	EmWmv38sfSMERIWmHZ0wKb9ROK973smRPzd3lM2/or57f/1nckLOU+lB4RiiEl9v8oKmVTXxo4Okj
	ABLdpKD9qeyFztUTOedmakySGOeR/X2izfBxKQL95wPKVdlOscveXg5Fk+pT4PoygkaiXf0/SVe56
	ceaIyMco8QfEynDypMIjWP0AWPw0GXrg1yoY3sXFNRZKI4Pz3tdYjc9mDySqntvbijAOwEMjwFIg2
	DIeDNThF6Ou2RQZ/BsA71ogfxkl6+CPVoIDCqhzfBzhEL41KBbm7YsAlLBAI6Roc822ISt3YoGDmC
	AQACsCNQ==;
Received: from mail-dy2-x00.google.com ([2607:f8b0:4864:36::])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAf1-000000098z5-404t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:30:01 +0000
Received: by mail-dy2-x00.google.com with SMTP id 5a478bee46e88-327b1d5824fso583983eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792744198; x=1793348998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=;
        b=OZdaM4FJamt6nY86pxqOelMBIDaz24eXyuAbuI2TEwPBtVp1Bia1p/fSHEVB5HxdpY
         7a/RKTCzVuWcziIKADesfvjOWhLUsgm3l/tyt5oSU8UJn459ilYs9tYBAl0VDOeuc/cv
         UzeJE10b2B5ApUGz7u51UXmda/H58HSNEv5GWXTj4L848vVhMQZxzvtGqygRo5MpS0Z+
         xbCIYaHrqnVQB0HF25VeL9gUK9PXIZHKHJEOuQ6XquQnhezTu2bAd/HufVhFcAS/X6yg
         EfUYpbdOyhl88vdbGKoDvjrEzf6cNd/vSC3WDcV3BSyu7XAChH8u93F4DC9yLD8u/Htc
         xf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744198; x=1793348998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=;
        b=qo4z4tp7Ujq6rqCH+LBF0cDnfjAe+YAOqF/7bdDeel/k/y/MiTBTxMUuXcg+B7JBsp
         /C7m8jGwpRAPhqB+NdfDBfNx/3C/ysSnkdODdk7qpsghonxdN3RXcozPTI1HqLOxY5nX
         zayFyWnBRLbbyP3ZbULmv2zgLVj5fsR66Ye68ocpUQ12Ulhrig3A9YzzSi2RydPfoGLE
         cyTHHUL8wDId8aqryWDRaNI+KfOoaTrrnz7wzsC/pExJXoJWKJU4jbi7pIfb7JlskY3u
         AH5Xl7iZPirlMNQE0on2ieLoPISBLSKMp/Gj6UP+EKWwaFqcizJpeXsnqFILfOg8czYf
         jADQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLMZHhHiajKEgQhwFUzjMzet6KQwB7mSISPjOQA9plMU8kspUk1itmJUDxUMG30n4/gbSKDmJOFFWqSXgabSuk@lists.infradead.org
X-Gm-Message-State: AFq9FYLqJ8wdXjv3JVRblFM5xRgNk3l7xxgJPGwrtU/WlR9xM/d3di5K
	vy+fMUycqtic3KVaZ7nubeYbKHvjr/tROLcvRtuFgfqAouBgY+7Fc2/l
X-Gm-Gg: AYBFou0kFFtAkvVNcjd88GGHDoz/sbzi9oGC6nbjz7WyqIQB2fzghN7DkUTURSYxkt4
	gKaiOCTba48e+2V/t0bO/RuHEOcIuP/+EhpNA4ewQkJ8hbdfSWDdfxSMlcY6MaCupouSeqyMrCz
	F+FZp7iKwbwR3O7nD6RYG4/aBchYPSbQVKzL/cP4T+PdEMAAb/S4nt+10HoH4w1x3VoNrxWTMII
	f0S8OTZckeA6kPn3Z4+AWT9f17ZDt3GCAbtvsP7hryT4r33kIRK+NgkzZ+3JADhzWXcOpCv1vJb
	CLDVKR5aCOJW4mQm6NTPNqJ/THC5Ws6oC7EqHPiYLW3m2AAHpBJfrtGFhFr1m0LtnS5wkqCnrhN
	3FkMd+ShWrhSGND0x9rwpwWrrEui7gDZUEzC10ZeIh/RuAJQxsTXSBv+vR5v213PGRw7I7y5NND
	XC8BnFaPu0eefbWdbfkjf5oR7TJe3GJDlO1i72+cQuFlYwbwemrvp8IuLpxMOr32WAaocKkIK6N
	G8XmEz2jtz8tg93KYrBrr/I6nwVRtGMa/lRTFEdaIStKvSD3z0xoGg=
X-Received: by 2002:a05:7300:a225:b0:351:6b27:d67d with SMTP id 5a478bee46e88-369d9802e3amr1997730eec.30.1792744197389;
        Fri, 23 Oct 2026 01:29:57 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9a72ff2sm4847349eec.0.2026.10.23.01.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:29:56 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Roger Lu <roger.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: SVS: fix device reference leak in svs_add_device_link()
Date: Fri, 23 Oct 2026 16:29:48 +0800
Message-ID: <20261023082948.1854252-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_093000_231119_820FD7C1 
X-CRM114-Status: GOOD (  16.69  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

svs_add_device_link() calls svs_get_subsys_device(), which returns a
device with a reference taken by of_find_device_by_node(). If either of
the subsequent checks fails, the function returns an error pointer
without dropping that reference, and the caller only checks IS_ERR() and
bails out, so the reference is leaked on every -EPROBE_DEFER.

Both error paths can be hit in practice: device_link_add() returns NULL
when the link would create a reverse dependency or on allocation
failure, and the supplier status check fails whenever the supplier has
not bound yet.

Drop the reference before returning on both paths.

While at it, note that the return value of device_link_add() is only
used to detect failure. Managed links are owned by the driver core, so
the driver must not keep or dereference the struct device_link pointer
to inspect the supplier state; read dev->links.status directly instead.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/soc/mediatek/mtk-svs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 99edecb204f25..fecb09b9185c2 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2145,21 +2145,21 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 					  const char *node_name)
 {
 	struct device *dev;
-	struct device_link *sup_link;
 
 	dev = svs_get_subsys_device(svsp, node_name);
 	if (IS_ERR(dev))
 		return dev;
 
-	sup_link = device_link_add(svsp->dev, dev,
-				   DL_FLAG_AUTOREMOVE_CONSUMER);
-	if (!sup_link) {
-		dev_err(svsp->dev, "sup_link is NULL\n");
+	if (!device_link_add(svsp->dev, dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
+		dev_err(svsp->dev, "device_link_add returns NULL\n");
+		put_device(dev);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
+	if (READ_ONCE(dev->links.status) != DL_DEV_DRIVER_BOUND) {
+		put_device(dev);
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	return dev;
 }
-- 
2.47.3


