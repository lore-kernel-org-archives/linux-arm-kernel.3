Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD43EC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXqjLQdB/CoMuRR1aOwLEfFv4t1NiYQCsuxpxSLoiQc=; b=x1vSLmedR/SPbqqp7sH+aoCqqs
	DZFVDtGmh8AHvF1LLZCKjWZRzdTCGA6jCmJbXX/Z6a4s6CzYMtvOwG2KBBkQfMzhvPpxevuBzkAak
	hy41AKpljx43W/u/UE4GEc3fV4GpSM9RLy9L/ZK4hMq4cIxferwbEZNXISvw9MxYelh/lkmEfVIer
	Gq8nfPbQJQqEhKflY6yF/W/pZXfbk3vuvKmX1ez7aW3hwgKmH9zW4hmR29dp3PH8Y2G3e8fQS3Dzz
	N0/S3sZoICx7mFOPXYN2iRE7FCFME+6G7nNCKg05L1Nmj05Tg4U9GwaiOIpOiWaBURduN9FJpkBG8
	tJ5XXHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrp-0000000DdyX-0vad;
	Thu, 23 Jul 2026 07:29:17 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrZ-0000000Ddqv-0Vo7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:29:04 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXqjLQdB/CoMuRR1aOwLEfFv4t1NiYQCsuxpxSLoiQc=;
	b=2UvurZwEBzoIJOUcJbZATpImBaX2JRoSAuUKGCAFDQn1m+eusP07MLDd1bq2ZbY+bReYaw
	RC9O8IdxAZAwsa1gBHbB1SLKg2yIhUuD15GRWNMPPMYcCoh92JbfYh76V/pHqGEKdTxNum
	mT062GKIw6p2v6cUW8x6t4tK2nyNloCrRx737cDkpmbqxL6W/4pX+52WoHg9kzOQo3oBsP
	VKK6uN6FY66jyf/8LOtQOhRQdbwbLBDA5yjmntAFpfG3z9CCbx5RzCjzemTgScVcjPWBOJ
	OGky86yO1famtf8JZuqnYXnniuzZZBg3ghHp29KAIZ2Gc33nJo4y9OoNiPqjog==
Date: Thu, 23 Jul 2026 09:27:24 +0200
Subject: [PATCH v3 02/11] firmware: imx: ele: Fix indentation in
 ele_base_msg.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-2-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=DGqUdZlhyphs8hR0tjgBUY5tl6ldZ12TestuLL1xzXU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0Nblr/cGTfZxOWTF86uwamVEeUaAwcoVr+qUNr87s
 eGs3vzfHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABN5M5mRYcWj/wISfIXuepK1
 rzg6jCdXZLt+SNHatPxv3PGDm4M/MjMyXJOz9f+1bKXaozdMTF/bRJQCs7NNI4qrF16zK18w52s
 UKwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002901_738673_C2C08503 
X-CRM114-Status: UNSURE (   7.72  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The file uses mixed indentation characters. Use tabs everywhere.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 475074580dd7..5c128bf56e88 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -28,19 +28,19 @@
 #define ELE_GEN_KEY_BLOB_REQ		0xaf
 #define ELE_GET_FW_STATUS_REQ		0xc5
 #define ELE_XIP_DECRYPT_REQ		0xc6
-#define ELE_WRITE_FUSE                  0xd6
-#define ELE_DEV_ATTEST_REQ              0xdb
-#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
-#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+#define ELE_WRITE_FUSE			0xd6
+#define ELE_DEV_ATTEST_REQ		0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ	0xf2
+#define ELE_READ_SHADOW_FUSE_REQ	0xf3
 
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
 
-#define MAX_UID_SIZE                     (16)
-#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
-#define DEV_GETINFO_FW_SHA_SZ            (32)
-#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define MAX_UID_SIZE			(16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ	(32)
+#define DEV_GETINFO_FW_SHA_SZ		(32)
+#define DEV_GETINFO_OEM_SRKH_SZ		(64)
 #define DEV_GETINFO_MIN_VER_MASK	0xff
 #define DEV_GETINFO_MAJ_VER_MASK	0xff00
 #define ELE_DEV_INFO_EXTRA_SZ		0x60

-- 
2.55.0


