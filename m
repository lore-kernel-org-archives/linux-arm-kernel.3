Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3F3C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWzy9f37TLLTSuTbfCAgfOB34y28JpT9kZ7G8h4yvw8=; b=JPe93mGl3UgRZjHD/Xtq0hRWt4
	09kYSVkCmv6Ds3hG/U1LUA31GyyAZQ+CjTJWUcW+nJrv2s9ZmvvcpBvmpVbHEuq333CYYe4N+a8LY
	1dHR7I3dvOAEBI0N+t/ItrAJaruWSdikJiwfzuut3MvnqRYpzGXpIA08eapxhgsmeenTrOFjmE2/9
	BZv1uj9VrqvSx7cJcPZaeMEquocGTvdbbhPrRMVSsvXV+lV5oEP/CBDOcAmLuL+W5wS7VDBz1g1aP
	0UICd2H/NtNq6DXTmLmQipx+KadlqlMrz8euaASmS4Wsp+o+O2wJNo/RpVH6BMxZQ7+M2yIWjsmKi
	0YBI3Yyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrsa-00000005mX7-3SPr;
	Tue, 28 Jan 2025 20:08:12 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrpv-00000005mDc-2s1W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:05:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=UWzy9f37TLLTSuTbfCAgfOB34y28JpT9kZ7G8h4yvw8=;
	b=QkEZEdJy/MewPk4aziDZQx0BWeIO3OTmSh4rZxA68MzuJYt+upwY/VZXppqsug/aCSnEJtY58b7OuhjBf8l9frogeWWtmYLrFv/Y0H4dk+VxX7ayaqfAmhDAtTAd/U++gDbsfwJpt8HeV0mlce0BJsDsk7a9NUBqO9AN+2+rTvY=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Tue, 28 Jan 2025 21:05:12 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
Date: Tue, 28 Jan 2025 21:03:50 +0100
Message-Id: <20250128200355.1948997-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128200355.1948997-1-lukas.schmid@netcube.li>
References: <20250128200355.1948997-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_120528_019779_8C23925A 
X-CRM114-Status: UNSURE (   8.97  )
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

NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT, or
Smart Home scenarios.

Website is still WIP, but the Links on it are active:
https://netcubesystems.at/

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..499ab972f9d2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1031,6 +1031,8 @@ patternProperties:
     description: Neofidelity Inc.
   "^neonode,.*":
     description: Neonode Inc.
+  "^netcube,.*":
+    description: NetCube Systems Austria
   "^netgear,.*":
     description: NETGEAR
   "^netlogic,.*":
-- 
2.39.5



