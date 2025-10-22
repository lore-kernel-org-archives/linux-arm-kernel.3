Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F5ECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=; b=nDrDUe42DhjuJnqMpWmgt/TQZQ
	03fC4yW2DHD2r2jsY/1QBo24hMgvDGfXpMvepHoht/RMkt0L54OVaX3y0Qen5eXaj7x198J3Gjd7P
	zgbL2BPo8UaTZ+TOg4WK+v1/mJDrzhcX6czTRN6K7oSwJkDUAguB7XgXCYItarlPqHlOviFujMgri
	y69U04NFi6HuSF730H2C2UppXCqpeIdJHay1/H9WSLGy7VU623DjzM589mk2vBGCIYdai3kMFWYrj
	fR3macy7r/JlOKezAVKmkJlNvbg7+uTE6jBO4IsLQ7NDU+cS5N9jCo9WWhHvIU0UVAYQ2Qp/UAIiu
	VPv53ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXZU-00000002kCj-3h1h;
	Wed, 22 Oct 2025 12:04:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXZR-00000002kBi-2Gs3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:04:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-427084a641aso3318078f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134639; x=1761739439; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=SxsSFhgG8NHU/WMmqdfXMq8owBnmbZTpq62L3gUmtyqM2JmyaLoBhahSGsVaacRXC4
         4jrylU/+FJVdLnS9E4rw72bUVEsJs0yeQ2OmzQWp2hZfyMdlwsE8haCRK0gIEETPskRl
         9KfU4HsJdxCDHoUchmoba2O8WnC4S7SzMCTWjrBkZG4gkkLAYKCpq58Unb0tVHzfrqMc
         k0xVio/DqUT53wereu24kRRbnk8/lHetrdvSu8D7cEspGglsFNagIsnY1OdMnr87jsHJ
         +rMrjk5Xbo0mPhdGt2yBUarfQ0Sk4qFW/O1B9ieGCjVGqOJaPDhdrCwK3S0iIe++5Cjd
         Rb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134639; x=1761739439;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=u0g5hT/NnvSiAHx904kEt/nITJqOujSNj27DeYmhXPZcAFMWsGrHPDvBO311ARimiM
         kg+A+xRK5x/iD+jSIz0Djq06KEjj2V++1QbioqSGmvjc/Ys6Rezqw/VOCr3lh96UA64H
         776CPoFWTU+zcoxmGkf4H4IJgy0yczGwSS8HfM2hyxPNF6VKn3KZ/1A7P0vwGdCx3+3C
         66rQRWY5Fd9/2oKo6EvxnxqwQe6s5zinCrYOEkB0rEZj7IZdSRXETPkaiq+9sWstincE
         CelvarUQFRQbe6eY3LhyHYb6ptjhMAZFvGab/dwZw2SSOv2rFiFo4NjuybdQrlNFtzkc
         2qyw==
X-Forwarded-Encrypted: i=1; AJvYcCUxd3rYYO4AFBnoirzONgmcXzuIhaiMYtfquJpF/AP8tF/Roc7RSxDD1cz47XCP/1KEAQLoaV++2RhoXukLzmPH@lists.infradead.org
X-Gm-Message-State: AOJu0YwVFBwbF6VANfeuMTjSH/OBIGX/TLVN3BNrf9R0aqkXukqmhnV3
	VnQQBAm4c02sSSRH6Y4yaI+XmqwwVtSDUcUZ96ZWTafrQHXgn261bssV8v4k/uA0Wqs=
X-Gm-Gg: ASbGncuwwtehihLEEUraBbm5l5b2hcbTE6JZFw8OjLFIW2nQCEEXGO4GJgnTrYYNZ+v
	vixrGclWO9CZN63kka2Gz+sLZYP5TR6YjEOTuwqAlSAeARCVKbCt3vBHixt0gzPgvlnPeMtDypJ
	WNCUprop8e6Z0lSgZyPDY3B0ESDug/hewAvM3MaHMJDPEpNHQYY9dSp2YWaa/SjyUJ7G3kM6f+L
	ay9/IL44FWNLfulfadbUl8S9ZFkKdSfBl9nws/mz27oq8nMj+heNa09e9IfE/2gJKZWYH8rWW7q
	SZVXqHQ/ygLQH8BnFhmMGtuIBdIH2gxRRoK7f7KUFg06oM9FWlD/SxS7VFZ+SpGoK9cOcD4k4B9
	A/2MbYnFevARdKM6xO6pkQxzZqYNUUM5ZPWerYOXOOhouw9MmccQ6OU4Yohy9Uqnp5K8yxkcRAh
	rSlQfRxw==
X-Google-Smtp-Source: AGHT+IGK45Cu7R7RqMblJ0H20sOThyXTHE0mGsTieR9rpgEJC68Mu7KEhV/qc0jaopljgaHcbYAevQ==
X-Received: by 2002:a05:6000:428a:b0:428:3cd7:a336 with SMTP id ffacd0b85a97d-4283cd7a3a7mr11330553f8f.63.1761134639094;
        Wed, 22 Oct 2025 05:03:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a78csm25019851f8f.26.2025.10.22.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:03:58 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:05:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
Message-ID: <aPi6eBlFLH43A4C0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_050401_609651_82AA0C60 
X-CRM114-Status: GOOD (  11.16  )
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

The kernel implementation of snprintf() cannot return negative error
codes.  Also these particular calls to snprintf() can't return zero
and the code to handle a zero return is sort of questionable.  Just
delete this impossible code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..9b624948a572 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0


