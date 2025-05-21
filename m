Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0104FC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfSlDXGfeAz5lznOPSIhUz7mRcQCCxThy6cuyCkDSbg=; b=hmhs8ObvagFFtcteWayuKPmWW4
	QbhN+qKCcJfgkq/lcaljyKuja12m0BJYzyE00D5K4IKHHXQ2i/gx1vxoQwiu3Auz48kaFE+JVyUA0
	ZIcJY9w3p8D5ns6GCnv3VACC+MvqRA3rPCRrxLtGuiQd57U6f5K8jwWjLl9UiCz0SufjISfNt85k9
	xpT7dvfnaZYGHQWFGQ3IdL5F/+IYd2H6rgRYrBDA/+YlTRhY/CmGi2HzB8q0jKl9ad7GMYwWPjmOm
	1JzoDoYR85Wzf/n+cHZO/dbruYoQIR2sNfAdQZUD/WeGc9U9h4w0o2EFUQw6n1icVeXJ5XJkDCtCq
	t0rnoqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjrF-0000000G02B-2uPS;
	Wed, 21 May 2025 13:51:45 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjFZ-0000000FtZv-2zC8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:12:52 +0000
X-QQ-mid: esmtpgz16t1747833076tae521dda
X-QQ-Originating-IP: NRDtIp6wxGHIj53BWIcJvNUAWwQhM3ael0y7Wl3X1ko=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 21:11:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3315312418809293864
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Wed, 21 May 2025 21:11:06 +0800
Message-Id: <20250521131108.5710-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521131108.5710-1-i@chainsx.cn>
References: <20250521131108.5710-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Mn6sU2dhbGGPC1wUTtNaGM4CXa2bhqSE9NCtR3p+lGlNwOqAc25KjFdn
	GmkeiquJlnjgJIngVJZtfUNpWGVhuL2w1h6mNouqqHW+Ir36pBx06LLq9NtctnP+2vXWfh+
	qlMj+thqW8eYIyBVWVzUeF9K4H0eUThBKhgX+8OKEb6sEzKkPhsjPqWxYWFwpfXLxY6BPzl
	55T8lUI3eqgzIeGXfGknD3131YP+w+VwwqETCmEwDAFEk0ph2CWHic1lfLCGqRLbXEzzqmn
	n169purm3jPjyuWFmToR7BPLjbCeSwGH+e5RpfQYkBlZX/ktToGt7sGWEm9sVV6dMBgrijK
	DMmXLJbrRZnediDVElTUmihmw6ySJRPY9XOgM4o4Hnb7/5MjuF/4Agl2bOOcHVcLTb7RpQN
	/iFleaFlEO2Ol1Yz2m6e57woqNAJJa8IzJtDPFBH9iTlhPlls2JgJJubgGJp5VikgEJ+BZp
	1nvWEPQWEnhGo1LhAtl54vkWpvbbmu0vIyFWvZZYbx3N4DUriZ65N81og2CuZ62WkhFYfTJ
	KaqnnNIbDY4MD2ExxLGR+WU+BZi/csjqFnwRjRVOJHokmQWUU0Dkr2xj/m5thBCewGdsSXN
	6eSwbmpF50Z9CD2FcuDpIeP0IU3V7FYU3pkzERaIWrOXqpmJUsOfd1hUZma/QouBrKt323D
	zVGYw1wRLvKkcyeh+VIRyI5khtaCuVhMuh9I+2xH6nNckvFy+oahwrZeIl5gRja3XjMGMbU
	eOXauMp1Lq1YOxgj8IGohttmla2f2gkG+TkXpDV7xJthJP5FoaRkUdUhS1Tui6Xge/Z0DhI
	9pGgoyi7FE3wgpSu33tLPj5g3iYPUO0CBB/ajQQEtz6vJlNWBp15me6OucK0aZuUyoga9p2
	cWrWeVcUWDEZEwII8NW7ESTtRL6f+9J9CVChP2jW290C/xcQjOMvg6PodEcg9YjxoVkhw1q
	Shz5PtrzBKIj5tDfaACOuM500yXyKuOountNNLWbFWPXwX0IbmaB/jzXVdffzYUAd9dbwb8
	pBCo20Zw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_061250_242249_E155CBF0 
X-CRM114-Status: UNSURE (   8.27  )
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

Add vendor prefix for SakuraPi.org, which produces
development boards like the SakuraPi-RK3308B.

Link: https://docs.sakurapi.org

Signed-off-by: Hsun Lai <i@chainsx.cn>

---

Changes in v4:
- Fix vendor prefixes error (Krzysztof Kozlowski v2)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 3e7450c3f..7eb2e13ea 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1300,6 +1300,8 @@ patternProperties:
     description: Recharge Véhicule Électrique (RVE) inc.
   "^saef,.*":
     description: Saef Technology Limited
+  "^sakurapi,.*":
+    description: SakuraPi.org
   "^samsung,.*":
     description: Samsung Semiconductor
   "^samtec,.*":
-- 
2.34.1


