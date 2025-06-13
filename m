Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF83C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=otyT+YaTJjPBX9e3RtgYlk7uAkCyCMfxu1qgrQAGDgk=; b=FAzLCSZZg7My/G
	7ltjEkMtMOtzDsZnSTwXXUNQUJUO+W0kDVMqnsS/A4US5yE+VM3oK7jos03RKNG31Z0m8t8231sFW
	61pfUtup7eiONrRAD+eCyO9uRvcCjDqYKOVPgCBO1WkaqT8hOb8AGoNjkLe/0fsUbNOqb1SrhC+9c
	h1WhoXrk/rud5EDHqsPXYHMZH/+HVt5vbXNvfO6hLm/I0yxDyLWa65Iy4sJKug4QJbVz5Tfog4Ahe
	BFPwBsm9GqArBx0mxWZO5KTk7uI3q6Xgx8vsc0hOk5juECkTv2YNFEIo0fCH02IrHZzN+ogAqBoqM
	HpPFoASsPcqWr+IvxvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xo-0000000HGdD-20ZO;
	Fri, 13 Jun 2025 18:17:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6nw-0000000Gyx4-18kB;
	Fri, 13 Jun 2025 15:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44535A51438;
	Fri, 13 Jun 2025 15:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B51C4CEE3;
	Fri, 13 Jun 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830334;
	bh=ubx0aSPirWzdiPRt3UtSIssQRIZ/h985GJfW7cPAiJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Cb2gSlz42q4+9rckZbHNm9mmnaMRvUkvnKuTABMYiq84cfWP92JqlnKt4mc/n1poM
	 T1TVcBG64hgiXnN1aHOB/gmT48zyQJZyMuDYETaY5RHNIjn6CXyB0f5jMv+qNx8OoK
	 G2wnFuAqX6HtyA5hVjSFwbyd9k58RoaA+uERxSXQFNexM+5+E+YvraktV0HOcCYw+u
	 fzC/lxxv9xfphyGnR6gtAC8Of00o1jYtLjo/lL95F/0SKU3b6ob3iwvx57JLO+hoGw
	 hdtymaQhdLgvfyR0uQzoUfJDQErdB8E/NcxpoZN50++35IjeEINdfnkpPoGoPclMxL
	 RRUepl/Ha9XoA==
Date: Fri, 13 Jun 2025 10:58:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com,
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 2/7] dt-bindings: pci: Add document for ASPEED PCIe Config
Message-ID: <20250613155853.GA962329@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033001.3153637-3-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085856_379793_E769B23C 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 13, 2025 at 11:29:56AM +0800, Jacky Chou wrote:
> Add device tree binding documentation for the ASPEED AST2600/AST2700 PCIe
> configuration syscon block. This shared register space is used by multiple
> PCIe-related devices to coordinate and manage common PCIe settings.
> The binding describes the required compatible strings and register space
> for the configuration node.

Make your subject match style of:

  git log --oneline Documentation/devicetree/bindings/pci/

s/Add document for/Add/

