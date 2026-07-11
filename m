Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blLlBGuvOatZK+tYYkPT/B5F2mpzYMtZI3nJxinObmM=; b=3xaJtNEL0QZaCVRMVohtIFZeKn
	5UnwSuga/LY1rk3ugF+K/Lx55H2vmtTAE+b2/+/13/cQeLCyBKbWlFzDcWvnpTBRhJWWRQGXUVV5C
	/+d2Rd2N0+67H2pxNlaOf7KQqTzv7vsluqpr8lnQkDzAPUYCIuJEmkihKqQkDp+ocvesJXyCEJwzP
	kGuJpnyGNbe45Vl8g6ED0yMnHnNFVkrUjuZKPRscZ+moAArOGZ80fILm8/WUHxYp6nGYsCXUMwfp+
	gGzf9KuFmHGxdITNE2PTx1ZEw9zsU4mzisEHU6XAI2ISDaHJoENRziqJl9rSMdFOoa0LgufI8DhhQ
	pXzb1lhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepo-00000006t6Q-27rL;
	Sat, 11 Jul 2026 21:02:04 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepi-00000006t0f-3ON8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:02:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DFE8119852;
	Sat, 11 Jul 2026 23:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803715; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=blLlBGuvOatZK+tYYkPT/B5F2mpzYMtZI3nJxinObmM=;
	b=J2rABFOoZHPoiDsWkKN7u+y7qutobLmqgJr5/F1fKTFJlKlmYiSepfVAwm/MzvIXgd45Yc
	TbicaX+qelKNDkZLWtzp3lBbV9tv5C1HQTSapfCF/OFP8DHuiNftjgQ3XQeS7ytykUvkBM
	RZ3G9ku3UcuMJJWNXSE0hfygb6SMiCa/1u3qot8RK5q2BdiBr8Rq9ZmuuNkqt+Tfihgg64
	tdmvJEc+xHC6lJaTgbr/9bGDqZ2n1t73Jlfh5sVAjtZ/Uoj0zVrtDP+uM+TcWbH1gV+cYX
	s5hvNlKcTiSMtY8l+5WtGzbsRG9g5jadPdeV2VU3YQSolrIsDG1jkRdPmQ+RDA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 10/10] MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address
Date: Sat, 11 Jul 2026 22:59:39 +0200
Message-ID: <20260711210131.236025-11-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140159_069502_4A59B37D 
X-CRM114-Status: GOOD (  10.18  )
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

Add another SoM type N: match and update email address to an
up to date one in the process.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8729cea57c3dd..3532d425e41f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
 
 DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 L:	kernel@dh-electronics.com
 S:	Maintained
 N:	dhcom
 N:	dhcor
+N:	dhcos
 N:	dhsom
 
 DIALOG SEMICONDUCTOR DRIVERS
-- 
2.53.0


