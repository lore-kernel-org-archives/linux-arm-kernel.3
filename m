Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBDACD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xTRJfMf2xCMRoFg3pDhuxXbQDbEEl//kUiBE/IfwhbE=; b=Uz7S30T9MqZITKSCwzdDkMOlHn
	SUhaDQyTpbHWObwOzvxKfWNLq8fyiqd5+5d2BWo+2W5mAEF+ZfZ54IOTeg6wAmXVb7s/ssMtUFaBm
	XWyDhRGGAZK0vAIC8QXEB0KpuloulB6QMI02WcJ7nGCA20sPiJk3e+a7lwy3Utv7IzbdkQ9lrtbNH
	ljTY4paEPjC351LKe4l/ks8nCoHaIC4RzKWG5/6rHDa6Vg3BD9YjQDJMZOaEweuJoQ/XdRhyMraF7
	4gUzWBvXNPQjOBNyrEqZrS8B1QFynYcoTQrDbv4m7jsO0eL6mC/PZzkd4peYtzYBqM1O1DG1pf+R9
	QBY9gkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbmo-00000006QVD-2fzG;
	Thu, 14 May 2026 19:31:58 +0000
Received: from cvsmtppost104.wmail.worksmobile.com ([125.209.209.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbmj-00000006QTS-3M2o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 19:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1778787110;
	bh=BrkiWYlXRuwCbsC4kJBtE8pYjnIvwC1tTPopuZzeBaU=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=UHTw4OSXVapxlj77y4OlnUMj4rXpn0G09GH/lGKK4o8bdVnTsHmSzbm40Ao/RpbpS
	 12GxKzXsdCTklN3UDrHjR+BhJdKc3s2HAre4P8usWqRQBr/Jd70RwJHLynBPHvsJzg
	 vIwRrjg1AcqwuqOAKTFyqIpjfOeJwK2ot77BT4qR5BoJ4SEylFb6tYjd7iYW5CCn1R
	 iQaQFQTkx5z9NxJrge4rs6pdkg7HFgNpPnfp8M+Fj0t9xO4aLDCjN0tV3qatTQlR15
	 Kgu0re7lr6XruD895cZtY7B//bw+ygS212yPVzuLhIuEmuH/1W188BYuKSLvCIsfvH
	 860oNKel8ocPA==
X-Originating-IP: 163.152.163.130
Received: from cvsendbo001.wmail ([10.113.20.163])
  by cvsmtppost104.wmail.worksmobile.com with ESMTP id FMdQb4MaQvGy89FA-tcyvw
  for <linux-arm-kernel@lists.infradead.org>;
  Thu, 14 May 2026 19:31:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1778787110;
	bh=BrkiWYlXRuwCbsC4kJBtE8pYjnIvwC1tTPopuZzeBaU=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=LCU8KKmqmoYTh6J+D5j4cAsDUs56Zf13FubjdDTHtYp4fRB4QbceUUltdwFjTmAjm
	 xQMibhLIV9T9KF+TfdfpbNxQkISEppCRK8zQhe3gBvj3ys3B3BRKxH+0FD4p358AVX
	 nfkmdCmcaXQbY31DqBpHbkGDC7Buhl5ROBZmlN7w=
X-Session-ID: kofb2z09QhisUCsQXLddww
X-Originating-IP: 163.152.163.130
X-Works-Send-Opt: penljAIYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: AZK9Fq2XFqJZ+HmmKxbd+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp401.gwmail.worksmobile.com with ESMTP id kofb2z09QhisUCsQXLddww
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 14 May 2026 19:31:50 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
Date: Fri, 15 May 2026 04:31:48 +0900
Message-Id: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_123154_108769_D4B5C8AF 
X-CRM114-Status: GOOD (  12.40  )
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

media_entity_remote_source_pad_unique() returns either a valid struct
media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
therefore never triggers, and the "pad not connected" error path is
unreachable.

Replace the NULL check with an IS_ERR() check so the validation
actually detects malformed media graphs.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9f..91e9fa0341e06 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.34.1


