Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7196FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9S606ivdk88pKEWaj7Kpt7XGN1MosTx0xtmJbQ+tj1Q=; b=OxXsM4n8FzHsdS0W9AF1HwYkJb
	h6X7TzQKnf0XP2f745DZp1UkqzC7QnBJamU8xOr6XyyioN79fCTdwhcRUhs3gDyTuiIyr4ofS/C8v
	eEXs2eKZQaVKQAhPp770TIATP7HBPRfdpwhmRsgxb3cebP9w8siERuukDsl0pogOlgCfoLnxHJ2gf
	u8pVUq4tvs/9AuRA6ZdRLeDL5ACsJ3Mk/2SaGoNZxIrpJy+eqGvcM7kYQ6LMELGf2I51WHC6U6ywb
	749VGsKx7gOMdm3o8n+2eR9Sh4CvtdM9RWvW7NriPEKGiRm72b71kQdqdp4sSPB+aUl7qcBX08vEX
	JK/Z2Nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z45-0000000EbQR-1UEk;
	Thu, 24 Apr 2025 16:04:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wN9-0000000E9WB-0OoO;
	Thu, 24 Apr 2025 13:12:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso7065765e9.0;
        Thu, 24 Apr 2025 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745500329; x=1746105129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9S606ivdk88pKEWaj7Kpt7XGN1MosTx0xtmJbQ+tj1Q=;
        b=Csd8vnnbf4feG53lhZJE06um3oL7Uuf9BK61G2gijNNcjeW+I2iQIre5rgvVMhYlq3
         VXAneJk5VRWStqwgejc1lO1SSw+dg08l/Yc3UcrRveOF84jCnV7+C3k4FA1SLolVh55U
         XHgzGf/PZYfJvonj+ub5avd9Lh9NGd0aNuTvXyPjn3llqQIbIoqdx/dQxx8+85OND51y
         6+G64v4ZRkI1K2f/36cIRnt1bNWWakZLJWs5J03jgmO05gCXSld2Qw6jA/AOsV+7wZxx
         QG8GCpdNG/1aAcBvwXJ2WO9/pPHWQE08HQnkmLuufVxo0mgl5So5wVzk0BIduLissy8K
         ObnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500329; x=1746105129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S606ivdk88pKEWaj7Kpt7XGN1MosTx0xtmJbQ+tj1Q=;
        b=iBczjis3bSlMqVwLFFx6hlwGZLVfXyPHGbDe8+6BkFW/nHzKPsHmf/GY4DIUCS1ibS
         aYinxKkPLaPHCcHCNkqQivV9h5DPjm6roGVByQz1fCVQpv0Zuac0ZpUiuA+BFBx1eoBg
         PFKT/rNUm88L+flkEyzG2hhmRyAScQC0LDfUMXQk1xCQKMTn23KLrUFPmU6RJEaNFRxe
         HWm4T804EMORo3dy+SOa9MoXDBg5j6oQh/SKuveAGlwQ9wiMdBnOrE1eDMI848aSZ2/h
         Fv5NcuZF7uVKdzjRSZr8PyDtzx+/U9m5Bp1kesEsJM4NZXqevXTZ9nPMZtNxtny55dzT
         kjew==
X-Forwarded-Encrypted: i=1; AJvYcCVD/dkgoaLCEmHmq/xn0icQOK6nThYxzaXKkPMBmfSLwzWjtn6nW3VEDONZx9UHfbtQa71NtzHSE+rBV1TevHn+@lists.infradead.org, AJvYcCVOhIXxgIBC4dBa1VqzW3zpS7nkZB6pvaM/BMmYir6kjT8qyTa+VY3KHhhCUm8wRx2dHjecW4YL0IRhTyDMYUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJjnh5Q7RjVGF2LBUh7xJTpvGY28QHLoDOAn2MeDmlej5dk+ne
	cxKWsr3M1RHHBoRG/dQNYenDNB94lxJ0PF84llAOPqc87sjaq+Q+
X-Gm-Gg: ASbGnctWt/WI/c2Qm7ouj5xmbQn2J30Tx6ApWuyEP7Eq98zZ50qhnsqpZA57mx30PvI
	gmlpRxrSErf98n0Ea0amesd7s4EP4sTPENbR39ZI7k24t7p6docExbcnuk7boUQ4uwdYOF7CUpJ
	b+A9BTY/sUukVg673FdAoiYjJFIr3U6le6uqW4Q1c4q34GvZxWumvCmG8h6C+6m//Mz31p2NRXb
	SO2/bVi1wIKf+Hzx43UY4tFzSuJ95K2YwBlR5mbF+BZq1572zwSBI2Hn3O2FFcYB9ueAzZlHx1U
	UjKNtml1mhVZD2GqYyJGGxMooDf2kDEv7YNo8WHYPg==
X-Google-Smtp-Source: AGHT+IH0jSQHUGWaZfvxTiF+/uEGoyp/1xBue+C21lwbotQk56PUX5CrmPAC7ibihDDtERNxvnwjkQ==
X-Received: by 2002:a05:600c:5007:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4409bda56c9mr24344935e9.33.1745500328918;
        Thu, 24 Apr 2025 06:12:08 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a06d4be673sm2030014f8f.23.2025.04.24.06.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:12:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
Date: Thu, 24 Apr 2025 14:12:01 +0100
Message-ID: <20250424131201.157601-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_061211_129349_A35088F9 
X-CRM114-Status: GOOD (  12.82  )
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

The sizeof argument is incorrect when allocating pctl->eint->base, it
should be *pctl->eint->base. (Generally, the size of void * is the same
as void ** so nothing is breaking in this specific case). Fix this.

Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8596f3541265..4c2b72a3543a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1017,7 +1017,7 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 
 	pctl->eint->nbase = 1;
 	/* mtk-eint expects an array */
-	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
+	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(*pctl->eint->base), GFP_KERNEL);
 	if (!pctl->eint->base)
 		return -ENOMEM;
 
-- 
2.49.0


