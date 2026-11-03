Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699B8606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iaZeCa1F;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=EKswpJjh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TaZ88bdbVZsQtosXQnNR3xMLn3i7UigiA3FkxA/swXE=; b=iaZeCa1FzSjmXw
	ndQ5RYgHwYuD6QNBC42NB5GZ9qcW+1FsUkhkO053renLxVU7KsHuwUgwV1Ylpby5qoKQ77PL9TC1Q
	9vzfrXd+1zs2oakJv2VxDtxNaOSXh9IDpslcwK4gyomKpYzz5gzoJAlvjT9rbx88Qj5pZGlMwBkX5
	XqaugqHW6Cu1lNRWlh+2zdIjjcNj3vTAHpZgQqiz1P6npfYDZFtSNaeObGlQstReoL0lRoQJMUa9z
	SnX432GqlLD5AtbXSIASoV6vskofm/6yV4YEaOzC9gmmopI+cXo3FkfVE5tpQWVJ3vTlfZBcbuGPW
	C7telwV3vscQBWdAi+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFCW-00000002gHS-0Qo6;
	Tue, 03 Nov 2026 14:09:24 +0000
Received: from inva129.nxp.com ([92.121.32.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFCT-00000002gGJ-1UEX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:09:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by inva129.nxp.com (Postfix) with ESMTP id 34A49600028F;
	Tue,  3 Nov 2026 15:09:18 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva129.nxp.com ([127.0.0.1])
 by localhost (inva129.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cHhj4KGFOqx; Tue,  3 Nov 2026 15:09:17 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva129.nxp.com (Postfix) with ESMTP id ABD8A600009F;
	Tue,  3 Nov 2026 15:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva129.nxp.com ABD8A600009F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1793714957;
	bh=TaZ88bdbVZsQtosXQnNR3xMLn3i7UigiA3FkxA/swXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKswpJjhgNOXT5IvZFhJxY9np0ncS5pcthx9z9kqnr4+MZ0EuEYijQxv3rimBO94i
	 B2QYjrnG73KmO3TBfRv+bAbjmg+vl3ynuHBX0Vdr5OfMG48HsfuYNbJnXWjgfLYGeW
	 5Zd7lePuxqtupmF1r79doOmYZiqRP+poE+TWGAAX21H9VjbfnvaXXUUDsAkpaDnS2I
	 gJyByDRfXFkYFUWNXiQ+L8Cs6w+Ven1GPZqSVa/6/yYHP/AiZLpE1EKPai28K3R5Wk
	 e6EFvwLw7UGI2LiD1U8GGwTQ7fAOyvGk+jmJGFQjLPBVP2edh6vMaQJq67VRjswOvW
	 wznbXOAYM7IzQ==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id CF663202AF;
	Tue,  3 Nov 2026 15:09:16 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 4/5] arm64: dts: s32n79-rdb: enable NETC IEP18
Date: Tue,  3 Nov 2026 16:09:10 +0200
Message-Id: <324f8f8178ed54e3b494a7f1b9d70acb0615ce35.1793712309.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793712309.git.claudiu.manoil@nxp.com>
References: <cover.1793712309.git.claudiu.manoil@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_060921_523134_023CF65A 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the NETC v4 ECAM bus #18 on the S32N79-RDB board so that the
ENETC v4 Pseudo-MAC port (PPM) PF and VF instances are probed.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v3: none
v2: none

 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258ef..897ba24ac03ae 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -68,3 +68,7 @@ &usdhc0 {
 	no-sdio;
 	status = "okay";
 };
+
+&netc_iep18 {
+	status = "okay";
+};
-- 
2.34.1


