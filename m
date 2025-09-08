Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ECCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 03:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHbvpCLD4BgNviyf/mZ/F8HePs4qrdtd4Ztv/GlIH04=; b=QJBEyyuv30Iw4U1FdsCjcDW9zc
	BpTOECrFQBtGI75wKYMKC90cQSIioLex0+VF7J1hfubUB7R826MzUPvFnOjzKtGUKO1mSrtAnx0SU
	9yd5C9KOPaxb/fwIH9jlbIXvD8Cd5TgCwtn3SmS5TKV01uAGwSaoa5hF4fuxerMemW1sypvgJTzs9
	DsiW3ZuHfDhySZ7brIt4C8LLBhbz+X9XqS4CJgmRM1+NAEKDoDfpzKJVT0QCqFv9xbivqiU14vxqH
	rnL1EuPYgzJ7+lhUyF4s9RhLfGd5rAvFmLM5AZfgyS8kbwgYC7MoW/Ll6C7/QswqodHQ6jNu2aBPi
	sxT6a35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSlj-0000000EINs-1FQD;
	Mon, 08 Sep 2025 03:42:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSiu-0000000EHZG-2Jgm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 03:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0ADE60007;
	Mon,  8 Sep 2025 03:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263B2C4CEF5;
	Mon,  8 Sep 2025 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757302759;
	bh=lVaQogxRxHTcdSmnAEDjTJ71tx8RD2jm4+c/+FwJSyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAHUGtf0ZWmD1BzjTl7H7Sc0d3vF4lov+wuMx7bLdXAyX9tfYide8ARlgvL247BVD
	 6pty0/0GhHOqMwME5JIfCbDVWXip7nbj61JTjDyKp6RbFlpn7PJhS9SMqoVOQujpZ7
	 tnaCbZypF1xWMznCZISz5uRnPkHE05vuyheacvOQe9OD5Jk6RfrRLUYk936fPnZVAc
	 7PTbqBQ2cmlr7xR6cXAlGKVQBOU+Bx7EfNLFuitjg+moNn+vM2TIO7PfA5tR4lENCT
	 hrJzn7qq0Te+FVFhxiT/+M+ynx4yZbxwwZU+I5l4NYurpfxqdIePQPWODIidGOcaBu
	 fwvLrCfG6NkzA==
Date: Mon, 8 Sep 2025 09:09:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, fan.ni@samsung.com, 
	quic_wenbyao@quicinc.com, namcao@linutronix.de, mayank.rana@oss.qualcomm.com, 
	thippeswamy.havalige@amd.com, quic_schintav@quicinc.com, shradha.t@samsung.com, 
	inochiama@gmail.com, cassel@kernel.org, kishon@kernel.org, 18255117159@163.com, 
	rongqianfeng@vivo.com, jirislaby@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH 00/11] PCI: Keystone: Enable loadable module support
Message-ID: <2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
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

On Wed, Sep 03, 2025 at 06:14:41PM GMT, Siddharth Vadapalli wrote:
> Hello,
> 
> This series enables support for the 'pci-keystone.c' driver to be built
> as a loadable module. The motivation for the series is that PCIe is not
> a necessity for booting Linux due to which the 'pci-keystone.c' driver
> does not need to be built-in.
> 

There are concerns from the irqchip maintainers that unloading an irqchip
controller is a bad idea. We had a lot of previous discussions on this topic.

But I would certainly welcome the idea of building a controller driver as a
module (tristate) and prevent unloading it during runtime (by keeping it as
builtin_platform_driver).

> Series is based on linux-next tagged next-20250903.
> 

No need to base your patches on top of linux-next. Either do it on top of -rc1
or pci/next.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

