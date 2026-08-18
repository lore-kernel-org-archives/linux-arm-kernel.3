Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E83C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jHhyJSui3i704cgzvhm4HDdluS0p3hdttBoRsE60vE=; b=yGGI7FeETHT35SegZ2Xz4jG+YO
	UUWrfwtDK/b9YRn/L80yl6X61VdzneUJq454RUn9vYJH5YNtyWvQO1S1mbJ48iiZHNQIB7ENpxoGV
	9bJZ+J1+NDBm1IHMS0uvBQ7weQWj4l8BXzaF9U6ni4douQ/aZXVf3mRfaPm5hT4nygbARcLkOCBQp
	hoal4HkTOx1JlXQs+EUvCNwNzve+GO7NPSXypiaFiyy4uUdfR2a2pOUXBPxswh6iz0vTbL+mEH8Tp
	oJuEahAXRSotppgDz3Y4mzwNtNAL2gdQNKV8Kv2GOjlciYySI/DPh95/e30nuJrFND1xrKKtNSoJX
	GhMM+xhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPB-00000008E3g-4B6v;
	Tue, 18 Aug 2026 15:07:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPA-00000008E3I-2ioM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 330564192E;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C01CC2BCF4;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787065628;
	bh=1EE9IJsz5rW59JTc+8Gbzasb4kXPgPy0MaTkkiCXn+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NrSAe/XS23jDuitV2fwXr6sOGiUI63PFhNUpl3uKtlRJrhyBHXFmnSIP2Dgjy+Qhq
	 y7w/pBs5ETs16DzR0z62ieysJundhvNdnTIrWcYj/cdmid5KfuDhBfJobkZwhycG4k
	 BFpr+LOiRu3cIcmgAGzQX0Lw0/yBs4Lte3euMnEgiIcAvHlEUb3sAxTvklQfp1YrZV
	 EffhsX7XC1MG9S7AMV9xsDJnZPOXMiu2kp7+yhcqIE6uRV1gUqVXjNcTRyNErCepxX
	 qngENrPoNBwdgI2jA11kO4lqGJE50p7g8kuV2RQl3nE8KX3MUkHK4dsqNmldHQclfP
	 8lDzRHMB+mzsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D694AC5DF7D;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 18 Aug 2026 16:05:42 +0100
Subject: [PATCH v2 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Exynos5515 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-for-next-lucky7-chipid-v2-1-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=HkPlddHKQwmqWY1ufNhu6MddjjvEqgdH7uQbcVq9NGo=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhHUY7ydlaLNNK0/u9GgxtdHJziy1rKsqJDZ6e
 CEaOqscgRGJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR1GAAKCRBJJwGyxHrX
 6yh2EACcHTH6X8Oxhu2iTKt+S/NSJkPZbr05I7QQwLnen0SomU4mSTbVSPFObCQKD4/J/oEiJ90
 yGGFaYKEG/ZECSrOIEFSNj6tfA+JuDkxV3Xikbj0HEDnSCQ1cNlk9JZJ3HBO1h/z/NKBUcPeQnc
 FV8zxiZ/va3xUT0s68afQY9ecQMV2xwzotSM9qS9tUx7AVkJvS6MciB7KC0dvadeB9PjGw4VplX
 D5SwECOHsZIOsgtJyrCDMgSvTx48fLCZflE1i9dUYKushaZPvMdAU4OU+0Qqz0Vfs+2Qs744zNn
 NResE0AA6KkEGh9XUhM0AYCoDtQ4rCjNy7hNnpIkMfI3yuG2g3DTkaMNf2Wm4V/1o6hqQOK1m9o
 MV8glC88kJlEZaVEP4MXGlRs3MbidYNjYlVJuT7BgQ2YfEnhBU6Vajm15kM2XUiXy3uNzVdXCXE
 vb/21em44JXEb8yl8OCBk0wmq+LyaSgL20BCyLsFakPKU2OFvy3LMLEdbt9xfkCB1cGwEGfZJlg
 0A1C5J/g5Hp9Ca4du6sTNkL3JJZvNpb9x0bDJPh1ROc6yyoNL0h5B39Ulw7dTIMhpgj68ppJzIY
 Y5ACoFYzawEm6mC5DMMF3l7dwpacBMNpBehwfQarzj6DXXpzx9i++C7frjN6lVbR/TVH/1cFFTk
 pM8PYmwr7jDa2mw==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add "samsung,exynos5515-chipid" compatible string to binding document,
which is fully compatible with "samsung,exynos850-chipid".

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index b9cdfe52b62f..619faf33214b 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos2200-chipid
+              - samsung,exynos5515-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
               - samsung,exynos9610-chipid

-- 
2.54.0



