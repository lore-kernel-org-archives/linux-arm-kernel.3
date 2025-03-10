Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A54C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=; b=1KDKG8oOJorBfYL65xk9lrqUsW
	mP/97TGRrqICJhERaYQtunanbx6KPEBm9DbJ65QmlIAkBDBBfqnDjK0ElOoV0ZFYGU14kjnWtaHtr
	vzdR2QHC5kD7PdFTrKsqeXIFbls7fwNH/MHBLozl1ie3L9ESABMwvkUcCmWnyq/ZZe0sjToH2fOPy
	9ALWvLIU6KFC48wWXNfBxdjOAoaVRHISGZgRhvQyxLroHKJcKykC7CQ5SoAbLrTwc8OL3fOSUJXKW
	CCKBi6nUSF9nSTSR04ZUkWF6l5u0XgUy7pZgsztE0DH0jbjHk/so6AgyQBxU86AeBBujQkILCKsD1
	Yr7bq91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trb6T-00000002OiS-2VDS;
	Mon, 10 Mar 2025 11:15:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tragT-00000002IzT-0w43
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:48:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43bdf0cbb6bso22595835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603711; x=1742208511; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=;
        b=IensH9ow62SsG71YlmazmZUBJ0s6P2573urRNA+4EfPnSWvdYB/7/wxSbjdnGwn2gU
         TaueRys7cKv/Tl5mwdtaEheTawOuNHcyJ1cBHM/s+e5jT+2r7dHJXVB2WpNOegF+oesd
         jbvjZyr8XNwWN1eyVHkpZHo+lGr1YhV4lcdY/wTLmim21OZBoKn7TcaapB1JASNuA4Vh
         u9d2OeVg6nC4+vgFDrH1Mk1juDEPtUH/5/vfqKxix+evb+4E8ahbQOWNGuIz2sywVTz4
         wmxN+205cyBd/PPUMtoPHLB/As355+j8giAQuzvCZD4BpO2Gf6PtLRASv8lfksRr4l25
         5eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603711; x=1742208511;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=;
        b=dQa1z8RASd/sew85iDmoHcF2yJFRNwMo7HL7He51o5ufSp9TYsjTWYdFHR5FE1zmUN
         zq4/SQJS3jNG31wdrfd+B8HMiTPqtyIv/pdcrsC2CJUKD6Y0tt5IXgVnfMgAWyH5csH+
         3WxHmJk+AagD4AHOkQRYrEZktIwx+eWl8lcW0wbY4yIvmzqwKMS/RCmdQ6xSAw7dOCqi
         VO98RBv9tdukjwFTQzwEWmobvgWncO7rJTlgb5eOnOBFwwWIgh61SHaUpYRIGn1VqutL
         CRuhCWlflcb725aN38kiK2WDM6BWR/Ocvoga3i3HUSMk+uHPYvm00p7zq31drv1nvuTS
         9BJg==
X-Forwarded-Encrypted: i=1; AJvYcCWqGbCGhO4uOnOqjuGdimrSQEKWtFLFkvBiVOzxQ5AG8u/rwxhMoMQGtLFUM1oDtfZWlTVoiYg1vBN6KVrJ1Imn@lists.infradead.org
X-Gm-Message-State: AOJu0YxYFFZIwQJWfSvC+fLlNX3PCbFyHEYKbYv05m4N0218uR3mafVy
	h9ZFCgKEblvfxvXynI9wrP7VfJN3rUUx9FpraQ97Ej/PEVOSpjd0rRh+kVtc7Pk=
X-Gm-Gg: ASbGnct8idw/R32kV8G/oAgiWNw/424iMYfLA3jYSVJJd1OIXfyMlfxuHKtK1Su2/Zy
	xgjAVQyc2iIqsQVWbvdjRgePNUBcC4Z8PchI/1ubzAkMPCQXqg4MVrugtM936XNLpPbvJG1ssWI
	8Qhzk6OLXxLrcTTCnWvUpF2TYl0EsVP4QHDezCYw7QzS2FyPxKVIpS8//Zhw+YdZRInLqMWSDdR
	w0L9oKS6tI3y2fM7zh6JB4bhl6oiGDFXXYvC6zx8JEd4gfwJrjLosIia1ESPN25TppFg4D/lcHv
	NhWFaGmCoE5vvLWmUhOTAro4q72rRPoCJLA2eOFYSZktCQkN3A==
X-Google-Smtp-Source: AGHT+IEvyQMgaUHnCuYCt+OpJiqkHIstn9Ui2odq4PjFQ9lNSszLbzPKWSr7S0YVwsCBZMsm/36JQg==
X-Received: by 2002:a05:600c:470d:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43cfab351c6mr15054385e9.16.1741603710881;
        Mon, 10 Mar 2025 03:48:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf27f8ef3sm45737585e9.11.2025.03.10.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:30 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034833_278109_8AF7ACCA 
X-CRM114-Status: GOOD (  12.36  )
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

This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
but there was typo and the | operation was missing and which turned
it into a no-op.

Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis, not tested.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 922330b3f4d7..9efef0e860da 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
 		case SPEED_100:
 			val |= MTK_QTX_SCH_MAX_RATE_EN |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
-			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
+			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
 			break;
 		case SPEED_1000:
-- 
2.47.2


