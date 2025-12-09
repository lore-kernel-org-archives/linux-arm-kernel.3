Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AAAD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dxeERWmLPtcv4v6HQIjHDVzEq/iPpIZia0cA32K9L8=; b=sUKPqDzoPhbjKnEoWZ+6e+yhI6
	pPjfE7yJunRduFsw7cS5y00Hr7uAFLRWMqIY52elpxMY5qNjrh4BhT7eu/iW8lUeCoAmVd6TlnPbS
	wMcnS2ZJGgurg6aO7065XNQ3/iQj+KjHE5fUiNTwGXdPkIHtDeAG0oWyOkf9w6Hfr2G+pgypshU5P
	JKNO44tFNrK6QtBDgtTYV2JZNg+UFfCIgQqa5iDjwOA8IkM2s4WIlkbAk8XHu6i7rLZ3nvmjkz8z3
	AyNxXWEkLT83HvuX+Yoawn1F5zWJfL6guAG4qdYbwCrHUBy9eACWaIm+4BvytzBY3U1oFYmM5t2YJ
	NIaGeWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunM-0000000E5sQ-3wJj;
	Tue, 09 Dec 2025 10:18:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunI-0000000E5pN-2aZa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:18:09 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 5742D22B2A;
	Tue,  9 Dec 2025 11:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275487;
	bh=+dxeERWmLPtcv4v6HQIjHDVzEq/iPpIZia0cA32K9L8=; h=From:To:Subject;
	b=OpuzYQ6MchrXobF5N7m8NlAb/Pk1SjMKzrNswtjtumjcOHt3p12rG0fQpVNFXcu23
	 jhV5kJu2qIuoiXkJnJ6gYqYEinXM3k5nPKa9T4kpZfEhlUiXqQGIH9x4Mm0EI3n7en
	 FflxU65uLIbJ1bb1nvybiASqrvDP2tjpEA1NXQWoSNIqknL2mx2Hz5XE5uLdKCHP52
	 fc3cjCFN4uDK2Ub+oN22+EnGjLhApENFXfu97laBY4WLudPn/FmOee6YqBcwbvXL76
	 lK8yxjLjMiuBZtl38rRmZ+NH6OzXELvUKhwja4XVYy9e6z13ahBLafLdE5Lja0Qm1e
	 EZVvRNspqXTFg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device
Date: Tue,  9 Dec 2025 11:17:51 +0100
Message-ID: <20251209101754.54067-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209101754.54067-1-francesco@dolcini.it>
References: <20251209101754.54067-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_021808_812461_9E6A5F3F 
X-CRM114-Status: UNSURE (   9.06  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Enable the hdmi_pai device on the Toradex SMARC iMX8M Plus Development
boards.

The hdmi_pai device, together with aud2htx module, hdmi_pai and hdmi
controller compose the HDMI audio pipeline.

See commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai
device") for the equivalent change on the NXP i.MX8MP EVK board.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 6f9dcd3a75c8..b31de307093c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -107,6 +107,10 @@ &gpio4 {
 	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_gpio6>;
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.47.3


