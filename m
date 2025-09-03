Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C42CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PERM9NW9/epjauAQ647nr1Bnq/1hfYwv4hqg012Ys6w=; b=UgVNH9ZoconHzQYPW4SbE2Qz6n
	xCxIA2JccTxAPzpCkBk4SBf/3Hw3WsyjGTpw1yGTGrJ52Mgy1/z6gcGh7/FhzgJ2BOWoY3EjjQhvk
	WHBwbrh1L1aqekgfA4aAgtZisswjoQa9O7qC9i4lts1s+ByhQzNLz785Qzrc7+jXF7yQT4qkO35ee
	2qdccQ5daM9EyNFiHJU4c1v4I7hMf6u2R/0sXBacy/4F2imGVSKcMCouZb59FvTPmiAhGeqsggsqp
	JRN+YduD5Qfy3m1brbdQDyT0guA7w5VwiljDQ5WVRYQ0KVAtsXfJ1LlgUo89atG9zqfo4Qg5rAxwl
	r8akQqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRI-00000008FpS-3iHH;
	Thu, 04 Sep 2025 02:11:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwNi-00000007qRE-1fgu;
	Wed, 03 Sep 2025 22:55:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24c7848519bso4623935ad.1;
        Wed, 03 Sep 2025 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756940110; x=1757544910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PERM9NW9/epjauAQ647nr1Bnq/1hfYwv4hqg012Ys6w=;
        b=Ta0pdnxUkicU47uzT3z1gJSddF4rnS+vw0RUEqxRNg5t3jA7NLx9z629ycgstslSBC
         L8DZ3lGMw+JYzwp1+8N9KNFoCfX4i68yeZ8G8/GnQLEVwjsHYpTPwSxf5UiPoOkI4j6o
         q/qX1xEJiQ3oAwJ6SRDXgFwApDDbVpxQk+xYgcV6Djnp18TLhLQNFu65+dl2IgSu31V8
         Na6L/ifMQa9innFMpxYNNDGhGgxaCVqDAva9iYouhGwkUF0NT54EwqEpOwqLJLFlhdl1
         iTH5UWuwdqXjepcR2b4/vNmHyonF/ofMEOa/A5rruvOy2H8vfY0Hd0R0OTFRfXSbCGtB
         a1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756940110; x=1757544910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PERM9NW9/epjauAQ647nr1Bnq/1hfYwv4hqg012Ys6w=;
        b=PVfFN9PoKzBveVWS16JPQ3ZMdlbCQ7UC6Bgp6HwpMmEL5Pl7tYjZ+2TWGSpastNwzV
         /T3ZNuVX/X2RwNPP4IFNAUxKX0NURjFFEUH1m+fBPk9nunLY0G9gWpcCgnCXojVKHFsT
         OdHA48sY71Tkb2OsNiP54C3DdtKJETmmSLGkfY6ybMRQopZ0uRMBXe2oBZEsU3d2lokx
         K85MRPwnxczf/zmr0ypjhxj3LxcPCD99hxtSeiP+PrcH37dEPV3XFSbeDD++ol80rgLD
         YIAleq/XjtvqMzijmCkOUQyUSMvJ2jSwFZnt/PpSPbfEne4OmJ1BUpp5EmCJFWjxORIO
         5MCg==
X-Forwarded-Encrypted: i=1; AJvYcCWNONn86jjncYwbgvlXOk+jY+1JekAq3NY3nb/w1WIPNY+D1gjI40og//yWyTnZxNlFwAhPImMx8LWR76Y5YLD1@lists.infradead.org, AJvYcCWhJmiiqlvWWMWAKOu54qpVkmCoE7ECOn90CWdpHb73hy9Wpp5CpdStfRVqE+Zb9w0ELZMiQcLn8QFeUBHJZPc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEWFwmceMKIfi9Btijlmvbht7vIAIILysnm7DITfTrD3aLXHPo
	iY+SNpP+eOEd+k9at9jKnu9oHorYQnLVCOd0WWArpwYogZgNEoEj0Ns6
X-Gm-Gg: ASbGnctaPfKnU0Q/NJxkw1QqsuDH6qVrs2pR/GPyNUdY1P3m9MdTA6SXUhGq3+dloIU
	rItKTUV4afyuwOwMctgrLP5ogI4u/xafWJbV3WoBQwUzY4a4RjSI+Kiz3iiEmNuCEEWZ6kRJzKR
	TAJDd5eRiDLWB0dYEhYAJiWGZ5qYhFaU1caVZ11RGA2bVz1uqy0/tYTZxdVxkZZGWFUVwbdthL1
	uC2efALf6ZzP6BxqAdK72MmZgGi01xWh5kb2Ue9LS5AtJH/pnPtBE+9H2/YQGX75dGJqf0A2VDT
	R8z/kfuHcQLd9O7NSTz1xUvoT1b8Jkwebf7dtX1/GPjd16A/fQWlwsMqEB7+1UYfHo6wb4eB6SF
	2t85b6vxbGSD5jl8bFUkvNNVITF+zY1q6MdgujgmE5aFgT7U5JgXhvMryx4SI32YX+/oS04ngpE
	Ip3yfUf9hatpriHC/lnd5B
X-Google-Smtp-Source: AGHT+IEsF/meH81c94jigsHRiHn2Bi2s+9U2J/0U2y+3EgRD50sJHl+AM1/5H0vpGBx0GalxnBVwlg==
X-Received: by 2002:a17:903:38c7:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2494490485bmr220520735ad.25.1756940109605;
        Wed, 03 Sep 2025 15:55:09 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com. [34.125.3.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24c9c2b1288sm25505435ad.106.2025.09.03.15.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 15:55:09 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
Date: Wed,  3 Sep 2025 15:55:03 -0700
Message-ID: <20250903225504.542268-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
In-Reply-To: <20250903225504.542268-1-olvaffe@gmail.com>
References: <20250903225504.542268-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_155510_434606_561406BA 
X-CRM114-Status: GOOD (  10.18  )
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

MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
panthor.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587..7ad5a3ffc5f5c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8196-mali
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0.338.gd7d06c2dae-goog


