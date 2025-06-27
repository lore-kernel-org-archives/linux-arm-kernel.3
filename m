Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A56C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wB0dMS6hivqSSBXtNM1k+cKaoQQFtES7HJcP+2+HrP8=; b=h2MluZKDlWcIrq
	sKQn5s72E8QGdMlxSc2ViSPf/Az+cv4+OmaZjYMXDbQZoOs5RLmWFIR19nYaCplf6TZ1ICt2JM0MA
	p8zKww0hASuq5TAQboIOCvO3+6UNrrSfie7AI0YtHSkiPB8H2V2AReRrtvTwt0F+0fOq4xcfwmVzV
	PeQPFJk3tqZyyoN9as4m8IiTIhqdIsEP22M1CvFtfQtWcrD8IWMSVUJwlFusoUUsiqgha5jyuPu0W
	A1pw2SIEUaRsBX5tT4SfCH6w42z+gGaMI98FtzbRzldahcKr9DDkg0+kaIC+469sR9GNHFv64hPqr
	kILWNF7mesf/LSa+HDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCzB-0000000FQDN-2Y8K;
	Fri, 27 Jun 2025 17:35:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBxS-0000000FH0J-0Ulx;
	Fri, 27 Jun 2025 16:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E62195C6A1C;
	Fri, 27 Jun 2025 16:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E870C4CEE3;
	Fri, 27 Jun 2025 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751041784;
	bh=zGKvNo/acvnr6nPN7Y6LvVuEW7FCaqjPXAJFWM3JHYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VCOx8pfqLEBsRP84PkmQ7ME8WzQwuJ14UPKXVs03rIDyqqzmdYRWD2tC5c0WWUoJH
	 tcmwzY9NtBtXGEOrix6+x3ZzPkjx4EszreKqaFyKrBcqakmcJMV5a10ECJG8HUFT5j
	 rFYqwFHfV+qMZbhcfFz45LTUgND4uaC4l3tYjEZ+ZgOCqwnrguARfZUS5nKSg42F3M
	 XIfUebBDXZz5nbGNVtzxE+9KGOlkBl2idjn9ttMnnMwMzPCNYBU/qMZec4M2TY8qSc
	 yEY12JJ+C9snuifaU2uy0ia6yfFHVSFiJI6jKF5Fwbuc+jqx13GeuGYuX8DV1G6ldE
	 uDg3dxdJWSh4A==
Date: Fri, 27 Jun 2025 11:29:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org,
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v2 06/10] dt-bindings: PCI: Add bindings support for
 Tesla FSD SoC
Message-ID: <20250627162943.GA1672296@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-7-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_092946_197149_88752F11 
X-CRM114-Status: GOOD (  12.28  )
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

On Wed, Jun 25, 2025 at 10:22:25PM +0530, Shradha Todi wrote:
> Document the PCIe controller device tree bindings for Tesla FSD
> SoC for both RC and EP.

> +++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml

> -  clocks:
> -    items:
> -      - description: PCIe bridge clock
> -      - description: PCIe bus clock

> -  vdd10-supply:
> -    description:
> -      Phandle to a regulator that provides 1.0V power to the PCIe block.
> -
> -  vdd18-supply:
> -    description:
> -      Phandle to a regulator that provides 1.8V power to the PCIe block.

> +            - description: pcie bridge clock
> +            - description: pcie bus clock

Gratuitous "PCIe" capitalization changes here and in supplies below.
This is just plain English text so we can use English conventions.

> +        vdd10-supply:
> +          description:
> +            phandle to a regulator that provides 1.0v power to the pcie block.
> +
> +        vdd18-supply:
> +          description:
> +            phandle to a regulator that provides 1.8v power to the pcie block.

I *would* be OK if you dropped the periods at the end of these, which
would make them match the other descriptions in this binding.

> +++ b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml

I'm not sure about the "tesla,fsd-pcie-ep.yaml" filename.  I see that
it currently only describes a tesla endpoint, but it seems like maybe
this should be parallel to the "samsung,exynos-pcie.yaml" host
controller binding.

Bjorn

