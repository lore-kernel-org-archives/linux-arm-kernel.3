Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B16C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=; b=flwPAT/NHPKxMR0/vm5q768wBp
	lm/IyZKcHHEfV3J5nvZxOy404fJpMrWDmX4Q2Zwz4Y8fT6IJjx9dqckIvwaCjakuRjJruCwfakBvL
	E7iacSx/g4lIKw8p8KGimAgCZJNC13E0LHBjk91JfELHq11xA50ExEB+Rvj4X7WJww1GJMG0IBHr6
	Jq3/++zbXZwHaIauWg+vBqHk5skT4rOpyNxoMI67PMmG7g9X9m24D9xNIhJ+aAf06ryPsEirmAqvL
	MT0YUNAR9gr42kepMjJ+JEaVII2YF2TfA9+NF9ZIDsvpQ3mJXUGKMkAbVu4PFs9hVLtNuo6qfWqbv
	QsV2Tycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwTB-0000000HJA5-3FUQ;
	Sat, 22 Mar 2025 10:52:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwRV-0000000HJ1J-44OA;
	Sat, 22 Mar 2025 10:51:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2335031f8f.2;
        Sat, 22 Mar 2025 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742640663; x=1743245463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=;
        b=hykkdfG41seFVUA0d4vGvikZZLZzVr1PbotrWfnopCxZP4TXkin6b7DQSMm7xyUkFE
         nKgUR9PN10EehO4efDf/37V6F9KR/ORqgoIHob3y89lRstKMuUzEw+txc7sntL7X5+ut
         lM2ta8IQdR79h5cNQ6NYqGL+R4KWLputccpvMx3StzwSuKMGoIStr1v6cbqKYRM42jy+
         CIoytI6HZdet/qrriLp5cJWDmEd/sUpg2wpOWXJ9lBZvvpornwnCD/XWy2kwGWt6GQL0
         ubXQWbFJMR/xTBgTKs9NvCO39AzxgIh3XgRqELDLWNkdMpqf0NLv78ecW3jUejqxKieK
         QCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742640663; x=1743245463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=;
        b=Jyk1G6m6gHT/GrSomzeWxS9TE57T27zhwrJVKgFMmhoQd0weY3Fh7+l/xINSKPFmPy
         t3GdrTX0f+38Y11/A7UyyX0gy6aA/jbhsYBY86m4uKRAe4ux4Z5tu34Qb5kVEpbk3v8v
         0T0YusEiM562r2j8ERpJs8FhZ+etrBUdZg9UvFIlPiPLplRH1O5kdopfrqRknAUxVOyA
         KSfjLyAY04AACLvhcM1Gl/rLEvwox9AK+OSMxQWAFQtVprCtKRVuknDKInC59zXgD+WD
         JddvQgsKeLYQJ/0ZyDYkYvuVdyf6tVxlb2xkeEGPG/ZovRhoFQXv515/9xsGTJsDleYO
         SUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Or9BQQM20aC6faaYN1Ug8u3xlMtOA7qQW87obhrBSv+x0hUtce4TE4FO9ohtntA6Rnw/scFTVu/nf9L9yuRb@lists.infradead.org, AJvYcCWWhhKXnHUGX8HNQ1zNx0dlwUbaIxlAipyabSo32FIQqbFOxTJnhOKNq6tJaXbHu0t9ARH/9hSYpKvuvm2DeeM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDm1quVAy+QJHRmRAkegOlhdELLRKOFo4jALp98WO9zdx4cV7a
	G0CTWrHvs+/aMATyAI3n/ihoWIr15tmXnmpaUqMx/uO/zZRyQeL4
X-Gm-Gg: ASbGncuGQP78Gj+cRiqtvr7dBdLsUOFXfk3H7FYLQGfS8JsoGcSuWVWsaH8HLnZ2i69
	zJYT9binTUPWOlUmekTYT4n8MKVD7vuwYzr3zNz/UIQJoUyzw2cusRoY8gzw+Flaw1b98g2/RFr
	CjUr1eyhgk7mzycGJtdDqDqeuBT61FNoal6XxEjYfKd3Xm4L3dmIVnA7uOrMbj9M3BiRv99zzlO
	2ZgIZNbvOuoBTrfDLDwZxYBKySAgEpOAAu/uVzbtBVjo9ITYMjk+kc9cEJRMMEadQMadf4wzSaO
	P2resWa6gRnC3lFtPrkaZHHMTStJlcOfe64ZFHOyhu9O4Q==
X-Google-Smtp-Source: AGHT+IEEaToUvEuqHUrucs2Mab5X6FQNEQACh4ItoD1rm1rGxrSkcKlwnmFnT1AV+XPhtU7H5TrVBg==
X-Received: by 2002:a5d:47a2:0:b0:391:47d8:de25 with SMTP id ffacd0b85a97d-3997f937634mr5851686f8f.41.1742640663277;
        Sat, 22 Mar 2025 03:51:03 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:924e:a190:c73a:b6bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efe61sm4906161f8f.97.2025.03.22.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 03:51:02 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: avoid NULL pointer dereference in mt7996_set_monitor()
Date: Sat, 22 Mar 2025 10:50:52 +0000
Message-Id: <20250322105052.19136-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_035106_006789_405136E8 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

The function mt7996_set_monitor() dereferences phy before 
the NULL sanity check.

Fix this to avoid NULL pointer dereference by moving the 
dereference after the check.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..66575698aef1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -414,11 +414,13 @@ static void mt7996_phy_set_rxfilter(struct mt7996_phy *phy)
 
 static void mt7996_set_monitor(struct mt7996_phy *phy, bool enabled)
 {
-	struct mt7996_dev *dev = phy->dev;
+	struct mt7996_dev *dev;
 
 	if (!phy)
 		return;
 
+	dev = phy->dev;
+	
 	if (enabled == !(phy->rxfilter & MT_WF_RFCR_DROP_OTHER_UC))
 		return;
 
-- 
2.39.5


