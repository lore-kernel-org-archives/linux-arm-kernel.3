Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C02AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jeb13SokNNFpJkdvHxDAZCgiIX6KKVTISmQSdYUXtd4=; b=0x7BhUmLI6K3VpaamrdeEn2G1e
	eukedDgqyOc4GWfpM1/fIw9ygkfKoPNq1pqh+7FaF9pqpOiiiU+Finq117linMmpruZ0LG1/rVm4k
	hrRpkOUFDXURwqW9fAM+h/Mf1XSdkQmFnTk/PJM5YvsGIV7bW032yknCHRAo8bAR4drEAXm/s0PBD
	XHLlLa1YpDJoK4FwBMCozPAJ05t/t1IbW+f9bQki2TwobAyCWjcP9U31ef9XaAIIvwgadaoCHMuSV
	JnBryn7wwGdFiYH6UtJaPTBM4YxcPB1CWzXlt/FXUeSIx6d89ntV8XMof0RxTPEgQdDMHwhZMuHpz
	QLlN7x9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMliN-0000000D9vy-0Yoo;
	Wed, 04 Jun 2025 10:51:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMleF-0000000D9RW-1a7T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 10:47:08 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554AkwBt745182;
	Wed, 4 Jun 2025 05:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749034018;
	bh=jeb13SokNNFpJkdvHxDAZCgiIX6KKVTISmQSdYUXtd4=;
	h=From:To:CC:Subject:Date;
	b=UkzhLjlwcvCa5DuEtyqeYjyKZ4LNecR4UoGJRaEzT4pIPBTems+QWHw2TIcvwsPm+
	 CgNqTdeOo+F5+OvsBrqNBxB2k7JL5QglPqezF4m9ksGGnRzmDpK85LUyCtOgGwpDy8
	 6hn+0rrbVABh31anURtckR8r3bL9zp56CLgsIw5E=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554AkwOg1977619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 05:46:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 05:46:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 05:46:57 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554Akvjv1917870;
	Wed, 4 Jun 2025 05:46:57 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-donadkar@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH 0/3] Enable audio support for J721S2-EVM
Date: Wed, 4 Jun 2025 16:16:53 +0530
Message-ID: <20250604104656.38752-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_034707_459563_0A652340 
X-CRM114-Status: GOOD (  10.05  )
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

These 3 patches add the support to enable audio on J721S2-EVM.

This required the i2c-mux support[0] which is now in linux tree.

Now, this series ***depends upon only one dts change[1]*** to ensure there
are no dtbs_check warnings (no functional issues):
"ti,j721e-system-controller.yaml" refers to "ti,am654-ehrpwm-tbclk.yaml"
for clock-controller nodes, but for audio we need "ti,am62-audio-refclk".
When scm_conf is "simple-bus", there are no such warnings.

Test log: https://gist.github.com/Jayesh2000/840c19ef8f9b7f0f75dedd015ccbf98a

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc829dbde9bf1f349631c677a85e08782037ecf
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/


Jayesh Choudhary (3):
  arm64: dts: ti: k3-j721s2-main: Add McASP nodes
  arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable analog audio
    support

 .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  99 +++++++++++++
 2 files changed, 230 insertions(+)

-- 
2.34.1


