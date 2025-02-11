Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3318C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFvKNq+o/CY+1RoNOyQ/3ZCunkHiOaoJBLr10RUdkpI=; b=nPaT3vBfWpDjqxbAH/75fbTKwF
	DnjUqL5fMAJYoePe3yYprjv7miLQ+dqZzWBUw5zKJccVqVOSy+7W/tKhQwvMkIlfGNHOrE6j5lSZK
	BdNKUTQbdELIBsvKu4J/ypaoCa/q6zSoUwiKNODgGhC84AyyRRTNlqRCmEtYPwXXN/mXMAQMhiLnJ
	nthYGayyHK6eFhQZQJ22MJyTfYmbG2g2aFRMthBQpHEGZ2Dd7carVJTiH3imz2a0vZ5TaQujTR6GH
	5nkdxvKocxW/OVq/zfFCcRndvLAunxs+oqStU//4adb7gyBjfjaezbfZreBWJvPGONfWgIVElALvV
	9kq5qKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwJ3-000000056Ws-3HcR;
	Tue, 11 Feb 2025 19:52:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwBL-000000054u3-2gHn;
	Tue, 11 Feb 2025 19:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34341A40C5F;
	Tue, 11 Feb 2025 19:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506C6C4CEDD;
	Tue, 11 Feb 2025 19:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739303070;
	bh=Hp0BPTzPwZpSHR+vJEd78ilDWWyWdLyiF/01sHFuRLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mM6CREdIS+9n2HJ1vw6TatQgM+uxQtpr9Vz9BNoLvEhP4Zj0/hR8kl5xchyKha2Uk
	 y+RlxOAS25/A/99+ZQzI3s5m6D/u3Iag96aQatQnlXPlrtsBLbNZTdCUmrs2aBBlR9
	 e1tavxR0OQSz1rCmLCEemgxuXp8CqjgsB/uzbtxJ2FdazYm1JskgU6IvXAgbLYxidP
	 q9udWokBedjCHBWSI5BxQZqNOt8ZzOR7GljcOKvv1EWYWWgloBvmjYMWAXCJB7B7Cy
	 c7swNbK2KWTinMcD0GInZhoHfawzoZlNKcCPaLFkDTEyMWy5W17h3/vPdeN72jurEA
	 LLTtwgTOcNMvg==
Date: Tue, 11 Feb 2025 20:44:26 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] arm64: dts: rockchip: disable IOMMU when running rk3588
 in PCIe endpoint mode
Message-ID: <Z6uomtzSVTOmAB8X@ryzen>
References: <20250207143900.2047949-2-cassel@kernel.org>
 <7996d1ec-6ceb-4d8a-bf03-1911ac5f8f0c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7996d1ec-6ceb-4d8a-bf03-1911ac5f8f0c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_114431_806980_EBE5444F 
X-CRM114-Status: GOOD (  28.10  )
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

Hello Robin,

On Tue, Feb 11, 2025 at 05:49:29PM +0000, Robin Murphy wrote:
> On 2025-02-07 2:39 pm, Niklas Cassel wrote:
> > Commit da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU
> > on the rk3588 SoC") enabled the mmu600_pcie IOMMU, both in the normal case
> > (when all PCIe controllers are running in Root Complex mode) and in the
> > case when running the pcie3x4 PCIe controller in Endpoint mode.
> > 
> > There have been no issues detected when running the PCIe controllers in
> > Root Complex mode. During PCI probe time, we will add a SID to the IOMMU
> > for each PCI device enumerated on the bus, including the root port itself.
> > 
> > However, when running the pcie3x4 PCIe controller in Endpoint mode, we
> > will only add a single SID to the IOMMU (the SID specified in the iommus
> > DT property).
> > 
> > The enablement of IOMMU in endpoint mode was verified on setup with two
> > Rock 5b:s, where the BDF of the Root Complex has BDF (00:00.0).
> > 
> > A Root Complex sending a TLP to the Endpoint will have Requester ID set
> > to the BDF of the initiator. On the EP side, the Requester ID will then
> > be used as the SID. This works fine if the Root Complex has a BDF that
> > matches the iommus DT property, however, if the Root Complex has any other
> > BDF, we will see something like:
> > arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x1600 ssid: 0x0
> > on the endpoint side.
> > 
> > For PCIe controllers running in endpoint mode that always uses the
> > incoming Requester ID as the SID, the iommus DT property simply isn't
> > a viable solution. (Neither is iommu-map a viable solution, as there is
> > no enumeration done on the endpoint side.)
> 
> Well, strictly the controller should own all the StreamIDs it's capable of
> emitting - if that's just one per possible bus number (as the iATU
> FUNC_NUM/FUNC_BYPASS stuff appears to suggest?) then 256 "iommus" entries
> isn't *entirely* unmanageable. If it were to support being arbitrary (or
> multiple) devices/functions, though, then we probably would want to look for
> a different solution, because nobody wants a 512KB DT property... :)

Well, FUNC_BYPASS and FUNC_NUM is in the IATU_REGION_CTRL_1_OFF_OUTBOUND_i
register, so it is for outbound PCI TLPs, not inbound PCI TLPs.
(Only inbound PCI TLPs will get sent to the IOMMU after passing the iATU).

There is FUNC_NUM in IATU_REGION_CTRL_1_OFF_INBOUND_i register, but it has
a different meaning. (An inbound PCI TLP will only get translated if the
FUNC_NUM matches the value in this register).
(This check is only performed if the "Function Number Match Enable" bit
of the "iATU Region Control 2 Register" is set.)


The SMMU on the rock5b, when running the PCIe controller in endpoint mode,
has printed the following:
arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x1600 ssid: 0x0
but also:
arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x20 ssid: 0x0

depending on which host system we had connected to it.

So I'm a bit worried that 256 "iommus" entries will not be enough.

I don't have any idea on how to solve this, but right now I don't see any
other option but to disable the IOMMU when running the PCIe controller in
endpoint mode.

(We have no issues when running with the iommu enabled when running the PCIe
controller(s) in Root Complex mode.)


Kind regards,
Niklas

