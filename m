Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52917CD5BC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hobewMbUUtq8nnlOW0e27euqbld+fnK4cYgkDzvSxAo=; b=zY5GgLkq4DK/mVBGaXMAZCjro2
	Rw4MSzJPs4IZCgtgG7BxMf6derluLRnZe6RBf57ba4cnPfgKcdbI3A/oi++AnUiYCflxB3Ffo+beS
	lmNp6UnVotiP9OYkHBFWYqkGJFu03X+zKPev3KubkXR8jBfP80z0xWiyZZ2G98Fbvla9kmS16eCdh
	1KkhpJiNouGpbeItaEKGkcA3Fev2+fvKOTToxZIMBU3BsYir47uOQDmyJLOVGhXmtb5RPZD5j/eDV
	1jQfMIUc3StXFNYl9nm+xg7wc9Ud5ezfBHRQ+jbFo1hQGk9Si0lQChKJUDW7rrieYJLXhbEPr+xEG
	ahgLXGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrds-0000000Dlfe-1sOc;
	Sat, 23 May 2026 19:04:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrdn-0000000Dldl-0mP1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 19:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1A4F44419;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1EE7C2BCC6;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779563044;
	bh=2SS07pcThfNT1tSaEjda22uwutm2wospJQwzUhdmOBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AOLantyx44Tvmr2p/dvDDJ06EAAhkd5EeYQBxCkrRQ9m0xOm4GcCwybmlZdCJq+Q8
	 dqO+5dyhF1fZAvZNzgfdzK3QePjGmAEro6/l+mOOKGu/IFUJcdYTheI3Y7olKXELbd
	 vuBhRdFQXHwCpklmoiHpfkAsgI3J3nOAk2QhWMMgJlEzNin3hqr2+cixXg5giyBRiq
	 IKFvpX3BAPwpchEBFg/2Zyuet1Kj4Pz8UTzswH0D4EWlcX3rPVsBbwTN7qxEdHGvV6
	 RwccLENMhH3yJmPQSMV8sTm4pzM0IG0mUNmUVM1qqUTld1fxAdjBz9IoLMgPTi1jhw
	 KSsf0ZsWahz5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4959CD5BC6;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
From: Demi Marie Obenour via B4 Relay <devnull+demiobenour.gmail.com@kernel.org>
Date: Sat, 23 May 2026 15:03:57 -0400
Subject: [PATCH 2/2] devicetree: Mark QCE bindings as deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-delete-qce-v1-2-86105cd7f406@gmail.com>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
In-Reply-To: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Demi Marie Obenour <demiobenour@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779563043; l=938;
 i=demiobenour@gmail.com; s=20250731; h=from:subject:message-id;
 bh=UpFD3AMMc7/LD9RiWL4w2/RMipvwMvRcG8UHGJEaez0=;
 b=yo8EFawzIu9uowTwT6gx7418eSwz8NdE8eaN4nlUmJi9nZT0Xb5dT6bfPYa7PttwabD5CoOZk
 jPDSEapbCQmAEMcriUpUZqZEojgTId9Zs1zk5AxN8mRKDz79OkI9g2t
X-Developer-Key: i=demiobenour@gmail.com; a=ed25519;
 pk=4iGY+ynEKxIfs+fIUK9EzsvZ44yGE0GvXLeLTPKKPhI=
X-Endpoint-Received: by B4 Relay for demiobenour@gmail.com/20250731 with
 auth_id=473
X-Original-From: Demi Marie Obenour <demiobenour@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_120407_256842_B7A7B1CB 
X-CRM114-Status: UNSURE (   8.95  )
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
Reply-To: demiobenour@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Demi Marie Obenour <demiobenour@gmail.com>

They are no longer used by the kernel.  Keep them to avoid unnecessary
churn and because I know next to nothing about devicetree.

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 08febd66c22ba8220860f1a59403782d12f8531f..0f378073ddf550ff5954fbe169d5d262a4e46dcf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -14,6 +14,9 @@ description:
   This document defines the binding for the QCE crypto
   controller found on Qualcomm parts.
 
+  This driver is no longer used and so this binding only exists
+  for backwards compatibility.
+
 properties:
   compatible:
     oneOf:

-- 
2.54.0



