Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06BCCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKLV4+58bTG8VBls3155eUBifK8pZ1zD59z4H998/Xg=; b=jL8gekeQ8j+HwMx7wbwOLP2xUp
	vWLQR9ot7uBl8SzCkXLwukwxgPXNs5HRwvzMTnPWLymWk7gjl0bqghU40D2y4svSyMUtkXQHJptH+
	ZK2OJ2VMX0N0sDmjVo65iaqHHf0gz4PMYAN24e5B8no8g5YZvsI2hdV+CUajwynPp+4Mj5SPp9Mc4
	EbckDF6No58PCdD3EA7AC5UFoyKpCQWC+RNfgv606Rt7R2RoumePSrZV5QMHEokfHpZ30mM0Ro68P
	R2wmIfWMK/ojN/MDZWqkhwCWBXy++FMj7jN6F4wa9QITIDXVwV+dNyXfxP8DT2Plh72C8uOz4PBTX
	Flina8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ymp-0000000FF5a-1a6Y;
	Fri, 26 Sep 2025 03:06:19 +0000
Received: from mail-m19731107.qiye.163.com ([220.197.31.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1yml-0000000FF2K-12YX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 03:06:18 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 241ea83c5;
	Fri, 26 Sep 2025 11:06:09 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: robh@kernel.org
Cc: adrian.hunter@intel.com,
	arnd@arndb.de,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	ulf.hansson@linaro.org,
	will@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v4 4/9] dt-bindings: mmc: Add Black Sesame Technologies DWCMSHC SDHCI
Date: Fri, 26 Sep 2025 11:06:08 +0800
Message-ID: <20250926030608.2951582-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923135620.GA3119392-robh@kernel.org>
References: <20250923135620.GA3119392-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9983fc398209cckunmb335c2cb8db69e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTBoeVhlMGk0ZTRodQ0JDTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=e88RQ4qIHmc+kYFzbklCrM0t2AxXMrqOhSc8K7MwuUbv1RswqVZoh3rjsy4f1eSnpuYFBbQnpM29auwmHpAjznO53ylvcGgvRZ0B92pASS/x4f6BT/4tazqluJf0c3Np77Bj6qcy5ngSMd0qOYYs/mmHvR1mIClKTurBrblMUIQ=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=KKLV4+58bTG8VBls3155eUBifK8pZ1zD59z4H998/Xg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_200615_553094_DE74D76D 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, Sep 23, 2025 at 08:56:20AM -0500, Rob Herring wrote:
> On Tue, Sep 23, 2025 at 02:10:10PM +0800, Albert Yang wrote:
> > Add device tree binding documentation for the Black Sesame Technologies
> > (BST) DWCMSHC SDHCI controller.

Hi Rob,

Thanks for the review.

> Thanks for the changelog here, but the subject should have 'PATCH v4' so
> various tools work.

Understood. Will ensure v5 has the proper subject format with 'PATCH v5'.

> Filename should match compatible.

Fixed. Renamed from bst,dwcmshc-sdhci.yaml to bst,c1200-dwcmshc.yaml 
to match the compatible string "bst,c1200-dwcmshc", and updated the 
$id field accordingly.

> Not really any point in having -names when there is only 1 entry.

Agreed. I've dropped clock-names from the schema, DTS, and removed it 
from required properties.

> Having this is odd. Please add a description saying what it is for.

Added description for memory-region: "Reserved memory region for bounce 
buffer. Required due to controller's 32-bit DMA limitation while system 
RAM is above 32-bit addressable range."

Updated example:

    mmc@22200000 {
        compatible = "bst,c1200-dwcmshc";
        reg = <0x0 0x22200000 0x0 0x1000>,
              <0x0 0x23006000 0x0 0x1000>;
        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
        clocks = <&clk_mmc>;
        memory-region = <&mmc0_reserved>;
        max-frequency = <200000000>;
        bus-width = <8>;
        non-removable;
        dma-coherent;
    };

Please let me know if you have any other concerns or suggestions for 
this binding. I'll send v5 with these fixes.

Thanks,
Albert Yang

