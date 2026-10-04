Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363ABCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eh6oGqLnV3p2vYbKzJgOkd1E+lStsY6pYpuQQzA/zB4=; b=IlQRt4gvKrLzgIsjKKLWAXpf0t
	OuOAcJdi/97rUxdEXySqnpCQCOEZOZRWSBd9I+AkI75a481msyWh5G2KqfdZ1Dt2N+OAIalgsnmoE
	1V0iEwPsyCF4UyStHTsgYwEh419EttMQlPNrkr0/6Tp8mtcUlRIYPa9mudxsSSADomS3SnbGW4Wvm
	FpLqLbfwzlQD51vSLuXaif1jdejmR369TY3mz5G2OTPOf1sDo8j2ql9LXtSBRKww/CQyk52Rxgaj/
	aP9E+a7VPwYsZXoMFTZlM0/ckPqPveMjmvy59UhdMoFs3GSLTk3T7lMaWtoepSeyU2MKavXArAI+M
	1wIecy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKKg-0000000EjcM-3twW;
	Sun, 04 Oct 2026 11:24:43 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKKd-0000000Ejby-3dcM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:24:41 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D28AD240103
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 13:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791113073;
	bh=eh6oGqLnV3p2vYbKzJgOkd1E+lStsY6pYpuQQzA/zB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=JZuOzBjUqBcis65fZbaB0VEExATJ4s0dTYjk3/nRZVkD/s8R9ydD0sfqjcmR390w2
	 H6jS2oJ5SgMTHsmKu2wL9l4DhYzi9QG0ezCFfImD6Ad5c7b35wM7Z3M1RcdBh73MX8
	 2SykB5isOyOilQeOmgMD6F9Jmi/txUOLq5i855b5Dwj7JWWJ1HLlBrBIlJEcBCOwTO
	 Uwh/z/Yep9DGK5LrkbWzUL5Kz/KDFshB2R3RQSDqXOg/+yJuBJna3wxINuJNEgol3l
	 RfasOWrR92f6xmDNQswBihDOJrKRejPV1cGB72Fb8vznEXnzcqvUdH9TCq9GBJWGxj
	 /sVLbeM+2ycmg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hyKt75yByz9rxG;
	Sun,  4 Oct 2026 13:24:31 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH] arm64: dts: st: mark main supplies always-on on stm32mp257f-dk
Date: Sun, 04 Oct 2026 11:24:33 +0000
Message-ID: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042440_053606_DB814A60 
X-CRM114-Status: UNSURE (   6.52  )
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

The vddcore, v1v8 and v3v3 regulators have no consumer in Linux, so
the regulator core disables them 30 seconds after boot. They supply
the SoC digital logic, the SoC 1.8 V analog domain and the 3.3 V board
peripherals, and must stay on while Linux runs.

Mark them always-on.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a8f18508db3e..7a837e6fd578 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -310,14 +310,17 @@ scmi_vddio1: regulator@0 {
 	scmi_vddcore: regulator@11 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
 		regulator-name = "vddcore";
+		regulator-always-on;
 	};
 	scmi_v1v8: regulator@14 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
 		regulator-name = "v1v8";
+		regulator-always-on;
 	};
 	scmi_v3v3: regulator@16 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
 		regulator-name = "v3v3";
+		regulator-always-on;
 	};
 	scmi_vdd_emmc: regulator@18 {
 		reg = <VOLTD_SCMI_STPMIC2_LDO2>;

base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.56.0


