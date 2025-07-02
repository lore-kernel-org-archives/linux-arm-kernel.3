Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAE6C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oauedJFcNupQ8Fk1UXI4Sti1IVfsmuuP3kAjEdP6s50=; b=HKfcbmpQ1Y3FODmeIUjlqHnZd7
	CYMUbqiwTe+jh7cRaw/hLF7rUyr4y5QXNYQDKhl7hzTkSxbFqTFpPLOCgJ9yvRkWg7xDtl8IdbF54
	vn6Eds9M2n6XBefv/o5+O8ABrpQ0fg/nrxa6nF0OMzE6fg3BbsH+v3PNQp5tXgfwicuwmYXhC/IE6
	ahFoTm3sW6gSSPvUdzsbkgTiCmnrNDmBt2MYQOmEXdanUfnSnnvcGdBXTVH1cxKQpdmG71Jo/p7U5
	5kXjz6psg9lkZYCr2fcr4KBtthKFF30eHo+DlnQy6+EOFZbLOupkRUrY8ATsDo9Ku3vT7Wt2Bbatu
	uQFl6uyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyKo-00000008c4Q-0dLm;
	Wed, 02 Jul 2025 14:21:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxFj-00000008PJb-0t2y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39F78A535AE;
	Wed,  2 Jul 2025 13:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CAFC4CEF0;
	Wed,  2 Jul 2025 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751461913;
	bh=usr+vdh8Cfv5WvS7rBd3qHZjCIE9fEJFds9FkIOefCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdILcO/ZVXR3CK4sFxnZRrFNZC9os6Ca2Md/27nxTz4uSSQJJgDg2ZtUqBBAL0UUY
	 q8YNMlZueUe+olSpZ/lVIl4u52Qzje626rfNfuMBEUZqJkPU6LqN6zvh+nDqE6iOmN
	 2TXH9ZEGuiH3lhZNoFo+O7XuKb+HAFeHe0Fhe9DJ8p2JVWMJkaznknlKHtUJ9vNkYE
	 +ENZ+AXsOTTetVgtp57o8oCNlOUNoR34UTgFDhvwiMs3WcgT+q0cWfQu8wZOc1/YPd
	 Iw0Q9I5rGoK6VfgPL2aBnsur5OIgoKKhR1jaaAviJLcjxdMsm6QvHPNSOOJDzd4vTL
	 4VLMbOH+VjLaw==
Date: Wed, 2 Jul 2025 18:41:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 06/10] misc: pci_endpoint_test: Add doorbell test case
Message-ID: <whbsnegk5g4vi626pstz5z3blztyrxdji566hpt6yq5jvna2ks@3nap2g4jiftg>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-6-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-6-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_061155_379303_97F63664 
X-CRM114-Status: GOOD (  26.30  )
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

