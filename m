Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8517C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbr9LxZ8oLYQtQZeLsWiC1BgbCneFfy6mUnSJzdKDVc=; b=K3G4pyQ2+iz7yaTb3xEAp8KNjB
	HIOnO3Yt8cUHMh/wX6l9vtbcKx4udyhttHtES5OilIm/VRvcMLN2iKcqn0+Yi+IQksTQfkQzTRw0U
	DCdzpRz9xqai6Kod6H59SGrcVbo8aWz7XYtkm+oH2nEpTDEKpRL2ySqwGUyP+f+m28g6N4Ju4aLxN
	iRe4JrwjpgL9XHR9GzlRspUJQo8d7NAmDl42KECO9iMeLzuXOTsFwXexxp7M5awIcdHNIcyLL7Dgj
	JeyIWboRUAlc/PbetvAaSomp/MpdS/Yw3m4nzbdhud4yrbp5x9wzexGXefxkyg3RAxFRO0ND5UQMm
	cRW7Y2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5YV-00000001UTd-3IKj;
	Thu, 08 May 2025 18:01:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5N4-00000001Soh-3I9V;
	Thu, 08 May 2025 17:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xbr9LxZ8oLYQtQZeLsWiC1BgbCneFfy6mUnSJzdKDVc=; b=Ra9CFLjYC1f0Ib4FWo+Dkdaqco
	A1rmu60DRFwfZ8OGNeq22YHzv4HPJRNOmdGGasn7enjs9yYOt+cr5tHDIABUXvxEWJ+g0hG82O5++
	5AZxA9ySjNaj1BZi68bZ6MoUMH0RLq9AnrPJ0J7T88v4K3tTs/b9Cb7wjNXy7mBmtlHS5PacKiwIN
	RBfSxi5SKjYvNURvmbFhIs3dAsO0+i6Oq3v8+wB7GwaCdA6bkAHGc+vR/hI17byUWMRenBKOsT/81
	PYvPXk8z8DmkH+TkNDFq81BaLZ+n4wKhKXLL67dxLIm61PiB3A5yIPE7RmYmt/W6/jfx+Vt0nRUca
	PKcVb+ug==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD5Mz-0000000G7jE-1J1I;
	Thu, 08 May 2025 17:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726548;
	bh=p1iaRjJi++EttsIqZp8D1e9XjdEQxDbNLYDz++43A88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HCY8NoptGHlgyc/4ekwLnq77520THngO0TiY+xwQFZbCh13pszg+BODakuNpu27NQ
	 4zGUGXpvlYfEaI+ITt4SthKFhKDwWOcXgWSnnTjyRnr2mpOO87LaPQN/qDFRm1SP96
	 I/AnlCN8QjWd6+SuNz9xl/pMj/iaYNQyecvFep+7g/cx3GMMYIISMjgUQrTDYYu8Ud
	 Lyd+7Cc4E2KagIyJulsHrD+WzpuHP78LF9AhV4NxdeySJAfSaT22F1gHQbFpYqkhAh
	 8Jgw04Zy0303u8+kCGqYqdKe7shR5is48szx3rK6eW7bDxp2y9xV0Md8DuVtHuaz4Y
	 HdxRc+GSCHZxQ==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6DFD17E080D;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 71B67480041; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:52 +0200
Subject: [PATCH v2 3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-3-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=sre@kernel.org;
 h=from:subject:message-id; bh=V6ouydAMjeLLipqGubBKzuYUl73fH35Zk0yjK7db6K0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pP/lcxUraZupIinulSaseR4T++TCK7mG
 vRYSzu2XWhRRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qavGYP/RkPQLOkNBmorCW9tusVBfKJORrobUzTjxPoNl97lWZfTiuAOuivXqGyO41aqftmMZy
 BweHRYWm9iIGJa+woikrjQvQLyNZmhSqtAHL0ZqVB8Wd8bW5S/qZEqNOQ5/kkIOgG9oguuxa22B
 VzNFv2Uz/f5My8y4AGwQCtLbjNWwoWq/npHfjtC/nYpXjiPZRnZFOaQiPED7Zldh0UgyeEilhfA
 TvxIDy+KjEeam1IgxFkY/gk8ND8RRBRH1rEfKpP/QrQK2afsr9XGQwS8DYmnWQi0zXSzYZek0Bj
 8Em0f5BS1Rbv7o+KXutI+nfKpvDKWqNhQbyhBkW+mEBVsausPpdu+Fu6B2wImx5jlrV4cfdkTfO
 XAinmqP44GVqe0zJHukc/LJUfEdRQze2wj+LyTgluPe+gg9b/YHRpM2j13Sig3eTZ+KxDCgUipi
 xEemssYBY5HOYo/CUPcaxazd3nR7Ux9xGzv7VgiqCM6DeeHjJL2w9131ibXAwcZX5NdBVGkc0k0
 0sb41bu3oaLXr48YLQ4VsL5rzrDKp3zrP85bK+Vf+INRTXadSyqB4ef9CmFMM+x0WNtLCnhEVTJ
 QvxYThhSFJg7PBcz5xzvO81KoGDQnieVoVjhkKDp1jG39ecU5QfEi/7X6gLQViaiIxyjH43H0LU
 vqws8+kyuegFDBowHlYQs5Q==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_184919_122068_DC4F8A75 
X-CRM114-Status: UNSURE (   9.25  )
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

From: FUKAUMI Naoki <naoki@radxa.com>

The Radxa ROCK 5B+ is an improved version of the ROCK 5B.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b777bca5ae69ca8644bc41380b94272..8f324417a3bdb3f5e11b03c86d18df4b6f60a43c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -946,6 +946,11 @@ properties:
           - const: radxa,rock-5b
           - const: rockchip,rk3588
 
+      - description: Radxa ROCK 5B+
+        items:
+          - const: radxa,rock-5b-plus
+          - const: rockchip,rk3588
+
       - description: Radxa ROCK 5C
         items:
           - const: radxa,rock-5c

-- 
2.47.2


