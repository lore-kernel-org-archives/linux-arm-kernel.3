Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CA4D2503F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHCs0iNyflG7x6+oRCtz4NEb6YJJHbVOD9mrmwPAxWA=; b=lo0GA9f9Dz1JhHRa3xiEQJaMTl
	j/sEtOK3xbOX20mRU2uZDsnQhFthsdbpfopJa19ifnr4B8uu49Ynk541QfPk1/9dxADk96D7WF3yF
	fdOQQl6A4YjsWcqRoZNmTOs4JaP5o07Kez/EmvBOeTMvcZ9rBBLDurK4HFdJeyu4AqCXxP5DgbqFI
	4Pujgn2OU8bhSwJ+Uf3CQTPP3pH2rtHadzqCpy6M9ttvBl9pcZAYQI8vS9z9Lj6pT5aG6HRYsWGiJ
	KV7F7peNLNo3y68SE/08JBSFWb5kIvwzM+78s09K8N0S8K3XH39o2q9bEUQh1iSWZGEhdt9V1THO1
	5MqjvGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCn7-00000004w4J-03jV;
	Mon, 12 Jan 2026 07:56:45 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCn4-00000004w3P-37Y6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:56:43 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 0E3C81FAAE;
	Mon, 12 Jan 2026 08:56:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768204600;
	bh=PHCs0iNyflG7x6+oRCtz4NEb6YJJHbVOD9mrmwPAxWA=; h=From:To:Subject;
	b=ZtMFcjqLE2oKc1b2piFxvFBSFhZ2YShLVNxAavEFQ89Q14nmtZiluhyX42oliU+zC
	 efs0sezywO5g1AwEcsa1CDAcDRmFKi2fMG5j3wC3xPk0zafy80891LW33xXLTk7uzh
	 ZHOXXFe7jReWJyvUAITn+3eqoPXKk4T0evYZON6RduaATjTaw4UtnRofeuGb9ZTIPj
	 ZnR+M9vhZeeFZ6gJq7D6XfYoV9wx+tjWtLEHIEPvMh9+PUInewDWZQRtLFV86x6wB7
	 3i35p4wwhSw61CsH4mobf3Bte0g4XVeV3sq7W78hNgFpfrICcr0iw4AQPEEUGiiMdm
	 YShixlWprrFgQ==
Date: Mon, 12 Jan 2026 08:56:36 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, trini@konsulko.com,
	u-boot@lists.denx.de, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] arm64: dts: ti: k3-*: Replace rgmii-rxid with rgmii-id
 for CPSW ports
Message-ID: <20260112075636.GA105765@francesco-nb>
References: <20251025073802.1790437-1-s-vadapalli@ti.com>
 <20260112074948.GA101138@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112074948.GA101138@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235642_938977_5B8A344C 
X-CRM114-Status: GOOD (  18.05  )
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

On Mon, Jan 12, 2026 at 08:49:56AM +0100, Francesco Dolcini wrote:
> +Tom +U-Boot ML
> 
> Hello Siddharth,
> 
> On Sat, Oct 25, 2025 at 01:07:59PM +0530, Siddharth Vadapalli wrote:
> > The MAC Ports across all of the CPSW instances (CPSW2G, CPSW3G, CPSW5G and
> > CPSW9G) present in various K3 SoCs only support the 'RGMII-ID' mode. This
> > correction has been implemented/enforced by the updates to:
> > a) Device-Tree binding for CPSW [0]
> > b) Driver for CPSW [1]
> > c) Driver for CPSW MAC Port's GMII [2]
> > 
> > To complete the transition from 'RGMII-RXID' to 'RGMII-ID', update the
> > 'phy-mode' property for all CPSW ports by replacing 'rgmii-rxid' with
> > 'rgmii-id'.
> > 
> > [0]: commit 9b357ea52523 ("dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example")
> > [1]: commit ca13b249f291 ("net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay")
> > [2]: commit a22d3b0d49d4 ("phy: ti: gmii-sel: Always write the RGMII ID setting")
> 
> What about U-Boot?
> I just noticed this in today U-Boot master:
> 
>   RGMII mode without internal TX delay unsupported; please fix your Device Tree
> 
> and I think this is coming from the DTS update from Linux to U-Boot.
> 
> Can you look into that?

Ok, I think that the issue is that the U-Boot code was updated
correctly, but now we need the v6.19 DT in U-Boot, and as of now we have
6.18 DT.

Tom: are you planning to sync the U-Boot DT to Linux v6.19 before the next
U-Boot release?


Francesco

