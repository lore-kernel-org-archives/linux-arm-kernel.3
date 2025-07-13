Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85175C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNiZDWh09gSc17UD6XGs5p9O0T6ekFI4zm0JXhSeABA=; b=uIBS6dmjsiivGwaythq7UBBhYm
	6+Knxp1WI3m3OMgQqrspszJHOnepi2AHIHEkOemjQoWOkJJNP3RDcc3Kv9vhH4FfFxKxUDBQ8Zk6I
	wMmJMzgF2/JQhqrmG//BL6dJJetbpuX6RAR/ws7GO4ZRgADlCfpzbqWlFcRzZefQpcgYFCUvMChrg
	LOGE7toLn7oEBh+DEitLwJlnjcRkGvcqahizrMZQ1vSRftnte3UsFmKbK9LHP4B12eS3Vh3tdkYDd
	xxeHsE7krkj6CxOFXhhCvZ62rqwdVPztV/6Qq7J543vlnCVHwjByKguhZJEKPV39silpYpKMKmMIk
	3kMPjbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazkx-00000000OdE-3Knw;
	Sun, 13 Jul 2025 16:40:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazeJ-00000000O8J-2j68;
	Sun, 13 Jul 2025 16:34:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23636167afeso31035285ad.3;
        Sun, 13 Jul 2025 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752424439; x=1753029239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNiZDWh09gSc17UD6XGs5p9O0T6ekFI4zm0JXhSeABA=;
        b=MiYU2I39x+kQC5/dBb3UmCJJa3MnwWBJ0XkD/WX31GoxqgWDWB4Pz0Viq1/Qwh5Poz
         mUKzq14xgJnGncqwn77a2By839MNyKo3GP833boMlQymDdRIwttmi1i0M656NApLZrbn
         VjafOpesp14lklrDg0MYUhU4RtiBybvxfIbTZJtgkvw2LQ3KeibUhp+0h7VTtC21en4i
         qPjFey08XMgHNLGiH+TqSHyYPvEkHPW3tYC/LUpS7fCP2WbSiCZk2E83UJUHsjEpG/jp
         ytuvwLTNXZMl6SAE9M1vncsIQKyaxz0jKBExDXi5MLSA2jIDhAYkL/poGIbArJJ4AYQ7
         YLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752424439; x=1753029239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNiZDWh09gSc17UD6XGs5p9O0T6ekFI4zm0JXhSeABA=;
        b=qyIHKbA6DSaSayR2GfPojBvXaXGs35aVJT/8FCo4AXxOdhTKOvE2XJyvukaDsvF4W7
         8gO2Gn1HLmXtXTUuJF+6UaOfEsO5B7hm/uxyAZAc23dfQ8+WdyjXzX8RkwF6q/sMC+BF
         0Po+DhMI+WaIOpbYsI99VXv9/+lQ4kpFsGjtgJU8gndbgpV8TPNfjYS2mRFJ8QzFTQgX
         mZixAM4+y433zA4MQQAtiECoaeJMgXzeSyVWUy+F3af1q8xDCrqns3JcWOwFgRa+S5Ti
         rpWHsQVl9dYwAmfaSO0LHNGmLV0Sic2trHUZSiueEHjYN/2Jpx9ec2oSLpJsye9SCitE
         pOTw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ve9s2kgySL3uywVJir/RsIeam5X/5PUW2m5Zm0HVJq24ApOgKerVVyV2SeM9xsnMaUz5+PbODqhDula9VG8=@lists.infradead.org, AJvYcCWW9HWweq0Tha80UG6HWIcC9xXsIj2lbue3e+Ve9VoxgIC7AkWiNWrjbUtCHhz1vEZlTev+D3AqnQoaWSAonoD8@lists.infradead.org
X-Gm-Message-State: AOJu0YxslwI5ruhb00oyCJ/XwWKxQRynhn17+o4RC9+DxJaMIsu9SEoG
	impk99S9BF39Akypfhd+Xzdx731bIOh+OenYvO4OE4T4yq9chaUKFcS+
X-Gm-Gg: ASbGncts8kXHMF4P4oEML0wmriFm122iJrWxIHiFmWAi/2liNbngmkoBecXHNoLN1O0
	+dv2PopB9bbHlLbgThvmAPktz0amwdJjY7bm0mHJwO3EQYNuvsZkGK/NjjuV2TV2aJYOTb0owvv
	azf5l6SsdALMOw1PSdsE4iTMXY5Mm/qov7sp68UqhMuXlbLciMcvJdl4Rh/zwZ+Dkdt1IEnREUS
	b8eSnoRKnIPsLIoeaHuCnmW9qxpE9zI5XhkfgNJxea3n7gY5F3KB00Rl+T3vLoqubY21HmUyMco
	Wp19bJto8DTL9kzpQC1w/UFQZrzjnpvXa0do9YyB1KpJ2iFWcYHTS2oxaO9CzwZQhPYfcUBbkeZ
	4m6ygpB3o7lAs+tI/X8SrtPwSVYslErWGi0A=
X-Google-Smtp-Source: AGHT+IEdyll58K8RJCfOj/b2BUuNNmUO/33CcfX5HEJHeRRkPpPprFi7Sds0ZndOnIvdOSA08auyYg==
X-Received: by 2002:a17:903:11d0:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23dee292477mr170412915ad.43.1752424438807;
        Sun, 13 Jul 2025 09:33:58 -0700 (PDT)
Received: from arch.localdomain ([155.117.228.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4285ecbsm80809655ad.48.2025.07.13.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 09:33:58 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	dsimic@manjaro.org,
	naoki@radxa.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add OneThing Cloud OEC turbo
Date: Mon, 14 Jul 2025 00:32:54 +0800
Message-ID: <20250713163255.163669-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713163255.163669-1-jerrysteve1101@gmail.com>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_093400_020726_86B61220 
X-CRM114-Status: UNSURE (   8.13  )
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

Add devicetree binding for the OneThing Cloud OEC turbo.

The OneThing Cloud OEC turbo features the RK3566 SoC, 4GB of RAM and 8GB
of eMMC storage, and supports one SATA interface and USB 3.0.

The original function of the OEC turbo (shipping with the vendor firmware)
is to serve as a PCDN (P2P Content Delivery Network) device.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390..e662a6927e86 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -742,6 +742,11 @@ properties:
           - const: openailab,eaidk-610
           - const: rockchip,rk3399
 
+      - description: OneThing Cloud OEC turbo
+        items:
+          - const: onething,cloud-oec-turbo
+          - const: rockchip,rk3566
+
       - description: Xunlong Orange Pi RK3399 board
         items:
           - const: xunlong,rk3399-orangepi
-- 
2.50.1


