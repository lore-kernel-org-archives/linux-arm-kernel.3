Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BB3CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKx+sib5qUR7xe20U1MiDw/OFxIq4LsoZJorRhIfYRA=; b=Q4Yy68cGOfsR2QoAElHrhkTVqu
	6e3Smo58701BaXKqLuDAuFO0WvMc9v+wF4dcbr/bWfpk862UDenw5elKbO5K+uksAm0l/iYubsBdY
	zFtz+yW1nyGVufq8JPHAYmOAYCcy9ZlJRfSBBdo3QrigwxB36JyjRKfRwP7pUdAp5ROq4uazZ6k6z
	JolAtTEw47m2T89g3GZsYXIrGs6L75HLstyk4k3mN6lFbEEwYQZViz50f5G91pw6hqTBTcIo62mr8
	CJ7D7xdg4WsaXKe08Ax5Xali+vwS/UpJC/5gvP41c0unW64/nmc2U21+13O9yQk0OOh8VSIRaYbVf
	Ocy0YWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urytF-00000005lWj-2u4t;
	Fri, 29 Aug 2025 13:11:37 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwO7-00000005KVw-05Mv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:31:21 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004FO-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E19A6C0796; Fri, 29 Aug 2025 12:21:00 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:21:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
Message-ID: <aLF_DEu6YNSCSRxu@alpha.franken.de>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_033119_205074_9DF68913 
X-CRM114-Status: GOOD (  12.30  )
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

On Tue, Jul 29, 2025 at 01:52:11PM -0700, Florian Fainelli wrote:
> This patch series updates the MIPS-based Broadcom STB chips to use a
> proper compatible string for their memory controller node(s) after
> 501be7cecec9 ("dt-bindings: memory-controller: Define fallback
> compatible").
> 
> Florian Fainelli (2):
>   dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
>   MIPS: BMIPS: Properly define memory controller compatible
> 
>  .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
>  arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
>  arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
>  arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
>  arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
>  arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
>  6 files changed, 18 insertions(+), 7 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

