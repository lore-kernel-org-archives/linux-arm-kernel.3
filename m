Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4CFFCB619
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKbch+KhkvyosRD0j6QhDe+o5sMa38/e30u48THoCP0=; b=xLTohaQAzoTqT0lscdut47mRmQ
	P5xJV3fq+pYq9vffGS9GKyqaFsCE8TEtDfyWgk4qPxokLXee8viihIF0bUT+PERL5vQ0fPwA/U44B
	LyRdsZLETcxgYiL+nhiuhvOFOd+xEd2yTBpat7Z/vb4gj86PrijB6SEJa2DTse/ZOggiTq6WNfz3F
	B5UdgMUm3SDxkfi+uEg83e+9jyUWMCaqREAQBD9yo/ltsG7RvsYt2/e/45urHqfcMnq5Bzai+m2Ww
	Ipr7HpCw2GLp01brxvgdtPEpIwMYdaFYcFxRzxgKimmEt1rn9C23gQGxmKoV/vyXIdUggjrp7iJZX
	ZLbffoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX9V-000000042dA-0VcB;
	Fri, 06 Mar 2026 15:31:45 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX9R-000000042cA-2vJg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:31:43 +0000
Received: from localhost.localdomain (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5446622A3A;
	Fri,  6 Mar 2026 16:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1772811097;
	bh=oKbch+KhkvyosRD0j6QhDe+o5sMa38/e30u48THoCP0=; h=From:To:Subject;
	b=FghcCxJGAh5ajqHSqacpSD8/LuALJYMy/9FSxbx0TWrnNAc8fKCSijOKI3AEl9xVJ
	 ZrJ3m21h4IRuJfxaCXxMvDg0nFtbC83Dr8rtc6N3AoXEj5c8nJ8ydC+GKwsXkbfPBA
	 PRZnaQmiegimKbQOPOEcyeJdL9+4KZYTWKaDE9VcHaHdI9Qu71ZWkneNB9UhLJZhZa
	 53HWptRrKGhlWOXggdUpR1fBqiSSGAAMmMPliwGnBoooqm9uR1HNF7ZGHwwBSRzmPq
	 u/z6/EKPRm9U+NgrHe4pJXkNqM1l1sczQl65KfVhuOmnusKQqlG3fsCFfnHlelk8+t
	 kRSTeVoOjsmcg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH] arm64: defconfig: Enable configurations for Toradex Aquila AM69
Date: Fri,  6 Mar 2026 16:31:17 +0100
Message-ID: <20260306153130.102972-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_073142_473506_F017778D 
X-CRM114-Status: UNSURE (   8.22  )
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

Enable the configurations needed for Aquila AM69 SoM and compatible
carrier boards.

 - CONFIG_SENSORS_AMC6821, needed for the fan controller on the clover
   and dev carrier board (as module).
 - CONFIG_POWER_RESET_GPIO and CONFIG_POWER_RESET_GPIO_RESTART needed
   for poweroff and restart functionalities (as built-in, it's not
   possible to set them as 'm').

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..af679604d9ed 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -729,6 +729,8 @@ CONFIG_GPIO_MACSMC=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_SL28CPLD=m
 CONFIG_GPIO_AGGREGATOR=m
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_POWER_RESET_MACSMC=m
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
@@ -757,6 +759,7 @@ CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
+CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_SENSORS_TMP102=m
-- 
2.47.3


