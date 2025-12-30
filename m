Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3BCE9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VpoCnIgKsRZ92pzrMxwDZZP7i+qPNxm3KzgXs7KlAU=; b=zvTjJWgdLX4YfsvPHPKQEuUukV
	w+n57pUbaMRLAK689v39CFokziCI/xvf6dJqVoXgi+eQonSWVjZQPvgBvt1O0mEl77FtGkl/rpdzZ
	sy9GaU0cX3UNrP9d2kcZNK0GveNcqT7miQcfn+g5VzuUTunRFtqyTCn7mF0tE/nfdjkhGOqnHrzrx
	ddl4YiQEPN3RaSvsQhtMJ/flsHMTZjxYPBuuRNDI7PYwegZllOUahePnQQPPNkqFOEnqSDHixSzY7
	kzL1oecXpWjsSxEbNymAPJTD0D+BGdF44aBaBU3dXCUCdPXLtzOReejvLa0zHzIYMZu99Bzd3pLJj
	/JIVFP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVeQ-00000004cXl-0q8z;
	Tue, 30 Dec 2025 09:04:22 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVeM-00000004cVQ-1rRK;
	Tue, 30 Dec 2025 09:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1767085407;
	bh=/VpoCnIgKsRZ92pzrMxwDZZP7i+qPNxm3KzgXs7KlAU=;
	h=From:To:Subject:Date:Message-Id;
	b=rwxAVk/d7DubyMcA2DD7Yo08VoiBpyWogj10+wBd/ljg5ZFDYYT3J/BNg3fNSm6DG
	 0D7N9vgbRHjsH9AOPlqKUq9E5sgUBhgX8Qdyk2+XCnC1HIFNPAVEBPYZByX0NwYYSW
	 kXeL9PV3fWMJ281hSRSU8lyeZsbyoU0fKAHnTMKM=
X-QQ-mid: esmtpgz16t1767085398tec99c1ed
X-QQ-Originating-IP: /TmhuuJhxmP7FNa6N98cvNeOz2pDT9y88FQ2UnLeMZw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Dec 2025 17:03:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15785446282400789070
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Liang Chen <cl@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
Date: Tue, 30 Dec 2025 17:02:46 +0800
Message-Id: <20251230090246.46-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MwQdfXoP8nuzj6ZsImoTwbRpq3kjUEZ+GsvAE7aPlYh11ur+xMi6Vvac
	0QbMN19XpTW+AebC8zFI+VMLcPW4LKJYVnq7WRp6a8tPfteiCrikViTOjr33hRpCe4hEaD+
	iit2VJ2+kQ7G1xtUDo6z3iobP7qnGWMdKXhH8sYafcCH+O8E//vq6QUwjT68/g+4jg5avbW
	+E09WOGzF7dwhANaN5L12N4h9sjHOaDsquTN/ZyPllhCPFcyqDm8d8mmPHYAs9HURzd7B5Y
	jZhJTBm18X2ISiMiV/rXYqGbt/Z79RnTb5bhyUAVwa8fl2irY7rdty4MV2KvF2H8P4IGMz0
	QKw/8jcRF4hAk1YNX9T+e3NXHi1F0sXGheEqae9OC8xC+QoHBS6IefgDKms8gNOPKOk7ze5
	IYZyUsPUao2An0i/oXq10mVwi09Ai2jtsPhteRZH0SQBm/Msah28P5OdNKRYTia+EpRsfjX
	DTqEmShwrirj/KxnGHETPDyZJBCfwYy+tl7bf+EHO1uVPj6FGCD/OTt6btLVz58NPWd2jgR
	pTl8lZOOVgW5OtYMgteqDoqdj53Eu41nKoZMMA34E+jbnR4uTS9l9z8hqEWwK1uYL5Ca27k
	hD+pXCbw0k9MYG74ClcS/1tDiflgbp0N7WR71MM3X4n3ljUSLCGycZRdJ9qQktEZMB0ikwe
	ryf/lgx81LYewcKHhGU8P433I52Y1wDIGs5QDtvpA9ntoXaFCay0Dvft5TxFNVThlzNdbnR
	KzGvLwtecM5NVwXBk+HUebfATohKomKoxzaHAgflMM0uLbASqMk6raUfTyJpieWEtlnsZc1
	/BZ/gg9QYHnAVNT4OkmE4RweeeHv0eCdae+lkOQ4ez3o0BWOHU9h+l9aSDc1cEeU4t6jI9q
	YgA6P+GFwl54FQ6Gvu1WxLSLzbt1raeFGE5OI1xt5tpQX0tF9gRmZk//lqcQjdtjAzlCukB
	Jp4PeI3rgARQwcnjoGxA8KKdzfYaqNglZgu5j4UeGEduG8QTHunRNOpzrKcVGjMbPy8c=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_010418_936204_716AED32 
X-CRM114-Status: GOOD (  10.11  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

According to RK3576 TRM part1 page13, the size of the GPU registers
is 128 KB.

Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6284e7bdc442..b375015f0662 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1271,7 +1271,7 @@ power-domain@RK3576_PD_VO1 {
 
 		gpu: gpu@27800000 {
 			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
-			reg = <0x0 0x27800000 0x0 0x200000>;
+			reg = <0x0 0x27800000 0x0 0x20000>;
 			assigned-clocks = <&scmi_clk SCMI_CLK_GPU>;
 			assigned-clock-rates = <198000000>;
 			clocks = <&cru CLK_GPU>;
-- 
2.51.1


