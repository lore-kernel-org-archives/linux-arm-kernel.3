Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB70C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGpytK8hzFYG8h6hklrBxtVpze36ZBvUjC8fpGOq5es=; b=cFYY6BNR+X93JoWG6Yzfovi1Cz
	OXnoeSWb8RreeYfN8lny2nW7KzsOxdJGeUmQ+yZYFeuA8dXorlrsP14ShWCGZlLP6RTWCgZPR6Hd+
	GJWf5QPH7Flo+c89HVf5UV34B2l73jXdf2776S0seK+J/TIUpucTc/AtehCHZM3qp9QgCFk5MP301
	crUD1r3d1qOXX60/u/IUzmzSpHlJ2s/m36j6Qy5bAQ1bAydE4wFcwikXjHu9FhEhmUivBfZQVTWNB
	RnuRt5UhmgsvzM+AgdkI/o5ErtezU/f7jHZeVxSQ6IqetgFoRsm+8s61U9yqDwsQUceN0eEQ2xPM6
	ZI6YEkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLwZ-0000000Cz5d-1vz8;
	Fri, 21 Aug 2026 09:53:47 +0000
Received: from [38.71.22.102] (helo=spam.axera-tech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLwW-0000000Cz3K-2e3O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:53:46 +0000
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9VvuB009928
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 17:31:57 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlG009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:35 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:32 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Fri, 21 Aug 2026 17:30:06 +0800
Subject: [PATCH 6/6] MAINTAINERS: add Axera ARM SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ax650-v1-v1-6-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
In-Reply-To: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=933;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=SBeMbd/J9hbapn3LUlNp02M8EmQHM8iyqHXyrUV/Uv8=;
 b=ElZ9I3RXyDOH2kwGskgjxEvHqifIWd6/3BR7mW42eHOkEx4UO7odqHZAuS8cbrqXVqOm4FhD5
 z/oLbXgsBo7CRycI8KmNPkPjzhJT8JH5Kl5t3pbvQHYcBmdDMPWNWLh
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-Originating-IP: [10.126.103.103]
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-MAIL: spam.axera-tech.com 67L9VvuB009928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025344_995716_CA7E4FDA 
X-CRM114-Status: GOOD (  10.84  )
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

Add maintainers and file patterns for Axera AX650 ARM64 support.

Reviewed-by: Shi Zhicheng <shizhicheng@axera-tech.com>
Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b7094a616afd..b3ac89227856 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4398,6 +4398,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXERA ARM64 SOC SUPPORT
+M:	Shi Zhicheng <shizhicheng@axera-tech.com>
+M:	Leng Honglin <lenghonglin@axera-tech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axera.yaml
+F:	arch/arm64/boot/dts/axera/
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1


