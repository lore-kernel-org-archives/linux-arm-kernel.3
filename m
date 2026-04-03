Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D98E85388
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVYtRxV34Iio1lKJclt3W9SyO0u5u3hMq2Rbk8nszoM=; b=44ajlEh2rNv0vzQ2NO2CgwLeUh
	PxSfPRrNY/V/jzL2igw5XedvmpRDqGhOlABwIFjjE7IyOEkYt6L7Pamg9n9PQ22RbhO9DfOAsoBBP
	3apv4Wiu/+v7a1CeTnGJliqbyGocdLtMTtgOB3+gqJnOAigOfXwr6jZUn/STHOigNFc6lJ7yizZ0G
	F+6occPh2b1EbI3InvSjLsBTgoDbBpoclLSTNZhR2P95RQGJkt4qr4xZll3C+gwgsHG/huk6DBqx2
	zMukwjGMEm+Dbh2V2xPd8JE/4U3id77Y7n3g9Hu2OlSEC6caMQ+jD0XGDRF2gDAgp9SXWfq+qm9z5
	LfPgMVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0e-00000002Mnl-2V9o;
	Fri, 03 Apr 2026 17:08:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0c-00000002MlO-0000
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B3144526;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1F1DC19421;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236116;
	bh=qd97gSvYOsCinrKqjfSpyQyyC3+0l1mQqK8cxyagYwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EZtX1+FF2tGM6CRGb83ZYMsZrgEG6h47onkhhKC52alNGLQ2L6yBUoR8iMuKjs28/
	 CWbfzbkUzSauBqJG+7Cfs+LrupT0LFRpheDSSy6LY5WkDEwiT9KJMmShP6AtrtqBUw
	 npKabIadrXybvOatWRkeCsfjI3jhy68ZUAPRTDUNa8RlVZU2AH1ul/P4QkdN3U8C9m
	 F5b3kJKlOYVgIQrVB9vwceXRADeQYd0wM3eWvAZnUWis9qp0d28X2hO/B4xt8FTnFA
	 yBOxFetKufv9EkHn5nvj58ZsGcUYZ7DJKVD+BPgdLnXQm/OLcxgMtjPaRxnUpvYYnf
	 4kUnfePW7wxLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FF3E85385;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:30 +0200
Subject: [PATCH WIP v3 01/11] Input: stmfts - Fix the MODULE_LICENSE()
 string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-1-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=QDQEyb6yQN5WPWE8pVdtCQECptdn8p6xNSQzeqr7Q2U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QPfJpOVCbfnnCtwRQ25JsCdJwSaQ1DCEJ1z
 w4fa/zpwnGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 cq5mD/4yTLw1YnM4rI+iACitacCxgW0nmVtCq9jvEjg0eRc+Doih2LUZDIgT2hoGxStWlH9z3TU
 mTNEOe3T1xOHCG/tQHkqAb/IW9B/dKO7mjFFjCfCFKh8J2Z/kZz57hlSwJh8M79zezOCUPY+PHj
 vD8JoniSzdu2vjO3oV/UmglrT9BpZ3rOAQX1wOKkiVtyDj8P6p/a9wMY0yaJq3gqKMmj5TdC8NH
 h30Pbc2q2hcHmlew8HVX5uzH8CBqcE/M/0v/ngcqfha3mxPJ0GgelOsofM62TO75oH2vmyJtbdf
 6++KrthcQl0u0XtPs50kKUSBYgK1SlmFXJjTRVWvrlATqME7HKdlKLCWaZkHCFbCdg8xrIl2Snf
 +DFfqrCA338TmpVIiUG1MSvwSvkMGsvWfSMj5T3WSeSXyuLEX2N4Yq3qRStUGNavfKvDFdGQDRu
 h6yZUvoyQnaHkyt+wEs6qfpsCs1uN2yJeWMr/fKp6sKjmq9dIPiMN0yRl4lC/5eNIruMCZeCgFF
 dgfuqiMuZ0rEC8O9kWUshsp/XU0XBO6vYMunqsaLWp18/44ZdRKFLxpJfbb5GRolXc1cyqJiEX6
 HMFV1zfu1GqR7Xf+BDp8hQ0B/+qYoDM54sWZHsqyujpsQKaFJN7q03bEi+UWvjQD0dhl/okRJjp
 nD6jaImfTZCUfAw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100838_091412_A79E03CC 
X-CRM114-Status: GOOD (  12.59  )
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

From: David Heidelberg <david@ixit.cz>

Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
value does not declare the module's exact license, but only lets the
module loader test whether the module is Free Software or not.

See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
"GPL v2" bogosity") in the details of the issue. The fix is to use
"GPL" for all modules under any variant of the GPL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 8af87d0b6eb64..def6bd0c8e059 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -807,4 +807,4 @@ module_i2c_driver(stmfts_driver);
 
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
 MODULE_DESCRIPTION("STMicroelectronics FTS Touch Screen");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.53.0



