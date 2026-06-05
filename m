Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40AFCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=; b=i86UqKc0LFWjN0VoU31Kk2KLPK
	X9VQo1npx1aDXtpHsNd8u/249zuEakvFmXoJ8cEtQMy2AtFx4X5K2YQhJi9geVy9CoX7fEi8P/DFZ
	l0DF//o+ox3Dk39d3qTqndiJ4BroHNukogJNGp7yoYe3W3O1azVgLvl6eBU0rqD4Y4duSmdVsR+mX
	AVsRFjyHu2jvGGlrw2fWADHh2tVZEpzaQ7Nb+xtoxW6vPtVrn/wNPOwAotMdA9TwCNZHlJjSwMocD
	ftmSXrvmQsiJSvHbiM0kxHCqkgYng1yUayXzRo/46+Uemr3sHfE0rFjQy1W6j1xmeE3HfvYkgVQ1d
	0/tRvR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsF-00000000Yal-0w99;
	Fri, 05 Jun 2026 11:38:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsC-00000000YZa-3ywC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:38:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso920496f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659479; x=1781264279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=bzcnL89sgStHlY4nPWoGSRgjSwVKin3Lb0yHV0BixZuvMutQC9nPMfU5IRjtwkiyla
         enpJXisLuZCCbG+N74Ii8zLyYjWlt7ZsQeAB27NtYpgmlOpx+C/ZHA2wAcp4nUsUW77p
         avfQdJxCodxT8a4PMzMhn6msKAy8zHcN7GkiIJUsl7L3439n/QCOKJNhAwLjnFYo2xwG
         jDa/zN/HJJC1gH0t6IyEFAVH3mGFsWdRVd539P55ycmZzVHKwZmZ/QjntGHsvMWsAY2+
         9zvwWqxvx5vuVyw1kh3a8WT3qBcCAK3maWZVln+IhIXWHq2ATglnWeSHM1v+XZdlOd3D
         DfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659479; x=1781264279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=kO8I3WkfY4AKqwZ9dvI66XRrkaWuDQKBN03RB0IV8aJ3Bc4AkdlQvKprb7x3OsRG1d
         AH93uVs2vwU3g+MceQVtakDWV9a3n8fty2O1XBa7WMiZDJ6+QlHOwF2hlJlnOfYIjQA5
         nP8/fJj3mAt27DtcQHKSDLaagIfiC/4m/e+nQHYwOy++wSZe2oZryVbddVsYXmZfQFbf
         NMIhj6tMMA9M3lgm+Ie3E+R4psFHRbKJ4ZXH2jDAt7gQnntDKaTjMis9sRb1lUcMlf/C
         BKbQJ5Z6is0aQ6i8Ak++ZRcW3u1STux3nORkxIJ9wGJS5W7LPdC6T70TVfggD9nAVLOt
         axvg==
X-Forwarded-Encrypted: i=1; AFNElJ/7gUazOvrWWMc0G/uBUx5p0hEaeoS2FRoqy7a4KqMFgodvLwcZobkf6FCWO5hWpf44ED/fBG9bOY09TxWAyjA1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcn1jAYwRxMBg1FbzbQmkTWRJ3Wb89tmPbLP83p/aDne1ZVkUl
	wMtSEFpZFmqDrLLguKyxNvVmBb9Xs4oflMrTwiPOTwOuXUtLgVEb+0YuS6T0VZM4
X-Gm-Gg: Acq92OH1/N6Y5eDL46qYX9+RXHs9o1/RAqS44j7uIfsOOx6dUVmOce0iUmYEDMuKEeL
	W4kTbgWB/d9FmBqaTKEeQX9Yi2a1fHipXYb1cL+qfKwJ5m385M0sYyp3iSwJPXP3ASZN4lH/11P
	mENanv91o5REXtPH86bh8IHih8rHnK2Oykc51cPM3Bp3foNB+kjIXM8+Hd82zSd1rFrpHFZBvzs
	hk488+OqOKqd1kKbrdTePJFeg9j3VQWyHuoKxX9VqICaeNFg1aL2uWf3JPazeefzJxj8R35ob35
	ShwgRtcQfq7lViNAh9NzJR6BUiW2QA1nhA2OKvEqpaI+QyyNGy0P0qKNfChykeWJ2MOZ7y9s6UX
	vqq3VlIh/JCXueN5ec+Nu0nYuiUpKG66NNbn2ZyMiNQud/37v4hX+fxvw9Oqz0revIx8d0id9yL
	ae8ha0EpSZjt3yZ18synywC9ohOe3GU/OEnI4QqeBYPSyJZX2FzUyKxnsPJcO9IJr7Ewkpm1A=
X-Received: by 2002:adf:ed0f:0:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-460304eb55emr3605857f8f.2.1780659478953;
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri,  5 Jun 2026 04:36:18 -0700
Message-ID: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043801_011754_6124F44A 
X-CRM114-Status: GOOD (  11.52  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The names of the carveout regions are derived using the names of the
reserved memory devicetree nodes, which are referenced using the
"memory-region" property. This adds a restriction on the names of said
devicetree nodes, often bearing specific names such as: "vdevbuffer",
"vdev0vring0", "rsc-table", etc... This goes against the devicetree
specification's recommendation, which states that the devicetree node
names should be generic.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the carveout names can use the values
passed via "memory-region-names", while keeping the devicetree node
names of the reserved memory regions generic.

There are no restrictions imposed on the values of the strings passed via
the new property since the software allows any name to be used, with some
names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
special meaning.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..8e3e6676a95e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0


