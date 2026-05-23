Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02033CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p5qBcxZqMKlPHWBrRqE7uc06B6ORR18pEXCvdSrRZEk=; b=YqVCfAU/1uU+pJFKGF5+oWbs5X
	KC9vv1TRZsZ2BmrF5XyI0Z0YI1rItxeer6baw0ulahMCpKvN5Ec2uMIhGS9PPC6SqA4LY/uFAF9mI
	J7e8zps4+FDgQmaAJJ48mogQA7Qg/6Vu2Xc86YsBEWjT8AIRYxTFzhh+wF81pccx5rmMomA/wKHzw
	5PYSyUxs6hOZYnF8RGBiL9gnEFV2usn3l5pJnsoNmFBac4F2Lw1CBiMWgvlZaOuqGKjuGHFaMy3+Q
	ekvAnt5inNrP8SUdAIDRXPBWsPPhDiMwObJPs25QQPDcHh4wnTcZKyKkjuknjYWqa/VCbwAGhFEvS
	YhDl8Mgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrdo-0000000DleQ-1H3o;
	Sat, 23 May 2026 19:04:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrdm-0000000Dlds-3Cwx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 19:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF3DC6001A;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 876E6C2BCB4;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779563044;
	bh=qKdKW12reljmkI9Y5GL96UhP5eGpAEu75do6kp2GrbQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ncgstb4+cU6Kr/5vk8rsYFyV4+Vp9eGMDxhnXQVVqjvXKekp7P5Mvrg2rKjmFIeM6
	 Wu7KH2kzMzCpMVfUG1Vvf81mVhWYdikI1QG/7SR1hByDyv8lAngLOlu7nqTTL7gx4b
	 MGWLaH6ZRhXxbVIKTFaYwkSxc0XfcMfPYp30s+Polf8A0ix9xeIHIxK5vZlU0dddMX
	 gBnz5J2FtdgQl7mMv9nA2wWJhyVB9C4vElAyGqIwnZQy7nAEjDEbGXhXD9gp4MINOk
	 VVDHAU8/uM8OwFnaOCmu0R6IMB0x9DmP0dRMRfKxgvSflDZJsHgQXKEjb1lVGupk/y
	 x0tJS52KuBE2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9A0CD5BB1;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
From: Demi Marie Obenour via B4 Relay <devnull+demiobenour.gmail.com@kernel.org>
Subject: [PATCH 0/2] Delete the Qualcomm crypto engine
Date: Sat, 23 May 2026 15:03:55 -0400
Message-Id: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNj3ZTUnNSSVN3C5FRdA2Mz4xQjo0QLU0szJaCGgqLUtMwKsGHRsbW
 1AAdO39VcAAAA
X-Change-ID: 20260523-delete-qce-0363d22a8596
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779563043; l=2071;
 i=demiobenour@gmail.com; s=20250731; h=from:subject:message-id;
 bh=qKdKW12reljmkI9Y5GL96UhP5eGpAEu75do6kp2GrbQ=;
 b=TtSJ+IKiIz4+J8ZUozDqY5sbAF3vqtXPpM9l1sFNxConO52NyijO6g3Vw49p+zAa/n1QHX5tt
 xTSDIB65+CJC+aZ2Q+K518avBn4FicGdDE2+6UFcs1UfpBdkIoLYdjs
X-Developer-Key: i=demiobenour@gmail.com; a=ed25519;
 pk=4iGY+ynEKxIfs+fIUK9EzsvZ44yGE0GvXLeLTPKKPhI=
X-Endpoint-Received: by B4 Relay for demiobenour@gmail.com/20250731 with
 auth_id=473
X-Original-From: Demi Marie Obenour <demiobenour@gmail.com>
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

The only realistic uses I can think of are:

1. Very weak devices where QCE is actually faster.
2. Devices without bitsliced NEON.

Do any such devices exist in the wild?  I have no idea.

Not even compile-tested, but should be trivial as it just deletes code.
I didn't change the device tree beyond marking the bindings as
deprecated.

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
Demi Marie Obenour (2):
      crypto: Delete Qualcomm crypto engine driver
      devicetree: Mark QCE bindings as deprecated

 .../devicetree/bindings/crypto/qcom-qce.yaml       |   3 +
 MAINTAINERS                                        |   8 -
 arch/arm/configs/multi_v7_defconfig                |   1 -
 arch/arm64/configs/defconfig                       |   1 -
 drivers/crypto/Kconfig                             | 111 ---
 drivers/crypto/Makefile                            |   1 -
 drivers/crypto/qce/Makefile                        |   9 -
 drivers/crypto/qce/aead.c                          | 841 ---------------------
 drivers/crypto/qce/aead.h                          |  56 --
 drivers/crypto/qce/cipher.h                        |  56 --
 drivers/crypto/qce/common.c                        | 595 ---------------
 drivers/crypto/qce/common.h                        | 104 ---
 drivers/crypto/qce/core.c                          | 271 -------
 drivers/crypto/qce/core.h                          |  64 --
 drivers/crypto/qce/dma.c                           | 135 ----
 drivers/crypto/qce/dma.h                           |  47 --
 drivers/crypto/qce/regs-v5.h                       | 326 --------
 drivers/crypto/qce/sha.c                           | 545 -------------
 drivers/crypto/qce/sha.h                           |  72 --
 drivers/crypto/qce/skcipher.c                      | 529 -------------
 20 files changed, 3 insertions(+), 3772 deletions(-)
---
base-commit: 49e05bb00f2e8168695f7af4d694c39e1423e8a2
change-id: 20260523-delete-qce-0363d22a8596

Best regards,
-- 
Demi Marie Obenour <demiobenour@gmail.com>



