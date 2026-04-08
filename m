Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6768810FC45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVYtRxV34Iio1lKJclt3W9SyO0u5u3hMq2Rbk8nszoM=; b=bnO+M7qguEH4WOOmxHmmZ8fNBR
	5q1dm61/iQqeBt9JmvMh9kVksW0gg3Tdv2Lh6fdI/Kz3OLddQA2nxHhueyMtm8/juEAtuMV+fiRAI
	Grt5H3MM8zFg3sZQtnko65YR2LjLVZ71IgrwMW+ZhbmlN5+ZJ1+o+s8+bBeBscGMpE4/FyLk+Uhyz
	8mhZpk7GYL+pOWU6zmcbqLr1lqs/Xtqb/XDLxB6m9oItOh7dCBreTRVKt9kBqzM/jWRXmmMCuh4yF
	arRdfXkWcPl2R+Q8DqZMko35AdY3UD3YxWlcMfvAU70KwGVzNnlR/H3CtGQvCydPP6mSxBu2Re1v6
	amt3KuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBl-00000009TD4-0HZz;
	Wed, 08 Apr 2026 22:15:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBg-00000009T8W-0rdX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E407E443B6;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAD25C2BC9E;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=qd97gSvYOsCinrKqjfSpyQyyC3+0l1mQqK8cxyagYwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R+DqiOCSf/aujk+/xbB+PZWiT9ZtmXyhrGmTI4F61VWOZGE7VZjJVXcjpydhKEd0D
	 FSLTkselCkhjq7lzKIwFgqd5CiAJIu7gGpdo+1EVTI8BvvHp37HFMtEUXFWvgiUOp3
	 VqG5dIqLdQt8/4PyiI7R32P2G9iaVEGBD53noNcQJQtvdtzskzHnijw4trNfOs4Dp1
	 8Sc7swjiRZyguUUvPXSaJ2WOo+RQbJcyHVLsy0sWcEs27ZCuSYgGGZLgjiTFYo7GB1
	 wsoETo9MCIw+PICPnfSHRKQ9n4gyTnS9jeDo96pGtqwFc/yQVHhXGmbBeIRWiRwl2N
	 96BvZaXVUrdWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9761C10FC459;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:44 +0200
Subject: [PATCH v4 01/11] Input: stmfts - Fix the MODULE_LICENSE() string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-1-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tORTVIWUARSt+X8PEgpRWebBk61lkEJPfSUe
 Qn5hhASu4WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkQAKCRBgAj/E00kg
 cpLTEACo06/04dYc2te03+Sy7fTTeUeGNPVohJ8IYXHmRlzwNqxLbH3zEffYQo4ogIp4AzNTrdQ
 PQMBbB9CZKT8OJSWPojgGhodpGdwTQLAxShW6fr0vY14adVsuUUie7qLGvopPQRm1tYaA+uqxe9
 mr2M+ylz9qrFPPrJaogMehFSipIUAdMFb5MnqDFWA0NjEqZp1uGbHC4T1F65w+49RlzaBu7z1AC
 zDrENGQ3dmQS8uNxV5xr08qCHSJq9U3PqSR3fc5jsrqTzxoLA48AGBGsbBEsFUrvpI6kCt/XXFO
 UdGalj2w2HB2KHwaYeneO4KFu/mD3Fe2Ylme65GClsUAjmxyoWfTPgOltIpUXgdBV1il1iS/+22
 ixalfRz2aHIDZv6t2lGFPM8eNxL/RgaRygUjSu4kvSIXJnodGhIXXs/VsIX0bVPccnbOSL2Afwh
 pzurDOVnmHN1gJitTqPEbmY17fl4llN1pEpYqDCB09ZjMdg99pYvhQqgxDxq+mc+NuGeGvOMt8n
 KjRzDRDXQy02HnXXjyKPdVEBnt1oWpHNdvS/dDaZXkoXHbbVLrTLtD7iQnuT2DulPtl/Sxp9+r1
 RXOiG/xINI+Hwj/2Azta5YpuTyxQOfNwpZyr6Lt5fLSnNJOkVVt5xvrzx/cs1tiCsYIXjRdvM8k
 wl7YY81E8PSVRWA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151552_293372_7EAD2D95 
X-CRM114-Status: GOOD (  12.56  )
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



