Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awyCfBcM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dt7+TDmH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=618ppnTTAMIe+DoCnrNMfZTILgIDF8MyT0GWuzKsSm0=; b=awyCfBcMCo1BVH
	2kk1GaBoFd1uc5TRWgToFT0lY7X1rDdUGtdmYTqgpXTBoKXTE3DqLt4uod041VlxUPXJc5+938BOx
	R1p++cNkE11yLDHWT3NE+rN31qVy8gYjBTMwje7kUE6HqvgxddXAVQ7oEzbR7CkVj8rM4gJUygn0Y
	F7IAjbPHsvLq7DG7zWbbahO8+Wfcsh7lXm2O1D3Re6boGLIawabqcunZXNrVZY/HZjsm3rdYQVrW7
	8WfwPfro7Dh87qvialfVM8eoQX4SZfxeb063jSBsLNwF0VczbyxuiEmC4XsOO1rfCaJefpOb1Fomn
	yhP/VAxRFPYXF2K4vDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5s-000000038Wd-3we4;
	Mon, 26 Oct 2026 19:10:52 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5n-000000038Pz-0Agu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:49 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-539edfadfa9so1437714b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041844; x=1793646644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=618ppnTTAMIe+DoCnrNMfZTILgIDF8MyT0GWuzKsSm0=;
        b=Dt7+TDmHXGs3FPkhvrC/HD54BAoZG02N/Ti/JIN9WFBlsRUyvrY/RFhG4G87WdY7AJ
         zO7DfqE64c+k39+2gAoi0TUYl6LXdy1alfcCiLuPr1NPIjxb4a89cznaiMe97b4lHQz7
         WTtor7fyJP4IxkxIaL55sRqR3R05Q7aJHzIz4jHi633UVuFNdXoVg6ToSH7cexillELX
         +FKNU1DrI58d+xz3km1TXvfNPN+U5Aggh5z6EAmOeTftYq+2pPOTJpw2ABDvjY9xurnc
         ETNWFUeX2BofVlJP3py6YBsj6nQbwXYQ/hwd5INp19qYU4jpOnKGKiy1nvEyZbBgmyEG
         D5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041844; x=1793646644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=618ppnTTAMIe+DoCnrNMfZTILgIDF8MyT0GWuzKsSm0=;
        b=VdvcHfT3iDEv4/1FqW/E9DMeBQPTItSN2Yz0n6WIb4spgeeFd2L5kDqI28z+bOtY1B
         9vryA5kYMbwdLen2QahrIE3jRIMjYZKs9FFLxItZYaNSsA1KiRxPrYHRWdyabT8UHhN6
         5giTTD8/ZgifzmpPD1Lyz6TKjo5cjj8B6xFJ4iLqqzvY0eGpdTzTcLLkLOEZ0bX4jMHn
         XSecLkssfnzrnbWHhiFxhd6cWyAaIa/rIZweRB4Iw1NgejR0ThIgrIYN54MPHZ/ILuzH
         2oX+1ZNxj2o4hWIE9mESE7PKaQA25pnPPuft5C/LqLaYYqbJkd4USurGZ5P72rALGIwk
         iTug==
X-Forwarded-Encrypted: i=1; AKwUvBwmTl2nzgDUses6m3Kp08J7g7z/2OD8RktbMDedkQgyPJTfefU8P9dyMq1DEg3cSkpnq/Qx95tCTUSozvRNOmfr@lists.infradead.org
X-Gm-Message-State: AFq9FYIeWFMy5PZAhlHJ6alsm4pjlm7JeDpE2Vns5P79Q2JD9LiQUi35
	72PSGHnAFvHUps4LKWTHGAbmk4aFklVvI82CUcJmvC2neEF5qscuou6l
