Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umtYYHDA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EuZIlTJl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=; b=umtYYHDAXruTQhX0qrXQazkgfN
	KO6tKJsKy+wXy21nlL8KZAvRRRuUatvyMxc6DTSYaZ+GGcsQkMK5pi9REtD2Tz1c2yjuKXqqFwyW7
	e77AIT7uJPFbJsUNjQ7UkvXzQnq4+zgOYrIwtsI5NABAEjgheLZ9fmhMHQzknIkNy9uy+VZsbAIfR
	GzYRHNmS9CA1dIFDQzfBkZw6WzIs4ls9utxIL7XjN0Kj2IdhorhDtlwV1kPy5GJLljdJ6gj4uaNT1
	JNAUoUoawsNtRaqTDbbSPwzMNfwkcsGBYQEPuBCy9RFxj6okUp0pXPWLuJR7GXeZF0RLjCudrOVHg
	wAvHnQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5n-000000038RY-2OJb;
	Mon, 26 Oct 2026 19:10:47 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5k-000000038PX-0oXE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:46 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-824413e10dcso1692041a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041841; x=1793646641; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
        b=EuZIlTJlWFCbcM14ohi++/LCK3YSh8w8TVfd00eN0Kucy/xZlSF8q0DFEBShKQwLNq
         oyUXfU+mmkCjhLtUI40q98RWtRqkR8WbbvHEu3UGmaEC9aaCnnd/WTMhO0I2QGdqR1u0
         m710Sx0OXzCKKqeAROA6U1n4291IhDPkAOiL3QpslvQyfRcyRr+CO0dVjvGwA3IbDzU7
         CT8MG2M4R7m3lmWEAIgyOZjmkG3oJ1kwUQE5CS+J7g1ity211lJZrVsTupZ33oQH8aw/
         kJjFvpVGKg+m8QxANiZzZwqs3eubcYnkS3XAfCtqRGE84FQIK/JzDjyndbKdtBZ6MizT
         GsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041841; x=1793646641;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
        b=dfEZazpm5vAL8OYFVs2y9Zzx0QmN2MCkyF/1Vnn2FDo3qJOfn/+NoX6aYzGtj6q4jS
         JTFXHcJq+9lABkDPTgeRJPB5twnGOJ879rL5TvjFqSenFO+1hWT5RrMhOhHno2Czzy/z
         QSelGjcWvTD9VRSkhuv6v2ooA7E9cmuTFWVudoiKHQj5NEicKXBM6mF8PVDJ3EHYb/L5
         utrd4N2QhM/jTZkLV1xonOuRA+a9EissFG28BSxgO1CDsuGq3iDwlF6saNXNV7FuvXPO
         DMG9zzZSYku3UsY0OB4RhAQ0fhVyB8x0SwVVF/mQ8vRNZwcWDtEOAHAyEMy1aOd0+OL9
         muOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiQ3A3g6juqekefgA3GrK5QyaLYTMpUboingcJG7sU6M6k1yDGxLYQWSZ+0QMxeu0Tbok9rUQL2gQ7v19qDJUm@lists.infradead.org
X-Gm-Message-State: AFq9FYJa3YvY0CMqiNou/q/zOSEN8xo7qwuR88tAwvn4QP3I1sqGKppL
	XTJRIbCvTexv+AxQ4/NL9KR7KUpg7A4axZFGbHM5uQ3vyckTHzAOrrdM
