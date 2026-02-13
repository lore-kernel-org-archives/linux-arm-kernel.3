Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EE0EF99DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62NbBiHOG2ObAhbgW7IBFCax+wToPdMR/Jlwgnf4L/s=; b=hrBrhyald0TeZ/SIaZ3wsLmAn+
	7rRPLOM94ozsKYypFwtatyGvMiNCW/BOf/Yq8/Ifcy7leVAB+DQi/Psp7bHtBFCnChb/mnUYFNOfQ
	X1xFIpMEHBYME+zFg+92IpYS8EUE0B8ZwRMR0hhEHiub9TToyhsHXmcRHq3zxZuwh75ke86n8thMT
	cG4/QJY1IP5g+0EX0vSp9F3pyiBNNWmwcZ4xeZ/I4zLX6PYJFBumEuekh5ItZJ1luUqrhMcAjuvwg
	yztuDhM5u1Wjs3Ucj8z0G/8+9qz8EaXCb93mYnUoyymZbw8QLN1kZxmNaxmT8HU98uqpF/WlXXNcu
	Rdh7xH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqzqy-00000003v23-0uv2;
	Fri, 13 Feb 2026 20:33:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqzqw-00000003v1t-3X73
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 20:33:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C8560054;
	Fri, 13 Feb 2026 20:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37491C116C6;
	Fri, 13 Feb 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771014805;
	bh=pmsGgNGAlAB0kNHZRIueghS0hE9sslQs2cfoHwsmqb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lojyy4b+l7aLIqPeIavbcrCLV0xvpgA4q69R1eG+or5truDhSFf7hdE4WemB5StE1
	 yCSWEiqGt1tlVDOL6E5zZOXl6ki4A9c2pdHh86HUy9QEJ3TKzx9UWUudJO29T4vzOX
	 b6iGbIVP/+NoIm68si3OZYh3ITJzrbetPHMnKKTQSQH3U49HhGFIR9wajWPxQT5DPs
	 ekNrs/0ga5pLaixiSRrnybU+AF2v0LhX6qYldSmXMZO9vLc5lMNqz+T/jVi0L1lFz+
	 Tl7IWMbPKRfrmi0SECKWoXPc5r35/ApxnOR6x2AyMfYjrUkzSe1GupQtwHFltJ0oPL
	 6zPYKq3/0qBug==
Date: Fri, 13 Feb 2026 21:33:20 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	bhelgaas@google.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s-vadapalli@ti.com,
	danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 1/4] PCI: Add documentation for DOE endpoint support
Message-ID: <aY-KkFE9Ya2ZF8ED@fedora>
References: <20260213123603.420941-1-a-garg7@ti.com>
 <20260213123603.420941-2-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213123603.420941-2-a-garg7@ti.com>
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

On Fri, Feb 13, 2026 at 06:06:00PM +0530, Aksh Garg wrote:
> From: Aksh Garg <a-garg7@ti.com>
> 
> Document the architecture and implementation details for the Data Object
> Exchange (DOE) framework for PCIe Endpoint devices.
> 
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---

Usually documentation is added as the final patch in a series.

I think this patch should just be squashed with patch 4/4, and the
squashed patch then being the final patch in the series - patch 3/3.


Kind regards,
Niklas

