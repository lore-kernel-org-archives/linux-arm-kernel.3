Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AECC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRaXGbiWaSnXuvdew1wAtMN94pvy9736x6TsTllkpvc=; b=wYvJNhuJWw/RpfwAUtwB72eOIz
	v2kBX9X7BPcyXBiEZ5KXOEUAjF72denm5dMpVWPqiEefC3OXDuXVsLzW/UhBhtZH62Re0ugnBcxov
	5RojjpHAULBB/1Wm6nXwvl9s7lTnKtb7sGpV+b3rKTMDq84SSuipPcUyqQFsW+l4V6DDYZfx7zX8s
	KwCYoguZYLBZjWy4jNskMx7MnGlMdp+lMVnx9MXEDLwH/PiVD9Poa2cHaOkoABPVzcF/K6FqTpBVC
	hCUD5IIm23lOxcXEHlmI7XVptL9Bq9fmmtHLO6wD04PiiFXoE6JXIernw3TcSS+4U1rldiokEi85U
	C3y7OuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UYP-0000000E8Q4-2my8;
	Thu, 17 Apr 2025 19:05:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UMo-0000000E6yr-3GZr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 18:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EA66439EF;
	Thu, 17 Apr 2025 18:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F6BC4CEE4;
	Thu, 17 Apr 2025 18:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744916022;
	bh=3y3PMm0tVQAUjU/Xvmx+6nF/hzWgLIoEsPBnM6eDK2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDPlYaBAIXnnGU6aorURM3OEqnYWj54w5J3kUByi8NL/MiwdRd62JrxKXcrluBUFW
	 vGmz+Ht0U2ysCjNOjK+njeXPRy2DpoKwjeJmsCRRFYxiyILxbGg+xXrLzBH7kL8Cfe
	 uJuPxd3qD3LvujnbM235bR8OG7kP5AbNZoYp2Xtk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6.12 288/393] arm64: dts: exynos: gs101: disable pinctrl_gsacore node
Date: Thu, 17 Apr 2025 19:51:37 +0200
Message-ID: <20250417175119.199687812@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417175107.546547190@linuxfoundation.org>
References: <20250417175107.546547190@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_115342_833043_87DB606D 
X-CRM114-Status: GOOD (  10.04  )
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Peter Griffin <peter.griffin@linaro.org>

commit 168e24966f10ff635b0ec9728aa71833bf850ee5 upstream.

gsacore registers are not accessible from normal world.

Disable this node, so that the suspend/resume callbacks
in the pinctrl driver don't cause a Serror attempting to
access the registers.

Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: tudor.ambarus@linaro.org
Cc: andre.draszik@linaro.org
Cc: kernel-team@android.com
Cc: willmcvicker@google.com
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1451,6 +1451,7 @@
 			/* TODO: update once support for this CMU exists */
 			clocks = <0>;
 			clock-names = "pclk";
+			status = "disabled";
 		};
 
 		cmu_top: clock-controller@1e080000 {



