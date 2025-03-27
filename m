Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B5DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFM4DEXgwP4DUJT1ZRgyqJLbj1hRqn7H9F0iin0fERw=; b=w0JQ8IsFEIxfl5n9OYnh6fHBdV
	Yq9/JEo8pkJe74J+0LFsCoYSzwX5oxDI0PpODIsSMg7mMR/v/vuBjc0fzTqZh7D516V3rrKGsPnGP
	9FWlPo57geJ3/nBUf1o0Xyyctg40F6RqQZp8xbkyJpKJbjgDZFv5cRw5D+uG3mfshZjwy5kRH65i1
	zUqbqc873BCmqf20JXAjU4+aDQoqQwZipot//nA0AhC+WRqNTVvu/KWb4sW2wkLPKoYbvJfvaLtbU
	NVvFESvR3JaRBK9btZ0VphMcz8ALlAltca+8VRTElvBZPDMktdqOugtMVv3q7bsoDlkbQRNR3JgvG
	PdYL0ZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpdw-0000000BRTa-1PQ0;
	Thu, 27 Mar 2025 15:59:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpX6-0000000BQD6-1vBr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7C4B614C9;
	Thu, 27 Mar 2025 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD63C4CEF2;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=fruR+HANJtaCS7pv0tIznmn63cohTn5pkBrHDkeQ/js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h7hsl0AM/22e/bEG6vm7tKzL9hKw5Ffc0SDldeO0CoRADC3nDBKm/BL01FZyWh8+2
	 YFtV/b5X8OGQuA8Dnx5848jxlcYndwHK6kWDY2i/MUW923jbp86pQe8/nZprdcgpbD
	 fHwwOIg31/FS+S+xwTaRrcNQd4Nw2wWFJjuobtkDK+sd8/H8xsF2VeAirZGf3W+pKH
	 58M8jQ+WJ3cBzLyhrmUU0tLwem//5qThOUfqjHMhBY+K8a2C5ptcphHiSwI3Ev4Spj
	 xO2JeITNEal+ZdtpA6c/qc8ig1ov5npo0CBjSgGPXQzckUaXHHYIeyZp2kE5lNZi3D
	 NOQVKAz5b9/Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E42C3600B;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:39 +0100
Subject: [PATCH v3 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-initial_display-v3-4-4e89ea1676ab@gocontroll.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
In-Reply-To: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=784;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=FLQCcTWqYBxzwTgGEyJvwN7uBqYk4J8ig3eGwMbzAQE=;
 b=wSQBKxI5wiMevTMoYJpi50Xz/fTuH2kMgJsTc630dXJtxeXk41frv+lEF4Skf497B5qsr9dNk
 Tz0JbNBB6KfBd8mK5U9i3xQfHobGNDwXJ7YW86eWDeeZ93MWRrgQ3sc
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f8ad2c1023016d7f72cccff880e3753d71d635b2..123f03d8f8bdeec6bc947044a0c46b84764863ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10043,6 +10043,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0



