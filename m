Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3D9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ELXcgf9+gtBvf/VOw7AkbYehc6e07lrij2CYQwQVr8=; b=vXLSP1OkXRLR37edrA7DH/QqRZ
	l2O0Te438ZmmFvlwlsFK8aHUkD+0shyGQWnBKscBOFCZ+T1EBZput2CScqUI2TXgtDwN6w7ODr/9C
	sh5m/FrxD5zhevxxZTVFOmQPB3eCyC/Hl+o9WOojuGC+Rqzqhp9rd9byVsfj3rDOmwaBZuX8aVRSQ
	Ui7sfAiCtc9rM/fpd4n4zd7s0F3oJo9CP9GyBTRw5HTm9z5wviveBvpmW6BFi4OX24K0iPnymjKHG
	Nftzb8wThNs+Bp8afxBUGoIGQXqE8Dl7wA9M/s32tnqtzmKOgBBMsDHNqPZpvvwn9PtTW+b0F0Woh
	MxYg9A2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Ir-00000004Mpx-0060;
	Fri, 13 Dec 2024 16:14:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Hm-00000004MhP-2Vbl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23661A42C3B;
	Fri, 13 Dec 2024 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1FE4C4CED0;
	Fri, 13 Dec 2024 16:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734106380;
	bh=kdhy92VFTEQXiuo32/qsaRnNKb4dWA/LMwOiSwmh7Os=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ndh8KagDiB1CW6XJ8O2sqCuLvOa0PEyAuR+65XShcsuqLEYnBVpMTGSwa7flczias
	 cR/3WpiKVPjyPhluTuf/WrZ8Wy1ergXuSWPmZa9h0MEvRJdmLCkaDKJ687yuJaJJtZ
	 Ry/5ZaYRpHpnat0oJtI7w8Nz/KK5j3n/eUNmoboS+1LrOycklMLDFpqIHsaz5e+OJX
	 ST+pwHsdigg5q3guwFvGIy0lFw6rrbZFkca+F0fZ+oADwkUzQl1J9YsljDtCO/b8Wp
	 qtuGQ32L4Md2c67lcZV98cxrZK0D6OLxhyp4y02TiBT76bggZAPi1SbOnBfqXIij8N
	 6xM8kGdo7wrHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6318E7717F;
	Fri, 13 Dec 2024 16:13:00 +0000 (UTC)
From: Ross Burton via B4 Relay <devnull+ross.burton.arm.com@kernel.org>
Date: Fri, 13 Dec 2024 16:12:58 +0000
Subject: [PATCH] arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
X-B4-Tracking: v=1; b=H4sIAAldXGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3eSc7NzE4pLUIl1TU4tU0xTzZEszs2QloPqCotS0zAqwWdGxtbU
 AZmVDoFsAAAA=
X-Change-ID: 20241213-clkmaster-558e5d7c966c
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ross Burton <ross.burton@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=ross.burton@arm.com; h=from:subject:message-id;
 bh=epENDaJFaEN+XJXFXZ723Iyyxb7oJBNFgTPKcQODkWo=;
 b=kA0DAAgBZItO7TOROJ0ByyZiAGdcXQvIqGC4hPhLJYfOvCIyA/T+rzDsNRxIyP39hHE1cxwB3
 IkCMwQAAQgAHRYhBIf9jOMBgVWcojlzDGSLTu0zkTidBQJnXF0LAAoJEGSLTu0zkTidtUUQALlI
 eHpo8h7c6m53q4NRc5Oca+Yj504O56wR7RfZApjR1hmzhklavRFuDBkfXtpYmoja3Mg73mN1cu0
 jhnHVRn8azedLxL5BQnh5UNa6ZH7voXrmeFyp+DrEPnozElBSlYilXvyfmj5sdkU7J/hxSiux8g
 Egyclnn6TYepZ+t59SajE3gmtQLj/Q731dS8B/7Tc/pr0dcxLxozTohv3o1Yl2c9vCK/r5AvgNy
 +t3Xm85Dc6JLnDgv00iR8a/FsbKC7N0/jcv0RwZZKfjAu8TFdSsZCM7ki/ppKRa9H9ZPQ4NLkgK
 YlnY3h9wtj5BI/cpDecn/X4cg5hln5RvjmAMRurk/zDwjekzmFUGCMV+UKdMT4FmWHcpvE0BWvx
 CNHLMb8Adu2wDe+1VYqJbZY1vHWUZSKNlbSb2AOEjaNf3K/jDiTEy6aaxAtuzipb2Hs/JvT/n20
 HM6i2Gy2tsvLsonwd/T2U8fDhAPOH2/nJEj5HjH+r/f6DnPn61Oqed1DR99GJtV7YwLVaClXa1J
 63WeHvvVi71mEaBpWSUV+QJo8Ygfq9AREPUZrTEGX8N9VadFUNIbvphZQnoUKA0ScHeIqS73ml9
 qfNGVimrwZc5Mz+2Itqrq1k2paKu8CESgrbgSP5O78mlsuTpXIjZN/W/eyWv3A7hkzTGItFsU2N
 6VWsg
X-Developer-Key: i=ross.burton@arm.com; a=openpgp;
 fpr=87FD8CE30181559CA239730C648B4EED3391389D
X-Endpoint-Received: by B4 Relay for ross.burton@arm.com/default with
 auth_id=59
X-Original-From: Ross Burton <ross.burton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_081302_770768_141E03B9 
X-CRM114-Status: UNSURE (   8.82  )
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
Reply-To: ross.burton@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ross Burton <ross.burton@arm.com>

This option was removed from the Kconfig in commit 802b83205519 ("clk:
qcom: fold dispcc-sm8650 info dispcc-sm8550") but it was not removed
from the defconfig.

Fixes: 802b83205519 ("clk: qcom: fold dispcc-sm8650 info dispcc-sm8550")
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e6158633f07c1f3532fba62f09b31e7448..c6d6a31a8f48c7ce9c9ca74e29db3b8835bfd556 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1352,7 +1352,6 @@ CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
-CONFIG_SM_DISPCC_8650=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y

---
base-commit: 231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
change-id: 20241213-clkmaster-558e5d7c966c

Best regards,
-- 
Ross Burton <ross.burton@arm.com>



