Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66E5C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00GjwRAhFlu/WPBIGY2mV9OsfJRwCCI/vOhKHYVUKO0=; b=T0dnZs0d/KYSmM1O5G1D721WGG
	+ghTdxBW4Z0984AqozH9NX81hMiuS5iRWzlrJmdRwngdP0YMC0nsSjZE08jIiw9RWtJs1kzpPVPb0
	HXXBQ/x9YJj2THJzNLcLHecS2OIPOb4USfeg8QwfxcrS/qFkel5YzNg1I27DWKTudosueHB0jMcSt
	1zkWj4W0L9mPQK5/lGBm/PRC2O01gKgAxorMJ5jD11S+7DIi88jlC1LtMTTFpt8CagY6DEhkJh4Rc
	AcPa6EZ2H1BgE8Cyg+surSBbJxaPEpEOx/l1OurepKzhq8ojqFbnRCtH6fnuTMY4Jh6FXe96/bzHS
	oloMiZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBio-00000004pGS-3nRF;
	Mon, 16 Jun 2025 15:26:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9de-00000004Uy0-2b3F
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=00GjwRAhFlu/WPBIGY2mV9OsfJRwCCI/vOhKHYVUKO0=; b=Q7inxcuyvEx9orPqu31/WJ/1D8
	5yFT2N1xGKxCm+RQmbPi0Kn4eZGf6/DY3T2z49uLaHdj8qmvTmPzhKcNDRRUqKj68LRhb57O1L1rU
	nnjFgiJQfG4pe/FeOF0hwV/ISYlqh+WRhd785YNT25qleU5bnOWaGVZhqyjSo0TRhQI0egzb0x/6S
	tYNUYRwFIBIJ5RDmsnHlOSXUgXQe5nKuULLjZQYfPA9XPtvWVN+g2fb6IG634CtSviV9u6cdL6leZ
	lPXekKtUWF+C9OEXNlXCHjbJPAEU9bwkfgQJ/1zI4la7vV7if7U8auP6ds7dS7cPucaHaGP9bMXq1
	ibbZCw7w==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9dc-00000003aL7-20Jn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F5FFA50FD9;
	Mon, 16 Jun 2025 13:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90D1DC4CEED;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750079551;
	bh=YXwjkRwHTteqV9ZERu+QJt1U/5y/bTSlS41CFa701/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eAoqiq+3BIiTXBQsf+iy6lbuldwoEn1VGVEc/MFL0cJUFkXH2Oj2RAd0VLz8iDcBU
	 4zLuIPHqi7gPXBlIGYyYxYHVHCGnNXOm7ee3O7cQcDGf/91bmKj2kY14CFbiKLdj0r
	 26/evmTtSwpYYq+5+/BUAfxfRASslpyJE1+hxouyNJQI2p45vf9WQ87bliaHyfjgBS
	 lVjX4kd95PGe9BxCUFU3k0UAg3+xbKy8JxEjAn/CF6Ueqpu3D/kQi9ID/76NDKMeXW
	 YSGyvs48n7n6XXaKDR7vgOaHTXpBKVhbDszip8OHFCjIJN2NA7lvwFpJOkSpAKv0wj
	 wrmst8AWtZ2PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85121C7115B;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 16 Jun 2025 13:12:14 +0000
Subject: [PATCH v3 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250616-allegro_dvt_al300_dec_driver-v3-3-7d746cb9e5f9@allegrodvt.com>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=wcArLg2XJHwE9gH/4U6ZLF2AB9JyotUnB2d5qn8XXFU=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQESNiK52VITvYp/mj/JOtaM8vZ81dufTzm9imp582Js
 zl3E0U+dpSyMIhxMciKKbJ8MFj67Atbjc+MFrb5MHNYmUCGMHBxCsBEZG8z/I8q+TPx4ORsW39G
 q98Gufvehj5h2yXSqXas8UOBhMXntOuMDHNOcSdYODpbTNkl87FVbf0plbB+1piXyQsTFbfbrk4
 MYQUA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141236_742429_7C12A6B2 
X-CRM114-Status: UNSURE (   9.62  )
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
Reply-To: yassine.ouaissa@allegrodvt.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add SAS (Société par actions simplifiée) to the allegro of vendor
prefixe description to include French simplified joint-stock company
legal structure.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..827fa988c5af4b59cf71e4cf47163e38eb1aa4c9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -82,7 +82,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedvision,.*":

-- 
2.30.2



