Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83384C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU2N2JXGLPWImpT+BmMIzsUXEUu7RmoA8czJtXTqRmE=; b=suqsxOxElwiNaxAUM90TrdTKGD
	CsJ+ACJVhwpRJBJ7WrQsdoCsbRn9ORu80QbikzCZWNfqtT3/A4sVvA0uclOkv1bTe2LJ2/6t+8pXY
	nYkcTFx3K3aq070lr8/oECMSPgjHafgPw1ssRVlejGl/VIlOM1HrXxpVUPWmc1OzgahTdlGXGryb+
	7+c2mw3p+sm/nfy0OE6kr3h8oVqoLvCEeYdQfd+KlHjN7OQlqxr+V7do2MHLRoL/R2GyhmSCaYTiT
	UX3nA784weVAqOhfj/w33rvDmASOs7S8w3S8GfvbAJTt+uaw99XUl0O96FKFdi/055MlpIyslwV1W
	IPJ7EZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYbP-0000000GEXh-0GZn;
	Thu, 16 Jan 2025 22:44:39 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYYr-0000000GEBF-0zFG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:42:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737067317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU2N2JXGLPWImpT+BmMIzsUXEUu7RmoA8czJtXTqRmE=;
	b=XUK0fntHOipj9+BpcG1fwV18cGCbY7Crzq4SjXFl+VL/vNt/6v9xOrQFQ4vqEWaDiKEFZL
	ZdCwkDmHlrerjMhsM3FEKXCOaB6ck6VvA044bK8Dc4Bp6hSWAI0+t9GUg0JAhYR274eLsM
	it6dWctQOKECQtlfBKBKIwe4gRlBLQ8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/5] spi: zynqmp-gqspi: Reformat long line
Date: Thu, 16 Jan 2025 17:41:26 -0500
Message-Id: <20250116224130.2684544-2-sean.anderson@linux.dev>
In-Reply-To: <20250116224130.2684544-1-sean.anderson@linux.dev>
References: <20250116224130.2684544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144201_412993_C46A8900 
X-CRM114-Status: GOOD (  10.35  )
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

This long line is broken in an unusual place. Reformat it to better
match the kernel style.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 549a6e0c9654..0c3b3a16bb36 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1059,8 +1059,8 @@ static unsigned long zynqmp_qspi_timeout(struct zynqmp_qspi *xqspi, u8 bits,
 static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 			       const struct spi_mem_op *op)
 {
-	struct zynqmp_qspi *xqspi = spi_controller_get_devdata
-				    (mem->spi->controller);
+	struct zynqmp_qspi *xqspi =
+		spi_controller_get_devdata(mem->spi->controller);
 	unsigned long timeout;
 	int err = 0, i;
 	u32 genfifoentry = 0;
-- 
2.35.1.1320.gc452695387.dirty


