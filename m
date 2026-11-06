Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E32606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N1Qj+hef;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cBjS1ii8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4NYaYldbirPssRZVT+OAgxyM3srfPHD9+pwWgKczAn8=; b=N1Qj+hefsh6fvyKMlDx73AQ+WB
	gUHrs1IufPCOo0rukQO9/BMe7bWBbfCRleGPWD5hKMRH4SgUz+617dkRGDXTZzss+wEIfrsPBPuKr
	qRfXwG+c7v/+cbCRwHRJITXApAZIllqg5krAz1IuUy1TtXX0L2d6WUFjjv/KB5SmBW+Km+/yT8UR1
	q7yZHdZJPqX83O3JQ28frT0KKoqnv9IrW38GfCCPOPygKI7TP4JzLo6kbtV74wqzhvNGcTwBFpz37
	ziGbZKQ4h14yOHF29uxz17INSBwrGnKtzBCSVgmsW9jtMCNO3CzEdH8gcXUvCEHdvp7vVkIDiG5Ff
	Pw9t7W1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDLw-0000000BLPX-0dq0;
	Fri, 06 Nov 2026 06:23:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDLt-0000000BLOa-0Spt;
	Fri, 06 Nov 2026 06:23:06 +0000
X-UUID: 85061402d9aa11f1acbe4559397dec65-20261105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4NYaYldbirPssRZVT+OAgxyM3srfPHD9+pwWgKczAn8=;
	b=cBjS1ii8wHzMfy5vpoRaW2+oYp77iwwOFV2s7TcFjeVZXov8ba1hW2Q5npatIQVcLxOKzqMyAJfT5MUcPwkBdxIdX0PBzPA2Olm+K1U6pB3FpXvhnPaSyTI/70nr+VEcCVEYWZjJARpKjHCTHUvre6/f+kUcE8eA/8EGXZsXxIU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f4fa7f2e-b14d-4baa-b484-c44f30640243,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a7accfdf-a34d-4b3e-8fda-dd691f9c4aa6,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85061402d9aa11f1acbe4559397dec65-20261105
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1732208811; Thu, 05 Nov 2026 23:23:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 14:22:59 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 14:22:58 +0800
From: Defa Li <defa.li@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <mingchang.jia@mediatek.com>,
	<yuhan.wei@mediatek.com>, <hao.lin@mediatek.com>, Defa Li
	<defa.li@mediatek.com>
Subject: [PATCH] i3c: master: Disable slave events before RSTDAA
Date: Fri, 6 Nov 2026 14:22:10 +0800
Message-ID: <20261106062236.564607-1-defa.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_222305_184498_485E0A5E 
X-CRM114-Status: GOOD (  10.95  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bus initialization sends RSTDAA before disabling slave events. A hot-join
or other slave event may occur after RSTDAA and interfere with the
following DISEC command or the remaining initialization.

Send broadcast DISEC before RSTDAA to disable SIR, master request, and
hot-join events before resetting dynamic addresses. This prevents slave
events from disrupting bus initialization.

Signed-off-by: Defa Li <defa.li@mediatek.com>
---
 drivers/i3c/master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 01e05bad8661..4fdc8f721364 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
-	 * Reset all dynamic address that may have been assigned before
-	 * (assigned by the bootloader for example).
+	 * Disable all slave events before starting DAA. When no active device
+	 * is on the bus, returns Mx error code M2, this error is ignored.
 	 */
-	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
+					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
+					   I3C_CCC_EVENT_HJ, true);
 	if (ret)
 		goto err_bus_cleanup;
 
@@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
-	 * Disable all slave events before starting DAA. When no active device
-	 * is on the bus, returns Mx error code M2, this error is ignored.
+	 * Reset all dynamic address that may have been assigned before
+	 * (assigned by the bootloader for example).
 	 */
-	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
-					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
-					   I3C_CCC_EVENT_HJ, true);
+	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
 	if (ret)
 		goto err_bus_cleanup;
 
-- 
2.43.0


