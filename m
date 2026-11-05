Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D806606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sIKt82Cw;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=knrI72jy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1cjL0JCpaDIHIZFe4xaYZge0ytMZ6yU98tvuRPdMz+g=; b=sIKt82CwrlZ8uB
	YFIrIhBXL73B7C9vm5O5ZcUPsVncP4XxwXYe75RsYBdoQeSuRHO3WpGGHLniVIx5ieHheFRAaY5Ra
	K9ZMT6pMSfO7wlhREfEygodkLqmvfm3R7sUi1NFd7t3RvPUQw5BpGjFh5Z7oxmjB74jxvN0zahbss
	MJho27b5wEjos1DScjkR6nv0heaflw2cvltkYRVnuFIryOe1dxpNnNoDM80TYBHXgGRRxTXRO44dQ
	eJXcC586DqD5pQnJRAQ34MJuq/f1UQHTSwPk+pU1kQVcdOGt5of7eXKji8OJbklpXKHas3hwMw/OJ
	fip35imIYFil3JfBSHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJy-00000008ZmW-2jKv;
	Thu, 05 Nov 2026 11:07:54 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJd-00000008ZPt-0DCq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F95F1496635;
	Thu, 05 Nov 2026 12:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876873; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1cjL0JCpaDIHIZFe4xaYZge0ytMZ6yU98tvuRPdMz+g=;
	b=knrI72jy2XsW8GAfy6cErSlBfoXL3yRP4sNgRDtKypmi2sI4ke8VGz9ZCyNjhg+Nzr1L7G
	hHaEFS4O2UTNnYeqA7VG8hXE7oDO4xMHIBM6YBe4hTsfdF3Bb2rGMe2sjDSd1j9QpzP1cd
	9WUsOemv7EEVN7eTkRZ6EwJLjcsbT793H4Itl6zMt06UZiRKESvHdTeGnjTUhLHlWh37Cd
	3VhD6nywiogQvtrb3Uvb62AVWrmGGy1WfbUR7RkkF7GF1LHwnklMkk385baTbb/I6sz0vL
	4VeWBRlisK+u3bgbcjwWETijl8xaoinS8u8z7j0sF9EAFrNgtJY+F22tvrz8Uw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 01/16] MAINTAINERS: Add sam9/sama to (AT91) SoC support
Date: Thu,  5 Nov 2026 12:06:37 +0100
Message-ID: <20261105110715.2486432-2-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030733_617377_3EBF4051 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Will catch previously unmatched files in include/dt-bindings/*

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - no changes
    
    v3:
    - new patch, not present in v2

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..3ca145c68e0e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3283,6 +3283,7 @@ F:	include/soc/at91/
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 N:	at91
 N:	atmel
+N:	sam[9a]
 
 ARM/Microchip Sparx5 SoC support
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
-- 
2.47.3


