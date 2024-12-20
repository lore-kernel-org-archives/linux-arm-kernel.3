Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 08:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xMgk20Jc1GtA0XgUpJcBSrSXC1qbOde0T99h5mQB/U=; b=lg5RzGW59dqJ0kV/+WXBle4MzC
	ljddhmwRhM3k4+CmrW7+5GSFGkqja0/QYbxWjCv7aWubcSKB/z5hM6z71Sw7bqVQrki/zMCJG9O94
	o87CkRp1ZQzF5DtBjFrzzDmzoII+QD7J+eA6MP1boq4LV0I9JlGskqMERqUKvXOgHQjw6eLmJS0V5
	WRc/+SQI8p3X0THf2pgcWHJx2ActyiEREz3t2sbDnSViXddU2tRcr8RKL9IObY4XhZtM1RshtkOVu
	Zi6lZJdPy3gKdfuL4pa1b76kc3CwmEEQkz3GlPyjlTx/E3/Y2idWarnk0GygTv0dfBBkeMW4599av
	T52r9uEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOY0C-00000004EdU-03qW;
	Fri, 20 Dec 2024 08:04:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXz3-00000004EX1-30b5;
	Fri, 20 Dec 2024 08:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F366A42B62;
	Fri, 20 Dec 2024 08:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0B7C4CECD;
	Fri, 20 Dec 2024 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734681820;
	bh=mIEsjG6cGAMR/EZZn/eyKKGNtuOQBefQB9mVoFjFBOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvRhos8Jst09ngqQVgSPOjY0UxkNn5FAUo09m/88T9klqMT9WVMJmBo0hfvS/E5O8
	 IkJbF1j8QfbL1rQ1sDHFKjLMGPO3+WqyXg3Z6WxyQGi+VKJ2328qesXWuI5D5exj8O
	 2bcNC1GNi0S1qG3JdR6a+LBQLaI6Bdv/48xVeKbQDQZ4LdehvX2jc9wn5t000zfz3K
	 snOlaceApMHKBCVCZwZ7CGDM0w3G/Lwp911sNUClmojqqcMzagRKB7cOjIWM8uJY7Y
	 TutnctkimaeGz980YnFleltc0bBoZQ1ETKdZeqU39wAvCa6paN8BIZXNSd2q+EnsQ8
	 xy3bXm+FgR+Wg==
Date: Fri, 20 Dec 2024 09:03:36 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588: add msi-parent for
 pcie3x4_ep
Message-ID: <Z2Uk2A7-YwkSfAOh@ryzen>
References: <20241120171048.2839621-2-cassel@kernel.org>
 <173318214613.1403925.10026428339576666444.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173318214613.1403925.10026428339576666444.b4-ty@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_000341_819568_A1213A9A 
X-CRM114-Status: GOOD (  20.40  )
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

On Tue, Dec 03, 2024 at 12:29:16AM +0100, Heiko Stuebner wrote:
> 
> On Wed, 20 Nov 2024 18:10:49 +0100, Niklas Cassel wrote:
> > Add msi-parent for the pcie3x4_ep PCI endpoint node.
> > 
> > The pcie3x4_ep node should use the same msi-parent as the pcie3x4 node
> > (which represents the PCIe controller running in Root Complex mode).
> > 
> > The GIC ITS can be used to trigger an IRQ on the endpoint when any of
> > the endpoint's PCI BARs are written to by the host[1].
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: rockchip: rk3588: add msi-parent for pcie3x4_ep
>       commit: b6f09f497b07008aa65c31341138cecafa78222c
> 

Hello Heiko,

When I sent this patch, I had tested it against Frank's v8 series which adds
support for a PCIe endpoint triggering an interrupt (using GIC ITS) when the
host side writes to the PCI BAR that the endpoint has configured as doorbell:
https://lore.kernel.org/linux-pci/20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com/


However, it seems that in v10 of his series, he has changed it so that the
PCIe endpoint node now requires 'msi-map' instead of 'msi-parent'
(just like how it is done in the PCIe root complex node):

See:
https://lore.kernel.org/linux-pci/20241204-ep-msi-v10-0-87c378dbcd6d@nxp.com/

"""
Changes in v10:

[...]

- Use "msi-map" in pci ep controler node, instead of of msi-parent. first
argument is
	(func_no << 8 | vfunc_no)
"""


I didn't realize that DT property required for this feature could change so
drastically, since DT is supposed to describe hardware, and msi-parent made
perfect sense, since this property is usually the one used for devices
connected to a bus.
(msi-map is usually only used on the host bus adapter / root complex.)

Knowing what I now know, I should have waited until this feature had landed
before submitting this patch. I apologize for this.

Could you please drop this patch from your v6.14-armsoc/dts64 branch?

Or should I send a revert?

Once Frank's series has landed, I can resubmit a patch that adds whichever
DT property he finally ends up using.


Kind regards,
Niklas

