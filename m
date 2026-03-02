Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C37EE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQjo+UoJ6GqrSx/+PHZueTA6s73GsDeCbNrBq/YqD/U=; b=OAm0Xho1qjhikAF9P1OXTCTc9w
	xEe3d4bxiOmVl5qPslnswzEFJ/wB4tyuAvuPR5JVnJ7WFPIVQ+SQNWMPqk031+fprmFvyDiNZ/l3b
	Wy4wXLbHomhkzeTWSQNhf+ZCcPgfHyfGckoN2Uz2xLlizOm+MNoZgw3Fxby4f14/4B5qMFHB7r+uG
	qpISMGH84oHJy9+T0jzoDRYPGR08iascjUhOyOlRoSC29MB10jlRumEFdffF6FZB6kVBj9jRu/ORD
	lz+QpEsQ9h/wLg7HQPlDgm3hwerQLPTnvI0TVOpnGgZt5uJHxbGyGQAsvakgnOVLU8ShFUI7ykY34
	iaOovY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2MD-0000000CxLU-2nqq;
	Mon, 02 Mar 2026 12:26:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2M0-0000000CwvL-2s4N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2008541683;
	Mon,  2 Mar 2026 12:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476A7C2BCB0;
	Mon,  2 Mar 2026 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454387;
	bh=0gVshRELHMBLwniWVamW9E81/1A4qAcYqA637gtwMmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ghAi/BLPrEay4xwAg+w5+3lpHz2BrAymAywyI2dk9NZLQm/PCuVnYjrxMLBuNU85C
	 r0HtmxGyb84zGsn6jeEbgK0YuPRoFXhRsLma+fCUnhubFFhWWwT/Q3CI3r3cMp4KCk
	 7QCuTBYXnX2zQPMLzbG95Pcj2YrA+yWk0pQdHGOwOQlD+ynSJcz0qGQycyZ4KqHidt
	 I8sbXD96ae4qBRqft6nHIKLuQL93YSoBD5NDK+kVZ0EqDocSvi8Pm4akCT0HkVS9EK
	 Lw8gNogZJfXXrQ1xsmh/IdSnUdIsIJZMTFZJUcE21npQs8vWz8jkbSmHQjSplYExSE
	 VUtctLfElofOg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 7/7] dt-bindings: hwmon: sl28cpld: Drop sa67mcu compatible
Date: Mon,  2 Mar 2026 13:24:52 +0100
Message-ID: <20260302122540.1377444-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042628_829772_B9462D4B 
X-CRM114-Status: GOOD (  10.16  )
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

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit 0f6eae86e626 ("dt-bindings: hwmon:
sl28cpld: add sa67mcu compatible").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 966b221b6caa..5803a1770cad 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -16,7 +16,6 @@ description: |
 properties:
   compatible:
     enum:
-      - kontron,sa67mcu-hwmon
       - kontron,sl28cpld-fan
 
   reg:
-- 
2.47.3


