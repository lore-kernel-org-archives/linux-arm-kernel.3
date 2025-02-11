Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93D1C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiTpVaJGe+WMW5KG0DMZYxbw4sg/6CJWl4qYCAOe8Ck=; b=O8bWaIApQDgOz08ny6r7hTNsqn
	Or3yqTz3mF9E4BeQlRfyQgkehB6oUXpAv6M8Bdg4MErI5EoF5n82wnTBXngVdUMFC7om89lOQvglR
	p2/7n4HAd31My+f/fMPlO2BM5UzbCx1cpANxa3/3ftZB/l0x+6IpgfTCSCS+bu4ygB29QdOoiCldk
	esQMQJRU0WgZ0FLtBtmEyLdAhyqgPrngp+pdNHLx+ZYLPWJttbhTdp1YZ/WdYGml6/1BmQXAC3In+
	eP+Gmh4PkgsEOn8UvWHrv8JBtLa5EbEUjx5ym0harJhtffZryjUE3fpRavbtcu0pxrc56R3uQBjLl
	XV5OQ/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuOo-00000004kh9-3jzj;
	Tue, 11 Feb 2025 17:50:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuNA-00000004kOg-41oX;
	Tue, 11 Feb 2025 17:48:38 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9557725C4B;
	Tue, 11 Feb 2025 18:48:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3ydeW4wkoKu; Tue, 11 Feb 2025 18:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739296111; bh=Z8lWfXxYGhsMs8dAs2Wwm4xHfFeTOKBFHHc/bDiuT6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jVFyeOtMDokw97k1t1QawSgEVgDg94c6AYdfNp+jiEPTBsNMz3S1wTHjXUHI19PDX
	 TEo4SERflwLXqeKpRjqLiLoLa3Q7/i/EkKiSBaqjTwG2mAHqctBKRefvWCjfq34Lp3
	 4KLgd6SJ01GbvFtqZrTHOU4PNqzAL7usAKoRH2lBapvnxEqT0ir7zrueYtjJUm5pvg
	 eFwcq9UGe1Dk7K9VRRTwVaDlgTI3zLrvz2YogYczVhi11QPiGZnvoOUBKDNYgEYiqi
	 J+3smDToYRaPYIPnrPAnm0CBvgoCzSKzsimhJyn9hLFDE4g690g4176IZgaxxxOUOk
	 /1ynOknIAOGhg==
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:48:31 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 4/4] phy: exynos5-usbdrd: add exynos7870 USBDRD support
In-Reply-To: <20250204-exynos7870-usbphy-v1-4-f30a9857efeb@disroot.org>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
 <20250204-exynos7870-usbphy-v1-4-f30a9857efeb@disroot.org>
Message-ID: <ba9aee5d125cd9bd2eea02d283877b5a@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_094837_134269_03F30F2E 
X-CRM114-Status: GOOD (  12.14  )
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

On 2025-02-03 20:40, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Implement support for Exynos7870 USB DRD on top of the existing
> exynos5-usbdrd driver.
> 
> Exynos7870 has a single USB 2.0 DRD PHY controller and no 3.0 PHYs. Thus,
> it only supports the UTMI interface.
> 
> Moreover, the PMU register offset for enabling the PHY controller is
> different for SoCs such as Exynos7870, where BIT(0) is for the 3.0 PHY and
> BIT(1) is for the 2.0 PHY. The phy_isol function for Exynos7870 uses the
> appropriate register offsets.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Co-developed-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 260 ++++++++++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
>  2 files changed, 262 insertions(+)
> 

Please refrain from merging, wait for the next revision.
Thank you.

