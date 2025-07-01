Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A45EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sdmq//H9qpGeZGvnanTINHZge7E2/2YYtXczGP00GEM=; b=ywBU9Iqa0vaDVIM0lkaBMQMp/1
	Xn0RNwjicKCCX4DDYezDH3keUmsZjANTDk5n7ydrz3qU+CBGnjLzA0rdD0m9oZXA7vB6/cfk8ninG
	X5oSY1srQFBD1PQf8c45EFZuaqffUnjro29TfpEBw8TNFus5locanJmnGfTle8ZGk+HQa6Bty8JNR
	DoHA+26NQh3V9CHDEF43QjwsRwJR+Fb6SnAkb/itKI2FdRXT69IrT85z1hqE5+g2wKvTJ9gQvWDz+
	RyWUfnjA9qwqIHUsQMdz7M1slni6NEvXv7lXvqyrsI2Up+53OyfGa0nHUJloaQGsFITodqQGsy0iT
	1U03YlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbjY-00000005ecq-3Pie;
	Tue, 01 Jul 2025 14:13:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaMH-00000005MyI-3WpR;
	Tue, 01 Jul 2025 12:45:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0EA6A52FD9;
	Tue,  1 Jul 2025 12:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A734C4CEEF;
	Tue,  1 Jul 2025 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751373908;
	bh=iA/ph/M71kX2tGT946O6HBiCUvqw1IpsbbdvFe4xP1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7omG6lvtr1EWRZrLsk+sFSIN6sWytvPyEZspFlI2ntr7CykfGRx7JWDrn71eIZNV
	 tujrFLD8V0/AbA3SHZdblplsXWkSxvPsVnZ7FJfms1isZIRx8rSsCbUCWBblBI8ReD
	 qlGB2wAvYu6nl+SrUXD+aSvQ6gGYjvj77sbxMq+VHuE9eveEyKIWwJVpfSEZ569UPK
	 Iepz5Y1VZ5Hw1GtqY6M9Bu8+T7oFyZzhrJMJRtWfw70F9kqE25m2BWEY7mwbcuyRcx
	 a+CLjszVCYVny4lwiLYc2VX2EOG4iB+HxqMsOaG+NWDPuKIwDWocet/x0o/JO3hN1o
	 iOlR+U8f7hvAg==
Date: Tue, 1 Jul 2025 18:14:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Philipp Stanner <pstanner@redhat.com>, 
	linux-rockchip@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rick wertenbroek <rick.wertenbroek@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Valmantas Paliksa <walmis@gmail.com>, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v9 1/4] PCI: rockchip: Use standard PCIe defines
Message-ID: <5uoyjs4vndspqdjho5lb2e6odek5fnfxrefftmxpzpejuqsgze@adyovdwmpxwe>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
 <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1751322015.git.geraldogabriel@gmail.com>
 <ce0fdbf2753075056c227ce7567a69386a5aa0a3.camel@redhat.com>
 <aGPOkw2G2IeNhDRy@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGPOkw2G2IeNhDRy@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_054509_958724_03F91D38 
X-CRM114-Status: GOOD (  17.95  )
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

On Tue, Jul 01, 2025 at 09:03:31AM GMT, Geraldo Nascimento wrote:
> On Tue, Jul 01, 2025 at 09:54:51AM +0200, Philipp Stanner wrote:
> > On Mon, 2025-06-30 at 19:24 -0300, Geraldo Nascimento wrote:
> > > Current code uses custom-defined register offsets and bitfields for
> > > standard PCIe registers. Change to using standard PCIe defines. Since
> > > we are now using standard PCIe defines, drop unused custom-defined
> > > ones,
> > > which are now referenced from offset at added Capabilities Register.
> > 
> > This could be phrased a bit more cleanly. At least I don't get exactly
> > what "from offset" means. You mean you replace the unused custom ones?
> > But if they're unused, why are they even being replaced?
> 
> Hi Philipp!
> 
> "from offset" means we use standard PCIe defines for registers that are
> adjacent to Capabilities Register, and we reference them from the offset
> at Capabilities Register.
> 
> No, all registers replaced are in use, unused in that context means they
> (the custom-defined registers which can be referenced starting from
> Capabilities Register address) become unused after the change, only.
> 

I've reworded the commit message:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/rockchip&id=04e740dfe153f2b6530ce99c0e346600d3fb2ef7

> > 
> > 
> > > 
> > > Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > s/By/by
> 
> Thanks for the capitalization catch. Unfortunately there's little I can do
> now that Mani went ahead and applied the first two patches (directly
> related to PCI subsystem).
> 

This was already taken care!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

