Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6643CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYsLbsYqre0/2A1iME4CXP95x8Y+41gNxqmAh0eb+zA=; b=EUhvimEDYATQPObvmYzGu/ZJSq
	bMmPOANxikdAzXj3pSjOUZMVS+7KOdFVsQPJQhWkjsCFWte19mg2PBCkUATMHIuyO4N7JGaTBFWXr
	6yLkDgGD/VXkJFBaeIG0fwCZhOdre7rAnRHB+1Ley00DSnV4m2E1iK5pEUrq7cjCNVUYf7TOT/y4F
	Aid4MgX8+P9xkH53UPftkeFgcMoiP5p/QzUKN93NrDxjTOscrFPmc9XaLbFGHzQ7Gw5losna/PQJn
	P8pvrC6LGq9UL+0yLsoM8qIxnNQOHGmpssls45ExPpRLjraikbRJ9zKDXCqI8P5GKPqnRVYZXrEIX
	X7cxk0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1mH-0000000FXHO-2SVO;
	Tue, 21 Oct 2025 02:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1mE-0000000FXGk-2aWQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 02:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45B67491FA;
	Tue, 21 Oct 2025 02:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57556C4CEFB;
	Tue, 21 Oct 2025 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761012426;
	bh=lea45PnhCbZ2sLHs3xr7ltskoeSEMmGeuwyEfGGX1Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8/9UGAmepYo0j9vJ4bIkQchuenciclVLqqFLNwcxiSeAsEdrcZ/puGGlF1EieTyh
	 MqVVDlTmIw4CZbu6TSZfeSRy7hhE6Kr7/oMmbELETlm2HZfzPlHAbGH4R9AZETTyDu
	 77FaoE1BBY8O7lULyKNmDydHVPSg1N1Ch6bI1mMRklSilmeQ3g1IURNjZru2bJfsFx
	 SqwxMWxlHB5i/MJqmNpNjIjj5YHTCNjuaRwFqZSqfTcezJ4m56xMF1TonyNHpcUWwZ
	 /C9UaEMCIHl4yna0JpGX5pZAeL/4FC0L6vaxmRunMGx96+HzffBho6PPghAAQ5hrt2
	 r2J41Ks44Rhhw==
Date: Tue, 21 Oct 2025 07:36:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vitor Soares <vitor.soares@toradex.com>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] PCI: j721e: Add support for optional regulator
 supplies
Message-ID: <p3l2p2raecqqkpdjswiddkthpxzvhm3rl4cw56y2epgcxfiwbb@gsieef3yqvpk>
References: <20251014112553.398845-1-ivitro@gmail.com>
 <20251014112553.398845-3-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014112553.398845-3-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_190706_673680_4C78B40E 
X-CRM114-Status: GOOD (  19.97  )
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

On Tue, Oct 14, 2025 at 12:25:49PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Some boards require external regulators to power PCIe endpoints.
> Add support for optional 1.5V, 3.3V, and 12V supplies, which may be
> defined in the device tree as vpcie1v5-supply, vpcie3v3-supply, and
> vpcie12v-supply.
> 
> Use devm_regulator_get_enable_optional() to obtain and enable each
> supply, so it will be automatically disabled when the driver is
> removed.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 5bc5ab20aa6d..f29ce2aef04e 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "../../pci.h"
>  #include "pcie-cadence.h"
> @@ -467,6 +468,10 @@ static const struct of_device_id of_j721e_pcie_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
>  
> +static const char * const j721e_pcie_supplies[] = {
> +	"vpcie12v", "vpcie3v3", "vpcie1v5"
> +};

Please don't hardcode the supplies in driver. The DT binding should make sure
the relevant supplies are passed (including the optional ones). Just use
of_regulator_bulk_get_all() to acquire all the passed supplies.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

