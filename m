Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD54C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=2ITLhoRmLbDgk1ZbFTDuuAj1BF
	ooVQ8XG+7v1KTgOWaCyVBZb+aMONgJEzattTcl0wMvUyLcOCzwQS2eWsduZBB68Q4G7yTLLoiS5nF
	Lqcpqc4bWrcepObvHQNUxnr8I9Kcu/qK0AZDlPhM/KpzmSxbJ7ZScd+rYH63XoyrTEmoN1QHvTEsn
	Z4cq+Chs9VSbRn5PHsww8BBuN8XUf4yZyZiyBoAEuVJGtCbGwWHtSxALMjCdz4inslo0opxcdqV5l
	K78wYLE3bObuxrS62TDmwwfXFHbvQUKEcehMaBcvrAuABr8agG2hwxmw8ZUtq74Fs4h19mkhZdrGg
	lRg1FI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJl-0000000GXDw-1Y12;
	Mon, 03 Aug 2026 07:42:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJi-0000000GXCo-2xO6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2811891f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742953; x=1786347753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=CMznL1JnEU411MYJwCqmNMKC4mFL356rDBnpBes9seycqGBc29HAOQMbJocY5kaii8
         gPg+wKZuH2r2tlYOXLzjHuG2JBfsJXpQFQoQGYsK2ZVvVyzvzy6Y0+1612YSZUTQner5
         FpQVWs0k5ss4cNwRHfww1O62KDPSe9wWxDOaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742953; x=1786347753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=AumdZwItf2E9cdvpHvd29peujFCl3HBZyvwDXlgLcfrvxY6yKq/+cbHnoFnQ3k5WSE
         csETq8hCnzg/xAL5NZlsCJQvAbwG+sbZDgGUVolJDfjJHrK71AcvqgArcUbkpCA/f3mJ
         AdHzSs0v3EEEwUlg7kV2dVS+3iqyrjdoV2PVRQG0P2Qh/2zinFRU5Q6aQWrjbLcWjlMs
         7tfOIMGkcWuZkpO+MUFCM0je28zJofptyiN7sVHOVf99qlUBoCgX2g5HcI0pGFBPoiMb
         +J36ZSxd0HwvKz4X5KeBafEAe90cMsC7KQH0JoJplxGlNlSqurpbpzykYMEHE6iznsBn
         fXbg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi2AuQ0xSx+Xono8R5YS82Dk3SfjTJdlQOEzWH8FmopRZCNBqKD7Shivtuyye16ilYA9x7rMq7zVZeRPH4BDbq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg2sMagQ5uq3Rty55WGPJyW1UYH4o1TyNWuNVJVC6b/1CDA/rp
	9M13gUxizsWf+TzZRUnPPSraeDXHq09R16GovLWaFjN4djpeuv6QuswkwNa/fpQCtDU=
X-Gm-Gg: AR+sD11+q4gAwp23CD63Nfl18/t4q/ha29zV5sITeK4AoYeVlAY2sLJ+8g+Ioy9CndZ
	cLIQlMqUq4QA/O3st7R8LIfve0OhwxWfllVH8ZLv3Jc7cvi8Tp5TnrUoNTIMYE5iffIAaqYr3Vf
	5reWZEgJvOkL+6mI/GHAirzuOrMEcFc4d+6FqGDQOu8xpH5OWE6bYHPs1IYALPLuHDcJRQW4drK
	7xThbf38DWD1EdVsZLAQdQ9Gmy28K8ZoDNYYnjfTyB7MLUrD5X+kK0xovKrmwqhz6OqCZdqMufa
	46M+TveP1rI2S9g0wBQIVior5WrD7eqYGPAMMb9S26ZF+3AsAqbBERTd9x8rEFULYJVkEmUWV/L
	NKrzaeVHsERPjVmQFYiDFqKLAauAhpd1J4352vaBWhz9C0mqq1KWSzsVbSwQuKpv1P5mf2N4Ko2
	sgALMumQxSP9RVQHsgCIpKgbbAdzNzpiOLtaj1r+e1e1PJfUAS3nWZQtQ/L9fX2ZCKJYHUifEvc
	EKc0WZOLKhyrg75ikJDaj7ymSEiEdpvCYk7pWWvC/uZm6n7+nY7QLLO1KvvvUru6tlTuyERVrq2
	gR2Ah85cz3G4c5lD5AjQ9GritLnBTYEZISaD3r5s5au0FGqtDsywr9Od1sFyPOtg
X-Received: by 2002:a5d:5a04:0:b0:47f:6fe0:294a with SMTP id ffacd0b85a97d-47fd72dbb97mr15447164f8f.23.1785742952786;
        Mon, 03 Aug 2026 00:42:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  3 Aug 2026 09:25:56 +0200
Message-ID: <20260803074224.3821911-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004234_763844_B677696D 
X-CRM114-Status: GOOD (  10.19  )
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

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0


