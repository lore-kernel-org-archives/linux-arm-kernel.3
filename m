Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8880BC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i73iHN07Xn5dbQ15hrDEY+QFRLYirRH7hxrF8MHF8eQ=; b=0v0arc2vrwD94X
	E7LnX1npMxlSY9a6b2ePtp6G4yCOo+8csd9HZZQ5O5zHHJHsOAUIl+nidLVDUxoNZrEBiqpYaKi5Q
	repWgusLdEs/Yh00yXoXcUaGwzvFu6bookt1SGK3j081vIjMHtT3ct4ZNffamEas9aGjqTFb1qG6T
	dMap/HVqhAY8QLdbnq0MnAZl+DdO3sQYOzPrpbWUSTVyFIwGyK5sW1yEcthmpQg0XoN97GUJ4/pjL
	oTgUeOayUOwqhpzS1C7oagmeprcbIsRqpYtbUoN0IbRXXWOwwjtLcFoDI1GNw4DuaoLcURYB8Lgp1
	AK7a5VOMroLf5OPRQiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jPb-0000000B4eq-1CMx;
	Thu, 24 Sep 2026 13:22:55 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jPY-0000000B4XY-0cSF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:22:53 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i73iHN07Xn5dbQ15hrDEY+QFRLYirRH7hxrF8MHF8eQ=;
	b=LbcviaqSxqHSmF7WPlr5Qub3WMBvHwWqUNfXcyzATsTziknRRpIqWEuTM3wTkwgIwHE5pw
	s2tf69q9DiEH3xk8Px9Wa6XxcJXmR+77e9W3XZFtGU4c4ofPcMaFv1gDeTHu3Shdct3JBA
	FQs7NhKf+y5zK55C5uH3Cl4XXP65EDk=
Subject: [PATCH 0/3] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
Date: Thu, 24 Sep 2026 15:22:22 +0200
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yTAg6XsW4wE6R+oOT6WAgh
 LtbdfXybd4KyllY4VitkPktKq/RUO8qoKEbr4wSzeCdb13wDXYpPRhjUXw2FtSymGlgumPLdR8
 iBX9we7BDytzL/Lufzn/rdLkxle8Stu0D3tQgyn8AAAA=
X-Change-ID: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062252_409959_BEDCD831 
X-CRM114-Status: UNSURE (   8.09  )
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

Hi,

mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
this makes the M4 device trees broadly compliant with
`dt-check-style --mode=strict`, leaving the same exceptions:

- line-length errors up to 82 columns are left as-is
- cache-related properties are left out of order to preserve human
  readability
- the property-order and line-length issues in the generated pmgr nodes
  are left as-is

I checked carefully that the modifications do not cause any functional
change in the compiled DTs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (3):
      dts: apple: t8132: Fix blank-lines-related dt-check-style issues
      dts: apple: t8132: Fix ordering-related dt-check-style issues
      dts: apple: t8132: Fix some line-length-related dt-check-style issues

 arch/arm64/boot/dts/apple/t8132-j604.dts  |   9 +-
 arch/arm64/boot/dts/apple/t8132-j713.dts  |   9 +-
 arch/arm64/boot/dts/apple/t8132-j715.dts  |   9 +-
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |   8 +-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 210 +++++++++++++++++-------------
 5 files changed, 142 insertions(+), 103 deletions(-)
---
base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


