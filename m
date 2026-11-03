Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF60606D82F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kkZ7mgga;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=BF4QVkXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lzm6FJ5ffdfLiwl5TCfB94ixpmG2lfYqywc1zULq7NM=; b=kkZ7mggaSzAnVc
	DIqR4ZMdbbeYiWQ6OFyjmfvq+kSNb36hnH1ZkPYqaV/eqtoQKK5mK5bKIMxDrL3MibZWhNSoZeqG0
	GFMpb5+T/4aIbYek9MYPYPBdCLgXk/b6FewtUr1Wms5UtaKO7UoYQw7ELvxW6JiVao0wYxSVW0/2K
	ytS+4PAU2vzxk+HaAavGTWA9irdR738NDddO3aCU/2HaCwTiiqogbTcpNZRfI8pc66NeOywDM4lIb
	31l1BpDVzPbXWrtmagEyH4qJevDyKPcYEFryYL07vIo/xaxKKEYKbxgEo6TYSDkOhyUA2BCwNhYsE
	HyosEcNYiA+ucenPq8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoE-00000002CXu-2GgM;
	Tue, 03 Nov 2026 11:36:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoA-00000002COD-01Zs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:36:07 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2FF32805;
	Tue,  3 Nov 2026 12:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705627;
	bh=4F38s6u+YAdZAkcvnqS12ydXVGwdXIr2aETVbPB3uE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BF4QVkXeBzUPQ7ZfoZw3qrPx1bIklmPJ75hN1b5jG2jNZ6HVk5rU2fjx3eSduX74/
	 USzRE5G76QW2nTpEUXmZW8sZTtP76CePqPTvUjO1KyYMEhD6B43suX1DTLvH0Y2cwj
	 InvebAmeC6ZLftX/G2eukkgpOl4tpJHbkisY8b4c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:27 +0200
Subject: [PATCH v5 07/15] drm/tidss: oldi: Drop unnecessary forward
 declaration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-7-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4F38s6u+YAdZAkcvnqS12ydXVGwdXIr2aETVbPB3uE4=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGrpxxeiQdCssNWcjrPR3Yhv4bAQhNlUrpPfUmWc/SmFYoCgG
 okCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJq6ccXAAoJEPo9qoy8lh71ShEP/jcT
 0GlOEJLepBQFo/LlgcgrJOL9HsgJsblq2Idi1NVsLt63IHLAOb9ENcpi93GIfnK1mHOdy1vp9Hg
 y8quxkqJqpb6CqnrrcNXF0qqgdPJtmRX8xXDwSdbTWfuL6JYmz+IaCvl4niNz0OF84aGmcXqOsx
 bPwmW3mRaoPXr4nABOHSAAieP83jxNCKljntCWHV3dda82gJMaDSwRQSbbYYl5Anw03DwpXE+xZ
 UW7gEi1Ia6NOzUENPbEIKHZFOqqEn3SDg7E0RY2HCawhX59GNR92lI2EmSwr04SNRfkqC7AbDBS
 +7yrAsVLF6TNKFyKOv+jd1UwY9L3jh9aMbRJytD/iLkTrfTmjpk82wdBqYn0fIKAJiT4xJuXaz/
 ICBG51tvf4bSouS/vCwop6DIWI4jVZ2Ut3KVYuSPp/s2gADfVegmSTXqgfRyf7WkEcnyri70reI
 M2SMbMWqqezkKxXKEAxYC18lS+bEG+pfgBM25jCqdTP4oyRy6imowaHyUb3O4tXJ2Qm00JjRrFM
 E3HhwLJf+ZXxc54kVitPyqRw6ikmZ8qQ+eecS3BtpAQw+zJwUx7YhBezEvQ1C0EEObCmVyuoJjH
 0tQ5OWoiai375iBNlvJ1LD2ly9oNUbYF9OdHdpEAGfUxLOjdowulzIDGnNa815qTAgS1Nmi8x8n
 4ysFM
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033606_284266_13043FF9 
X-CRM114-Status: UNSURE (   9.29  )
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

Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
declaration.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
index a361e6dbfce3..ef9597fe5409 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.h
+++ b/drivers/gpu/drm/tidss/tidss_oldi.h
@@ -10,8 +10,6 @@
 
 #include "tidss_drv.h"
 
-struct tidss_oldi;
-
 /* OLDI PORTS */
 #define OLDI_INPUT_PORT		0
 #define OLDI_OUTPUT_PORT	1

-- 
2.43.0


