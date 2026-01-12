Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BFBD2503F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mu3A6Fj4SLA5ywv0bviGzdNIFATxYiX/NAbD4mBo3Vo=; b=DMWMCu9ESXOc7VooqHxMA0ffHE
	AqMH3W5nh+mxpqyLqF+VNlmKWW/e9j6w9rx+hMg6w+2d0zauPJI+K0F5qloiSZaqd9Bm2XtRoGMf/
	6kpyUXR/spbhjALRI8ntUEM2LgB1wBUuGsqf09ARgoEzxD17T6quJPyzbDH9R2DaXPJfUi76y91j0
	hjkFJ0+0IdYYB4BSgdicuS2ZcuVBqhEDmJ6WBrZDm/h+hcw/NhLXRWgvRI70wLGkmC842TMrRb5C5
	XP2O8u8JfO/FweUBckMZ4EJGG6bz7X8/tM782AlAp7vTrEdVjjb62p/Esa1k/Ogd+7+NLBJvoWvwM
	SOPbSSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCgc-00000004va6-0bq7;
	Mon, 12 Jan 2026 07:50:02 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCgY-00000004vYq-3L8c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:50:01 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 4F3BB1F93B;
	Mon, 12 Jan 2026 08:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768204192;
	bh=mu3A6Fj4SLA5ywv0bviGzdNIFATxYiX/NAbD4mBo3Vo=; h=From:To:Subject;
	b=DDox4Q85Gt21ueXl5K2plK+Wm41XkJYxRzHZ5NaDAGeXqcC1Kn4MOcc0DPDiACYkP
	 Uk27tFma73dUK0LLVNbXC8jR5XQUuwBHFiqvQ2Y69jUbE9ciJG850d7t86MHpo0s+W
	 aMa6SVmGk9smzn94/9qUMm0urveISGVYY6Iw1MdHockzOeZBIRRcDyR9OKrMy+Xd9U
	 z9UPgJkzyDNOGAQW248qbFNwymNbHqWNha9BnODNX736kneqCGGF60duYZXH7vr/Vu
	 eqeXr1ps/knO5zF0pyezs2tYdYWvHLbh6DJIPNGw80cy3c+evyH6fuIZomfnncsDeV
	 IGG/7pRDmFeWg==
Date: Mon, 12 Jan 2026 08:49:48 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, trini@konsulko.com,
	u-boot@lists.denx.de
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] arm64: dts: ti: k3-*: Replace rgmii-rxid with rgmii-id
 for CPSW ports
Message-ID: <20260112074948.GA101138@francesco-nb>
References: <20251025073802.1790437-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025073802.1790437-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234959_717233_950E67B0 
X-CRM114-Status: GOOD (  11.07  )
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

+Tom +U-Boot ML

Hello Siddharth,

On Sat, Oct 25, 2025 at 01:07:59PM +0530, Siddharth Vadapalli wrote:
> The MAC Ports across all of the CPSW instances (CPSW2G, CPSW3G, CPSW5G and
> CPSW9G) present in various K3 SoCs only support the 'RGMII-ID' mode. This
> correction has been implemented/enforced by the updates to:
> a) Device-Tree binding for CPSW [0]
> b) Driver for CPSW [1]
> c) Driver for CPSW MAC Port's GMII [2]
> 
> To complete the transition from 'RGMII-RXID' to 'RGMII-ID', update the
> 'phy-mode' property for all CPSW ports by replacing 'rgmii-rxid' with
> 'rgmii-id'.
> 
> [0]: commit 9b357ea52523 ("dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example")
> [1]: commit ca13b249f291 ("net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay")
> [2]: commit a22d3b0d49d4 ("phy: ti: gmii-sel: Always write the RGMII ID setting")

What about U-Boot?
I just noticed this in today U-Boot master:

  RGMII mode without internal TX delay unsupported; please fix your Device Tree

and I think this is coming from the DTS update from Linux to U-Boot.

Can you look into that?

Francesco


