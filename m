Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B42E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4V23sYyqb9psq1QgP2iubl2bF1Qt4flQVazEMi/42RQ=; b=kEjyCbC1AHxK+T01u/rTN1oP++
	No5KQiPPemOe+1dvTRNbk/IyZPT3oddlpFafmAmP1H67e7Rm7vERkQj+oScn1U+C6B58K7HjbJ81a
	okUnC0x4k+JTmpTEJfHf1B83IpDs+PEw94xpdqjpDPSZ3NyYSsUP03gREFf55t5bPfTsXBmlb5Kgf
	HUbeLK4mJeBHQ0nJ5Z/l/g6wPZYq+wuxkh/Dwj5lqr1IqAHNmWBavB/P+gEU99cSeOyggwCxSUqGc
	HqZ/0nWjeAJI+ZNRCECsdMVmK5SM7JKMsOjt3rMEyDu7oPjTBlx7abEyd81aDKc09ZyICCMP6CGMQ
	8FrVTa/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2M8-0000000CxAr-0Guh;
	Mon, 02 Mar 2026 12:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Le-0000000CwFm-26qo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1915E4398E;
	Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A786C2BC87;
	Mon,  2 Mar 2026 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454366;
	bh=yY+TZSmId9g+9Og/utITL4C/Pmxjg5Xby4QQjZzITSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ILueajBNT9jG/aLuqJs8XPiz2vcMyGf8VxkpP7GvdcU7Z1JR0hjIc/x61K73hvkkT
	 6xMGnkCsU8YRVvAcSbH4cTyrx+N23vhlED2SBadGHET3H8OfD5Opx9BG1OIbt5B7If
	 PVA/q2ryjyAS45DdBIExUW/p+L8DB5heAryyWDIH9SXVIDKNUxDDFafuctv6o6td3u
	 NfSgGwcKlk31AeAkeC/ujkcrGfJX/P6+lu0FvITFyLbt73KBXX7Y6ol66x90yBp6Da
	 C1QpbBNp7deASGUZTXRrUlK8kElp1BLBBzuGOw3ZPL9HFiqIhyQuEHJUj2pUw7IBuS
	 IsM95zMrbbfvQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 2/7] arm64: defconfig: remove SENSORS_SA67MCU
Date: Mon,  2 Mar 2026 13:24:47 +0100
Message-ID: <20260302122540.1377444-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042606_610332_AAB92063 
X-CRM114-Status: UNSURE (   9.81  )
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

Remove the SENSORS_SA67MCU from the defconfig because the driver was
removed.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..5fb4ae3588e7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -755,7 +755,6 @@ CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
-CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
-- 
2.47.3


