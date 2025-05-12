Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CD2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7CKmsvauDc0q8NWP+HLO/2UN2L/FIYQsPE5ctif+Wxg=; b=lkEWJ2vljfX/tkI2/hr+AmA1sG
	OxZi7HsArttOG3atolQ4dZaG1+FhFvp9HaIvJpI8L2w/ADhgBBarIkEa/QokhXn7G0B7b3FS3R2ym
	bQ1HnKKzjrueDm6pcodcQ1b4+ykU86KIgCNHz3HfHhqjZ1KDZco43k6fr+k69089ecygSzA8NeaKu
	WCCwHmP4F/lWrrgUaNC9TzWAwxFDWsQ05tvHGKcn4AVRWUpsKfa7V7MuF3Ihjgr+fS4cl637osijV
	7aocrYOzF5a1bHc4igVGTjsEAjNIdUWUpA1bfsrg9w6lSNTu/nPBzUkjyf/AqN5UHv/gl3tF6XHuU
	3N0DQRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETq3-00000009fiB-3Vmg;
	Mon, 12 May 2025 14:09:03 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uET61-00000009WiO-1sZf;
	Mon, 12 May 2025 13:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747056084;
	bh=7CKmsvauDc0q8NWP+HLO/2UN2L/FIYQsPE5ctif+Wxg=;
	h=From:To:Cc:Subject:Date;
	b=LXhNuFDefl86vAkdiD5oLX46xOD6t2pPwBfohtwNvjDphWEGpJ2njlFdazhydUNsy
	 +MiYydAZgMJ8rkVlpJ5CErU0wYmqMouxIND1aWQs0cf9OCMuxDTaJCQNfq6VqeKL0G
	 8BDRaoNJszNmMdTtVegHC24esS9z3285tVPFXPlM=
Received: from localhost.localdomain ([182.245.65.132])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 5421CC49; Mon, 12 May 2025 21:21:02 +0800
X-QQ-mid: xmsmtpt1747056062t1bvo054i
Message-ID: <tencent_60646CD888A3BD7F0B0C701B95A2B22EB807@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLDX0xD0WxzRUCFyjoAKFGVx1fKo3JfF5pFAw0yXSVYl40akhhIq
	 TT8QDQkIVvAWtNR3/KRtGxsUEf8GuOCOiGOapoU4bXT460wJP9phd2qqgKvgqbcSAVo60sGccid9
	 cE+GUVlKRr0g5Jmh5fAS3x+wq5Kxjh6eU6HtWVsoadYl5I3njMxYHJsquwgRuhDcr85Mxo2sI6mV
	 gWdvZ+luWlkSYIjcjMC0GGL24MRD0kl8yWvlqvLlYaY4Gg3dgbSXoOGzEJCQ1CrV6/bMklVcMq/J
	 edL+cgt6P0Fz6b5FNFz26JTLyDeeM28jul6okXGueinD5rlY5qc/T+itnBS7+mKuAssgbAYWPEN8
	 d/TpC9PT9l/mG7TXmObXTh7tu/XkprwDx/2TLF59Kw8AeRXHjrskE3k2bVVGZtMbgiTlimlhr2P8
	 ExdbnXFOw7f6fvn2NOaafWfcX615tUIizhghtRYNQ85DlI36VYvKCpoI0NhVkzzR9csA+9D6upPr
	 ZPRHYXQvtdhF2QqAjEQ5V5XQaX21E0/sawXNCLDeb4PgwUBOBAcyaXyyOaBs88URdlmEJjS2hYnX
	 vEHKVsi0X4jtd9AZ4RDbDwPIjqFtaSnJ7E6lL3rd83tJT0NN9Um2gTA5F8vdg37HX6TfpEE3nbZ4
	 DPJxhNaY48rQ6/pZfyYRN1fc98AM9o9zvhM3pfz+gzkZ4MJgcku//oqTU7+LzkxfNcTwCKLAi5IU
	 MKMeo/0BIo9OqIJ6nv2MaaKWTDXiTKN1GxLf7Owq34PDxsNE3M9z+PyF96tWvLwa/AX6Z5PT+s5H
	 i7Blt+fYsqZ3FtRYEDQ6fi4VVUWPZVqg4okhqeE2wqGgHpqiJQwAQ6QhMa4BWvPfJSvkS5oiiw1e
	 G9XiWiAUFdJ7LXGzhR0GgP23sno2DoD9qVh7oWCaVDI1h6vbAmK6tcx8T7d5WETEYKBK5Yphl2Te
	 juzj9rjxKtMNYmMyHZIbztdruMCMxOcyktG/rW/4ukPWFB3A1CSymY8r5C0Nf8no9SMm1+Lvh7+n
	 Os//bwqS/aC7GwXtm7YF16RNgf4rJEtn6ygLsZbTd8bSdqP7hC69oKqUcTdS6rz8GVLHA1XQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: chainsx@foxmail.com
To: robh@kernel.org
Cc: chainsx@foxmail.com,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon, 12 May 2025 21:20:59 +0800
X-OQ-MSGID: <20250512132059.312789-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_062129_780686_91BF70B5 
X-CRM114-Status: UNSURE (   7.57  )
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

From: Hsun Lai <chainsx@foxmail.com>

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <chainsx@foxmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290..13d5dcbc7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


