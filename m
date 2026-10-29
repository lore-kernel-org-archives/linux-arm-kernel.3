Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A867A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LgiBxDc0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vur9MX3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=; b=LgiBxDc0YjHu7s
	mnyzhyWAX1wixMEIr3nl5r/zYJBcSydiASZK/l5ngQJt8TNrix16N1Jgeu+vrIavwK2YnkrVU/O7j
	s/Rh0EGgY6hkU/f8YRpI7TnKjwrbpMd5emn/e3R0CnP1OU+qWyU0LtzqewbQVB9XV7EePZjZU6g+V
	UKM7cQii9NeYxv5ji5qSEzL+jy8IhdORp5AWY0WcUFVxnJbFmgX4bT+l2cKpmHx1XSMEmILjMhlXl
	nDP6xvKC5pVsQPzmAT6D9qdRMZOvkoMDtIiG2h7/+ft5Z5I/Ypf9zymRx6miMSI2JQSAkNL6mCEl4
	19H7zgVyPAtIAzAhRY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZh-00000009SS9-1YHb;
	Thu, 29 Oct 2026 13:53:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZV-00000009SCH-3UXp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1626257f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282016; x=1793886816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=Vur9MX3NuhCm43KKTu1/BzDwTyZjtwdex6DdzQVCjK/ELrCDkpRmdgNa5rwQdDTBzW
         gGeFB4c1kNdVR2ICIOqwxbVkz2Fj9SKVtk3clCWBmoz8beLa2JDHR6IoN5fGTdcXMV8N
         M5H64QqoAC255vQM/moRUuKm0SchjukHRPFs6kSGwAobeRBo+kJY8HEsEIBJuVn7chW+
         4rRAjoNszCAQsksuswrJ3Y7NYZOZeq2iwck5FbiE5z2EDQIzcQBrfGN+tHBUwN/vcoDQ
         xQdSm0KfhQVLwNRsMX/5EchZVQACmL78v9oj5QwZPgNI0yXPTRbKYslG8Av7B/jslyau
         zRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282016; x=1793886816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=QW//fiZGZ+q7XxOYXXQMNnj6+f1sNLWwRxsbDSky6DzxxFF4533bu1cwzdZSigyU2E
         hvQIcnxpSHzEXQeXMBWxHSaUDitsDlN9gwdaqNIpk3XEYvqripN9S88ov4m0zbJosgyt
         Rz/ANQQwBBisiUKGVSVS77jvGb2zqMXXYFEdHBxyYm8m46sMKxkhXsXWOewpHaCqgs7X
         1fB9lbNgmCypxsCdGlyx8lMmJEg0cEhcvMbqWJOAoAla238SCLLp6i3KIzR85djBGggH
         3IK5O0hyJp3xOYBd4TEwtG3En32Wd1eB8nExelKiSuQyDjemsuSe7ei8j1OuOcG/3Cmb
         N54A==
X-Forwarded-Encrypted: i=1; AKwUvBxnZie0gPnblViSUyYle9Zzt49OoPFptC6eEqEW0B5IckdcyErH3TM8Fzxc0iQc5H/6L8mUt2bWQNfXt9Fu/oJv@lists.infradead.org
X-Gm-Message-State: AFq9FYIvsTq7guQSuUIJSjuOCmCjxmumtWoREQuo/CWEB2t18XY3Isex
	RCajV/XOhAQD1ILG8T3hglFDkiJMQwbyQN6oCnEKH2/TG1yad3/itEE=
X-Gm-Gg: AYBFou0OQ7vib+LGI43uO92GIKDh3Em97nDfye+BuSObsSUWm4D35fE5wJPWHqn+6Xk
	Y7xPtSoMdZWqVTzz9vWTlaNTjsT0SJlKMTxd6hr2ZywPsRcZzDCD7DY5qXpVIvvBcMXoJwWgM42
	g20HzQ1nuBkXTGIDenvmoWWVMMuOEuuSdvhPs9esMKgY998XKWvj0EGHZzWVxIPE6NmXxPFq5hW
	e6SG+q8kFYZIJ8e5Y+ctvXxNESHi2nAsc+GTMW68oityJI3jckQxxZBJEMvf8X+LDXpglzd4PHk
	u9NAVqA06mTfJZj4m/X5I5ljjC11QT+l5fZjXfwTeuk4UPZMxFZPr1zcJcwGOeZZ5PfRArUU9cH
	NSvSh0SpJNbYzP4FkwimeSXUW8aZCcMCnqzDAqQQ57Q6RrbaGKCW5i2XpWRk11u095zMsoJBlvQ
	fMBykBp8l7n779SOCjqck5TngIJ3ZDjb1AJNWWFIc7NmQ5gDPmv6mmEugSZj1a9qvvS0NuWsyt0
	eCPuhw6bfO8Yjce76vZURNzdibxxtSvxN9SC9j+ZhbmAtRrEJZCjdl3k6HF5Zn9XRa8S7aQb8Em
	wtUADAOvbP6GZhOXA4tgagQuLLm931Owylg3ITx9GH7LP7d1GTZnBrCGcrtWCC0LtFM=
X-Received: by 2002:a05:6000:178a:b0:48e:56fa:9645 with SMTP id ffacd0b85a97d-48e5d5cf38fmr12439039f8f.29.1793282015845;
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:51 +0100
Subject: [PATCH RFC v2 14/14] drm/msm: enable LPAC on gen70900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-14-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=982;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zftBrxFOdArPW4SDW/zPbLM/dW8N0ZZjr0f9slsMd44=;
 b=drJK44c9MU6MO0yKK3/YNJmZlff0GX8bkfJNHj78s+gEdYZMo0J9ar0ZFCpDUnU9s9p/mTv9U
 QEVDlUzSQ7wDLCQ28Hd4GN503IJPB36U2UQmXnTQDK6NcMLz/o9Mfkc
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065337_915831_AE091924 
X-CRM114-Status: GOOD (  12.12  )
X-Spam-Score: -1.9 (-)
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

When the enable_lpac mod param is left on auto (-1) LPAC will be enabled
for targets that are known to support it and are known to work.

gen70900 (Adreno 750) is one such target.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 5ee00eead14c..cd1bdb54429d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1591,7 +1591,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
-			  ADRENO_QUIRK_IFPC,
+			  ADRENO_QUIRK_IFPC |
+			  ADRENO_QUIRK_LPAC,
 		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.56.0


