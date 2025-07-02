Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2818AC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3Y+HgzkBSkvH4NC9/I3jKz6TJmgOGTm6DNQwZbY/YI=; b=F0BvD0le5znXmtUXi90B3VPlB3
	UmxYtAD+BYJE14gMbTFnFzb6q6v0Zy/kusUvY/j0WMoLuQLf1ZDA2qNY2+CFszOmRWbVr0a5f/0gb
	m2MK3MumVM+pfb5+5vUusE92LuDlQr10vRxjLj7q1QtCvF8EyweflgB5iEz6pLdk93inx0KF3gIkQ
	YCRWjrfS7XigYJtkiFvPz2YFdRlhgZ3v/B+USQAyKwDC5c9G7ev6lBGyl4NdoWFZXem9TCSRzhlAw
	1HIw7lYpVHXnVM4NzjUAuWwjIOY8nUNyC8b86Nb8E+wr1jajdXiWUomdEtt51zuumpkqNrW1dOJUu
	08YXBXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxUx-00000008SBs-1P7p;
	Wed, 02 Jul 2025 13:27:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxK8-00000008Pwb-16tD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D3Y+HgzkBSkvH4NC9/I3jKz6TJmgOGTm6DNQwZbY/YI=; b=iu3Vp/Lei5vSQm7J0DjXiSollc
	gFjMpjCoaYMdHz50lFXc0LR//aHhvY45UjGZX1Wo6JSxU2Rj8LQAPl28GfugMXenMPrzkCVlUm3i7
	GJP2lAsbR+eN19ZQHczFS6yRgj0uxIW9XdRC0bxbvw81MO5vLzt5fEXS83h6b33XxbF7nOfpg0QG9
	yn/IYpkK2lH7lGtGq0AzTnhDVDatK2/7C+1fFNo+nt/KcYUr5IPDmLSjEXYGVE6kTCqGQ0Xe5r43c
	CHddh6YIpCxrzOI3o+4aVQy8EJCh3UH1eMSjCGXnNRO7AXfK9m7UuFA/4+sOMSQyBhuXnZO1BUqH2
	buoIawrw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxK5-00000007Oyo-1zhR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 309B2A536BA;
	Wed,  2 Jul 2025 13:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C4BC4CEED;
	Wed,  2 Jul 2025 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462184;
	bh=BalqjDGonmJyXEzDFjwpcwkTqv8MDEHIz2hYDyigmKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3owOUtMnbbvO0krTqvLoWpLm1WkZCnvikqym0I+oe5gDYS6XcLZM0ON4AOd3e1Mf
	 hllI3RTOM+c8lyijWVGowILYr/ZOAHLki7Ud+J//IpPO9JA6BeK5PdVTDdperVX8SY
	 Sw/14lBoOgyzoA1OF5kX/ZxmW+4kxHw6lOWj2atwl5gT7Im+nRCjoprVWU3A5cFet9
	 62spxD0/kOK47Uh0NZTFQjUR+pXgGdr2OQk+BAyOmaPisTgVjPBRSTj34ab5DAC1c0
	 nIIZZmTXw+ZelUkHzkwsSGCRK/wQXYWDBKK8khIdHO/UvRAec5DJK2w8mdzt5d45c2
	 dNgaIEF2P+eUA==
Date: Wed, 2 Jul 2025 18:46:04 +0530
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
Subject: Re: [PATCH v19 07/10] selftests: pci_endpoint: Add doorbell test case
Message-ID: <u7crpzltdyqypkvrkfbs6sruc4z3cpzyvcnqkokzsicbqkoj7e@6uxhoifc5xl7>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-7-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-7-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_141625_779836_9D2797D3 
X-CRM114-Status: GOOD (  16.40  )
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

On Mon, Jun 09, 2025 at 12:34:19PM GMT, Frank Li wrote:
> Add doorbell test case.
> 

This also warrants a documentation change.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v14 to v16
> - Add set IRQ type
> 
> change from v13 to v14
> - merge to selftests framework
> ---
>  .../selftests/pci_endpoint/pci_endpoint_test.c     | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
> index ac26481d29d9d..da0db0e7c9693 100644
> --- a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
> +++ b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
> @@ -229,4 +229,32 @@ TEST_F(pci_ep_data_transfer, COPY_TEST)
>  					 test_size[i]);
>  	}
>  }
> +
> +FIXTURE(pcie_ep_doorbell)
> +{
> +	int fd;
> +};
> +
> +FIXTURE_SETUP(pcie_ep_doorbell)
> +{
> +	self->fd = open(test_device, O_RDWR);
> +
> +	ASSERT_NE(-1, self->fd) TH_LOG("Can't open PCI Endpoint Test device");
> +};
> +
> +FIXTURE_TEARDOWN(pcie_ep_doorbell)
> +{
> +	close(self->fd);
> +};
> +
> +TEST_F(pcie_ep_doorbell, DOORBELL_TEST)
> +{
> +	int ret;
> +
> +	pci_ep_ioctl(PCITEST_SET_IRQTYPE, PCITEST_IRQ_TYPE_AUTO);
> +	ASSERT_EQ(0, ret) TH_LOG("Can't set AUTO IRQ type");
> +
> +	pci_ep_ioctl(PCITEST_DOORBELL, 0);
> +	EXPECT_FALSE(ret) TH_LOG("Test failed for Doorbell\n");
> +}
>  TEST_HARNESS_MAIN
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

