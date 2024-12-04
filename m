Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9E6E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHiQbTEgmKH9YJvchoKzzeYkoYqclDUm2mUIjrd62W8=; b=wQBwR7zY3AKKZpVJIHZ1U8CHbY
	1jYp2mD23Vjvr7x3n67OIghLnBFMFk+WVmQeEvdUFq+taOODf/bGhfvCf1YofYZqmh7tChn+PpidI
	I2SSpURs6bKSuBAJ8uLWc6mMR6fX0zeh+ebE4vt/l70XMApCH/qH6cs0ONh7jEEU/wgFucDGv/P68
	TgLByMbEtqx63iJGYeQU2kLFb8OfAcJ3Bv9uSNLsryINuj59Vznlh4BqIcvJ3l/RSeadNvziZyOxg
	hRWpvRoR0OAF6FmAToN0E7dfD9DMRRYJzpexWnZSnpBVBm2u7PTExBkX9fqriBYzm7cS7Tq2ohWgr
	929EBA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs4z-0000000D9ql-1mld;
	Wed, 04 Dec 2024 16:18:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6pD-2Ejy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E25AA41A2A;
	Wed,  4 Dec 2024 16:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC34FC4CEDF;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328393;
	bh=HNblYFGy1Ig37KXJlD6WXui3N0XjQbqGnX6arBwFr9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Px9j/j1RYWiymXMQuwRWRP1t0khCqGyFfnLMx98swNGzusdiUxG+KZjFMP173VjxM
	 6DEtbx7H45nkpLzaSDf/t+ilxtmUMeYSJ2mVvfEpOjFTYxuGzdExt5y0NOP3ExS/zD
	 ylRaiKa9/k9055RDcWvCPIT3N0mHcwpq3xOsQKaQEoRi76jvsawthlaOgKZaMpFIRb
	 MrABEiVVNfE2jMZ/B0/s9XjzPbS4hoevz3q0otO4IHA2Fh0uqTH1Pp5dgwbQT5nDFd
	 753501H+cxKBpXhZgU//4gvwXQBlV0UhZn/ywALiR8Wu4c8cKT11wTvXwZZVAUL3wn
	 jqLDQpEzJSFtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B18E7716B;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Date: Wed, 04 Dec 2024 16:05:24 +0000
Subject: [PATCH v5 1/6] dt-bindings: Add Blaize vendor prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-1-b642bcc49307@blaize.com>
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=977;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=1p4NJqsf17xN5CcZrMIAnl7jCYm1QXfL6oCC9V0Tk3w=;
 b=64y+oANFB0qQeuvkTUwTBMYbGMUUYnye9j461IexzjJ3LzVVGMKHRB8OKKbjV+SjZIL33zGBK
 ErfzePQmuiWCkbKLCNzjqpIJKUpD9tO7Fv5YXop3zeoCbjx20OilcNE
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_702011_4332D28D 
X-CRM114-Status: UNSURE (   8.58  )
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
Reply-To: nikolaos.pasaloukos@blaize.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Blaize, Inc. (www.blaize.com) is a SoC manufacturer with integrated
programmable Graph-Streaming-Processors for AI and ML.

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de7fe40ce4d97ed3ea264a5971a3428dd..809086061a1992567ca6c5d404fbcee8a33ee300 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -216,6 +216,8 @@ patternProperties:
     description: Shenzhen BigTree Tech Co., LTD
   "^bitmain,.*":
     description: Bitmain Technologies
+  "^blaize,.*":
+    description: Blaize, Inc.
   "^blutek,.*":
     description: BluTek Power
   "^boe,.*":

-- 
2.43.0



