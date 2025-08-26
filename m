Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A88C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 03:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqTxvJKSMwA5Wg558Yiq9fp/nWOBu7V/8CLFFiOlqGQ=; b=KidXPXqVB5uG0EzYumwdWl3OCm
	yZCKnMrU/s7RcFVlcd8cZTqrXUkgHQtXmCkUqUB02fE8h28FHhOjmrw3xCV6UTFP8odtVpTaVbo3O
	h2/H5Pcw5qlBaGIDdwsHxRrO+mfy+TeExqzzCYDRk5WzVRLiQyF/WaYKivFYqJRMcZkd6qW4Bcclf
	H3bm1+z31yvNtWtHgy92lLfIAWLlufI3r/bMhqx0BNvuwUA7dumJad4VvjZRXQS1xyniObpTPHYQv
	fb37O9o6jJGlVI92vkyrHzG4EnrLf8flHrBHFrl/XQ6F0P7PZbXc2C3S6zD+O3NvB4s24f1ra5Bx2
	vaem62/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqkHn-0000000ARMb-3sRB;
	Tue, 26 Aug 2025 03:23:51 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqk4F-0000000AQCR-0BZt;
	Tue, 26 Aug 2025 03:09:53 +0000
X-QQ-mid: zesmtpip4t1756177709t5030dc98
X-QQ-Originating-IP: 8jn44H85scY8QjZCU9Psl5dy1VpOz/vAu3R++oqMy44=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Aug 2025 11:08:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 599651795414604186
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
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
Date: Tue, 26 Aug 2025 11:08:16 +0800
Message-Id: <20250826030818.3485927-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826030818.3485927-1-i@chainsx.cn>
References: <20250826030818.3485927-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OX/+6nY/vs4TvfZnY960lqQH6DJb52Gwf3nkyzpeID3zoO2QVWVK3Q5I
	yMWe3pZ+GaObTgzZkQ8J+ZUwZ8qkaErkSKI/qM1dPnhkqwl17dkLEbygqq6wMHZLp18+eEL
	9CiJI8UxhSyqrYKJjgGt+bcxJE1QQ4aGNM9XxV++WZFcSjV6THMi2Tou+1n8jyBqQNHBUQW
	ryeRTtTd+0AIVBjic2+PZRFBDJJc3LRSsdx9IOLbXu2/7u9s3k+/G7v3Eba1md8zyFfADXK
	JpTfz6icvgHGdICfsu9g246WH3Wv9tNTuFZ4h7UG8Xco1d30O3gxzoQEYXHGePvdvCXLO8B
	hd9GHmEwjQrGYTtaGhUFbob3r5tP70xxCRsOX6em0vPNW1K7VLCj1ZH+AUyFSSJY8mvB8/2
	ddYsC9yejngrTjEQZ/fedwX3kPC/B3eKla8i6AFyBHTzco4iXswV3SaMzPc5nbHDU/x6DUV
	/zBS5YmeTZqj8XnwrZcN1UvRkwb04V6u/fFAx7Gx2thYbUzHyhWUZ7gF1w3hZGYFDAxTWB+
	+oe7xSEPn0VmLVGegZ7dYGw/j+NNqzVNwmy6/QKWl9UrgFlVKBvvl7+mZ+aSDxU+QBLhCIR
	Km1ttSq/VoPC4dPS4/Bc2ubskMC/8p4FmLmlldLrc9WKD8OyPt7XlCGLyAllO9lRfUkmCoS
	V+3MtzKylKi76TG4njrIsJy1TmtwE2kczGIj44d02j3I6rJuDVO4IUKHJ4mSCdhJBomYhQo
	sfhV2A9GGcGJX/BT38KOyHhzc4UfYBh1lb6vTmQMPV6Q2gLWDKav5IAX1EyghMGaj+KReM8
	qvLXWFBDq3tiiM0fiGsX4C4ZwAYeXbt9EVfmXe5trKezvxnvi09u7dXoTOVPGuBs94qtSkA
	UssQ0yMIZQ363BqQ+gFCpkbl9U84DawODZerVapnCfl509oz4bXO/KgHCCY9eBYe0hMyfNF
	9VQq+5KK+rLw8T3pJ/14/JpAZ6Y5UEIavvtzqiS9LpsVV19bOEcuC8DnXXzli5Br6Ycy6cP
	RqfFxKqyAsGtKFt9kr
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_200951_929830_F1A85A29 
X-CRM114-Status: UNSURE (   9.40  )
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
2.34.1


