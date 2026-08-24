Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6ABC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 22:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZbVphlX7nHILauFpZLGbnK6gFDl7ET10FXthNtKOgQY=; b=MHBnvRg3jguBA/
	Xh+31iYHJQ71LM5KkTz6J6B0ExW3Fx2WJIutLNeu2IEiHPTMMxG+5AKkIY3sf/ampCHM3btwwSUlm
	nl7Rz7Dja82LRdVRddorp1haUNFkjpHl37D9ZZjSs2eSK/nPwyfocTq2/9uzgfLjiMr8yCY7UJz6B
	dl59Jhm/4W+2uM6pMJgu+IZNNN9tyoWL51HuQsQRbk0SnVXlsmWiXTWdMud8PALXe83cJiyZSs+Jw
	h3Iyn+HvHCac10ZZk26qlrsIeRLBRNH3N6/CXy4ZeK9jnKcko0meHiAivymQtIIL7qDIs0rexCOwO
	+xoR6ZVF41mmzBr+vDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydVY-0000000HSvK-3haP;
	Mon, 24 Aug 2026 22:51:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydVW-0000000HSuq-3RKv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 22:51:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3095A6011F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 22:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85851F000E9;
	Mon, 24 Aug 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787611868;
	bh=ZbVphlX7nHILauFpZLGbnK6gFDl7ET10FXthNtKOgQY=;
	h=From:Subject:Date:To:Cc;
	b=Z6dW8C63FFhJUEn5aS/j4KPe/qVrzqv10yaFOcYsMwTz20Jl++0Q/00iHNfFcaxUQ
	 Vu1siwuBXSJ6JwxQJ/skJxSqrTpELIWrsfdnuW6k6C72NkmnvllljPdVVKWCTbr0eC
	 9kgOT6MP5v6vOJI7DGbj3wGbvvHB7Q22Qb3XcWmnIfIT7+42HJxPQt5R/D7TwKhTjG
	 6ASdX/Pzm6/czpW4T9AOGbeJB4QAfH7/g70QZJh4HkhlCpZi29ugmbq6k6FcNprOba
	 DPpBefYUzFRvAgIyD6jbGQDrfWqmH49JJLeGysvT5vF5xcCdG1wMiYZzkzfjqVZsGk
	 dzzqrENO+YHIg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] ARM: dts: ux500: Add the Imagis ISA1200 to Janice and
 Gavini
Date: Tue, 25 Aug 2026 00:51:02 +0200
Message-Id: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N5Bd3CL9ivSwmuw2h1rZtCKIf
 zf0NMwc5gCTpmLw6A5osqnpZ3EJtw7mV16qoLI7RIp3GmKPvz0RIX8NMzPqO1c1Rw3RM82lEA8
 pTJLAF2uTovt/Pz7P8wINsRL3bgAAAA==
X-Change-ID: 20260824-ux500-dts-add-imagis-img1200-0cff0d851be5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This adds the device tree entries for the newly merged ISA1200
to the Ux500 Janice and Gavini device trees.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      ARM: dts: ux500: Add the Imagis ISA to Janice DTS
      ARM: dts: ux500: Add the Imagis ISA to Gavini DTS

 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 56 ++++++++++++++++++++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 56 ++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)
---
base-commit: b6b019a1d9b90ac51174f0ca15b1338b61506bf9
change-id: 20260824-ux500-dts-add-imagis-img1200-0cff0d851be5

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


