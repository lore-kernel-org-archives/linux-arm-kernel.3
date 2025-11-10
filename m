Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6F6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQl61L9I9u2xQQF1X/UfEPM0pFoUMJSuuR9eAoGyqZU=; b=iXUaInhTySSJgA8c7JWRJc/0jH
	xIcVk2QEOncYZ8RxqmYxViNnG63bIgO+eL2kUw5bZkwyITKh9adJdHxJvcTCF9nPDgJC+3i3z0JZf
	NoD7in5fWR0QW24aVpk8/fYL7FvDCiEZjVDWFkmowmQrynPVUan+2EdULr4mhsymxFXIajM0kk5RR
	AvPgcmBtWOPYTBXLmRQhi1sOgCaJQ1+gTeXhMh9yoR28WMVFsooD4aLUeasQdMNUJ/ZXYvNIE00H3
	AGrUUWsItk5QyKNImLme2ktWWWKPtIRomseFc6YwYejlXRnBr1xyqwiaa4K1lLG89aHRR3+Xdekx5
	CCx5mc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOUk-000000057aH-3CHN;
	Mon, 10 Nov 2025 09:47:30 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOUg-000000057Yc-3O5r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:47:29 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 998811F83E;
	Mon, 10 Nov 2025 10:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762768040;
	bh=KQl61L9I9u2xQQF1X/UfEPM0pFoUMJSuuR9eAoGyqZU=; h=From:To:Subject;
	b=Kc/FraVr8ImWie5WC1jnKVxUUKZybUzTIr+lzPA9SNd+LOWtP8X4l7o9cIbp8+bE9
	 X7LRhRkAuMGkcvqGne9Inav3v9pAP1H3J8MWs8Z1CSFACj55DSesFQEOc/2Ur+Ko+W
	 WHDSHDbY7ftYB9eXrwj60NNdKXU6MQjine3zfmej8XYClIUJn2dywB6/4F/zDEu/Up
	 hJV1RNG2/stKN+IszKMJKbcXntU92f+dPCW66xCMC8Eu5odPidFQaO9XFn3bgN0hF4
	 6KSFmZeCpbHUDXsyMEw/sCSUL7Jf0Wh/m7QoWoXwMmbHUWjV4EnOrpNhmM47Ny9krY
	 VGTL7LA9c+6/w==
Date: Mon, 10 Nov 2025 10:47:16 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add Aquila AM69 Support
Message-ID: <20251110094716.GA7356@francesco-nb>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
 <20251104145240.61219-2-francesco@dolcini.it>
 <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
 <20251105115335.GA14157@francesco-nb>
 <7024f4b3-00a0-4618-8bf9-53e305fcc982@ti.com>
 <20251106101932.GA5975@francesco-nb>
 <e1b2a13d-fab0-47f1-aae3-f2661c94d54a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1b2a13d-fab0-47f1-aae3-f2661c94d54a@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014727_888495_DB2DA217 
X-CRM114-Status: GOOD (  35.72  )
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

Hi Vignesh,

On Mon, Nov 10, 2025 at 10:06:58AM +0530, Vignesh Raghavendra wrote:
> On 06/11/25 15:49, Francesco Dolcini wrote:
> >>> Yes, known. Is this an issue?
> >>>
> >>> This node must be disabled, no matter what is present in any included
> >>> dtsi file, it's a deliberate decision.
> >>>
> >>> This dtsi file describes a SoM, the used pins/functions are defined on
> >>> the pinout, but this node cannot be enabled unless the SoM is mated with
> >>> a carrier board that is exposing it.
> >> Same as my point above, you shouldn't enable nodes that are not used
> >> or have anything attached. The SoM only has some edge connectors so
> >> it should not be enabled at the SoM level, that we seem to agree, but
> >> the carrier board doesn't connect those lines to anything either. They
> >> just run to a pin header with nothing attached, how is that header
> >> any different than the pins on the edge of the SoM?
> > You are commenting something unrelated here, or I am not understanding
> > you.
> > 
> > You commented that the status = "disabled" is redundant. We both agree
> > that this node needs to be disabled in the SoM dtsi, and it is already
> > like that.
> > 
> > I would prefer to keep the redundant "disabled", because I see value on
> > not having to rely on what is done on any included dtsi, where the
> > original node is defined. 
> 
> 
> One can always reverse compile the DTB to see if a node is enabled or not.

Sure. My reason for having it explicitly disabled here is not to have to
depend on anything that is happening on the included dtsi on this
regard, given that we really want those disabled in the SoM.

See for example https://lore.kernel.org/all/20251015111344.3639415-1-s-vadapalli@ti.com/
where you can see that our verdin am62 was not impacted by this change
at all. 

To me this is just a benefit, without any drawback.

> > I see this as a common pattern in multiple
> > dts/dtsi file and is what I would prefer to have (and I do not see any
> > kind of maintenance  overhead on having it nor this being in conflict
> > with dts-coding-style.rst).
> 
> I cannot seem to find any precedence to such a pattern (adding status =
> "disabled" for nodes that are already disabled at SoC level dtsi.) Could
> you point me to some?

Just a couple of examples, you can easily find more if needed

  k3-am62-verdin.dtsi:&main_spi1
  nxp/imx/imx6qdl-phytec-phycore-som.dtsi:&fec


> > Vignesh, Nishanth, what is your expectation on this redundant
> > `status = "disabled"` property?
> > 	
> 
> Assuming such pattern exists, please add a note in the commit message in
> the next version.

With that said, it's a small thing, if you prefer me to change it just
let me know and I'll send a v2 with this changed.

Vignesh: do you prefer a v2 with a mention in the commit message on the
`disabled` node, or that I just get rid of those? Anything else that you
spotted on this patch and that should be changed?

Francesco


