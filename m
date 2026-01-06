Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417F2CD043E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wzOmv6xb46ma0kIdq1mvf7H1nuM8KvPoqSmkqQD+is4=; b=crfBqLR9qBvO34c2xRxNU2IMlQ
	3PaWPg6XZg8dNvLpY5p69/UmfMkPGv3JGzD2PbgzKUIzKTP5J9n7qsXBNMqsjWsHCn05pvfIO0tfZ
	X8sl/6b0vaOy2sYJSVVjNn1nv/GfmysM1Fp36YfWh8BCnqVpmXKVpsAqqxvdfg2p1V64aAcrRMTAQ
	Tf3MKmuFpFVyhHg+aQaDqwG09zHc8pJ1HOHfe1WbsYE/0vPTT44XLNsqSA1r00cHUge52sYVGZfMz
	li8dowZkSQsQ9MHZHiCCJqLo4QS4ej0dYGfvG3Bt7unl7ZBjKzcjHhS7bcDusbvFh5l+hqWYWUZxh
	PZiF3q6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Ip-0000000CVGP-0aho;
	Tue, 06 Jan 2026 07:16:27 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Im-0000000CVDR-2E4A;
	Tue, 06 Jan 2026 07:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1767683726;
	bh=wzOmv6xb46ma0kIdq1mvf7H1nuM8KvPoqSmkqQD+is4=;
	h=From:To:Subject:Date:Message-Id;
	b=Lgx6cdytvZ+iMpOlDyn1Z0UvKAPKRbWn7uXcLKOJ9UfyrFkJSsk88mIk/8Hs2XJns
	 oj+eLBMRqyn5li2jPxgHk7bw5muC7QPd4jCOyEKdr21eCjunrOSer9mdIQCdy+yXYp
	 b+zT9AuSY8IG2OobFPEZsXu0j0cQmFzinLwPcEA8=
X-QQ-mid: zesmtpgz9t1767683718t74c1803a
X-QQ-Originating-IP: 3daLNgR+M4EFi4RaxX9uSmwxwSvZp/u/KtlWbfEdv90=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jan 2026 15:15:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3899787890278610606
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
Subject: [PATCH v2] arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
Date: Tue,  6 Jan 2026 15:15:13 +0800
Message-Id: <20260106071513.209-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NUTz4BkILuKLFFWBZfchHmh6dkBSgPb7Sm33IdaehBQ/s6QwrHboGwH/
	bWhMJgyU+ZHbRH0OM53S6NRb50HJ5yRA+oFigkp4Gwnp0PbktdB4BDiUnB9y+dbp8CvsboD
	NLkZRekZ4DoNvuYtU2f7XEcXZA5G5eLRz08kwhlIlaR0dsSmB8Q+9hUxw/0YZpyMBzt0fxs
	L+Emz/30zYhamPeQD3RrVKra3IM5beINdhnGK5h0kEoHwLLqPcr6CklJWOvVKJWtkzaa6Nb
	8/waq4IlccfcLbtnv5vuEPlDcDEBZiNP6XEzIiFa0K82pWwBbfzT0oLIt9X9KzPVydDBy0y
	EWX9wsZr/Ju8KBzs7mADXMuClKIjn7GlOhCxM4UyIuCwimDX+Y3LtaGPeHBXkJL25KIZKOF
	7bPstmGFgrhFfNBAnl+h8dBha0L/Zr40PmRzVWUgcBbQZJxoanxSE6sV6XLgKpQLJtt9q0F
	tTkIsotp8sKbFdl9QzQganxJpLdTnNPJnsGvRwyTkll6muJB7ayaM23GnXD9v9Dh8iffQYB
	6oTtW+kO8h3vNw3bdoRRDqF4ajrPrrfWPDhn3gX9yjMJOZdCnuj+oUWAT86qhxYguuo+s0c
	dH3qstJJaUIe+1Q8yoTLl/dDZFzJ7O4ncIZlwRz4GZnwB/7TLoPOyF6UIrO9nlKiaPJ/YlT
	7asqFe1QBwPf9LP/HV9Hdux9BPcFQQPMHTOxMyHmEhivCPDH7mmEXez0IYxUSbC5CHbJnHv
	SLtkNX/aloaNjo5oWPwDWdiQNtDRe79dUHxsLxenpyCenXrg7tkNg/eo2KxMw0hpB/drOqK
	p5EQpDh4HXChl552+UkNTNctTWgZeJVIvktl7fdkJh4LHJsxgNCsA5lZpay0+F+IBgaYf/t
	Y1qomcpiYqdUxRSMuWJErabBAbFIt8aZxe5MdjTrxm/T8gh24YJN6qC3CFXX6z3VJGpUVvR
	2oKZSVCezUZmE4tFwmQs2cD/aEJQGnaF42GqLHrh6XMZlZCJESKHHcCFInwpPK/RVpFNgcC
	E4HBpy8w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_231625_118936_BF5F90CD 
X-CRM114-Status: GOOD (  12.57  )
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

According to RK3576 TRM part1 Table 1-1 Address Mapping, the size of
the GPU registers is 128 KB.

The current mapping incorrectly includes the addresses of multiple
following IP like the eInk interface at 0x27900000. This has not
been detected by the DT tooling as none of the extra mapped IP is
described in the upstream RK3576 DT so far.

Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

Changes in v2:
- Add more accurate problem description comment.
- Link to v1: https://lore.kernel.org/all/20251230090246.46-1-kernel@airkyi.com/

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


