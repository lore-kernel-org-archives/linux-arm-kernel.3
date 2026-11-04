Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHfHLx2G;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEYLohFI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KZ+cSODzQCgfcBpl6SVJcEIqMlZuev5QB51iLkiBvrk=; b=NHfHLx2GbIPKXt
	lWHumgcWMLEvYGPJEXul8tGSGTpYNLRBHx0anAWl6cOdd6D1FUYuPmMgnFkUtRMxFvJJEYQIAGqWM
	snqVkpZJFCEh5ZnXVvRmPh6lhfas7/AXw1Whp8WLPkFf2bzN+yHRo4CguJXLKp8MqP0pHle21XK0O
	eTLK2bEqPD/ewxHAU62LOG7KnAy+1hgZxeRPC5RLxlQPkCanc+Sny+XIXQBdEhpFkNbRjTyF0+is2
	QJ9c87T3UqUiI5rbgi630Z682+LBovTHSE69zDuu6piwe35wxWJzdh1jxSdbCRBMQ2eCbg+JsEZSS
	N260fqGAx9gi+U2za2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcKR-00000005gjU-36GN;
	Wed, 04 Nov 2026 14:51:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcKQ-00000005giN-0fFD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:51:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C64443A58;
	Wed,  4 Nov 2026 14:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F001F00A02;
	Wed,  4 Nov 2026 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803864;
	bh=KZ+cSODzQCgfcBpl6SVJcEIqMlZuev5QB51iLkiBvrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hEYLohFIYjvoBdLuSxCMYOa4+tBioMrRKoOn0Zd/jT9g4EOO9QpvN3p/3FXAzgWW7
	 esXIGQ1oM+hi2SxM1uYJjXqyN2OPSeovFr/0lU4pVqFY/8ztfaE3jYExzg7uSe9hgO
	 MLQhcygksG9R/0WGsdFcJNb1PMPwjMOgyqY6kai8bdC4in3FmxrdWAQpy9U7a6N+zt
	 5PWPnK4J9IzvBj7cL2QpmWMT7SapiHZcNgIhCVc5+62SYGL8qtgdkgqsr3Ni/+ioxM
	 PC+7Ze1AJyXio77uxs2uHyEKkn+IsTCkupZxreazy+ClKBmUnFbt2+FIwd5SedbkL0
	 kTyrTfW2za8lA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH] ARM: dts: aspeed: Correct white-space style
Date: Wed,  4 Nov 2026 15:50:44 +0100
Message-ID: <179380380617.180018.5035897143826922583.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=569; i=krzk@kernel.org; h=from:subject:message-id; bh=Okt3ZSzwnfGvkN/VPRaSt/4uaDxDFjo067Mc70YUqJM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60ZFEdlmY28ps779HHOvpcaFb5uiI9gKS045I q3cX4xYIXSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautGRQAKCRDBN2bmhouD 1ypDD/9LsvgMsAEVjEmkOYZG43IflZC8TaSgHFnrB9O0MF4d2lGoamHBT6Bm8H1ACULZAiDjYks cKhZ4tqAa2P11cQH8yKv0P9QaaPAgAOUqag6s5vOPWp0HcGwCMM8wDJApnzmU2sZt/R4un6Ci/4 4OAoFgnvBgTuR3rkJRYScsD4u408LCTYlPVgCU8PZPLtmj3Q0DaXViKgACYykdG5AcuWGChkRbC XzRmn/sJaypEefZgzW+fTOt2zBN3vd/KcN86z6NSg/p6/DI/PL6+Ca34ZF8eyZZndpLmfMeHyNt sd9lWIRhWp5qj/L5yWM7KsDzoHS4FT5wHK2xBAeTtjne3xv6L2+Yt+CRm6w1cP0f9zqAH0uFWqH ul0DSI35KfxCQRSHERIer1YkvmR1Xhs/RPL5Mz5zxjgq9quXmOvfnq5KTft5kS/U+3JCwTOvTHy bQ3DwEcXTuKhDqSnk2ycZbE8wDSAQxu2Sr9tCmp83NWlVhWrZ7P5lbCtPkngEmfVGgn9vqqgYpE ZX8P/VOgAzGVztGOykoGjyDr2jUn7D9k3j++u2KnA+BJYQsrD5qZYxqXhoPiMkwPqHKdxdQax7D EE/N4YHwQPlDoBxPJIfcWnTHI53FhFWKJMzUUTU+uRyN0euIIN8yQLyNUoZhGAeRE2cC/NSZCVK jbohlvttijpc0q
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 01 Aug 2026 23:04:38 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

This is waiting for three months without feedback, so just picked it up.

Applied, thanks!

[1/1] ARM: dts: aspeed: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/48481f2f187d2162c89c324c9ead4b6351ea9b50

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

