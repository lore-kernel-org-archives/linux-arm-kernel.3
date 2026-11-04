Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835836078963
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PVepguhr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hlal74QU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fh+ACEbd+2yeqgDmFjxeuuMrHA8VR1p1REYatt8k/fk=; b=PVepguhryzPd/nGTbOR649FWHj
	US0XTfrXcnyF/G10VU0Ry7KMU7mBmC7EkmugGfXbRYWCXkIoaJ1jRDEGapf6lhkyYIELAN/GWvYOB
	SC78J6wSwXSkX4MHW1Lm6GUHF4F4FupYCJG6tjlyA3VMYDbBPHLUBRzoOMXcS+UZG29KTdAUxbCun
	s3CqfEla4UEMe9fsGOpB7naudahNB1FQTsFifgQVXeC7Z1MC0f2qyAhtwH7xcMf4vojtxH7qcswxr
	x5p+GtULLYRfwX5ZhLfMrtBFOauFO/Vp0IbiMqBgM0ID5kZfqaFXhuPtreYkDc/KOZ8brC5an8lgv
	oZUxrZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi5M-00000006y1c-3RVv;
	Wed, 04 Nov 2026 20:59:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi5L-00000006y11-22kM;
	Wed, 04 Nov 2026 20:59:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D670540AD7;
	Wed,  4 Nov 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793825994;
	b=ny8UvKePUlDuRas6KfKrnZSG/QsMsc4JE3XLsehSh0bwlsEGfgvUFiJJRLu7Nn9chMLY
	 AFvRhH65ft+S66m5drrGLMcYSh3IyK7O9nHL8S1Sqyzsh5FuHHKgccMBDTaylQ6pY7qx0
	 /BRIOtyIjxAFFM/rRy+Z04GHUglFYIaTC0MnwPWkkA4TcOa1jFu92+Bf0JlsCLttdUxxm
	 uCt8gCLsQOF8c7flcZCFo5bMs02HQooF/xAtqXEqQMLosE2DwN4I0VUdB/tpChrxaIQia
	 NuneMqW3crqL1LizDONP3rJo5blWxvQ6vLilg7Kyy2uxJGHVm5mQzmljrhHAziWkzKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825994;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fh+ACEbd+2yeqgDmFjxeuuMrHA8VR1p1REYatt8k/fk=;
	b=f3wo9hFAfKrWtW0GgET+AjitzL/nR6NpYCuSE3086cUGwhzb8/bVojvNSxvJt+Z5ksyY
	 /Xe+gJUDXXgwgeoJt4o56iZP0PpW6Qpwlw6N6ZgDcs3m2Rs/Xna/5K0pJ/oEaRwzstjtZ
	 fesgrdZouopiyPT76+NQF7QSwvJkfEmfROxo6BLY0NBmPZ+mf05XHtNuF2fNABpoTJT1q
	 dlctQgOllwbLO46eXoGPBaqt3UnMFVBrnCm+4zFy6YV4C1WYzJJJUlOiVwGAxh1z4b8CT
	 BH5r8DL+PXYnSMshn8CxQ7/c8aqspJfLtxNzFzpYUzEVI0Oax+QAWRBh3r5LIOumPtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AEDD1F00A16;
	Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825994;
	bh=Fh+ACEbd+2yeqgDmFjxeuuMrHA8VR1p1REYatt8k/fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Hlal74QUViW87iAGXgcmurXWwPs0nti1LkIq/p6fVgaNSByc1tw6UoW/WAv0hA/bJ
	 H1cPpsjcaSNV8GvYQBzO2CEIAWCR9hU22q6bw+bumJ351Fb1b0HwshYBjpLFzgfueL
	 41D03cNK08L6YVEEMHFwg815YXfX8RIzQVAjFeIKcbKWtsRpxEuiRLVI/O29z8N8TL
	 XyWEQz0njgKY8zfLl3/sFZWiJMYW7uxJ3CzvX2bYUiWd2w1wKbhXkpCehu9eTG2pKq
	 F+Hxrp+nNf9UJz8XJ9/QC0g2YoMSHnnA8lYiXjGUT7YO8MrhgYwtSJ317TKyDjUPxK
	 QlPHnuje1O5FA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D0D0646FA5;
	Wed,  4 Nov 2026 20:59:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 21:59:21 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi
 M6V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-nanopi-m6v2-v2-1-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793825992; l=1010;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=kMzMgde44rYz24ZMLHKoVZSaRZSmvu1GOyj3r3/eQTI=;
 b=F61jD7PkYeloWQ2Ucc5RhDzJjMpJAizwJBCvxrPVZlPen0NNLQEVy9sm5+85FT7QuNWDQO3W5
 g/DuJyGZNa6CPe9K7GHhAQCaGB0PsnFd2/9UWqwBejigJ7wo1bnzkTv
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add device tree binding documentation for FriendlyElec NanoPi M6V2,
a single-board computer based on the Rockchip RK3588S SoC. This board
is an updated version of the original M6 board with a few changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 456ad1c58e7f5..01a13aaf3e8fb 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -398,6 +398,7 @@ properties:
         items:
           - enum:
               - friendlyarm,nanopi-m6
+              - friendlyarm,nanopi-m6v2
               - friendlyarm,nanopi-r6c
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s

-- 
2.56.0



