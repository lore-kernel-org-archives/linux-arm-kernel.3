Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BDFCDB476
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH6XOXaUkoXBybFA1DnjFzkAgNaIfL+d8sfDFTGpe2A=; b=XvBpcLgBunMFdeMcdxb15XSr7b
	qdQFUMsvowhZ9Ju2HjvqGr8gyjxrJ2d/uMKJlMxzs385dYOOFkBAmoTo/y5K7swewndyZai7+9ClM
	BzWs4XsEc1j1HSu9VqLIqcULZiAmPHXrU+HSliFGGZ6wlZMMS1n8CmJRKnpgCpLDIqKvXfU9DwtGf
	FWvTsvzWYmyQddy8lW+TfDI8eRdmqt0TrpaNgMQVoueywDRlQW5hHIZDG2SvS70uoRw8UDdvFTSg2
	i0KtRgZVZG4+kVV1lwiaDYAeFrRUP80udreL/AR4ovN+nkOmxBT/8mPozKDJPozh0Vk2UaOGfcYdk
	froEC2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQp-00000005VSX-1siU;
	Tue, 23 Jun 2026 00:56:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQm-00000005VNK-489G;
	Tue, 23 Jun 2026 00:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1669244605;
	Tue, 23 Jun 2026 00:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1945C4AF52;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=1g64L8/SrBqId9q3KIZ6p2+e6E7DhsIhWfkLiC3FzPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nRMSK61RV5rGq6Q1ITpoA4Bx2Mp56Ze7MOzlYXpNK69SlgJPGtulCP1wBue/SB0oM
	 6LD6sCclYSvM+MljLSuhl+h2jvMxLLl+N0w8u0B8r9gZd83A4pD49TEXneizsm1F9T
	 3pjxJ7k4foNorxLzGW9g8fEe0CSQFBhrFJ5Yyad1yexNcVa6WMWUOQ294lzvRt1KSb
	 yTlJca2VJpc09kjIkupZAkdil8GfFGpcN2opKfF4RJzvxwsB1gDzGIgiJzgEKOxC/4
	 cSEVgwpdCor+hRaOTDSxxkUnu8txfvuDicOOSYuUv+Ll8zvxufkEEo4HLTa75AsPd0
	 E/erRaj5AtjdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970BECDB46F;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:29 -0400
Subject: [PATCH 8/8] arm64: defconfig: Add SM8450 camcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-8-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=617;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=tJTk/lG/kNTnUjOLpx+gWVzUbilr34jSWya5odqqhqs=;
 b=qSquq9luNtdbeWsRumnnqskxOKb6XsFmPQk/wqQyMxMqshJHpQq5fAYeBMGjGEGP/BW3Zq/30
 KQKqkVP7EE1BbZmsUl2lhoH3RDA25jfGC+mzxoned9J0JrGpVs7snP3
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

Add SM8450 camcc as a module since it's enabled in SM8450 dtsi.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..8c50c16ee0b8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1541,6 +1541,7 @@ CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_6350=m
 CONFIG_SM_CAMCC_MILOS=m
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_CAMCC_8450=m
 CONFIG_SM_CAMCC_8550=m
 CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_CAMCC_8750=m

-- 
2.54.0



