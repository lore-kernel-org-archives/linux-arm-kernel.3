Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2447E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMn1O1+qC3YXzGcO+IH+ucmI377x4ENLUeynUgJsaX0=; b=ZLIaOFHEcGl3JWLXyYa9eUmyxA
	wmykLppdy0GP2wMPGjGJJ0Zf6h4jMVr82LXR/0mtChAhXq6w5rkeX+9AszwETSp7p9KoWPXfdWzkM
	4BOMfuSs+RZ8UvpgV99GzujV3clUaYKkhl7o23e+gtbRkbej1rJz9x3UL+ziOC5pwaugDBn0tgafa
	tFmTGNTaO0HutDKj+9lCxEyAhwtWY2rOPtS7C9Rr5tIj26mIXMnc/HyrxnZg+TI8jgwYATPmrNjH5
	Ogs95QEKNryK/xEUBb4aQ30RsTriJUA+4KEzuLakljswovIvnitqC+EP4IEoyH+XomXUJkW3sxP5h
	sf6UcC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs04-0000000D8wK-0nOQ;
	Wed, 04 Dec 2024 16:13:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6pE-1etQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6FEC5C6F6D;
	Wed,  4 Dec 2024 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E693C4CEEC;
	Wed,  4 Dec 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328394;
	bh=caG52ZRp1/jQY4rcSWmiiteqmXt1GTPM57aTXkjfahw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SMlGYcgT6LjEvSQyZZAmmpLbdC+E5SFhP9pH/8xD3QzyjK2uTP2Jt48fchgvESj/n
	 JSnZraps5oI92bXzCVY8JGAkne2U81os6p1iTDJ9hTt9RLhGPPEfPz03puCkHF900G
	 BKHnKnBxPWfmvXzuIZ5zJAhpFU94FdZ+kEgp/eh/grD36r2X7ZVcAeGQsS+ikBHKX4
	 PfS8VucLsx0jwzsG9AuDofAP+JYN7hOVz+njS7ZZEP94iZoMlb19Zad8vdV5YMC80a
	 12JyoEX/UivDB9RsT/eRVB65Cg3oQovlynY+dviNBkmPazoO4r9LNuHiRoUPaKNWBE
	 a/uIArj/l0ZXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21599E77174;
	Wed,  4 Dec 2024 16:06:34 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Date: Wed, 04 Dec 2024 16:05:29 +0000
Subject: [PATCH v5 6/6] MAINTAINER: Add entry for Blaize SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-6-b642bcc49307@blaize.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=1011;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=B8JPdEWFjlJ8iEOYfys3/T/ybAOs8kuytmN42/vy2FE=;
 b=69fm4FjATA2NwB5OGt8iyDk9vJ/CiyV9KeDh/wGTGXFqK24nbZoonpWBIw7h7n36QG+NsR/eT
 ZUX5cmE+gCtCDWs7fkmPLb33xMqw5aS1cLuJ9T70M1GH4NASTaqSw+Y
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_488778_5EEFE087 
X-CRM114-Status: UNSURE (   9.36  )
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

Add MAINTAINERS entry for Blaize SoC platform with a list of
maintainers.

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 273a84483b74543b510de7b08804bbd1f6514358..43846a23f9d990ae9fe066e65ed2bdd36376e327 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2238,6 +2238,15 @@ F:	arch/arm64/boot/dts/bitmain/
 F:	drivers/clk/clk-bm1880.c
 F:	drivers/pinctrl/pinctrl-bm1880.c
 
+ARM/BLAIZE ARCHITECTURE
+M:	James Cowgill <james.cowgill@blaize.com>
+M:	Matt Redfearn <matt.redfearn@blaize.com>
+M:	Neil Jones <neil.jones@blaize.com>
+M:	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/blaize.yaml
+F:	arch/arm64/boot/dts/blaize/
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.43.0



