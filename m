Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA00CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVkIeOS8yFdKE4JHU+qeb6s0/70ldISnfTAI1PjQVt8=; b=wxhVi51Y+nQvDXSa1JUwls0MeL
	yZZa1pOMp/vQESruWokcZa9P9ir1Py9yBC2qtla8nf789a29X0sypM30H5kZX6uKtOlqaFlaJzcNY
	y+V0vDnSBMgiJj92XL+KqX6oyJEM7DoLGW+FGZuV9B4g6Sl8gxdNdBBmbOzYN9wFjdxcLxouD0Oc+
	BsRJ4bWA+F/5mBtKvjJhy533bkDCqq6id5QDLhHjRy9KGLvrclaaySB6PX0ljAqCiLTgWVgNw88/T
	ysKZVvwSIrfPlqrhb+vYgYXeeptNDVT4PYHPQ2Qmb15TYolrqtApB/mCt9HWS0AdF5lh2EHIAU85C
	cTwpaiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT74-00000005AhL-15Q2;
	Thu, 14 May 2026 10:16:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT72-00000005Ah3-2wjR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0D2C6012B;
	Thu, 14 May 2026 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4735C2BCB3;
	Thu, 14 May 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753775;
	bh=MVkIeOS8yFdKE4JHU+qeb6s0/70ldISnfTAI1PjQVt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gG5yh085PRYj5m2zyXmyL1cYJBjLTd64W6A2QJopdSbz4ogeHpFmN11YAMZNCqg5E
	 /yC2WuBLU/WxfxOBX5IxBXwn5MVqDDnt0EGXqC/2zA4YvxvYESvuX1A8XKvtLI7egb
	 M7SRmsaO1mqr1sGeOEbNy7UJ8RwmMM6I5q089WAIW1yFHBjfpVGtlPI0/yFyTGj9+X
	 v72VkAeDkBAs7LUGsCmGcMAQzZ5x3UyvY4M9JSBiGqBp85ABF6XEUBwDPfTSh32Nxp
	 J8P0iPRe637fhS4PntSL/c30QJKywouH7v5z/5xZ9B8a91p7qx28JYP87HXmHrLq6h
	 5Rlm6/C9b2hZw==
Date: Thu, 14 May 2026 12:16:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <20260514-lush-onyx-trogon-48eca5@quoll>
References: <20260513025101.1498104-1-hongxing.zhu@nxp.com>
 <20260513025101.1498104-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513025101.1498104-2-hongxing.zhu@nxp.com>
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

On Wed, May 13, 2026 at 10:50:59AM +0800, Richard Zhu wrote:
> Add optional interrupt entries to the i.MX6Q PCIe binding to support

Describe hardware, not "binding".

> event-based interrupt handling:

Same questions as last time.

Best regards,
Krzysztof


