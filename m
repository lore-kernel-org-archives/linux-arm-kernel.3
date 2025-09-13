Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA55CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOrQ3XGbY+iSa2zf95DYqVzO70h3BxOkjjoWzWQq+H8=; b=FhQa6lGCZyNCeb2avNvPZmj2wL
	YRX9TfDsKlFC/0+YNsLZWT5VSRrKM/hnzHuSHb7xs7g+T5iDNx1Sxpn3KIQtkuUIGgG5UaOnRho+h
	ixRsg6yHi8ifbpLnIi0xDDTjQSV97QEYfmXEIyf6R9LYJRcrpK6kXzRpfGrr2h7Nqk7qRZlO3eHXM
	JV58dHpB6HDBQZWxjIhOrXXZaSq7qMfa3k4X1Y6BvPK5ibjq3JMAVFXMTlo4QTMul0dPZZifjOCZc
	LbB48wU3AGIDoHvlZnx90cZdeV8bvZnrRSjjDwmYZpatwgTnlHn4FoWsmk3kXpRQcMH7xZR0tY4Km
	67YgL16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMbn-0000000E7Ux-30JF;
	Sat, 13 Sep 2025 09:31:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMbk-0000000E7TD-3JxT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 09:31:50 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AD9F6664;
	Sat, 13 Sep 2025 11:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757755827;
	bh=i/90t0EIiI8YT4SDcQlBv+MxfSzMFscIihlKp+m74p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPvrMojwHgYf8KJbiXp0FAFeMMXBQZBtETs17QcPzsV2r2CAwhylnATx03eubg2j5
	 XxD7prpuuzSAc0nrCVYf6L3ixLhxOYg/zxhKvwZj80EfndTrfnJ0FdjO6Y1ofCRRpJ
	 r/Yn3sKRv6TAYhiRzj78N583eJ7fCaFUTnG2EBAU=
Date: Sat, 13 Sep 2025 12:31:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-media@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <20250913093118.GA4842@pendragon.ideasonboard.com>
References: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>
 <aMShqlBgHXHIExDC@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aMShqlBgHXHIExDC@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_023149_271740_E87845A8 
X-CRM114-Status: GOOD (  14.41  )
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

On Sat, Sep 13, 2025 at 12:41:46AM +0200, Wolfram Sang wrote:
> On Wed, Aug 13, 2025 at 12:49:23PM +0300, Laurent Pinchart wrote:
> > Usage of the clock-frequency property for camera sensors is discouraged
> > in favour of using assigned-clock-rates (and assigned-clock-parents
> > where needed). Mark the property as deprecated.
> > 
> > Update the examples accordingly. In DT examples where the sensor input
> > clock appears to come from a programmable clock generator, replace
> > clock-frequency by the assigned-clocks and assigned-clock-rates
> > properties. Otherwise, just drop clock-frequency.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Changes since v2:
> > 
> > - Don't remove clocks property in samsung,exynos4212-fimc-is.yaml
> > 
> > Changes since v1:
> > 
> > - Adapt examples in bindings that reference sensors
> > ---
> >  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
> 
> Can I have this i2c change seperately to avoid dependencies?

I'm afraid it has been merged in the media tree already.

-- 
Regards,

Laurent Pinchart

