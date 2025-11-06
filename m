Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8322CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 00:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NlLGWeT3KVpe70zKYE9KyDhVQrecsnB0b6EAh1BEKRM=; b=jkmPt1JvMyYAzS
	LAYUMhn+ljlmCKyQq1S+Bk0ADOOwicyfRh83JaxJDmw4bZB0d/+u+LUFGWHROhBteOgXoaUof0x1w
	k0WY/ZCncbXKG2e/AneGfFOVOTNHVvnRCChHHIv4tKrAzPfWI80o+/n+2Gv85PlA9LJD3xUFik46J
	pGtAk6HyeLQjbpZ/kkikzFWfxXh3GH8H9Rox4qGqvXekogqYeLRf6FdAOyhVB/Ne9vPgVVJqis8Zp
	kMMB4a9wi/1YPSPcRbC96Xvzy91ij6prf1WWnLPTJrAKWPSqgLfjJCq2nKpUJ93WbAsXypqBepxk2
	E9jTj5/qqKJ07D1TXOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnQx-0000000EdTP-0V2b;
	Thu, 06 Nov 2025 00:00:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnQu-0000000EdTJ-3l1i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 00:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE39E60224;
	Thu,  6 Nov 2025 00:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E245C4CEFB;
	Thu,  6 Nov 2025 00:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762387254;
	bh=5IK5qZfBjMO/Z5358IGhBKuigXyQuAzqcpc4dXrDunc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YxzfXxvYcR3RlTH0HKRVAzhkpjaPTcY/o1R3VVPf0UDf9p98OQn6a8kwF2rBRUg/Z
	 HDFXzEPvIQuJGaVqj5zZTOsjyoaMkE4Rbw4EbNNXBjD4BpATBd/1kEVBd2HWlNXfmt
	 550GLlqGovaCwYjgyHDcJE/P9Y/tTxnkaERkmJC0QStvxFv5jt32c886hIvOHSg24e
	 J1BpC/EMdz0I1adY1GhrxAjp3KbGRgWy0GukHujC4+/tlXgPedslb2LZY5sHSGpbiM
	 z7jDzyZ1Kp6BkWE4LdzL3eH9Kcp8o5n+nSQ8VYHUUcBjbdk54ZX5Y0rmKQOphcqb71
	 nLB0vd/F7h05A==
Date: Wed, 5 Nov 2025 18:00:53 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <20251106000053.GA1932421@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022174309.1180931-2-vincent.guittot@linaro.org>
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

On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> Describe the PCIe host controller available on the S32G platforms.

> +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space */

Fix comment alignment.

