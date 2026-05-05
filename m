Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E17FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAJhk27tpW5Xpntp31c3+nM/LaggP06QbC7a84S+snc=; b=Wr9jgIMjcKPIMUplvAyS/RbeFX
	uwTVoZMhSrTJ+S7ie73rsWF0j9nvjEe6InF4YBKXbBakpRAbhXKYeodhsqQCA1l4Z/fTX3FAq73pS
	SngDZZ92cgYcZkmppcrvoxmHlEVCV6IyJXYpNPMRQcNpIYj7y49/KIvgZvWi4cMqVCn/sKl0/fnxV
	nBf1awdmDnXcVCsL6qnLK2+hrd415L5wH+4gs1Ex2s1x2IC4DxMyiRha4NN14q0FODlQNwKd0tpeG
	LtTWEftgQ+0YE3r08OLouLLeMnFG/BX45m7g5aGYIHtfGgimxO8Q1hjz+FfpQzy3SMieqbSV+3uv/
	TKeP/smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUX-0000000FxuR-30w0;
	Tue, 05 May 2026 10:59:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUW-0000000Fxth-2Cx6;
	Tue, 05 May 2026 10:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tAJhk27tpW5Xpntp31c3+nM/LaggP06QbC7a84S+snc=; b=Hy2yampZzQWvx3NaMpBKlutXrn
	OlJONhCp44qFi695EF+D1SrgZGkJEZkg7QUFRQAu/hYzZ5kNouKfSmUxA3F5ZSWZnv2KTxEOF/xdr
	q5RQMm8imUoKOWeeFX4G/0vdceIsrVmrUuoTKRGc1dPyg3U68+AWvjtU59Ma26+ffzIVTwxxw2KfQ
	obYZbM2OHr7Kl39fnxt/wBUalVXfIMMdwjhnxM4eFibWYssfB1qHhSzybZouak0jq+gY6gWsYA12O
	nSgYFaS9FWRy7Y+IMleSfDvado7HUPBXAAntTteYdnbrcNEeQyeFqvJD3mXnz+f/Zqwjp9bMEzlR0
	y765v9RQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUS-0000000DHxz-0u8t;
	Tue, 05 May 2026 10:59:03 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AwcN431171996, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777978718; bh=tAJhk27tpW5Xpntp31c3+nM/LaggP06QbC7a84S+snc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=XQ67WtdxH3ZXsJEykG4/BOM036OW3bkwxxETnEiDCe6u5CUK3LTuzsK9tZwvgk16O
	 /uQ3w/cieB89hZ8HiKdf02fj0G4j0I6Wr5tledW8f2v8k9DfHXP6Cfp+qP++fEzX16
	 JY/sWg7jYmrdVdThsOq2BZ9CqF5lQJFjxu3IBlvxsd+bCZZMbYBce0JHj03XOs4mb3
	 jSY6Y89y0g0Z3gYpCokTQW0075l/mKe3BDmqR4nLITtIMjKzkKNnp27uekZncLPNxh
	 A0+s7VAXy2fLPDoi3ILhb7FnyUzGfxIYdHhEtWqw4ribyAqjWbMY3f3qDNxUcY+tV4
	 xxEa/7owRU2sw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AwcN431171996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:58:38 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:58:38 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 5 May 2026 18:58:38 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>, <afaerber@suse.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] ARM: realtek: MAINTAINERS: Include pin controller drivers
Date: Tue, 5 May 2026 18:58:37 +0800
Message-ID: <20260505105838.1014771-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505105838.1014771-1-eleanor.lin@realtek.com>
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
 <20260505105838.1014771-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_115900_576486_235BCC63 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

No dedicated maintainers are shown for Realtek SoC pin controllers,
except pinctrl subsystem maintainer, which means reduced review and
impression of abandoned drivers.  Pin controller drivers are essential
part of an SoC, so in case of lack of dedicated entry at least cover it
by the SoC platform maintainers.

Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b66b739ae2ca..0f8b8264e6e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3356,6 +3356,7 @@ F:	Documentation/devicetree/bindings/arm/realtek.yaml
 F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
+F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
-- 
2.34.1


