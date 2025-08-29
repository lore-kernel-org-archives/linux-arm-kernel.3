Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2766CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JlGWP9cdFeQdJxZDhhksgK1ne4GePlqTYxtnj+4ZiI=; b=V0YkohND56CLYGNsht3BW+Z1Wp
	eiD60L4qXC1Ujat7Jxangfk1FMenwU8/3G9fmpKcfWFw+8341txeKuMozS67EpNywAnvoOt8+CVV3
	QO31pCjY+oP07dbR0+b/wIEl/YtUzNyNBfw4LwZ792yvRp5AaPYue1gcEBWDHHLUKcdf7Y91psa/V
	WazHh/WQrD/UfMtilGyCCWZXlK2EpN0mDyaFkgH9BPHAXJgUVKREJmhV3yLKByZxcUt5wspXWY9h0
	UV5GVQezcJttQAeY8R6flXYWGofqfCNRGt0EaPyfLuATc3U6ka8cD9R1BDBhVk2IR+IXb7poH7X+p
	stuQQyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tI-00000006kzA-3Kkb;
	Fri, 29 Aug 2025 19:36:04 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us19s-00000006Ddj-3pFe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:36:58 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1us19p-0006bt-00; Fri, 29 Aug 2025 17:36:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A28FAC0513; Fri, 29 Aug 2025 17:36:13 +0200 (CEST)
Date: Fri, 29 Aug 2025 17:36:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
Message-ID: <aLHI7arPfcMDEhzM@alpha.franken.de>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <aLF_DEu6YNSCSRxu@alpha.franken.de>
 <dcb0c746-62ed-48f6-9247-03bdf36c6e92@kernel.org>
 <60e55e14-7712-4f82-93af-6751009327fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60e55e14-7712-4f82-93af-6751009327fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_083657_264620_0C6A7F8A 
X-CRM114-Status: GOOD (  17.24  )
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

On Fri, Aug 29, 2025 at 12:39:00PM +0200, Krzysztof Kozlowski wrote:
> On 29/08/2025 12:37, Krzysztof Kozlowski wrote:
> > On 29/08/2025 12:21, Thomas Bogendoerfer wrote:
> >> On Tue, Jul 29, 2025 at 01:52:11PM -0700, Florian Fainelli wrote:
> >>> This patch series updates the MIPS-based Broadcom STB chips to use a
> >>> proper compatible string for their memory controller node(s) after
> >>> 501be7cecec9 ("dt-bindings: memory-controller: Define fallback
> >>> compatible").
> >>>
> >>> Florian Fainelli (2):
> >>>   dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
> >>>   MIPS: BMIPS: Properly define memory controller compatible
> >>>
> >>>  .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
> >>>  arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
> >>>  arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
> >>>  arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
> >>>  arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
> >>>  arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
> >>>  6 files changed, 18 insertions(+), 7 deletions(-)
> >>
> >> series applied to mips-next.
> > 
> > Why entire series? You were notified two weeks ago that I already took
> > the driver subsystem patch.

I haven't got a mail in this thread from you about taking the first patch.

> ...and you do not have even ack from memory-controllers for that patch.

sorry, I'll drop the patch then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

