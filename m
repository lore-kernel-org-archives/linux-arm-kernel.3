Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC0FD597A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CIaljBntNdosJcYXB5qEBigXw3CArhvaUO+bs+WKn70=; b=WiCa33ihnTuPps
	OjRt6Y+NsV00xhcwWXjSjXX4tYkbs+ESruufI3FiUmWOXn35u0ol22Xsw9Fs+A08J4T8r5kTfUG5J
	itHcuR6oUYzVgAk3F6AoRr1siqMXempb1AmpP05hfH1EiVnaIAyWGhZwzybcfY9IMZJ/wOp8g3JVa
	kpTWfEZTefTB3F6Wvmvr2+vApjktDQHeVve0ZWMK1SZyOK9Kwz7JzOGCnfofdAolbkXtQYC+IYc3t
	AVezP0qZu5Zit3UppA2Q6Wi+y+Vo6+xU3L7uz7prZ3NRbez4KJhhdJ8EuhRRCLRdye9r/1A1xsXB6
	9ecEiX+T5vr0mfMUStDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxiY-00000004tsv-3osj;
	Tue, 12 Nov 2024 20:42:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxfh-00000004tRZ-3Tx3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 20:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3A165C58A2;
	Tue, 12 Nov 2024 20:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76B9C4CED7;
	Tue, 12 Nov 2024 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731443972;
	bh=Cz4bRV94/5MKAskZbYAn+TUSR0LBQP5CIfaO0PQZ+eA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ff1apUwpOiGPDm+i+5r5B3s5dmMB2dJgxctx3edd+b8FqF8Nq3n93rQlg+41y6zOA
	 EPwhloVc6oGbcSWc3w0fax5DWB8hXhLMxLQJDc4PLLIMp5u3XuwJGwYPr+k0fxj1JN
	 TvpI1koK8FK9Jz1qa6gsTyhc3PzbzilN2ZW+SDXjPgB15ms1yNhVgTOmpQE8s7gjNQ
	 CYy8yCHHLYst8fgwZop0vbGlqErCDK4gxLXQdkg4avOvz8LJtuxCVfYTHZF2biblwf
	 5JfB0NGw1U2oK8kbGhKypOx4xWcXZKafm1zqdSAGge/7VCqmssFPjEgxVbe5+4yk3k
	 Gp8simaEgiFCg==
Date: Tue, 12 Nov 2024 14:39:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
Message-ID: <20241112203931.GA1858001@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-6-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_123933_927318_9B85903F 
X-CRM114-Status: GOOD (  12.58  )
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

On Tue, Nov 12, 2024 at 05:19:25PM +0100, Christian Bruel wrote:
> Add myself as STM32MP25 PCIe host and PCIe endpoint drivers

s/as STM32MP25/as maintainer of STM32MP25/

> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4803908768e8..277e1cc0769e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17912,6 +17912,13 @@ L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/pci/controller/dwc/pci-exynos.c
>  
> +PCI DRIVER FOR STM32MP25
> +M:	Christian Bruel <christian.bruel@foss.st.com>
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/st,stm32-pcie-*.yaml
> +F:	drivers/pci/controller/dwc/*stm32*
> +
>  PCI DRIVER FOR SYNOPSYS DESIGNWARE
>  M:	Jingoo Han <jingoohan1@gmail.com>
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -- 
> 2.34.1
> 

