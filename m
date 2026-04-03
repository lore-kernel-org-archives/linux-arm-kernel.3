Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CFBE8538B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtN1yjPtO1vtNZpAT1hGZ+43qCluHvFHFIqhxnfcaWU=; b=ZiKK8GRFZQjSJXos09FQaAIduX
	pkpLTtJqfuF5NHcl4zxfh2Ko2wyfHMNzLuYRMYvcLsVTgNtXjMt5y6br7JRWTfTwZTuCVeZaAaD6R
	U9ZzWhdRKWSg6U7xlwIbCAFHd/pQ+5xKZSsNqZDJTx9Ww0RevhIi25lWIAxoaxZHHzVMUWcVr5Pr0
	2Sj8CQawRmiJ6lLlxlcruKq/uE2vpuIwF1KEkW7jKNGHEMRcyJ9P6CSvZDZNbYxkyjN5Ckirk5do5
	Wz04HGv6tHj/EFC+Kvh8hjEPFo+WDIViqFeHC8AdLaEj/xSrnlvid4GKEGkEVnMcYqdhenlCKpYYw
	dFgAajDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0q-00000002N1m-31pf;
	Fri, 03 Apr 2026 17:08:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0m-00000002MxV-38CL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 17:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=CtN1yjPtO1vtNZpAT1hGZ+43qCluHvFHFIqhxnfcaWU=; b=k7hv8ZaEmHT22qA5LT+RJZyyR1
	wPf2LBK4oLri1J6VgO3SNhjDmE6sjsKCR4SN/FKwPrPIiCA7MJ5mE8DkP0TLaTWdsV05Ga5mj9PlF
	9QL1EGHKL4ThDS6OdJYad6mXt6PX4IvaEk3rKVAoxubdS4RO5GtyWcDwTBQTuli3lC/rgdYgU3TYF
	Hh6zyR6fnenjZLvOEOgJ69Ng4g9HZclH2nsBKx+O7yigFPiB82uXms2fE9Mo2/XTMy2b6xPj7yHMQ
	8kE2yU97KdAyl7Gj2F7//TBeSkW9+SuQMzT8YxCnmMHOBBTouosv6Z9/NaXx6F3XNrD2IKKC5xpbg
	q61WsMjQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0i-00000004Uk5-2968
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E019444579;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7D35C4CEF7;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=rKnHwYgLNi3sMebAsDDIpMCpmbnS/3URMebyTSVFWZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KUdvSzmc2KdFS/vapGWLhldul49tbG1X8VrpflhOl8CJ5l73H2d6q0oJRFbqRpxcP
	 JSq6LC83BMNyhPYeh6qL0bbw7EUjovIZ4xm6v6D4easReC21zNOJ48xuuoyVW3CWn+
	 sCNPMy5dV4j/lucnfZADBh8X98Lj2ALq5KG9mTwL0lPodqhI3OSRV5SeZjEhOCL+t2
	 qt/CYMHDsBv4xGmWMRxiHPp0aCg6515w24sGknLBu7A0MbT/vLdytWlGej0M7DOKrj
	 aoRW5sLcVaAigplIfs8CcaQQfNrwd4U5XLvndH+1qTlaOlwjqIbxeOrntV2lBFJgVK
	 PLVZ5SCO4mkDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63C7E85387;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:35 +0200
Subject: [PATCH WIP v3 06/11] Input: stmfts - use client to make future
 code cleaner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-6-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=lbYMNOyikKvzSOq1O72SDp83zLBiEDw5AionEdJRDJQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQADNC8bWKbBtksX+13HyaXLaUKZUVfxXHk
 07gDDNOQnGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cmJ+D/9IK24uy72rHSw+JqStVL356K7AGLtPpHDc95QFrDKE2f2kUT+x6P7o9SqSBP3I1N76QCD
 6yV7c32f1U/8vgx4zNLD4Z/3ncV94IaEAwfxLB5SiG2Hxe7NC4JQZAzTQCIBIfl3u8wlZFxqf1H
 uqfRt5Cu0hJDH1+51p/pvBrcIiAjdCd0zAKDO9tAk4HLkjTF9VJvgZF55DdNjWpZSeyv+ePxStR
 E4J1l7kvFvA2mOdFGhSQVlc5RGZjgHHRRIcPx5mUNk/nqqeTUBgNMGcnp9r/KTS/T0O4FqKkizw
 eLFz0q7mwyUfBhGKdC699DKtT4EwoLROVYBnzx2DvWjKfizwj4B8BRuR2/ULcVP0wh68zGBVg3c
 QtwgVIbgSKH0g9FKBVNDUxNT/WmTXzoPvuON8IhKMGOFAtBcuRJ3YyXrTvr/hMhKK5e10Gy6JJu
 VGzMtIsdysc4tjxbl2xGjR7XcxH/cJ4R/YdVoogMS1hBceSFnXYJJA/HpF+lVmeNvOJQeP2EAgY
 eGgxMZQG8fbvXLYwtDTbdUTlAExnFHsd1Ap/m9RochKmbCPILoxPmm9qcDE2o9BvwuPNJ8lbAhG
 da801WhDMPR1dUkdi8ANdK4IQHZxs+WDmQnBUfQ7G8s5hKPVI9gLbN0grqKm+agBqRZw8ZK+G7t
 KxJYscsQBkZfYKw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_180845_015912_609A512E 
X-CRM114-Status: GOOD (  10.49  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

Make code cleaner, compiler will optimize it away anyway.

Preparation for FTM5 support, where more steps are needed.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index a90528b76f52b..5f7de5e687da2 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -763,9 +763,10 @@ static int stmfts_runtime_suspend(struct device *dev)
 static int stmfts_runtime_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
+	struct i2c_client *client = sdata->client;
 	int ret;
 
-	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
+	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);
 	if (ret)
 		dev_err(dev, "failed to resume device: %d\n", ret);
 

-- 
2.53.0



