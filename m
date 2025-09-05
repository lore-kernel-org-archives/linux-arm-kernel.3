Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3585ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=so1w6SARn6qmC4AOrbPwt9pSODl5A4iWHzB1CjddN4s=; b=eSD/rarU4Boxi4WccGrawEDMfa
	b3w4qOz8v5gzHEpWj4xe9VsPNFXLFolGq3bmgkQ+sF3wsRT7cPKE6SLP4CmtMvDiBlMW4DTkZ+Km+
	jmhSfE2xMWB2Twg4Tt5+XycliSy2w3e9KmDNy8LKFT+Q0ft67UiNT2++sR143K4n+CYAYY/5nOHw/
	oNpV80KcXs27FkpGBu7NuwKmWB0tdw+7mWrtup5YZsKV8mdbZD8IRcoV3CKuO3ruUr1YmsT5BL5SA
	Ijd6lNpMHYNNUhhRWz02OO+p9z50gX+i/mO9TD/ltt6ta+Tn+kDFTzx8k85LArM9CXZjiLTG0TvAj
	s+diK0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMlN-0000000GL5g-1eJR;
	Fri, 05 Sep 2025 03:05:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdN-0000000GIL0-1xBo;
	Fri, 05 Sep 2025 02:57:06 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7728a8862ccso1698036b3a.0;
        Thu, 04 Sep 2025 19:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041025; x=1757645825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so1w6SARn6qmC4AOrbPwt9pSODl5A4iWHzB1CjddN4s=;
        b=JjkMVXNI0OvVw2i1gOhcu3x8+jlWrrhPIL/dxZp2e3ZZZYzohWcRQvpug1/sfE0lEU
         65Ka0ypBPZGvoq1M3+2a8KSnrmpqjUoOnQfvuKixEjJnOo+xabQF+aokCoCXf5yjVJuK
         fZyFBh29h3G2obFyxLXOf6VXA8kV1PMbHE73OWusXhSXcsMSc400RqTYZ7zISHcLfs9f
         hdLTtQM0hDb976wAbmAk5XazYAU3VwQyMPFtQ4OcEDFI9Yzo2Um3g3TfF4naFlP78fVl
         2HosIVALzg6D8u2DlzzLKO4H+ngDcO7P1DZPExrY+de04u5+wPbgrueJ8CPheHJDj7p6
         rmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041025; x=1757645825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=so1w6SARn6qmC4AOrbPwt9pSODl5A4iWHzB1CjddN4s=;
        b=rowjrOBUOquosXhHwUVf4uJngfq6bP7w5htZbBNO30DsxGWPnqXj6ReoMg1tAje9ef
         +qUJeTdnswaHA3esNYeutvYrG19VI/3kCG4cWJpONgaS2VJ5vEmN1QPWvSXStOipOQlS
         aBk42DV6cdXhHsjK+QUI4B67T7hU+QkKvL1C1gXNu49hldXxXK7nKIFfp/3IL2vKJI8E
         jmnXIEweDyHerz31zkoAK8tMq/bwEf4H6GUGuB+x28wiekTi1bGglzpXWkfygxdMSVVT
         BvC05i9aK20MX701tJiTgHBqqrzIBeiI1X+Xiq68bVouCi5jpdy/7VOOyupaUC7Ezjdr
         /9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu6Hkh7NnmgEtT0gI+9ibdNIFyoqmIa+kHi0cRhKhnVoYk0LcSYsjS7V7q3KxoA8SdfpImVEyU4qPfHt4lHIC3@lists.infradead.org, AJvYcCX2nldJgbfwxa+be/rxIn6h7RAxx/A6A2aYa7PfDmrsSG5IsKHGk/JmcxL2stI+hQR5W/n7jbx53keFX+AID8A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoPCyy8b0sLFcF/vmPlcNXgSl4k/erteIzP9eo0+KORKi9zMFX
	pZSGgmMpJUeUHGv/ln9kLYfnc4bTRVCAf6Br8Y8hh+Rd2bTyPbMDiEuzBmE8UkOTVf913CGh
X-Gm-Gg: ASbGncv50vzoEbFGfy6117Wcf9pFgpVeSvm5BNNVlTT/pD7xQX5+01+N/vemZkisWpO
	EzyRIOFCmZzhQUSvQL4ONvlEesX6Bdr979mg8jBmSuy+5mXQM4aIg/leiOm3WF6tuvhylqNdFP0
	qlUXdImh0GS+ZIUAHMgkzpQ5Zjl6lSRryaCLHh09BPkhftocUe/IBev/+Z12Po4abkV7o2pHGGs
	3ruLT0YC0d36PTWA3MBqOwqLDqLk4B6dHJ5pFNz1Kh1ZZcUBNPxtHn92GmM39P0D5ljBbvMpRQr
	2YaCDN2gOr2I6hKTkspcT0DQAVL+qXGQguT+vAHt49ivg9xbZojs4QbUicw2Gjp5lXce3778he0
	MSZ9bLO82s9XGURkH3eX0iw==
X-Google-Smtp-Source: AGHT+IGxi0bFyMNWI1ng9Srru4j1XYe6kK8wIV4CSfnpgd1yu92+nFzqOJeoOCTEb7GctJdWYeFvVw==
X-Received: by 2002:a05:6a21:9997:b0:246:1e3:1f7e with SMTP id adf61e73a8af0-24e7d6d01a5mr2400763637.5.1757041024606;
        Thu, 04 Sep 2025 19:57:04 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:04 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 2/8] drm/rockchip: vop: add lut_size for RK3368 vop_data
Date: Fri,  5 Sep 2025 10:56:26 +0800
Message-Id: <20250905025632.222422-3-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195705_502071_23CDE9AC 
X-CRM114-Status: GOOD (  10.21  )
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

VOP driver need a correct lut_size to work normally. According to
rockchip downstream kernel source [1], the lut_size is 0x400.

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm64/boot/dts/rockchip/rk3368.dtsi#L1497

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index d1f788763..219f8c2fa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -880,6 +880,7 @@ static const struct vop_data rk3368_vop = {
 	.win = rk3368_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3368_vop_win_data),
 	.max_output = { 4096, 2160 },
+	.lut_size = 1024,
 };
 
 static const struct vop_intr rk3366_vop_intr = {
-- 
2.39.5


