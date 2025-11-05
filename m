Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86492CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBtzWzncUCLW7jgIRibI+FmsMWik6VfyN9D1TSUtg8g=; b=MijelUAsybMc8ssMxo75+nUj+h
	YLLCWeauxAVKO1HoB6bckbS1M/feewlRofyDpyh6Q1c5KtAoEcGyK7JhFa/mCWfHIEvJXvsy+xM1d
	ItHS0X+/XxrJSj8A9ivnPXAyI4vGw0tXJrJFVVbn14fR8l+THUg8FqruOXsDdgmm1q42L8SuoL5YE
	ii+sxvkt/dkS7NtTR1PARQ4P/YPRghvOaEY6nYPvuTNU7eOxeWqfBWkvEzg4fQqDCsc1NlmfLYrED
	QQbUfBHaW8kl2Rhxb3h97O6OHNhfon1BHSVTbbrmq0EM/0gf8zQVa/NZZ+SXjanyswXVuMw2uDGTW
	6gyhWoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgTy-0000000E4rI-0kqK;
	Wed, 05 Nov 2025 16:35:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgTv-0000000E4qp-0sGH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:35:37 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3F9801FA8E;
	Wed,  5 Nov 2025 17:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762360529;
	bh=LBtzWzncUCLW7jgIRibI+FmsMWik6VfyN9D1TSUtg8g=; h=From:To:Subject;
	b=ww/jUTnM93ycCzKIUYzW87oCShpcjIpKHFikyIeIZ+JW8Wwb/trOoD4msQns12CvY
	 lIU6OT6M1zRM8JFfOOj5LMHxTmdYi4XnuRnCFpFoeczX5rxdyUWrSx24GFILnXEI1I
	 4L3jRexsthSMuF7LhIESEAvItg5meLMNwJ10itkO2iL0OsjiRSoRjFzPW4y+jcMfli
	 npRvr1XCXp4Rhr81TDZ9Mm5iPQxjobmb2SdWzVdBq5MxXILpRufsdc66xF15YdXEro
	 kvRwbbEp8PShz/TgdwXozOO5iKzctm40Ina5/Hf3cRZL4o+RTz5/frJ2+98KSJovIG
	 K7qrsvT7GTpww==
Date: Wed, 5 Nov 2025 17:35:24 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] arm64: dts: ti: k3-*: Replace rgmii-rxid with rgmii-id
 for CPSW ports
Message-ID: <20251105163524.GA18927@francesco-nb>
References: <20251025073802.1790437-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025073802.1790437-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_083535_858038_B641A3C4 
X-CRM114-Status: GOOD (  10.60  )
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
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com> # Toradex Verdin AM62P

Verdin AM62 is the same regarding ethernet, so I expect no issue also
there.

Francesco


