Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C2E66887
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 21:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=; b=tyEwZNq+BpRt+mcItrg6MY48jd
	W5FfeSeAJE219mz3KwaTd1G3MLUAIz1jkHSTnNTQYumeavLdvd4UC0+nOUDzLP7pqGz5EjenQ8lhN
	tXb5G5XHRl0DxXNUtqaIjwp4C7YYLGh1q1h03zYBwuVmjspwS1OXoRj5ikspaUbNGKEb7Putq3JZe
	bejubQnl9UFj6ta23CzHQLohig9EGKrlCe3qC5w2M3gjCzAyOmEB4TwbhscED/BCqktd/GTzgyK/7
	EaJljwmSfy+n0FwDSKAv5wVdiKTnY7ihb63KVYVEeNX65nA4lrxrW/ZCS1SpXlnvKkXxNbHm+tRlI
	5VPnM0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tExf5-00000004u8M-0wxq;
	Sat, 23 Nov 2024 21:27:27 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tExe8-00000004tz4-1m7E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 21:26:29 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-46375ac25fbso24488281cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 13:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732397187; x=1733001987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=EU23jtKhlXQWfK9qwzzCzGXdgFB2XUn+LU5kGXjfNaqb4z9hFKwVEmjsLIF3HUeAiY
         OHLGBAqtW6cr6zoFkE2pONriSXrdLmktVubqIclwC3XlkDZd3RHK3PjiMnvsBG7OUu7l
         mv3MGi4bBNjnsV6d7lteQ51wlcE2u5GelVxTdHWswGoqBPqb6cEFffafv9bm6I0/Uf+W
         +lDiAUodDQykDaZgclb/93ifwtBUF735Zx3hx9h7csHpKdn6AlFn9D9Iacx4tu2554Wc
         taRwFy7cmpSoy414/dG4KA67gVw+KkWNb+Z2SvsaqjiYQiTrc8M6sfyG43t+owKHSyhT
         a66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732397187; x=1733001987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=UTkih9dR+JT9GQMtiAzP2qyNJL0KbrGxuORRUlTuwQHRxMmlprkD8sec8BPMx5qEwM
         DIHDE86DDWCbyLPnvBxq3Sq+zodidMv3GLlaeBqRpSnIJzbZtyTZEMKfNDknpvX58Un7
         6HFE+6UWQa3fffoZW0yktyYjO0AscX1bc/OaoZgZFuI4TdWKaA4TCnSzqPhKyYnUN+2D
         bjreEKa4w+fIIs0u1XwnNHFbpCbFI0wl4hGLHp3clfvR5ZrxjmDbTNaQCCNrCr8pM8a2
         NmYG7/VwYgSmvYiyqGzcT9KWQeHC7e4ePvZS/vGwinMrmVavcNiKBu0VSES/cI3tSK3w
         6nBg==
X-Forwarded-Encrypted: i=1; AJvYcCXcVnBm3E236lRzEWia/SeSv26uySHVLhuVKFLHddOXG0fasIVSLZy0VeiO5mDclH+jh6u0Nj0SmM/n2nHb/7wa@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt7Xc0FlCh3WROj2uzfXPNOqcWNDk5yEOBxia6geo6KBAvXLla
	ApZNcEZ2NYhb83v2WHvnbNr0v7JuDBuT6spiT0E7vi9Vp7sNe8OZ
X-Gm-Gg: ASbGnctGuT8g68vnam9vnmVPJWM/ccUFSVJa1EOXBr9/0fJfYDsAfGCd6Wv/UaFp0mB
	G1SpHD2PhgLI14GWWcpBiyPj77M66K6Lp3FQ20+Eq3eeO7Vl4af9cdvYohF7t8Ke8KyR5/E4cN8
	WlkiJnB/C71lNsRR4jRcmnl4EjZMMN3cO29ZNRFgxHpNmgibhcrpk/+1qvlMn8GQ6o6q7UIvJM4
	giWtjmFufzzBhMkCXmfoXQR4Hp4UGzka6iua4bO5hSgJMtL4F/2XUlOZApEAScXUHPGbA4H
X-Google-Smtp-Source: AGHT+IG5PKwkaZdfHENRxLK17QUpoYrvU5jJ1tBVCBUSAkJvvZxzWp3amwDBrzNlQ0M668EVPCFsuA==
X-Received: by 2002:a05:622a:13c8:b0:460:ad75:300a with SMTP id d75a77b69052e-4653d620415mr115969591cf.37.1732397186893;
        Sat, 23 Nov 2024 13:26:26 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3d9c14sm27763811cf.15.2024.11.23.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:26:26 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/2] media: camif-core: Add check for clk_enable()
Date: Sat, 23 Nov 2024 21:26:23 +0000
Message-Id: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_132628_475878_6E6B1C02 
X-CRM114-Status: GOOD (  12.99  )
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index de6e8f151849..221e3c447f36 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -527,10 +527,19 @@ static void s3c_camif_remove(struct platform_device *pdev)
 static int s3c_camif_runtime_resume(struct device *dev)
 {
 	struct camif_dev *camif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(camif->clock[CLK_GATE]);
+	if (ret)
+		return ret;
 
-	clk_enable(camif->clock[CLK_GATE]);
 	/* null op on s3c244x */
-	clk_enable(camif->clock[CLK_CAM]);
+	ret = clk_enable(camif->clock[CLK_CAM]);
+	if (ret) {
+		clk_disable(camif->clock[CLK_GATE]);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


