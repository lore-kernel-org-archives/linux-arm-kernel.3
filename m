Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFC2E98E13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9KyuG9XgjpihXrjGMwXLuf103/DAjAkkzo4U07uSKA=; b=ysRCDVzsnqVxk37xDOwIZled7M
	9Pt1IrN/hjQ40FHq0e5jGtzwBRjUyCQQ4hfjbArHFgGyQsr7CFqJsgi2mvkJrnxxyHTBVr7sGB1il
	ZuN79d/hATOoMl1PIvoC8dXspHMbUUL0IjKwE4w8sCglCa3J4+keFM+7r6DvEVoRr8yyhsMl+CLog
	Eh4ELiWJkxkADCt2T+niTLLrWCJGFgrNOFe8b24nsKk5Mb/TFsc6i3Me4w/tUt4H7skGzTlv2teds
	3gYZCUo6/pCiMxeqkRWVNZphS0Wp5143LclUF+DHmoG8hUYiCbi1G8Ix1a0XCXWlDVpqy+b5WjAUC
	P/ao/woA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoX-000000000Aw-3ci4;
	Mon, 23 Feb 2026 10:05:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoW-0000000009k-1i7w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5481600CB;
	Mon, 23 Feb 2026 10:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92C6C116C6;
	Mon, 23 Feb 2026 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841114;
	bh=CwOK2TpwDjvleWI5ncKbppOyRNpTmchpH8bwQirbQvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jKPagN2y9Kwouaty5QIPa7gZFwDoAlsoo0xyF19YB/v4b+xeGOgXtoUDiKjBA9K7N
	 h06h1VPb3PjfJ6OiUA2lIjm8AEQDhUPI84st2zmiQ2V2/o/lW58A8KkjxWBTNPsl/d
	 sYXiPSLWNkj8LaANH2S4GJcJBJtJ2dazTPvMznKJoCjXCVubiHAondwz6QkCu9H3Is
	 fxKDxIj3snY/6vqWBcsNk3067zbDriWTI4dD4cmNiTCoGO7nerKkG9KoaTFy5OpXM/
	 NguJkNLhn2s99I/TOzithQCIHNz+N1jPceI6qRrZJx+89jQW6IyZ4+fmHrzClFOZnn
	 Ka24jO5gRy4nw==
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
Subject: [PATCH 2/8] arm64: defconfig: remove SENSORS_SA67MCU
Date: Mon, 23 Feb 2026 11:04:47 +0100
Message-ID: <20260223100459.844967-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Remove the SENSORS_SA67MCU from the defconfig because the driver will be
removed.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..b7bdb8af77b4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -754,7 +754,6 @@ CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
-CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
-- 
2.47.3


