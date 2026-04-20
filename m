Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3AEF588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OouD0XULIhEyNzGNVc+waPLFih1jK2LTaDUpP+07Lvo=; b=v2B1UAozwwa+/pzSeeFI6T7p9/
	rQ+2QrascxftQjTiJZc/B6pbLIGICcHUyYnBqh2bStYrEiDPkaZwxpFeo8I/cFFP7AcyAg+GnRtqN
	XTgi3YxaAtbn6aAEFYyD+yXPo0RRhiXu/PK7tBWTtgxzMph7fHsqGIxW836p2EeDEWdtx8ErlnlI5
	tcMXtXhVbDJ0FvfOl3KL/9tsDqDEt2EpPDYRoMMTxewdvXlPc5RL4Q/glB34J1HMT+18gBKW/GUgX
	7JFlurXfUA1xWwan/ehnq2h6Y6ZI5EXvDH8qufs4v8pYQNiOC84PcRQ7hesX0J5qTsYiPfiLbq3zK
	0TGbL2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9L-00000006v1K-0uib;
	Mon, 20 Apr 2026 12:54:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9D-00000006utu-2Tgd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:54:45 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66D532769;
	Mon, 20 Apr 2026 14:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689585;
	bh=FkIewGjJgmTlrhcbqcI/ZGMUPpfnTF6TeMFYfD/xf6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jiabUEvHYjCCHaRqIxrMYNJgyP88QdLWhvCb5PIS/rmCWozC1pGzLcZToytdCqWF4
	 8Q2mKF9y5QBsdLCl08grKuUWZFw6KTmWvZj5rf9WFLwQXndHYNZZ+PFg8jBoCLkmjf
	 +wQVN99z2CDMlflW6civ0Uw2irm+V8DhX/onolsY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:14 +0300
Subject: [PATCH 07/15] drm/tidss: oldi: Remove define for unused register
 OLDI_LB_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-7-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=FkIewGjJgmTlrhcbqcI/ZGMUPpfnTF6TeMFYfD/xf6w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iIFey/l4vcKVxR+5WkadBr8jXczXYL2hzcjU
 fo++LLqQdqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiBQAKCRD6PaqMvJYe
 9Y9wD/9akYkqmkfYxklqM8y0MS8KwtgDhNiRzs/CfWIGsFfMmM8+lKimGP0tv1w8On0CaNBBeNA
 uOJsivYBWChM4uDMT0lg4yvkcQ05/G5tok9VoWGWOFpugzhhUcd523HdwtK5QbPFYjd3YGTLi+B
 nvg8xDt74sPEmwcOqQeGbjdh0DcnXDTMrnLRh5G5Y1o+etnz26OpjOnp/9iPchVh0D7PhCBFGLj
 fRjH0Q2d8b3rngeJ4lJl5zE7ZTPOjQIPk5yJ9V6xY2pjZytt1AoNvLfF4yK56ntaU1WpUFy6WbL
 /qm5483YETC1xPZtSQ7GWX/Xb+ys82hJNkDIt+87VtusqzmJiwcZ+cz1ruAhWm8nKF5sk25Ch1q
 pi7pv9yBZ+LDswcevzT1CB3T+dci7TORTn/fMmnYgBCn7ilTEN370BsOeJxZgmaREB5GtyyVpSP
 4Fhhf47QXnvlgiarUEuApJ7Hb99Ga9utKvdcMu9U9MV14It6tqkDl4Ve3HNd8gs666mh8A5TM4B
 UKOEvQqP5VLBzVOaJ+WbuB7bwbmtWD+bK+vueGQvZCeRo5uVMuqGufRtwkCk71LO6py7E8RuHqu
 MXubMr7Fv3bwi5MP+6kGn1BMM4vX+4Zj7ocKnparh33kIN1d8Gz1k5DhE32Fm+4TzON4zilQh72
 26A8WLcmCtGQ8sA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_055444_251318_DBAAAD51 
X-CRM114-Status: UNSURE (   8.83  )
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

OLDI_LB_CTRL define is not used, and doesn't seem to exist at least on
some SoCs. Let's remove the define.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
index 8cd535c5ee65..a361e6dbfce3 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.h
+++ b/drivers/gpu/drm/tidss/tidss_oldi.h
@@ -20,7 +20,6 @@ struct tidss_oldi;
 
 /* Register offsets */
 #define OLDI_PD_CTRL            0x100
-#define OLDI_LB_CTRL            0x104
 
 /* Power control bits */
 #define OLDI_PWRDOWN_TX(n)	BIT(n)

-- 
2.43.0


