Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A698DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3iUidy9GVanTb1yQMnj+P4EXWDv4+JPkslTkTvcE6Q4=; b=kA/QfAtYAX1dFoFfXp2JVMVnzl
	btD10nJp2ZV3E9bdcCFDoqAlwyQ7k1fRRYIFyhroMO3EVDwjBGSAsGtoyTxvpdNac5Codk7wNn3zE
	zZzUjDxKNI0q2nRwoYonSbgpx38vdwu7sFf5JLcpWmOaTAxqTPB0eGU/tHMzP6HXo9ebm+TPGEicO
	OyetdMn6wNPCPg8k//+Cz+4DBZeAebuy6EFvV7rrE+m606GcccNqGNOEHNn83ZRJaINr+1jJO6Ufu
	wCfedjokhClCKHdk2fbNYsMZ15mNzqj5a6af00Mqm+car3XEtU+EK/d4Vb/6776HO05MclE/Y0Gi+
	QSHGN4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpp2g-00000008EFX-1tQL;
	Wed, 05 Mar 2025 13:44:10 +0000
Received: from mail-m3269.qiye.163.com ([220.197.32.69])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoc8-000000089qe-2pB4;
	Wed, 05 Mar 2025 13:16:46 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id d0a29efa;
	Wed, 5 Mar 2025 21:16:39 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] arm64: dts: rockchip: Enable ufshc on rk3576 evb1 board
Date: Wed,  5 Mar 2025 21:16:26 +0800
Message-Id: <1741180586-140422-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUMaSFYfH01CTxkdGBgaTRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9566737be809cckunmd0a29efa
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhQ6Mww6HjJRKj9OMj06SREP
	DxYaCQ1VSlVKTE9KSkNLTUtLSE9NVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1ISDcG
DKIM-Signature: a=rsa-sha256;
	b=ZIvKhAvf4wvtML+qOBbA69trrbqNhpcw0+1tGNJzQ+tNmA8/LU6lvBhd+mCltXKANZ0F2HE/hWEBZjL/Od7gTOkFTQAD/Rk7rX2ZY6aU/lwiPrjFt0r2gRztBQzcwpVDdpx43DVgtIk7vBN1roY/e37rPUOiF171WWBCfEXSnqA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3iUidy9GVanTb1yQMnj+P4EXWDv4+JPkslTkTvcE6Q4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_051645_216868_82B9DC70 
X-CRM114-Status: UNSURE (   8.67  )
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

RK3576 evb1 board supports UFS, so enable it.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 782ca00..78efa91 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -715,6 +715,10 @@
 	status = "okay";
 };
 
+&ufshc {
+	status = "okay";
+};
+
 &usbdp_phy {
 	rockchip,dp-lane-mux = <2 3>;
 	status = "okay";
-- 
2.7.4


