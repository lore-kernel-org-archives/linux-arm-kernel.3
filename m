Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE009CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 02:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqTxvJKSMwA5Wg558Yiq9fp/nWOBu7V/8CLFFiOlqGQ=; b=BI6FZxhhM63M+iqgLlvLRMbcAU
	YINByRhV4WDW+cks66oxIAVKXU/T7pczgBUDt2RI7Fuw2ABbUwmq1ytcIEt+HNc/D7UPqQEl3A6Jy
	MjkJXNJut4nxj5pQ+eXudJgJV+DDfVt/BG3g78dp6ZGTN7DcyWok2uLSEnNsV2HcZEqiWDAnzh3bK
	tFdQt1AVGCV/6Mibl7qCwDhkAe2n0+9Tf4F4oW985ucMeJk8zA2QfchZUUTgjot/1DfBLIsqkJPDa
	sJUl1LySEGd6PcMbpdVtrJQSLmsij1R5yntn9vfY+JH+5vO3+oa3KNp3gj91TRoTDgtVg0Uu0aBaV
	YCYrdMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usugx-0000000AzEz-0F6r;
	Mon, 01 Sep 2025 02:54:47 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usueF-0000000Az0k-3A2B;
	Mon, 01 Sep 2025 02:52:01 +0000
X-QQ-mid: zesmtpip4t1756695045tc264b712
X-QQ-Originating-IP: ap5qtfwFLDiWsWjGBf9EO9zRS7YU1uzGqHMrPqJn1wo=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Sep 2025 10:50:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5940222375455868438
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
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
Date: Mon,  1 Sep 2025 10:50:36 +0800
Message-Id: <20250901025037.81548-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901025037.81548-1-i@chainsx.cn>
References: <20250901025037.81548-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M6hLaPPfhfA/DlmYwOYSUBZDm0e4HnGubRP6ZOJ+XfXnmxn7XeGwch8D
	46YdAzEDlgKl7xtaFnNvbxL+QoC6R9KRKBiPPLMj27/b7jpFal2P12S1Mq4lpBeBtmAlAck
	3eVwQVKxwTE9FQEUks6LKYNceM+Wu99Ve7TfM2X5SiJX0ks9bvAXBI0dpr2jp+ttdHVmda+
	E/E92PYdotmohxZD8hS04EDw/UjDvoDw5GUL0poDIDOKw5eaCSMhV64VaUZp/cNpJ0Vp3Rk
	BEaiXiKF4WJ3fDSn2IxIv/K7tut3DvKwc0Uz0CDjexEqD8PpHcG4kkzaE+MROEwXv5towdd
	HyjpWhR5Nxcs+Q7xz62/izChcYvRwVua/NKbN4Qs24oxeggg1KAE0Zj3earjcHAjqoHfT/1
	ApngW/zP1i1myclky/0kWQjlRMpU9113l9A7b05dp4vMwpCofg7glFd5gzD/TFRVIBQPPdB
	amkoQncLbzkD3g4Yy6GjWA1pVzoLMb7GTPc1Lkkfe1V1Cr32QMXWKbuXLC29Zdy7P1kK6JV
	dW3rq+bER3UrH3sByWAQM08P2apx+xfh5XfhTK0T/aTok3Kr72z2oVu9asoqROb+Fo9KHod
	q0jY4UOQ/gfcjPgrKKdt72zNgsgSp3JzB6QWa/CWklvxRWCvxMlieBRgqAvzMyt3407yaVs
	t7XpEXotV89xIvfFfpCjqS4j8/kPmilft2X5L+xJnnuZO5dZU7pw+0UCl7XNBKglNIDfaVi
	p1bUf6Q4qQl1xmQEha8vIVfOVvAMio8teqIOSFgvMF/RlMeRgcPs5SzZzfDdOgJhdUYsJ0/
	f79sR/ZYwOzwIUwddfiBUjr1qxPIIIt0V2cafU74hE6+YRvOrF3VF2WK1oN3m2PETkSkQhy
	hqE1Je7MfIs0h2sK0I3ylZQw+oYHgcQvrKZvkLR1RLnIycMI26PiB0F0Iz5qCIveKtuyHkl
	z0DbR8Nu2djYLkneNzI9XdefuGZy4RdsmHg85eky5T0d96HEVpzt74NpaPDGbGufIKAOi/1
	VoubPCP/l6tQc70vATiMfzKEOV/ry7oSirun0g7PX9fQotOzHMkugunyfoDCdvu5we6gPD4
	aEaPENqW6y3C+mrDkBvJjA5ambOxW4W0FyFQryupycA2aYXoUbriuIoHkHsgR9wYg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_195200_074338_68867DDE 
X-CRM114-Status: UNSURE (   8.36  )
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