X-Gm-Gg: AYBFou3p+R1zXGtFKJSsIKRp0vSQJWAs9X72++UKZnynFLcPIAT5BIvKrdLR61r2fyV
	TEF5zShmDLhUQMxwqc62w1ZydqQn3gYTNKLfmn9HRORBfwXPs6AS5uBFpmcP6mKLuWJHDaS5+4J
	/8OjqLmWYZSaV3ZUHMcBrqUr4qBRtcc6wcmxRDrYvAxwXpt8D1IVKuKkWqudKeIoGjz2M30BwdV
	1ivHOGm/Q0az6md292+Yo2vCUjAkCX09vPR+Mx2ro+/x9S+jaUlf58oPNHMn0cHY/zrcqOxSnCC
	GFr1sgtlKp7nSeqJUmNSvCV9lqegiExebIkcNuyU2gy8HerhvUthWTCGJesPQ0PXu4h0EAQ/+ZK
	v98j+ZvaAaHNOVXQ1PSckI9vVF3IMmz2rVROsTd01It1X5auckY9NrdgY/UJfPUzi7W11QWoVeQ
	RWnaQDCJA03qFx/5EWYo45/cCphsSedBc4bAH4IUIH9k0GlxmBJvUIVIJpYk0hfbQF143r97zXY
	J4h+Ri26jo1r6wiT7EK2liJZ0WoQOZQeqZi/qCL7Z4RwaSYCzBpnzQnf7fH5SEe/P3zsPSkN+PE
	iuswMQcmOLc5hukj65fL9cUCXWqPlJxVjLZDGQ7TuQ28iEbU5mrB1MVegp+L9ym+2k0=
X-Received: by 2002:a05:6808:1209:b0:4d6:90f3:74a3 with SMTP id 5614622812f47-55c003118bemr5492504b6e.46.1793041843805;
        Mon, 26 Oct 2026 12:10:43 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:42 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:36 -0500
Subject: [PATCH 1/4] wifi: mt76: mt7663s: don't advertise random MAC
 address scans
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-1-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=1887;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ZxzBWCMIVzBy2zHcQbyAGCsHpmwqwCbczZ1Y+dIdAUw=;
 b=JQfaph5OJQ4fE5sflHyc3YV9ljMuTh+tTrOIW1IgQQ0aFKTtqLSEtsrcaemUK4HFew0sfFGir
 3w4+xgm3WyyBDexS52kgyrjuzRFqDFkswzrbmOnDeL9cZqTcguX/7yc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121047_092887_1F521722 
X-CRM114-Status: GOOD (  14.25  )
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

With the MT7663 offload firmware (N9 3.1.1, build 20200604161656) on
SDIO, a hw scan with NL80211_SCAN_FLAG_RANDOM_ADDR completes in about
50 ms with no results, while the same scan without the flag takes about
5 s and finds every BSS in range:

  iw dev wlan0 scan flush            -> 17-23 BSSes in 5 s
  iw dev wlan0 scan flush randomise  -> 0 BSSes in 0.05 s

NetworkManager randomizes the scan address by default, so on an
mt7663s it lists no networks, or only the few whose beacons happen to
arrive during a scan, and it can't find the network it is configured
for.

Stop advertising NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR on SDIO, so user
space falls back to the device address. Scheduled scans have their own
MT7663 request layout and are left alone. Only the SDIO variant was
tested; the PCIe and USB ones load the same firmware and may need the
same treatment.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 665b0f1e939f..e6685c51fa6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -200,6 +200,12 @@ mt7615_check_offload_capability(struct mt7615_dev *dev)
 				   WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL |
 				   NL80211_FEATURE_P2P_GO_CTWIN |
 				   NL80211_FEATURE_P2P_GO_OPPPS;
+		/*
+		 * On SDIO the firmware ends a hw scan with a random source
+		 * address at once, with no results.
+		 */
+		if (mt76_is_sdio(&dev->mt76))
+			wiphy->features &= ~NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	} else {
 		dev->ops->hw_scan = NULL;
 		dev->ops->cancel_hw_scan = NULL;

-- 
2.55.0


