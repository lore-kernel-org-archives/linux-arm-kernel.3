Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15204C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1kfSKKcor/bJT8IN3/Hv4FIeHEYJeaadT4cP2Vsnnw=; b=XexernduwtIe10QOnwbjpSxMdI
	ojmqmQIsuK/TbK0JrzJEcGNqJ7t4XUEpSGwN6Sna0qHjcy9/E5h/TEOzKjXNCszLRALcpCX2yTx2z
	aBriKGvF37j5zghavyXm1m9TQT2+r9+hZsG0ojYGrf/iS2woqNxzjPuE27DdyyAIYWs+sLPUkIARc
	yAsCofxIOGxb2qGectEdqhw0La/Z7nyTwLy43lXXbcq1u2+/lRgGIqBGpRVNA3FP6vKehGjHtL2w5
	Zc9KiZCkKrnXcnfa8KtMnPF6xmIF1As0JkUTWKOYFYSZLm2uBTt7CABWtr0dMQK/bBh5mZvn5QrGN
	ESc4e3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGXi-00000000YzP-0pHC;
	Sun, 09 Mar 2025 13:18:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW3-00000000YeE-3y7D;
	Sun, 09 Mar 2025 13:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE733A45BBD;
	Sun,  9 Mar 2025 13:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A0B5C4CEE3;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741526185;
	bh=sXGqpc3WKcfHqTQx4M6yghIZTgooBtjzDEElH3FLBmo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hK+y3wETfKuUaCbc/hMQ8VWmNA/RPIW66r4GEJ5NzoFph2CRWlzYtC9XR3rBFEdWA
	 FRXEJr4I1Or77IuIgs3NLOw8kiUXLmcxHOoiG7FkwGnrlYna245iPHBVtS9xDbQI1K
	 JIxMMnzhJft/NThTkXnqVIBu4BQmsc/B2T7wYbdy6obRSE/quqeBIzUJJ2J05tHiL2
	 rGGtNNtAJ2s4dpG24Jpmpw76AAl/gQMSAbODx+jvdx81/U8gFlZjGYy4xcfQAQLonf
	 9nQRynQo/vQCmc1GKmcFs7sG04vwWYbTYpsT2k9pKwjUr7oKC/Cf9DG4bgZNOA+KVv
	 z8A74AN9QDAXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE41C28B2F;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Sun, 09 Mar 2025 14:16:19 +0100
Message-Id: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKOUzWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMj3dL0/Pxi3cRcY900M3MTQ2MLMwMTYxMloPqCotS0zAqwWdGxtbU
 AG099b1sAAAA=
X-Change-ID: 20250222-ugoos-am3-f67413860434
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741526184; l=789;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=sXGqpc3WKcfHqTQx4M6yghIZTgooBtjzDEElH3FLBmo=;
 b=KFqgJkbT9NIujlHGhFm/rVdGXRHTo5NcLMkJr6gLnbrM7M1MDwvekKDXH18GNow11O+DpCkYj
 KQdztzgUsbIC5N0WLj5HCSQuZdReN4kdb5XFmeI1g1pTIBmbYrG4Hfk
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_061628_071488_080C0940 
X-CRM114-Status: UNSURE (   7.67  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds a device tree for Ugoos AM3, an Android TV box from
2018. Most hardware functionality has been tested, as noted in patch 2/2.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (2):
      dt-bindings: arm: amlogic: Add Ogoos AM3
      arm64: dts: amlogic: Add Ogoos AM3

 Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 95 ++++++++++++++++++++++
 4 files changed, 98 insertions(+), 1 deletion(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250222-ugoos-am3-f67413860434

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



