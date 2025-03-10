Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05255C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE1sTeqM+1AGfrmmwn3FDyVaoKa/iwOIi7NTDRnQcf0=; b=ZL1CK6K7V3HBvT0V7YZ7Rg/UMc
	6GbrTS4FxilaIb5Pts0mvCLVEkt+VoYbCUzIyf8feZbFg135yU0k1emSCad+Cc41ULHfJCd7mr2hI
	yzD9NPAMJAdqQlkxPa7ZVxbhJZcmH3dGU0+FEw7juZQh/wk2eoSbnuqkjK+4sDrt89RGaEeGrV7SZ
	/rYcHOSp07+O4ghAsQguHLH3wcSijAvnFIgUiqCGumGBTBBKg0THU+Cva74taX372AJH1PE1B+hEv
	nLqOHmYrQdne8EcByv3WGzD7raavr6jL2sfgGKztSBCihelxxapQ4mu8BJyPtjOI2GilKokqP2NVQ
	jBaIcJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfop-00000003KgW-00op;
	Mon, 10 Mar 2025 16:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfMY-00000003GqY-19PL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 15:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AE1sTeqM+1AGfrmmwn3FDyVaoKa/iwOIi7NTDRnQcf0=; b=rV7dkhD1estHZdVJC+MpmWjHE5
	QwI2LyIpRVqBioa6oBiYWaD9fVl8Ol1aP8iER9Kz545ra3oiR/mghDbO8MVNPF1oGSG9XHAWqNHke
	gvcnt0QXuDvH0QOJW+uPBolC95JXE4ys2aXIAsqmygg9GhAvWQVyf372BVVlcwCn+9hDmMpJfeLmH
	2SNtVgFFunTGkYxTuUFVbPImrdythyuNpDUrczGgde5Js/AZSVHwl1M8a9X6eHlFYPv3/2VvHNK9t
	RV3pNmmA71NXIGlOTaipx4LlgFXHAVhgumirJN/AK/W+NTsqz9fnGIcbYSP+Iv4GgIlgXWPIp/5+P
	RrxCbrMw==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfMV-00000001tcp-0ZQ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:48:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so898a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741621692; x=1742226492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE1sTeqM+1AGfrmmwn3FDyVaoKa/iwOIi7NTDRnQcf0=;
        b=YUaEuupNtr5PsLT3D4UxQ+UMSvrgum8293ieG2oIqQsSnq9j5zHsv5M0VRpgxq0EI2
         JXBHlxu3UQ5zwCTt/ZZ1dXUEiaAzXAvT8vql+d3VhG46c3klucjXMPVGMSSJ9WS8tXmg
         Hri/OUUQlAcZvrXmzV3jQ4FpZurkmlJhradWNU6spRz9kAMKRoJfLNwHL0+2ERus75tl
         XexrvApg/HfEb7EmRtvFWKUjbpYtSHPPA+T9waFa0QSVpXYZGJiA7yN5F4hLPxA5eiJ0
         FQknDPVaGuzM75yfgIhWvhPPeWf8yw/9ATOjPJ591P8FNpQEqiA6MlIwlAoEhefNghW2
         tWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741621692; x=1742226492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AE1sTeqM+1AGfrmmwn3FDyVaoKa/iwOIi7NTDRnQcf0=;
        b=v2P87JVqGwkUKl9Ba3vBlOGOZ2G731/2UMx0Wxc4+9Y2jG9AQ6g+wXVpy1wlE5g/7N
         BeOZOBGr1Nxd7SxTJ6qSK3lmNSdaLJe5OU0P/TiRjkKL5915aqU9yXblbSGGpAWxWAxg
         EjuhuNj2M5D8XxOsXtnIwRo/wZ3/TvGneSjFUQqMm7h6bivTXOibhHJfOe1BHunfEosO
         IwFPH3pNr7964uANk+ioqBX18jatVLNaRtMPYerK2djyV8Fqx5rPN+YFcUiJ+pupkmRZ
         UwuCOG1M0FX3Hq7kJ0KXxk6xRdZrH5jYe+imZtUqwAskwDLnNERxSxhqgh5b7k4+MgWz
         Ub6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3AaJZBKUjjZJJPVT+cPpPZo0Skv5xZqYqpg/N6BtKXq8OV58feCAHVWOULLok3sJjrqWbSa0Syyfpzjsxp3Ic@lists.infradead.org
X-Gm-Message-State: AOJu0Yw244V9VuG5+xT9tTiz+bTst+01Rd+znkyO2jayLREHBM1l2q2B
	ggoHOWucZy6yChLgSQerjlgME9uB4XGXw6L7xmLAZA109dKimYXQ
X-Gm-Gg: ASbGncv36Pg73z4JGjt4DF6Qm3bVEJvxX8/U7E2LgMQJW2y3zHvpBiZ1LOQARWskzC6
	TBov7DxzMlU6oqGNWR5rVLsXTbo3CUxCiBV6O6Qbc83v1kc1GuuQV+++cCprOiSD6cbEaRneiFd
	ifJ1vzcrOVaMisulugHx0MOJsuLskrDE8dhJlTKHWfWDgH0Q910V+iQTAYRY4wi/WlMIYCydQi/
	N24J8UX9ORD50baGdc02shI8TdMHEFeh/mIKX0tzc7Wa/xZ02jeDOKoMJwFEBLIgSvAm17Hmse6
	OEULCL7xcqrRgSFt59QniG7dj8+Ht7IQ++RzbuublPEGuBBQ9Jxxu2GZiJI=
X-Google-Smtp-Source: AGHT+IEn29ZIrELth1vqpMB17cSDSf9zSUtKS9md/Y6FhQ/FeXOR6GLoNZVchkEQaWPlzFBlIxy9Lw==
X-Received: by 2002:a05:6402:3513:b0:5db:e88c:914f with SMTP id 4fb4d7f45d1cf-5e614f1f459mr10527894a12.4.1741621691847;
        Mon, 10 Mar 2025 08:48:11 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766d0e0sm7252732a12.64.2025.03.10.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:48:11 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <gradenovic@ultratronik.de>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Mon, 10 Mar 2025 16:48:00 +0100
Message-ID: <20250310154804.326943-4-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310154804.326943-1-goran.radni@gmail.com>
References: <20250310154804.326943-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_154815_283293_91AFB225 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Goran Rađenović <gradenovic@ultratronik.de>

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Signed-off-by: Goran Rađenović <gradenovic@ultratronik.de>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index b6c56d4ce6b9..2cfc08430a87 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -175,6 +175,11 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: Ultratronik STM32MP1 SBC based Boards
+        items:
+          - const: ux,stm32mp157c-ultra-fly-sbc
+          - const: st,stm32mp157
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
-- 
2.43.0


