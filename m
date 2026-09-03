Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B271FC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=; b=HOuxNfoORc5djrfv6O0fAFt11x
	Um65bB2TaJrECaBr58XOZqF0gaBOxap/2hq6yFMWqS63MLAuRg1cmuYDd4IAEClQg1YBn3jGSRcTu
	DOExskxyxrKiTMx1S8UCw1hNish/CYLUEk40DurgocmOtbubtPzJpoWr0agiegH+Hk+gJu/cmX8yn
	hd/EppUqrqEUfKRZ+JqRC9pKyKdq8oame0/61r/LrX7Km0sK7iVtbuXE97+3JL7CPU4iisCe1dKXw
	gRGSq4TAMnNv45eCDWD4unciyjd5vhDoAUkLBRaphSySCPZDAAfO6d+FpCEFhLejbuxInUfcKRqwj
	1TSGoYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25br-0000000HCeB-09ry;
	Thu, 03 Sep 2026 11:27:59 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25bo-0000000HCd0-3ETC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:27:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3289064b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 04:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434876; x=1789039676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=;
        b=KrhjlmM9cCd1hijDO7gACAD+NSPU4w6artpPj17N0Hi+xITZcGqbE4UhEzj1bRURi0
         U1qcPouLmQ5zXp+KHQzcya2PWVBAkVvH49qQrd1D8YQgGwfNqmSNp7hiEWRhyyJg9nFp
         pTG3cF79VHa/nu6K8oyhJPOrYDqgwOHzScEMZi2gecs90tZYQmlY0YfMrCYz9fB6aZfW
         vsZP/vsQsBNj/rOyGEZgmQLRccACQ0qdh2g+BPcFRQx+lWMwm1HSQ6B/LJlehzEB7uGX
         ldGCiTMH86uIK6rQ/zK1Q1Ztbl5ZUp+nGjiujU7AczmTAclpZ4AeKPvaV9Q4JCUEVkLm
         gotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434876; x=1789039676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LelVyfkIJElVaV96Bx2ole6PtnzRp3ZrnXJtU0M/fEY=;
        b=fte87xx0tuiXc3MwZybGcGAZoMV0sDs2yOS62tjKZdfLbAlCYTZPmsD5a+fqUCV8Yb
         ancFtbAvwTk/BwCfUAEqm9AuWSPrlVy8pP5P9GIRnkUfvjCfdsEsS+sbEB+Jq3IwfrhG
         U0pbawy+ju9QDb7vOEkf2hrLX3pn70mTid/FH4pfWayZs4sRpOlBW30HGoZ7HU42M0SJ
         YlsnGVK1wxI9yHNdyddlkDSA5WmVh9KFmnvf4hdGX6Jt3fnuyBW3aNeP5mnxq5BInF9y
         I2esrw28idECpegFcnXV1/zxDbvSIJUy+Vt/Ar8NLipeP4/6vJ/PLEGWHtkCVS+Zn36n
         tEgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx338hB9TH6+71pmqsAFA6sP3hF8TKp2tTsyI2RT6/ssPSRws5QjWReFyjOBEiXEwPmGMCUCHq0ZOtT6hsGa3TO@lists.infradead.org
X-Gm-Message-State: AFuF++k+tmPgueH4LBIzwtsyN+90FC3I3z/TgrlNXbld1iFZgsVDLv9I
	XJ6oq7Z3waeTc+LFiL1mJZr9riwR5sGX2KDs+8b6qDzpBcx3i4rzseCx
X-Gm-Gg: AYBFou0W7aHaI+C8pbCKJ/GiJcfcCVgZR7YT1ELOpBAxFFDnRfwWhlb+44svu+VPjAq
	jYbU752vXOeyl4sfTuAfPECaILKHoiWsV9M6+5cSBu/63uOtlRfijMQy3Roy2KqKT1cKkBUn0z/
	DKhCvizH+8vn1IkqATlbbIFCO4nHWY7nyNmANCiftBEOSqj0ok4jk4N4FydTFxfLEUyljo+MrEr
	RMQYH9PKKpUnXxSoSZT3KwtwLjD1oZe3WZXNwj4RiYflbSS//koOfoRJtf0iHyxnrTAWY7IkbmF
	SwzSCT2I6fcTA5PVt9bkqVG/1oZQ0vGYOOfJ+QYSsxKOluE7YBPENzDphM2JYKiJwArVRyou6/W
	C0jI35ONokuSvFKM8Zot4GXikS5+atAauV3bhpRXq0C2/Kwv/n9Pg7CdcdDb6AHVOq9iMBvB4bk
	26squWMX7yITzpO902g29FuLSWVAw4lD9oM1O9vOg3tobbULQYJZg3Y5QSqUbE7kOB836hlNIuk
	WUdCdCcpfQVmOoFkUkOf5uf8rkJBbrNxIa2jPzsF6tr314qakXeYTvU7pcIVDF1QW8DX9bHlz+a
	/H+9l0HyOowYLEY=
X-Received: by 2002:a05:6a21:339f:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3d9afa068f5mr18626130637.4.1788434875933;
        Thu, 03 Sep 2026 04:27:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d467134sm856084a12.30.2026.09.03.04.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:27:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: rockchip: rockchip_sai: Handle runtime PM resume failures in set_fmt
Date: Thu,  3 Sep 2026 18:27:38 +0700
Message-ID: <20260903112739.373621-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_042756_810479_E78ED13B 
X-CRM114-Status: GOOD (  12.80  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_sai_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 30b5e71d0937..264a99e618a5 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -487,7 +487,9 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned long flags;
 	int ret = 0;
 
-	pm_runtime_get_sync(dai->dev);
+	ret = pm_runtime_resume_and_get(dai->dev);
+	if (ret)
+		return ret;
 
 	mask = SAI_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-- 
2.43.0


