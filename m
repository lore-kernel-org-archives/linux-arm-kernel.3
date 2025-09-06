Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 01:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7F0n7D432kI/8TDM2zzfMQeAXcSFxDGIcCb60S29Ag=; b=zPOSDp5eb78I1OW/PScFfH0Sik
	PDemvZLElbwDsSoDx0uoKmbLrRAhrgfPPkiiOGL51gjY/fSyapWluo1BfFYCJ+VXRwFFA8A7SWMj/
	veyGQYunVtw6gsawhwpU8GIYMaDgzSDdK1LKk3k7C020uLx1M6B1KoSycIpcvWwVjEQG44icXPjkw
	ozk0oXDytEUgCPgu+mMJdjw0HBUHdi40IL66j/Bpp6KDFC4LmSNE/AgSCQxtTeSDQZKAAdgVmfEDJ
	u4zlkNlUWr73t8KuIyz+AUHglFbZCmDrorxw9j2N1uo5M2qKDSZXlGHcIqjBG/AOlpYZYbo3R+0P1
	GRNZHw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uui4s-00000005yWX-0WBf;
	Sat, 06 Sep 2025 01:50:54 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uui22-00000005x7f-0wg0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 01:47:59 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5861lplt3440581;
	Fri, 5 Sep 2025 20:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757123271;
	bh=L7F0n7D432kI/8TDM2zzfMQeAXcSFxDGIcCb60S29Ag=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aMPgdkMyU0tQsAXg6Z67kzB+8r9scFyKT3o5TgOgy+IJrss8I7NQAhNyKI/MWV8vt
	 licxwf4EraFKp2U2gpVfNpe7cAhm/8w4RWzyZsTVqHYGHC1AWqA61xaWzIXMtAef78
	 SPKmKULN0QmAOJ2JKPUMkCzqH6Wj24BMCBoDRzSk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5861lpko2051501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 20:47:51 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 20:47:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 20:47:51 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5861lnUb1300100;
	Fri, 5 Sep 2025 20:47:50 -0500
Date: Sat, 6 Sep 2025 07:17:49 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
CC: <vigneshr@ti.com>, <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <linux-omap@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: j721e: Fix incorrect error message in probe
Message-ID: <22e63c06-ec7f-4afe-8fc2-f90d49004ce9@ti.com>
References: <20250905211436.3048282-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905211436.3048282-1-alok.a.tiwari@oracle.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_184758_306151_231CBAB5 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Sep 05, 2025 at 02:14:34PM -0700, Alok Tiwari wrote:
> The probe function printed "pm_runtime_get_sync failed" when
> j721e_pcie_ctrl_init() returned an error. This is misleading since
> the failure was not from pm_runtime but from the controller init
> routine. Update the error message to correctly reflect the source.
> 
> No functional changes.
> 
> Fixes: f3e25911a430 ("PCI: j721e: Add TI J721E PCIe driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
> Not sure if a Fixes tag is required here
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 6c93f39d0288..5e445a7bda33 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -549,7 +549,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  
>  	ret = j721e_pcie_ctrl_init(pcie);
>  	if (ret < 0) {
> -		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
> +		dev_err_probe(dev, ret, "j721e_pcie_ctrl_init failed\n");
>  		goto err_get_sync;
>  	}

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

