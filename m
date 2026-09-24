Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F38C98316
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pvbg/dxk+AXCSTE+uheu6nRjPFHJfcJOZt8KrB0ENwM=; b=lIslw0sosUBzrYYj0IR53sUpMg
	dqtRLdzfTB1t+PPpew7UexxSmFpL7iAKJaHOwFtz7A3QMvauY9qC6HnHUmpvSWJvS7jzRyaj5MGCY
	NRPJgleaHZeTePEPaPDdSIhEP7E13vQJpYe1UrJgrsfFEf5iGZIjn/95bnWHfhX0VntVwr8XjotYv
	Zv/697nrUEX52wvTz876keUMzUaO53DAWmdH01hOP/iv52s+15mOyJuwXZJVy6mHiGozqFbgqjR13
	yxznYXhKOcU2TUqrsasDH/bo9oS4PuQ2aRFkKzItG/w5C5TeMPIKozZ6PA5XnXNELwoX1xJtMoG65
	5DHFmV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIW-0000000ABje-2LIG;
	Thu, 24 Sep 2026 06:51:12 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIB-0000000ABdZ-2ezb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pvbg/dxk+AXCSTE+uheu6nRjPFHJfcJOZt8KrB0ENwM=; b=Dfru81rGkINwCO7B3gaN4M5uo3
	YPXIChLRXufB1ejedu9Ey8Hs1FFFMo66uR7DMJjv7zcY9BCkvDa8+RVQhP8zBCJggH0+TiOp4cw9p
	9f6ldBzPmo5bw+CrGYDWebflmzupkpjnNNqWSHmDxdeGxNhZ6FWkv7QVr5xqJFs7GKFid1Fb7w2uS
	hnmAoFVaECVzrdN7R1duCNppMKN9RzfmSHY3bSdrtCyOIMZaDvbCXxb2vL4eCpudnxf3/5gGdSlf2
	c0mTgjMj9eubZoM8CRMGJSiuR1MeV+i+Td4ok3seYRZwSSQwV1YQP4HFNS4Zx1Blga0vUaYS5iPB5
	1UITnEGA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:54176 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9dI7-0000000AyGs-1v6y;
	Thu, 24 Sep 2026 08:50:48 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH v2 0/4] da9062/da9061 watchdog timeout mode
Date: Thu, 24 Sep 2026 08:50:40 +0200
Message-Id: <20260924065044.368341-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_235052_244293_D5F84DEA 
X-CRM114-Status: UNSURE (   7.71  )
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

This is a revival of a series originally posted by Andrej Picej in              
December 2021 [1]. It lets the DA9061/2 PMIC watchdog be configured via         
the "dlg,wdt-sd" DT property, to trigger a full SHUTDOWN instead of the         
default POWERDOWN on watchdog timeout, and enables that on the PHYTEC           
phyCORE-i.MX6 SOM.                                                              
                                                                                
From v5 of original series this resend drops patch 4/5 ("dt-bindings:           
watchdog: da9062: add watchdog timeout mode") because it already landed         
upstream as commit 382256b219fb, later converted from .txt to YAML by           
bd888a4377ae. Thus dlg,da9062-watchdog.yaml already documents dlg,wdt-sd        
property.                                                                       
                                                                                
Patches 1 and 2 (the mfd prerequisites making register CONFIG_I                 
writable) needed a rebase: an unrelated commit has since added                  
CONFIG_J, the register immediately adjacent to CONFIG_I, to the same            
writeable-range tables. Rather than reapplying the original single-             
register insert next to it, these merge CONFIG_I and CONFIG_J into one          
range, matching the existing CONFIG_G-CONFIG_K style already used in            
this file.                                                                      
                                                                                
Patch 3 (the watchdog driver support) still applies unmodified.                 
                                                                                
Patch 4 only needed its target path updated for the arch/arm/boot/dts           
vendor sub-directory move (imx6qdl-phytec-phycore-som.dtsi is now under         
nxp/imx/); its content is unchanged.

Changes in v2:

Patch 1 and 2: 
- capitalize subject description
 
Patch 3:
- implement Guenter's remarks (code refactor and update commit message)

Patch 4:
- capitalize subject description

Link to v1: https://lore.kernel.org/all/20260923111719.2032012-1-primoz.fiser@norik.com/                                         
                                                                                
[1] https://lore.kernel.org/all/20211206064732.280375-1-andrej.picej@norik.com/

Andrej Picej (3):
  mfd: da9061: Make register CONFIG_I writable
  watchdog: da9062: Add support for dlg,wdt-sd property
  ARM: dts: imx6: phycore-som: Set watchdog timeout mode to shutdown

Stefan Christ (1):
  mfd: da9062: Make register CONFIG_I writable

 .../nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  1 +
 drivers/mfd/da9062-core.c                      |  4 ++--
 drivers/watchdog/da9062_wdt.c                  | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.34.1