X-Gm-Gg: AYBFou24mDPVfoMmY9mvzyXslilOJDZp/5csuD7vjaHdePMgxgRVh4enIPm54ir7Zcz
	i/ABfrrUM3DRMlZw5YULUS+gRWwvPQOdk+IQ4B3Gv5AopW3KtyUW/4SNj3ghncS2d3shW7EknTN
	9sqejvdqltFa7YiaOUhxA8C5a5IRuni2HWutYEOhki/jBUMQnDbtkfaYBax6fSFgZ6ENIcAVXnD
	6qZcxcSjplcv3utwIYZApUnHgPv37HqSFVheedx1fh8SLx32KdjBRJOn0C1xE8ri1aUy+vkfzv9
	n9xcsU+JvJaV9Qa5V/cz+7APNHQxaTT9DwDPsWk83b+p6ukoN/HNr7uLr/r8IIVShgb14qP2iwn
	SiHhUCpvK8YQAkmWVruPM8yM84D9QwDJ4PXaOZGo/YGWQxxTYaTXtSeqPDAMgq+CK99WDcx7Jrj
	Y8Oh54WyIew2Uon9E7kWnE5fKOET5TxFG3O7Jd6Mq64kUzAU9deb6jQ6mGlKpO71keJ1p/DF11+
	k5LgqTXO/1tz7CwYne/8leKIYhCve6J0zA8Bz45JvGr1v2GbK44f1SVoY00suPYf+HEYtaywzK+
	0DdfIHnC6qSEseGbiTCbeF9bejMKpgPHo4X16Ry6weW68A==
X-Received: by 2002:a05:6808:50a6:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-55c002c4d6cmr5571600b6e.29.1793041840897;
        Mon, 26 Oct 2026 12:10:40 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:40 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/4] wifi: mt76: mt7663s: two fixes and fewer SDIO status
 reads
Date: Mon, 26 Oct 2026 14:10:35 -0500
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQqDMAwA0KuEfBuwKXSjVxn7cG3UwKyS6BiId
 x/sXeCd6GIqjhlONPmo69owQ+gAyzy0SUgrZkDuOYWeA9nLDiGf5V3XRsfmu8mwaJto2W8pRSf
 mEkONY0n3ih3gZjLq9388ntf1A00N4KtzAAAA
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-mt7663s-22c31d3fc68d
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=2308;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=tyqWodcb4HgA2IBe3psm2WrhLsTpaYYAyzN5LeZv4/A=;
 b=E4ysnrAqpc/wKUI5mzFLxFe8CxGZEzCtxfGQ1JNY+laZcPUAM6KONFWstDZqbNG1+jqMwAzk5
 HJ/ByhvWs+cCbQl2zCyqQISK2s1XAC/Ns8YnvGdS8EMZajk3AVJWTye
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121044_253212_BE351ADF 
X-CRM114-Status: GOOD (  10.21  )
X-Spam-Score: -2.1 (--)
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

These came out of bringing up the MT7663 SDIO module of the Amazon Fire
TV Stick (3rd generation, MT8695) on mainline. The board's devicetree
is not upstream yet.

Patches 1 and 2 are fixes. With the offload firmware, a hw scan with a
random source address ends at once with no results, so NetworkManager,
which randomizes by default, finds no networks; patch 1 stops
advertising random-address scans on SDIO. Patch 2 lets mt7663s wait
while btmtksdio holds the ROM patch semaphore, instead of failing to
load its firmware when Bluetooth probes first. The matching btmtksdio
fixes for the same race are posted separately to linux-bluetooth.

Patches 3 and 4 make the txrx worker cheaper on the bus: the interrupt
mask writes become CMD52s, and mt7663s takes the next interrupt status
from the end of each RX read (RX enhance mode) instead of reading WHISR
before every RX read. On this board they halve the status reads; the
link is air-limited, so throughput did not change.

All four were tested on v7.3 on the stick, with btmtksdio built in; six
boots in a row brought up both functions, with each driver downloading
the patch first at least once. They apply cleanly to the mt76 tree, where
they were build-tested with W=1.

This series was developed with the help of an LLM coding assistant.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (4):
      wifi: mt76: mt7663s: don't advertise random MAC address scans
      wifi: mt76: mt7615: wait while Bluetooth downloads the MT7663 patch
      wifi: mt76: sdio: use CMD52 to mask and unmask the interrupt
      wifi: mt76: mt7663s: use RX enhance mode

 drivers/net/wireless/mediatek/mt76/mt76.h        | 10 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7615/init.c |  6 +++++
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 14 ++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 28 +++++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/sdio.c        |  3 +++
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 21 +++++++++++++-----
 6 files changed, 69 insertions(+), 13 deletions(-)
---
base-commit: 16f56d6e78fb3cdb3214bdc6a61c2b1c567c9aa0
change-id: 20261021-rbrue-sheldon-upstreaming-mt7663s-22c31d3fc68d

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


