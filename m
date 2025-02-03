Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F07C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2eatfBTlCFvmFVXioDEM0J09IeRH7d/6g7gbr6pysjI=; b=Wg9K4eRMZC6GOx
	BXCWZSYvqPHJ8x7YDfMVeS/a2xoOVd+LNV4JBkNGjK/IRE2j+rXV9H4VlNy1gVqul2ORhk7JoR/46
	cyT4OdbOhtSo8TJacsUB4HmLcZrYvjex5MQlPEuq97VrQt8TjUFiLkRlDo9+fwv/iqHY2qbYy0YZ3
	fgDNVFFWDrnBfqVWu7rzJhS9kU2jQJHStey6qcNvqoDPvkQx6BV0eRUa8ZjK0kghAKdUl9s8NMk58
	ZUKV+wpJotsQ2uMFQwCDZnPZHF06gb0OJ7298P0b0n4pBVjisvjubH6iZdvlTXyRryQfE/Hqt6Y1F
	D/iBixwPKk3/EaKMbXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf41w-0000000GfSy-37Li;
	Mon, 03 Feb 2025 21:30:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf40c-0000000GfBN-1u0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE5E65C6957;
	Mon,  3 Feb 2025 21:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24882C4CED2;
	Mon,  3 Feb 2025 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618173;
	bh=k45PuhlI1pyZAkhQxB499IE+3LUgYrC/yYKeKsxVgHw=;
	h=From:Subject:Date:To:Cc:From;
	b=Yc+Yb6e79pQq+/g/JjRXN1MbhgANzFxtPQwz50l4cSHFcKGAfWu7o7WUl6YdivPvL
	 Av9v8YrdHfXcmKpeaXIKRDxXchNkQcHwEqTs4j9g5eGzicxCxHMLJqZen94KgVtUQU
	 RyyAoDy9OE3jT8dgb9W/yvAt8mdH2qMZSSSBqrZiRlv58FVG04yGFmwwMx7YG5YAO7
	 fma8sGXqN5CAPPk2AmDK1RYXcp4bEQzIjQ7VCeianii1ujsaP3OqYMgXAVZlrzRAz3
	 wQZTkeKx3NJTaMOn1UZ61/l2DR4+Hx9x/zMi/K7ar2v6qPNfcIerlmh2Q6zDyVPwGE
	 /oShsVseZJdFA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/4] dt-bindings: Ensure all smsc,lan9115 properties are
 evaluated
Date: Mon, 03 Feb 2025 15:29:12 -0600
Message-Id: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACg1oWcC/x2MWwqAIBAArxL73YKPDOwq0YfkWgthoRGBePekz
 xmYKZApMWWYugKJHs58xgay72DdXdwI2TcGJZQRSmj0Nx4uWikNBn6RSAcdRhsG5aFFV6Km/+G
 81PoBiq6kE2AAAAA=
X-Change-ID: 20250203-dt-lan9115-fix-ee3f3f69f42d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_132934_540069_D4D9B3B4 
X-CRM114-Status: UNSURE (   8.18  )
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

This series adds qcom,ebi2 and samsung,exynos4210-srom memory 
controllers' child node properties to mc-peripheral-props.yaml in order 
to fix the 'additionalProperties: true' in the smsc,lan9115.yaml 
schema. These 2 memory controllers are used with the lan9115 in several 
.dts's.

I'll take this series thru the DT tree.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
Rob Herring (Arm) (4):
      dt-bindings: memory-controllers: Move qcom,ebi2 from bindings/bus/
      dt-bindings: memory-controllers: qcom,ebi2: Split out child node properties
      dt-bindings: memory-controllers: samsung,exynos4210-srom: Split out child node properties
      dt-bindings: net: smsc,lan9115: Ensure all properties are defined

 .../bindings/memory-controllers/exynos-srom.yaml   | 35 ---------
 .../memory-controllers/mc-peripheral-props.yaml    |  2 +
 .../qcom,ebi2-peripheral-props.yaml                | 91 ++++++++++++++++++++++
 .../{bus => memory-controllers}/qcom,ebi2.yaml     | 86 +-------------------
 .../samsung,exynos4210-srom-peripheral-props.yaml  | 35 +++++++++
 .../devicetree/bindings/net/smsc,lan9115.yaml      |  6 +-
 6 files changed, 131 insertions(+), 124 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-dt-lan9115-fix-ee3f3f69f42d

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


