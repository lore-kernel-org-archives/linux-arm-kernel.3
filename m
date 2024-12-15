Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E72E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqmyyA9V+nWvG2IPtJHyJld9/5ghcdXXrxiPRuEcLP4=; b=h9TOdbmFAkl4FENPJZAcS500SX
	VpEfwYdzgnnR5n1eBhLl/kX8GAb8KkrHpBtjsW0AANCBK15/1n2SuKOkmqCf7BQDvuZ4lYPvokUwH
	3EvMDGdZQ/BtqUVLEb6qv7tcis48ygJ2lUYsghAPAEkkfq0R2imu41FFEKEAPe9NDtstZRyYB6J02
	OFeG02dqIn5AKWkaJ72W3n13a/h2WVJLY4WgRgSJi5IsX0tEZqC/2s13IDWIFOqYy6bhuc4iSu+Ma
	olnBWJYZK3RrdRU+qoP/wrMCR2oRmRls3+TmcACCbuSv1kvzR/0BKQZ6oHmTFMWkKG9Vr4Ytn3G6L
	7V6LGZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMmTH-00000007nVP-48w8;
	Sun, 15 Dec 2024 11:07:35 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMmSB-00000007nPU-2CWQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 11:06:30 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8A7FD1F920;
	Sun, 15 Dec 2024 12:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734260783;
	bh=pqmyyA9V+nWvG2IPtJHyJld9/5ghcdXXrxiPRuEcLP4=;
	h=Received:Received:From:To:Subject;
	b=Z6u1m/gCu7/Y4/nty/KowRsKY0JfM/YWRcK9HRgSxHkn1lzir9qs1B1/vVHjQjbHd
	 3gPvpnMUaOZb1K+QhzvSHgqGfdFWZ3TbdPdDsTsLdKlkzi68XtrTlZElUNsSmS2X5w
	 7htrwVBWblRsxcWurMJWuu1tyiDMuZFuuSv3Wxb1C3342s8wmUJuy6whejFpUXAnJT
	 +z688M9HDurpTALx0ZJaTTQ9ore/FDTQUGrG6lesO9L0ZJLkKdfR00DhoSW3aYvROH
	 7JI3K2GrsZXZixCXFo7eNfTNRpb8kSUqTGCQ6uNCi/AUeghkoYPiZIp7tLfJQQo9gN
	 0gtTZwxecErTQ==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 396ED7FACD;
	Sun, 15 Dec 2024 12:06:23 +0100 (CET)
Received: from pivi by livingston with local (Exim 4.96)
	(envelope-from <francesco@dolcini.it>)
	id 1tMmS7-0002m8-0H;
	Sun, 15 Dec 2024 12:06:23 +0100
Date: Sun, 15 Dec 2024 12:06:23 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Bryan Brattlof <bb@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
Message-ID: <Z164Lyg-AH8KBTYZ@livingston.pivistrello.it>
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
 <Z12rnZiCXQxtMWlf@livingston.pivistrello.it>
 <20241214215624.e372oju6eserpf4f@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214215624.e372oju6eserpf4f@bryanbrattlof.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_030628_466915_1C0C1910 
X-CRM114-Status: GOOD (  17.89  )
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

Hello Bryan,

On Sat, Dec 14, 2024 at 03:56:24PM -0600, Bryan Brattlof wrote:
> On December 14, 2024 thus sayeth Francesco Dolcini:
> > On Sun, Nov 17, 2024 at 11:34:07PM -0600, Bryan Brattlof wrote:
> > > From: Vignesh Raghavendra <vigneshr@ti.com>
> > > 
> > > Add the initial infrastructure needed for the AM62L. All of which can be
> > > found in the Technical Reference Manual (TRM) located here:
> > > 
> > >     https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> > > 
> > > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
> > >  arch/arm64/boot/dts/ti/Makefile                  |  3 +
> > >  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
> > >  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
> > >  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
> > >  arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
> > >  7 files changed, 252 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > index 18f155cd06c84..b109e854879cb 100644
> > > --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > @@ -31,6 +31,12 @@ properties:
> > >            - const: phytec,am62a-phycore-som
> > >            - const: ti,am62a7
> > >  
> > > +      - description: K3 AM62L3 SoC and Boards
> > > +        items:
> > > +          - enum:
> > > +              - ti,am62l3-evm
> > > +          - const: ti,am62l3
> > > +
> > 
> > can you clarify the differences between AM62L and AM62L3? you have a mix of names in this series. I assume that
> > AM62L is the SOC family / product name, while AM62L3 is a specific 
> > part number.
> >
> 
> Absolutely! I found the naming a bit confusing myself. 

Thanks for the clarification, having ti,am62l3 is consistent with what
you did with AM62, in which you have ti,am625.

Francesco



