Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEA3606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJNU3FFx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HgAtbzyT;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eHvUG/zO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=; b=cJNU3FFxqaaEl7
	mtOmTrcULQFhcw5A+7GIUVZ5/SLDQS/HZevCWwl4DlcrXynwFtAEiSUtHBJKY3f9lagTRA41L+g0j
	wuVYdgWcRzz6k/NwbeDDYwPstvCcpkqcIbX3L+PPS1yCzRUtw0bSLV+Rgn6t2PfKqwliFO9JivK7D
	HzqkPL3ogpUaBMf9+frUOsgKynfZC2f7wFgJrDM7jenY1IjeV4P02L0kjfcKrHW1SLiGxwevHfDAN
	66Ep1cg94/WNE1VsC4hWOC74gcap77+C51kC3XuhguNOsKA7OjgUWRPR42gACxwkOvfdqu5+TBz9B
	6SkuuOoVABXO5GKi+V4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx8X-000000093LA-2dxm;
	Thu, 05 Nov 2026 13:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx8W-000000093KC-39Sl;
	Thu, 05 Nov 2026 13:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=; b=HgAtbzyTidIXixwZJOBtFPKS8K
	LsiLWJU4r6cn3LlMlF73UsWzJyIr7CYV6Z8OpuT1dXw0mrVAbt5OAF0kuiJC+EmD8PlDjBfYz5JTz
	jjo5j0ZAN5UF2KqRDiOXi2pN8K2Xh8w2FxBJsTI5zLcVZQ9XbqxEIktiZGiqEc4BmKUg8K+2s5ZkE
	zCdYXZOuyhuZLShMDaI7iUzs/G+7VYj/8gyja18+cMgPvNMo/kkYXUe47r8x4EtquiJTRD/WajcV2
	ddIC/yvTN0/0h/eyggILR3twPlRB+1RV01YLRC2xkQ/obxUu+1iJAQh3eB7RGHDufb5y/rE5hhryp
	enpK+ErA==;
Received: from m16.mail.163.com ([220.197.31.3])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx8S-00000002zeD-45OR;
	Thu, 05 Nov 2026 13:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=;
	b=eHvUG/zOMLNjImA0Rm6/V64Xc5uaPJYmRa5PTGSz0/FgAAb2PiY7RzWHNX5ukR
	u33pC/CYSMOqoa/qgyV6T5K20S4Yg1UKBjKcw/Vf+/wYicVXpkn63+c1EBNaeWHy
	zqezkhLhL99oLUCBIY4VRuj8tc8jQzSMH+eG7HM/r1rXM=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD39xKpfuxqIBOEEw--.52808S3;
	Thu, 05 Nov 2026 21:03:39 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Thu, 05 Nov 2026 21:03:30 +0800
Subject: [PATCH v16 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-quarkpi-ca2-v16-1-b48eacb64a60@163.com>
References: <20261105-quarkpi-ca2-v16-0-b48eacb64a60@163.com>
In-Reply-To: <20261105-quarkpi-ca2-v16-0-b48eacb64a60@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wD39xKpfuxqIBOEEw--.52808S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43WF17Ww13tr1xKFykKrg_yoWDXFbEka
	4xZF15uFWrJFyFgw45Aa1xGryqvw42krn7AF1UAF1kA34qkws3tFZ5t342kFyxWr43urn3
	Crn5Ar97XFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3QufDWrsfqu13QAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130409_606352_E0179DE1 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..db93d97eaa95 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -187,6 +187,11 @@ properties:
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.34.1