On Mon, Jun 09, 2025 at 12:34:18PM GMT, Frank Li wrote:
> Add three registers: PCIE_ENDPOINT_TEST_DB_BAR, PCIE_ENDPOINT_TEST_DB_ADDR,
> and PCIE_ENDPOINT_TEST_DB_DATA.
> 
> Trigger the doorbell by writing data from PCI_ENDPOINT_TEST_DB_DATA to the
> address provided by PCI_ENDPOINT_TEST_DB_OFFSET and wait for endpoint
> feedback.
> 
> Add two command to COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL
> to enable EP side's doorbell support and avoid compatible problem, which
> host side driver miss-match with endpoint side function driver. See below
> table:
> 
> 		Host side new driver	Host side old driver
> EP: new driver		S			F
> EP: old driver		F			F
> 
> S: If EP side support MSI, 'pci_endpoint_test -f pcie_ep_doorbell' return
> success.
>    If EP side doesn't support MSI, the same to 'F'.
> 
> F: 'pci_endpoint_test -f pcie_ep_doorbell' return failure, other case as
> usual.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v14 to v16
> - none
> 
> Change from v13 to v14
> - update to use pci_endpoint_test -f pcie_ep_doorbell
> - change ioctrl id to fix conflict
> 
> Change from v9 to v13
> - none
> 
> Change from v8 to v9
> - change PCITEST_DOORBELL to 0xa
> 
> Change form v6 to v8
> - none
> 
> Change from v5 to v6
> - %s/PCI_ENDPOINT_TEST_DB_ADDR/PCI_ENDPOINT_TEST_DB_OFFSET/g
> 
> Change from v4 to v5
> - remove unused varible
> - add irq_type at pci_endpoint_test_doorbell();
> 
> change from v3 to v4
> - Add COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL.
> - Remove new DID requirement.
> ---
>  drivers/misc/pci_endpoint_test.c | 82 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/pcitest.h     |  1 +
>  2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> index c4e5e2c977be2..0f3af7adea107 100644
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -37,6 +37,8 @@
>  #define COMMAND_READ				BIT(3)
>  #define COMMAND_WRITE				BIT(4)
>  #define COMMAND_COPY				BIT(5)
> +#define COMMAND_ENABLE_DOORBELL			BIT(6)
> +#define COMMAND_DISABLE_DOORBELL		BIT(7)
>  
>  #define PCI_ENDPOINT_TEST_STATUS		0x8
>  #define STATUS_READ_SUCCESS			BIT(0)
> @@ -48,6 +50,11 @@
>  #define STATUS_IRQ_RAISED			BIT(6)
>  #define STATUS_SRC_ADDR_INVALID			BIT(7)
>  #define STATUS_DST_ADDR_INVALID			BIT(8)
> +#define STATUS_DOORBELL_SUCCESS			BIT(9)
> +#define STATUS_DOORBELL_ENABLE_SUCCESS		BIT(10)
> +#define STATUS_DOORBELL_ENABLE_FAIL		BIT(11)
> +#define STATUS_DOORBELL_DISABLE_SUCCESS		BIT(12)
> +#define STATUS_DOORBELL_DISABLE_FAIL		BIT(13)
>  
>  #define PCI_ENDPOINT_TEST_LOWER_SRC_ADDR	0x0c
>  #define PCI_ENDPOINT_TEST_UPPER_SRC_ADDR	0x10
> @@ -62,6 +69,7 @@
>  #define PCI_ENDPOINT_TEST_IRQ_NUMBER		0x28
>  
>  #define PCI_ENDPOINT_TEST_FLAGS			0x2c
> +
>  #define FLAG_USE_DMA				BIT(0)
>  
>  #define PCI_ENDPOINT_TEST_CAPS			0x30
> @@ -70,6 +78,10 @@
>  #define CAP_MSIX				BIT(2)
>  #define CAP_INTX				BIT(3)
>  
> +#define PCI_ENDPOINT_TEST_DB_BAR		0x34
> +#define PCI_ENDPOINT_TEST_DB_OFFSET		0x38
> +#define PCI_ENDPOINT_TEST_DB_DATA		0x3c
> +
>  #define PCI_DEVICE_ID_TI_AM654			0xb00c
>  #define PCI_DEVICE_ID_TI_J7200			0xb00f
>  #define PCI_DEVICE_ID_TI_AM64			0xb010
> @@ -100,6 +112,7 @@ enum pci_barno {
>  	BAR_3,
>  	BAR_4,
>  	BAR_5,
> +	NO_BAR = -1,
>  };
>  
>  struct pci_endpoint_test {
> @@ -841,6 +854,72 @@ static int pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
>  	return 0;
>  }
>  
> +static int pci_endpoint_test_doorbell(struct pci_endpoint_test *test)
> +{
> +	struct pci_dev *pdev = test->pdev;
> +	struct device *dev = &pdev->dev;
> +	int irq_type = test->irq_type;
> +	enum pci_barno bar;
> +	u32 data, status;
> +	u32 addr;
> +
> +	if (irq_type < PCITEST_IRQ_TYPE_INTX ||
> +	    irq_type > PCITEST_IRQ_TYPE_MSIX) {
> +		dev_err(dev, "Invalid IRQ type option\n");

'Invalid IRQ type\n'

> +		return -EINVAL;
> +	}
> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
> +				 COMMAND_ENABLE_DOORBELL);
> +
> +	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));

You should check for the timeout here and below.

> +
> +	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
> +	if (status & STATUS_DOORBELL_ENABLE_FAIL) {
> +		dev_err(dev, "Failed to enable doorbell\n");
> +		return -EINVAL;
> +	}
> +
> +	data = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_DATA);
> +	addr = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_OFFSET);
> +	bar = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_BAR);
> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_STATUS, 0);
> +
> +	bar = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_BAR);
> +
> +	writel(data, test->bar[bar] + addr);
> +
> +	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
> +
> +	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
> +
> +	if (!(status & STATUS_DOORBELL_SUCCESS))
> +		dev_err(dev, "Endpoint have not received Doorbell\n");

'Failed to trigger doorbell in endpoint\n'

- Mani

-- 
மணிவண்ணன் சதாசிவம்

