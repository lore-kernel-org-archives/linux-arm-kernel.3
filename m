Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86806CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF3xGrEUFdHEStObrNSfP3pu1tt74nWP2+Cczyhxx5M=; b=uHSlCw8JSgCNTHi+tkxIU6lF37
	nVKBAGlbkVXWGhBbNahLo7WNBUIe9aBHZu6CXbRrR84tBB0PKvwQlo8QWEeiMxVt0r4iBTKVxGIjL
	JBoNv5ANXxcK+eO6K6MCwKoaK82BdhnrPEM8srUh68YBJaSnu+3xisG2gs8lyYjhiQS52rkp1TMf7
	DRNXlRRcRX5YL4Q5y2FHtBjfof1D75O+VrI/ss8w8Ts3iMdV48SvwYBlWeWctKB+Jq9h9ZVhu2dqS
	4reYYu9cVxu1BiXKurgARFLrXJwmSFw8vKafv3Tk3Te/KlWFvoAZKkxeeoQVl+Ucm8uYy2inm7VQl
	i1pj/wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8T-0000000GNYk-0Ydz;
	Tue, 05 May 2026 13:48:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8M-0000000GNS3-2iN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A06D1445ED;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E312C2BCC7;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=41aAwkaRzDArZ2/BUER3ytgPMD/yUeLsP1zzcXu+P7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pr7RAkwJ/OuNJ4iFRuwgPOUqr5/X2gNfeBNEI5jDSh/jpDawzZ3oWjxF2t/z0Pw0+
	 +MHVJhCyfK6IZ33s054r4LAg7lTQCd/kX6s6oxK/jbtk4jEzrQTAxvix+OpsK85XSZ
	 bXOx4h0x92dn7/bBQF8JoH03dm4VG413J9opE22tKuJ4wN8GOOpd4VgH2GxkXjtvFv
	 6QQwRvQdJcKdbIlV9xJSUCyb/sHt0A1sRyX0zVWxDj0k/OT0nRukAI+8XnBzuS4XKS
	 5C1kDABrdGS0YkrANP65UnyK6HV72gI1t5Ar6BvS5qmYpe+CcCJw20VSD2eE0kkSZa
	 aZD5EfwfhHoEg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4A7455FF94; Tue, 05 May 2026 21:48:19 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
Date: Tue,  5 May 2026 21:48:07 +0800
Message-ID: <20260505134812.408316-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_064822_709185_A24488D4 
X-CRM114-Status: GOOD (  10.77  )
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

The H616 contains a video engine similar to past SoCs.

Add a new compatible for it.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 818d815d4732..20c430795134 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-video-engine
       - allwinner,sun50i-h5-video-engine
       - allwinner,sun50i-h6-video-engine
+      - allwinner,sun50i-h616-video-engine
 
   reg:
     maxItems: 1
@@ -96,6 +97,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun50i-h6-video-engine
+              - allwinner,sun50i-h616-video-engine
     then:
       properties:
         iommus:
@@ -111,6 +113,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun50i-h6-video-engine
+              - allwinner,sun50i-h616-video-engine
     then:
       properties:
         allwinner,sram:
-- 
2.47.3


