Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C93BD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hoXMVRSQSHzlrc6BbneIFGzDKJfR415NtQHWKx5Mxg=; b=vDcO1FVFzIqLgwRwuDorcZ6j8b
	+ySImadB71NJIjM4CXCD3wjpsUZuZU4OnpO4hXzkOwUjB5AStUTihXBk6rfW91fMteWC1NuRQmFdE
	n01M7H6j7FHl5Hq00mm9sUktiqQTOVE4Jss4+byr2oKTGW7MA8I2GVMKNFodfBj6WAG2llaTtD2z7
	TvL5MJ/VTXXImN1q4VGA81F/KRXv0kd07A6GInIidKZJOPq88LBAbHqxy/GnqMoo89KwXkqpQzG7y
	St2nk1IXEp1+VOS4dqnm1YADcgHZGRIRty9UQn5qiElchunNYdHJ29dIXl46q+D0DUeZde7OMXo92
	tXRW9b1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsL-00000003zpL-2PzF;
	Tue, 20 Jan 2026 14:38:33 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsI-00000003znt-0AeE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD18B148AD3E;
	Tue, 20 Jan 2026 15:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3hoXMVRSQSHzlrc6BbneIFGzDKJfR415NtQHWKx5Mxg=;
	b=gCp7kAske59StqI62JOTq91WMYEzRi/kuFO6Kgah5eMF6sbw8oWBk7eY2Xgw+L/xV6KKoS
	L8mESPh9n3EW0iIeJzDepuQzirbqipPiVsY7dI4w6cmWiCnTveSNapWDAhJNaoJXEqJjJT
	HbTbcmc9XAn73oHmwbgxmXbpqDjHntg5ZwlOWnrj4wIc+dblxxNh4Orwnr0zCn6xyLB7hs
	dpWpKyFtNbdpOmZ2XugdmRig8X2melFBk0fEyNp9BpmYMpd5+F1gy4ffsCwi/IzTaRpZeO
	jXtNx4hr2MrEbAlvzQqf009jtjLxmvi4VTPkOvClSCECQtPWLkNRDaVvZOF19Q==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 01/19] MAINTAINERS: Add sam9/sama to (AT91) SoC support
Date: Tue, 20 Jan 2026 15:37:22 +0100
Message-ID: <20260120143759.904013-2-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063830_559971_38CA898B 
X-CRM114-Status: UNSURE (   9.59  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Will catch previously unmatched files in include/dt-bindings/*

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - new patch, not present in v2

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index da9dbc1a40194..c882399c5e4b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3033,6 +3033,7 @@ F:	include/soc/at91/
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 N:	at91
 N:	atmel
+N:	sam[9a]
 
 ARM/Microchip Sparx5 SoC support
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
-- 
2.47.3


