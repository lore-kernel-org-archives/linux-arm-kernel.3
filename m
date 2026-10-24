Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xx/4+jUj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eJLHK9Uw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=; b=xx/4+jUjTPIevMEOOMs+LendMA
	cSgY7GtSZ590Cyrd2jdgWR149TwhH6yaNLtSy/5Dc29ADHO6p3AFFYfvj3SmIZ1e//7LA5fJWYgXe
	CCtx9ojRGV044S8Hi7IwjJjwRgp1FfXTPkaUrpemlY9PgXoelao7w7s4Nz5ptvOz6jWgQybrLx2d5
	Q+H7GEsTfv7l/zvVfiNBP4q3pxBXy1VXBHMDbwp/XuMXgjyle9GuDgRl3Iq8g7duPYEKarVFG1Uwy
	gynM8xdFrWozmSvLLH/Bnms5bdsXK9PfKLTwQqk/ZZF+h5gi+j6qeFyAiBkoFsB9hD/qE9/F/9VeH
	2ObnaCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKif3-00000000WgW-1lwA;
	Sat, 24 Oct 2026 20:48:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKif0-00000000Wg1-2go9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:48:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1123814f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874892; x=1793479692; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=eJLHK9UwZZqYlgHDLak0zGVpoA0TIZSTMBB/xL8hH1fd42w0LF4/G1mG5oHU7dYUqX
         VcRKo3buTGbXiAvE+3XP6iXXVjF7HOIhRFGJtq616vBDDEb/FnwG1sQtqUtAKEMO01xp
         hCHIBWS9zZom+NwPoY4BXthd0fYSi4YH8QbxqBxJeXINe6vXek8pgnKmpCnCRfJBeoOs
         8LVW0YKIPCpbBKvqcP2EyD6/Ut2gW0KZmgX9SQKfot2qPQ+Xhva8Vrwtk2/qMf1viqgz
         bBAcKVp6Icbjml2a9Y4xnYKQxPdQJlopx0E6lfkc2CHAbQdup4B+wXMYa/OLVHzJCp8o
         9APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874892; x=1793479692;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=NQLcClh/0A/OcmpbKA3Ham06ychqzL4bHt8vMLbP7RdRMVnunZvIjg9xJdOo0O8mhL
         CyGJ7M8B1NRYB6FtlJmVIADWoJav/gGUiesp1R/Xh6sycllHk+UDCXnKCi6cghIzFrZT
         WOLpU0Al8diZqNG5vqO/LHYIV1RXW/oa0Lh+7b+OBjugZgeeOSuXdCtYV4nf63jAuXWW
         bviQidRlz8NM/1Bfgpp8L53uh1ykzcHkM4G3Wkf4PXaaNg0ZURWRx+T4e4sY/jV9K3yG
         8nkYhi+4zEQcoJXeV98gzr4Kw4mM+nBmF7AcmE8lt3VKPU2d6QY3eqUOPncu/E0dHjco
         H9zA==
X-Forwarded-Encrypted: i=1; AKwUvBzOH9O/sxj2k24zC7L4fzTU+RwFfWUetHVODSzM8uhMW5lT5hP4sCLyB4HuASwKoksstNpjPshAg/DIdcbVBH5e@lists.infradead.org
X-Gm-Message-State: AFq9FYKRSlKr8oY6C67O2SUMbJzZOS1X/VM519G6bxlYlLiJbG5BIfYh
	0lAPTYpxNA8kRW00YA1eV3vSCZ48mbNKLfXkmWrXW4w+SHwVzuZBKOTr
X-Gm-Gg: AYBFou0fTJY1qPcn3gdBVOQU+QJ6a7zmHKx1QdjLzzR4GRD70phEb78oMI/7KbheV+j
	dmlimRaZ1BgjCJ5VN+n4AWuXr8balAJ44THo6LGEaEemqz6LcCsDuGihz+ReU5r1gWsmDyCgenf
	pQ4T5R3SIM6aQOce8d4kjRTARdI3w/1YIiopp5IYGGpJmo239u5a5F5+sPuXUJoTo+bGj63+E92
	3dOaeUSBXuMnkXeNzYQVefI4xgkUupyH1UBj0N0qeJqeWZqVctGTpxpjQoda+5STytYDALs3avr
	3LF0l4lSN6T+3RxUNHH0Wee5/MkzK69eh3t9IqRbOah0xJXK+d0ozJvY9tuieZ77f5awDhl4KGZ
	u/6IFVpvV6hskaqcxgWIHv3YW8fOdhfrWPV5QnQ+fzDvOR1AsgDuGNd+Am4m3TjGoQEjmgODp+2
	mUCLbcNvJcu2SpdCOu++i3V29OUzWarVuy7A4c6OQqyWUNQq/pme52w44yMfLaLUGbOY/SrOcCB
	ONdYYhlRNgxY1h9x3kEIKIvhrj5fQ+A/WO6o8SGHslCt6VzShUZxg70NQztlDQ9mFN/1L1AGO/V
	sBQTsk2w
X-Received: by 2002:a05:600c:5397:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a35ac99b8fmr44041955e9.8.1792874892206;
        Sat, 24 Oct 2026 13:48:12 -0700 (PDT)
Received: from theSameSurfase.localdomain ([193.222.98.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm6221793f8f.35.2026.10.24.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:48:11 -0700 (PDT)
From: thesame-personal <thesame.personal@gmail.com>
Date: Sat, 24 Oct 2026 22:48:04 +0200
Subject: [PATCH] ARM: dts: samsung: exynos4412-p4note: allow powering off
 the wifi card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIMZ3WoC/x3MSw5AMBAA0KvIrE2iNT5xFbGgpsxCK60IEXfXW
 L7NeyByEI7QZQ8EPiWKdwkqz8Cso1sYZU4GXehaFZqQr9v5SKQ07uT8wTgFs9ltNFi33BhVlhV
 NFlKwB7Zy/Xk/vO8HJtVRYGwAAAA=
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_134814_702614_C5422700 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sdhci_3 serving BCM4334 was missing cap-power-off-card.
On my N8000 this resulted in the following messages after sleeping:
[305.759883] PM: suspend entry (deep)
[306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
[306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
[307.127267] PM: suspend exit

The regression was triggered by commit 8c3170628a9c
("wifi: brcmfmac: keep power during suspend if board requires it").
Midas already has a fix in commit 2ff147fdfa99
("ARM: dts: samsung: exynos4412-midas:
turn off SDIO WLAN chip during system suspend").
exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
so p4note did not automatically inherit the Midas fix.

Another affected board was fixed in commit 863d69923bdb ("ARM: dts:
samsung: exynos4210-i9100: turn off SDIO WLAN chip during system
suspend").

Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 8d52aa13b8..03b514a82b 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -1232,6 +1232,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 

---
base-commit: b47faa6004d86ade16b90d24fa1e1f179e6f7230
change-id: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf

Best regards,
--  
Artem Utkin <thesame.personal@gmail.com>


