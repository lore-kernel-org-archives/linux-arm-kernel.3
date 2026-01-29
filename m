Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE2D358EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTRog+IwmrYHyO0U4dmJGbr+cuA3smR5bAwagjLcAnk=; b=BRHQzBr69rXZ0nOoRFaqoMZKIS
	9ICw/WaYp6spxF8OINyXVZzh4pUbJxgXNg+MfOl4yzDqP4gjnDFJc+TkmYoRCLaY9tWmZWtDkzpPt
	9sBhylGA+Q2WsF1aUBFxf+Kq9JpP7Vd2PULkF9wkyOMu/upA5YVsjCMdPrFE5NKVLgtk2iwbVsGMU
	aBv66957ZqdYoAKuLxjzSjpuY3Ztgsy7Xxugtv1rXMPzXGDCVqa0cTz0GRfm3PB5X789PTL9sO5x4
	UT76da0KYqOxAgH4NhxQYyBh1RPbpjN4m6cHcvDauKjtIUhBnkBIZXlLi6DHVKcqZHg6RXVYj5Ztt
	IJHE80IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOk6-0000000HXTy-1Xoc;
	Thu, 29 Jan 2026 09:55:14 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOk2-0000000HXRH-32qP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:55:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA7A010F7AC;
	Thu, 29 Jan 2026 10:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680503; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XTRog+IwmrYHyO0U4dmJGbr+cuA3smR5bAwagjLcAnk=;
	b=etKeGBIJbhp3ZjkAy6wEW2Thn0m6ovXAVqJzCVf9HwqlS/mhE3vRB98jlJbYbQXo6iqyZt
	33670e1EEYC+j1ZboLTfZL2yP0G8nMIAh9Uw+nYwmS9rHU0dQgNPDyX7s9TcwE8rG0mqc4
	IZNgUPccMjGMVXdlNYBdgZfKgdeUTERLpus4QoND4bBlkEdUkScBjI87gwWfZfmvoIob5M
	ISuI+UPYVfdCkIxBxeNJJMyqULct/YPX5+9nQitUcPzibSqfrmSM51843NOeFD5WbMksgg
	9wkrd5k7dXljYESulF3dTqSWAPTPvZhKv2HTculnfqwS288pgbgRzg/thiKEXg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: vf610: Drop VF610_CLK_END define
Date: Thu, 29 Jan 2026 10:54:40 +0100
Message-Id: <20260129095442.1646748-3-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_015510_989918_CBA5DD8B 
X-CRM114-Status: UNSURE (   9.85  )
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

The VF610_CLK_END should be dropped as it is not part of the ABI.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v4:
- New, separate patch
---
 include/dt-bindings/clock/vf610-clock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index 373644e46747..c91fb86fa9a1 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,6 +197,5 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
-#define VF610_CLK_END			191
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.39.5


