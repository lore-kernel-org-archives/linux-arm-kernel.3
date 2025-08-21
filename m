Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D00CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnwod4a21DVH+G2n4LJGE+XCcKAFqtNglNCJYQmrBxo=; b=45xLVEA0Rc8GhlcRp7mpkBEIfI
	A6cwG/fDoUTj3XbinXrTjnumMqnpso/fe2Cdk5sxWlLyiQHJpWoEoLMNb0Nt+cgfFgotpfmrGibtt
	xvmuT5iAxqU66cIGyPgvaje7WG1A872zIZGcnPi1B0dY4bbASGf57SYRrwdIx3ZR8ylhc/Pl3g0e4
	pCP7NfcKzUpdynnNDuBDbhVbSUbx5Vq7ZK2Sz3IFgp1sCCAFd6fon3iswuEh5eHfKzC/tp3QUv83q
	7UPjWXDEQHynbYW+yRJ/Z2lONtUymWgfPytID53YNRzlS5zuCTQ+BiVbJozlHQoWNj85BmFZ8HCL0
	JwXeY4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ei-0000000HM2V-0agU;
	Thu, 21 Aug 2025 15:29:56 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3DF-0000000GiBL-0EM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:12:10 +0000
X-QQ-mid: zesmtpip2t1755774593t81369842
X-QQ-Originating-IP: Ag73yM+7wvdFdbNm9yHrmkwzqg+tb/7BJP3xAKS4ils=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 19:09:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14449137100758401658
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
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
Date: Thu, 21 Aug 2025 19:09:41 +0800
Message-Id: <20250821110942.172150-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821110942.172150-1-i@chainsx.cn>
References: <20250821110942.172150-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Mp+xDw1JqiqZsuKu+N+Cxf6nhQTygpmyEyPvWIlWsSFKddXSt690TdjE
	anWOXv870+sisdGfOa77YtP7YesJFXEECC/fCqbm7dmvFDokMQ8uwTY0m19htHto0AtYbtF
	NWi7npPkZlO3swjdi4JOGMFf2/fd9nanB4I823VIz9c8nLCCT9spEVwcSlv3sUNCpG7eQOw
	KHtwT1ymH/8ekVA1el09AtBefhTv9Nb5D3trKzCnqUYg1g1z5I94NOMHfDCS8hrjbm7m+wr
	Pq4By/9ffngFixpjtC6bj7ofW1RW1CrEMgymGw9Txjk30R8A1OhgqdF1I+NverZu0vRJOkq
	90g34VGe78Mg1OVQj18fFZ7ZiX10neb8BJwDwit5jZQ34EW0PFED6hgArU2AM31RzcFCJx/
	fXjaFZU9HVXDlffIlRCk9LympLqw6fkqiVFhLovxwBOLFBeTpUbuM5/78wOHkSyz3UirOLa
	SMiPwO6SETtSXNPHYq9993Q07mL9KvYJaWJMdY9jDnwHL7tAmp+yF0yF6sMfJPL5RJTH7R4
	kJmAGX0uVIGX8UMzw3SfWnTz+tUEHTXskEEXgLXMGfvkQWLyR5bGqEjQ+TDl87lew9m15wF
	8MNo/sdFCa0Q7Fs/yS2XcvXXvaubYSbv16IVwqDMCIqYNmVJvY0kn7eLaL3QvAlZntnQ4V7
	GLG0Nhsl7SjlKNUtpqZGVKGtqcMnVndT+1NqMcjmGZXb7Kvme96jsz8uACFMXVLCFhBT6+S
	veqGgiuTGjZdW76Xbqt2sUV1lknwmcrubcA1C228UdM1cuBAEukyjYaQBoJyldLVet8TkO9
	RjsLQFgxirhQhB2AdGcmfVnJNCXnesYec4AAxvVMzKB930/Nbxii+DHIDUsFgXn7RQDEe23
	NumTqubNs8mxImwc3ISNlkmXEu4pAfQ26uOdol3wpl47XVHIrXc4sHCo7M02EYq1WgnQOJp
	YbKhgdbzTpSp7BLOULkfriqLkA2qCm92xrlfV/lnu1S2NKi3mCCLAeg/LPPpqF0m5bE4aCZ
	SdMVPqjwX2/pmzzmBZFJfyysq6hWQ=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041209_545208_E352A627 
X-CRM114-Status: UNSURE (   7.88  )
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
---

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


