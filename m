Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2EAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FneYXAuOME8Df99lzvc4w6XCpUDG98t55L9UJ4vYqBQ=; b=yNH7wHRS8sUyPKqVbtnyijSFZE
	9VZt8+gTx3t5I6cWQxcDSZz2tnIQCEyII5Y9oXIdKC4rgQ8k4H3aZDHgkpevrtwXoC1mLUYCagRZf
	/UTNW6PDufq4UjJ7DLVdu9AOOFFi2WYnkqbkjsMyFDLNKbkryHdjcptktxQ5whdo5zkTfDPvbiyo/
	L3x/gWgAS3WwINR5bVQvYOVV2I/iKdyjZyOPnUMvVEcHqVeoqXFgH3L8cpGwytDMkjsY2rccH1DO7
	uzkg1OVAEAzlTKnTOeAwy8WIJDFSB8y5bM3KkUkoAjHPFtEqsBzsFDqV0hG3Zl1TbhiY0VqNY7JPw
	4Gp7DOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncOk-00000007Ezs-1dio;
	Thu, 27 Feb 2025 11:49:50 +0000
Received: from mail-m1973181.qiye.163.com ([220.197.31.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbvX-000000079HD-04VQ;
	Thu, 27 Feb 2025 11:19:40 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97ec;
	Thu, 27 Feb 2025 19:19:35 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 10/15] dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
Date: Thu, 27 Feb 2025 19:19:08 +0800
Message-Id: <20250227111913.2344207-11-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0lIT1ZIH0JIGR9IGE1IGRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95472227a603afkunmc65f97ec
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQw6Ajo6PDIWMw0ZEkMSHgMK
	NjJPCxFVSlVKTE9LTU5OSkxNQ0JLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0JKNwY+
DKIM-Signature: a=rsa-sha256;
	b=GcN2ERCc1IPbG8jdSQtA8+gejnae2Ic80W8H0f/M/9NoS9RfXof+K3bYWjyMhKuOedDw/XI6BQEYsQufopuwN507GTjp7A1azj/7+xjM6iQKEkxbVMc8XAkrXttbNAKs6X1Cle31sEbkhBko7R/8JulWU3/OED3FqwSUk1M8N00=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=FneYXAuOME8Df99lzvc4w6XCpUDG98t55L9UJ4vYqBQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031939_213749_D2E9F02A 
X-CRM114-Status: UNSURE (   8.12  )
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

The PWM core on Rockchip's RK3562 is the same as the one already
included in RK3328. Extend the binding accordingly to allow

	compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
---

Changes in v3:
- Update the commit message and collect the Acked-by tag.

Changes in v2: None

 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index 65bfb492b3a4..e4e1976c542d 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -30,6 +30,7 @@ properties:
           - enum:
               - rockchip,px30-pwm
               - rockchip,rk3308-pwm
+              - rockchip,rk3562-pwm
               - rockchip,rk3568-pwm
               - rockchip,rk3588-pwm
               - rockchip,rv1126-pwm
-- 
2.25.1


