Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FBACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 02:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vELlwcROpxEid3Pc7mzfoojHpbFdUp+xPYXawgbmQgU=; b=i5GPh8iTRBOmidEGkvz60odWHS
	DaRC0C+l4u9Ne6fxzyGkw1h5mCb+yIPByNnyFdZ/F70FaQpjNrMXNnUhgGjdVC4212OYcvKb3R9uC
	bR27Bc235PdatGw/l3mvnu7aTC9Dy9mwIg6wXK/lv9k39DULf/e+mwXWKP5gtytnZ2RJFceYEc1pA
	1UoRe0MzZIiGei2+eJ47WI6CFB19+dqBr7MCeJSXJuF327JLz4xEyvoHPExEVuZ6wPm/1rRmRSc6t
	obZmf1jpY2OFMZkX5RbRGfmpm00KGMxrqs0pyTlv2AiylSpLFRRjKUHL1qb7n5TmLOXmA5bWA5vlO
	QNsfVx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ubq-0000000ExeA-2cGf;
	Tue, 14 Oct 2025 02:17:54 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ubn-0000000Exch-1SvD;
	Tue, 14 Oct 2025 02:17:53 +0000
X-QQ-mid: zesmtpip2t1760408193tcc19e30d
X-QQ-Originating-IP: L97C2AOZ3ljzEh0zDfCvPHB+yq3dBgEQHwUDQ8nWgfY=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 10:16:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2101948375338814732
EX-QQ-RecipientCnt: 12
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
Date: Tue, 14 Oct 2025 10:16:13 +0800
Message-ID: <0601AB836AE5F348+20251014021623.286121-2-i@chainsx.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014021623.286121-1-i@chainsx.cn>
References: <20251014021623.286121-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M1hhAs3UGlS86sv8CdrYj0h/ny7cm5gN8rXdwXDvtP6ZVfWfin03ngNb
	2EUxQAybovToVYSsIIq6hFhMAl5+ErjeXkfwaBI4OT43zSJFJ0UJOGKhgvFdtGY3pLr8p1g
	OlbXvcLf5QiuF0yGHrrT+4gHxLL+TWHHgretT1iOSpaNvB9Xi0FJzc2ftWnMXK8fNkARRRr
	vOGdm5/F/Nkl0MZG7yygTDeqglyJnVEKpytGfSWfrSV8X21+xlvt2hVgQd+WDzKjbWnPvwA
	3oW+s8NWVKu82kf/YQbifxgG5anxIknEbF7PbvmAOqibxuc9UqIeEeZmPAVOs7+yJjg9FSo
	d+tA5FQfDdf91GDRPXEmSLdgIqTFwEmzd3kqrzlfA2o0tqJDUzi2ITFyWxphS+z8xx2emjr
	gzR9U7yVcrn3V2gIHNtYKi8n/wtJk2M1xks71HBzgh0dLgA7R7/nPvZvj722+Q3XiL7Pfl+
	weWTZmM/rUUUcOH1nP/YTfu+2JRh//4jwHQpMuWKJI2vtK9I/ZeHBXRfljXX2UPG2h28SuR
	/ECxN6dsb+vy8VQYsk00bLjkERFEj6SxAI13Fnf2hUeTsHdwiYfzZyPNmiafAoxF3xidgkc
	oFQSsOE7bJfjZJFvxWWu58LUEetEhGtL8qBlYL/QEg7d7np0KelGTIhojDcHg7HsNOF0Ypm
	w767jRBZsF6gYrQX7P8HBMpr63pXjzBS69RtqxSIYbdiB7epW7Aq6EAvpXrYSb+PPdaSoF8
	uX5amHU6frV57GdOS/dOap0IPqrZ87EqfWtoXr6hkwlaXlJSeRALQNQQWL0lTZwA1dHlgxx
	jzXH74pBzmvTU0Xyg17PGhh5safTGJPzRxmCTMMfQnHrK0qaJwqG0GFfsAcQD2GudW6vyea
	x/hqSoYrSomjTFDz4wHhiGaKr7j1Z7KG54lgUAnBKPqW971IU3BCHx1ILzB0ZR9Vb5NkxeE
	O/2b0meIZuIjNXOa8wq2mNQhpLs1dQw0rO5gK/S1nODCXpQWfIi+1IrZLsmFmzRwuvS6fa5
	AtMnlh5pLutEysR1+k/3S/AwrYeM2ZwunRtmx9R7V6HPKxCOnU
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_191751_936382_3FC8CCAC 
X-CRM114-Status: UNSURE (   8.01  )
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

This documents 100ASK DShanPi A1 which is a SBC based on RK3576 SoC.

Link: https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/

Signed-off-by: Hsun Lai <i@chainsx.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6a..033730861 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -15,6 +15,11 @@ properties:
   compatible:
     oneOf:
 
+      - description: 100ASK DshanPi A1 board
+        items:
+          - const: 100ask,dshanpi-a1
+          - const: rockchip,rk3576
+
       - description: 96boards RK3399 Ficus (ROCK960 Enterprise Edition)
         items:
           - const: vamrs,ficus
-- 
2.43.0


