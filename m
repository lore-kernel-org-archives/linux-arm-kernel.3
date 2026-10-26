Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A23606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pYaOhCUC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAves+Ua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=; b=pYaOhCUCZL/z/Nv3Kb4s4fUtff
	uyWeNzekwxU59fVXdmlYOiGxdLhlEyGHu2w84GrWqycHEZne+t+XGUNj+EKtAJC+n3I9MgVhqKcNH
	aFrx2TDuQNrN6cwRsQeMiiiHeApKWSKKTWnsJ1URLu9bxu/VrkHzQxrKqO9C6GwEKfCUzMmdbfkAy
	rUlWsCk29JIepqBruILJ0USfe7q/9Xrora11vNcYIvzsYYi8dJ9ENM4EwrHsTGJbASea+JsLYYtGP
	I43BispBUYUDawwJ9n2mDAmEl8q1DkFW79i4KU4+QGV0z4yu7taPP70bndRDJEWBDPumjQVk0ymMT
	e/3tGCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNGf-00000002qIZ-2KBB;
	Mon, 26 Oct 2026 16:09:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNGd-00000002qID-0BSt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:09:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so672425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030985; x=1793635785; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=qAves+UabzMW81fMDunHEWP3rRHQbc7taToAF5OY+z5G66oQL+VdwMbrmoH4HRSfBA
         TVImV9qeF/kb6W/nKdQor9/BWO1PLS3saMmvs8HLmQhvJ1znuakYzCyUzY1xef4Yyw4Y
         c6L5pB6xmSWY+hLyE8zLK4U1p5kkLMJR2oraNE4cHKe8rOSM+zFcmNEgl0Kbsu8Yb/mt
         aKwDARN/5XAYCqxwpe7ZSFAP2siNjphw9eLuVdE91qbfmkmAjD77GW6meLYno3GR540M
         4ahIhtH7PxZQwCUAgDDQ3t4U2oiOdjp6PkTGcX+uvR+SuEkZ3lT2MzlkIMDVsdZjeIty
         Lgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030985; x=1793635785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=H/fa+ozXpMjRzgeMDnxx1qCC3L7oHVt2abFs9tY73PyeoHtukX866if4i1xmL5C2tk
         7Tsg5ceUcFNMIXgrK1P0ZWtMb/Qh9kIUuDWTBwFhy9OVWyGC2aKT72He4kQnFahgRQ4/
         RY3vfZBwG0VTBUcpZaHoaX7naJhcmg57BlJaP4fmsQdfFPjaHafM3MfXSvqfkYJvP0M4
         QA6sMCNiRshgn7b0BLDOn4nZx3ZbpiKyBep2Nxh5z6jBtj3obRc7IlFiPIcvhmqZolNr
         qWdfv+x1TJPiUUXFb0J32+ce8L/go+UPrIblW2Vaar32yk7uyIxnpy/XsvFf1dMusPuq
         ZHDA==
X-Forwarded-Encrypted: i=1; AKwUvBxu+G0XfVbW9+gvvdSZtO2I9WmQ6AL34hS2fKsQDfi3tOJ81PI/VX4onFFGxKe7XYX+GpZvC/XVnaW5+LiTsMcr@lists.infradead.org
X-Gm-Message-State: AFq9FYJrltb6pch9GwYrnMyiMcYH9Hy3Uc5H91+mmigeZfMx6W2SmASA
	2tjrKje38rF1h5bwkg4fUdMm22nExuvRUeYX4a5nPtQ3cqyMGCtOOlPu
X-Gm-Gg: AYBFou2eNwiFCq1v1Cx7eHWfHn9ZWzKIQ2YEDtUFSY7aAnT7quqKF7VTqEObDO08DcP
	NP/cLqiSc9cpfStgtK/E8X25L20dhn0Qr+cc7LOeXd/HbLoEsQX46VZ6rXDSb4ahjIkPVZyoUxs
	cWDzm6jp6sQy3TDXKfJaFaLxYHk+xmAzerT5aSSzMfkPAAgfklMglk5pf351SfZ7pCzZJ4EseY8
	Mbv94dzSCqRLNLsvYPe7WVLTqb/NmcQTYDMv0KDUXUigs98BAF7dlIQPf1H3jQIZslm7N2eQtmf
	3B0Y3PMVk0xtL7SDL+npeZ/A8u6HtlxfrRSt4L3dM1cgNCR0N/L5Ded/bw6qoIdEl3a6N5LUZcE
	IZpH+38kALL4Wd0tvLBQLP4fa2WKTioJMee3dIaoArdDALQMcLix1buR/AIiqDGwQEWmq1hvMMi
	SkovjO4lb2zP5C/GtHJsgKGYawht3cj3tXDbQR3lQlRjqlOfrphXnzf1BTrYD4YgKgfoIJLIASz
	bgo3qDnHApQP2iYILZgoS4I2Me4pEN4xLcgjf+BWYeeG+NWYpwS1S9ie1HNCFDU57ymBZQi9d/l
	GaioaY29UaP4CC24YeXd4yHUSnJfkQ==
X-Received: by 2002:a05:600c:3115:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a7c16c5294mr2538075e9.13.1793030984491;
        Mon, 26 Oct 2026 09:09:44 -0700 (PDT)
Received: from theSameSurfase.localdomain ([89.216.103.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm224923225e9.3.2026.10.26.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:09:43 -0700 (PDT)
From: Artem Utkin <thesame.personal@gmail.com>
Date: Mon, 26 Oct 2026 17:09:14 +0100
Subject: [PATCH v2] ARM: dts: samsung: exynos4412-p4note: allow powering
 off the wifi card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-exynos4412-p4note-brcmfmac-v2-1-14b372972163@gmail.com>
X-B4-Tracking: v=1; b=H4sIACl732oC/43NQQ6CMBCF4auQWTuGlgrqynsYFjAMMIltSUsIh
 HB3Kydw+b3F/3aIHIQjPLMdAi8SxbsEfcmAxsYNjNIlg851qXJtkNfN+WiM0jgZ52fGNpDtbUN
 Y3rkiVRQ30/aQAlPgXtYz/q6TR4mzD9v5tajf+ld2Uaiw6PIHm0dJmqrXYBv5XMlbqI/j+AKcD
 dU7xAAAAA==
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: stable@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090947_111353_73787DF5 
X-CRM114-Status: GOOD (  10.99  )
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

Fixes: 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board requires it")
Cc: stable@vger.kernel.org
Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
Changes in v2:
- Drop the paragraph about exynos4210-i9100.
- Add Fixes and Cc stable trailers.
- Correct the author name to match Signed-off-by.
- Link to v1: https://patch.msgid.link/20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com
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


