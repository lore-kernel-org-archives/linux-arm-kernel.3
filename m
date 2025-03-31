Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F18C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nchhUVuAAorL0EgxuZL9IZu5rkzQ0M46OJLLbl4XGVw=; b=B+XFU7kgn7vxjC+n3v8UPvq9TT
	lyR+2DfmYOl9ARjPpTeaL7URMuM5QE/e0i/SxCa2ZUyRuPTegpu442uuFDdW2kUXR5HzJvL4ObCEe
	CKydPVEWuNEEf8LtqtPjaZdROKxqporfCMihIGrCCmr5ca6lh7j/RnfoRenMNBHEeL4AuQD6qE2pR
	6kxzCj+5Oz+X48MAwpY29TyMBYrmeU944hE8G97q1g6DPjDqiUrgibbMal3k5jCB4946djphzfcBJ
	hYzX4w1R0c0OrjfA2Q4ZnkN/IKMUOM501GON75/EU9wTuXYWgdocOvuE3pGaoyOY6E8M8+i3zEVN3
	qic3wvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC5H-000000001OC-0KsC;
	Mon, 31 Mar 2025 10:09:35 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC1o-000000000wc-328T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:06:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DC2561384409;
	Mon, 31 Mar 2025 06:05:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 31 Mar 2025 06:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743415556;
	 x=1743501956; bh=nchhUVuAAorL0EgxuZL9IZu5rkzQ0M46OJLLbl4XGVw=; b=
	L8c4RwBW7/oqaiqL+U6FvAV9TP70RZmpwsABCfNCAkXlgnWljqr0XkFJ4U5cSxca
	0XYAE0oqR/IrFbmA7U3he1jIahWPPPMFGPvN62bqbZ27x5pG102866Ca1t+1jIS1
	SsUmJW2+NuE8Vnlpjgn22Kg9SixBIZEJxucmdxaAEsm5eCgfYf5uQMRBCIh6yqvo
	Wv50T/bDdPou/ETRrzCrcB14HIVsnSzz3l9UP3U9iGwmy7InPjhpfQ0BOmYfjxrS
	EwpyJ6fhQzV76PMtE3qeSNJQGUnQN6Y6J2rJLKSTLH9c33cTNRGmnTtMWeuAqYxt
	k16WGQ8oBmRAuWlYhMNqNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743415556; x=
	1743501956; bh=nchhUVuAAorL0EgxuZL9IZu5rkzQ0M46OJLLbl4XGVw=; b=G
	dC/BMezhE+nwSTfFWtYwXcCkrexLE6O42p9w+cI6Fben4D9l2S1FvXGfiuYXAUwp
	gc+rIqFLDANbIQ99Au39fgRN9WMKi2Iv+cXHUKyPjUFagRkOOSEz2i0RwZhuMtUE
	WBuxyLAkxvYjZD0E2s8YYs3AeMmCQaE0GcHEoplKTrolIPnq8PF8Z/z6FckXrKGn
	I65iD2B7DQ+Bl7U11jlbHugHMyxbzMW7fLZFGmJj5yJbWckWlqctMZMb+qEBMdur
	cqWUPyGBEhmkgBhhMWD92RU8bPAu2aGIHMMR6YOgAW7yKMtVDy0GvbKG+ooTi9jr
	kfO2pRlAsE8hFPYnKl5jg==
X-ME-Sender: <xms:AmnqZ2n7pqDbpJL1RHdxJzCsqtl-oEtJHh-wrefGoP2f4p_wLqb6Tg>
    <xme:AmnqZ919u4d4_awZxE4oG8RPS75WqZGuchUYpzDFFOFPZXIEz72mO4XqKEAYdVOwz
    Bc4AS2VAaOdpA0VP4g>
X-ME-Received: <xmr:AmnqZ0p9BeNKZ7v8rPx7msDXjnRg53CYH3X2ivfk30vzmxtfb3I95PBLZNE3mHRN1JtWqVLM3syGgTTiZ26fykCSartG20KYWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedvfe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgv
    nhgvshgrshesmhgrihhlsghogidrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehk
    fieslhhinhhugidrtghomhdprhgtphhtthhopehrrghfrghlsehmihhlvggtkhhirdhplh
    dprhgtphhtthhopegrqdgshhgrthhirgdusehtihdrtghomhdprhgtphhtthhopegshhgv
    lhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggv
    rhdrsggvpdhrtghpthhtohephhgvihhkohesshhnthgvtghhrdguvg
X-ME-Proxy: <xmx:AmnqZ6lAAolEv1lvwEz_JB_6KLN_eRAvAmSnu5EmxUtpG4O-ZNqTpg>
    <xmx:AmnqZ00iHcKdzkrwMjLJw8URFY2SBJWHPwr84_gtoJGGSuPg5JCoMA>
    <xmx:AmnqZxtlG7mWiNymiwke6d86mwSCcge3sM6lDmzPbMdagVDvudWMPA>
    <xmx:AmnqZwXgAX-oQNc3hcAmTVsasfhFkPNzH-ndN9CV1pwDC79cDHhzDw>
    <xmx:BGnqZ1WgrfeLKtJmIWlaD2RGmCaO_7r4vmu3jTbEb4sm6R9dCZ7I2asu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 06:05:54 -0400 (EDT)
Date: Mon, 31 Mar 2025 12:05:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H
 Sparrow Hawk board support
Message-ID: <20250331100552.GC233273@ragnatech.se>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_030601_290839_5DAFEAA3 
X-CRM114-Status: GOOD (  14.31  )
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

Hi Marek,

Thanks for your work.

On 2025-03-30 21:56:08 +0200, Marek Vasut wrote:
> Add Renesas R-Car V4H Sparrow Hawk board based on R-Car V4H ES3.0 (R8A779G3)
> SoC. This is a single-board computer with single gigabit ethernet, DSI-to-eDP
> bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports, micro SD
> card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD, debug
> UART and JTAG.
> 
> The board uses split clock for PCIe controller and device, which requires
> slight extension of rcar-gen4-pci-host.yaml DT schema, to cover this kind
> of description. The DWC PCIe controller driver already supports this mode
> of clock operation, hence no driver change is needed.

For the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Marek Vasut (4):
>   dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
>   dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
>   dt-bindings: soc: renesas: Document Renesas R-Car V4H Sparrow Hawk
>     board support
>   arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk
>     board support
> 
>  .../bindings/pci/rcar-gen4-pci-host.yaml      |   8 +-
>  .../bindings/soc/renesas/renesas.yaml         |   7 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 671 ++++++++++++++++++
>  5 files changed, 687 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> 
> ---
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: "Rafał Miłecki" <rafal@milecki.pl>
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Junhao Xie <bigfoot@classfun.cn>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> 
> -- 
> 2.47.2
> 
> 

-- 
Kind Regards,
Niklas Söderlund

