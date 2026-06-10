Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E2CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAu6Ul/ODruu5/T+1v02MmQ3DEE6tSOAxC8Avg98/e0=; b=col6D13laP8C/fRULDAeuEVwtJ
	Jk/poRPRsGHHhLBr8XPFjBS2ezmaVoqwQHG+lqnfGFYPOpASE8KsSdKECMgxoyvh69Gp+5pqZmcs1
	v3SeETXVY3tN4TACRSbk4XVi9LcDM7hHukT8MeKPClSF2H2GQ+6zWyUUTceuTl0mpS14eWMId3VnH
	qZXhXLJ2MS+c9ngFhoOe0suOcI7FoI6sN9kD3EWGG0XfL2ho3u3YZOGGjm3QlidL1Qx4kVKi+AdGB
	a6E1tqMbnTvoEUb7FXJx9sKTGElNaEfRQUhl2YfC60h7p2xfelU+2ImkJLQVs33wqLJ2OhkLB5YlY
	rbd9fdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJoP-00000007rU1-42Aq;
	Wed, 10 Jun 2026 14:21:45 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJoM-00000007rOy-3Jx4;
	Wed, 10 Jun 2026 14:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JAu6Ul/ODruu5/T+1v02MmQ3DEE6tSOAxC8Avg98/e0=; b=LwR53l2DDl3h3OEjFM9fpyhnxm
	1oK7VV0Ebo8TIQxkNvtHSX7NNvmjLo6e2asN1SVlEBf5AFuGIvu9dpAet1GI+TxA+ovFes2kdRThR
	Md1M+VaMNG/5dJ6noMknnLV6BRAadvbDZNLxQbX+DpBqnMCEfK9jMRjdod58byutAwaw+3YnCqcKL
	gmrrd2RHGM/UveKXbnoREo74GY33lbBH5+2IaencvbRfjRQDNhAfTJiIWIVFkwGmaEUrQC0YNhAHE
	L/AB6lwhIo6eqbtoewFqwOwg0japnH+s9fdDtZnuhjQyPlEwmPYAkN2egOiVe9h+BpUgiQ6NRWL+W
	FRhksI/g==;
Received: from [81.57.40.39] (port=46646 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wXJSO-0000000Clj9-1VTA;
	Wed, 10 Jun 2026 15:59:00 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Wed, 10 Jun 2026 15:58:58 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add youyeetoo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yy3588-board-v1-1-4bb7176b6826@superkali.me>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
In-Reply-To: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781099938; l=907;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=kXK/54ULP2Lb77CepgkuzvBpvSOu/WuOZfeeKMAjx18=;
 b=EkxE0T53cM7PeMOKfu+Ex9F8rM+N6uZvjL3ZF8/6lI2Ut3eYR/u8HPE6KRdqfpe0ijh1o+nay
 11kM96TfbqhCwbttEcAcdsv9tA6uaWJny2wG10paLkfDgjsx2Y6nI+V
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_072142_994018_93480327 
X-CRM114-Status: UNSURE (   4.66  )
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

Youyeetoo is the single board computer brand of Hong Kong Cybodev
Tech Limited.

Link: https://www.youyeetoo.com
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66a..c0d05ba73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1915,6 +1915,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youyeetoo,.*":
+    description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
     description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
   "^ysoft,.*":

-- 
2.47.3


