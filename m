Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9141FC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nITHRcPKbcB+AhbMxeU5N4RO/HPZFix5FniAHxSYaMI=; b=mzbZ2a9vk9iZV2JzwsjMPwmcfG
	nKYDAp/maGrTlPpKSCplx6D6wPoBdMSoDesBAy812wKNMOyStM7R7pVt5FY7GjnezP91/X2m6EhrR
	aWdfB0C1RBnVuZmTXpy5sWuIiGD2I8XDr2w9IQboe5+QsQHvZTh+YASBHQ+yI+Tq1SNcSqbjxxkhH
	IGxWB2/unufBGpG0NRY240X6YKXGMGA0WY+FV3azQP6DA2updQx99A048Nc61RbS1rcP65f3V6JFC
	fyaYYmR7udrABNVCt8AawjkePNcUVnM2TbMHspbG7S/42dJYoXhAagrcM6+xFwpfvoripDPR56MvX
	ss0J7gvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9p2c-0000000C1gr-3VTZ;
	Thu, 24 Sep 2026 19:23:34 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9p2K-0000000C1Zr-0Bmw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:23:18 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B0A0B240106
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790277791;
	bh=nITHRcPKbcB+AhbMxeU5N4RO/HPZFix5FniAHxSYaMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=NGZLis289AJ0scI0Y6646QdWwarYkyprpmgJk6atvUtGeJ9fUzFb1x60aLAQyYpU8
	 0DST/18ABweJu26PbCVH38heL/cr+/+0Wsw5FBzKHiOEn6q44Qc3h8Gl+YQI9+HrJd
	 ZIpCxTmHHQApPWhDID0/TslJVFpewDt2n1YC0jiQZYCgPfNgnLSJUpoldWU7tAyxz+
	 WgsGHhQkugRd/3+/mAYQGCRZKJc7MSa8XYXnUQb0eJp6oYMQ0J3kgPwkVZMOs4RjgI
	 ZN5zyVLXsi1G+ItnEI2T4uFfcQX+m1d5wHlTGmOVYqpOO8J+Mh7zmGY9167LtmQpLx
	 FFSVJxPFPtbTA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrNz20zRqz9rxD;
	Thu, 24 Sep 2026 21:23:10 +0200 (CEST)
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
Subject: [PATCH 2/2] arm64: defconfig: enable Moortec MR75203 PVT controller
Date: Thu, 24 Sep 2026 19:23:11 +0000
Message-ID: <20260924192259.20517-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
References: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_122316_234226_95497E3D 
X-CRM114-Status: UNSURE (   8.45  )
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

Enable the Moortec MR75203 PVT controller driver as a module. It is used
by the digital temperature sensor of the STM32MP25 SoCs.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6d3d94ab7db..fd4da6a61ce6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -765,6 +765,7 @@ CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_GPIO_FAN=m
 CONFIG_SENSORS_JC42=m
 CONFIG_SENSORS_MACSMC_HWMON=m
+CONFIG_SENSORS_MR75203=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
-- 
2.55.0


