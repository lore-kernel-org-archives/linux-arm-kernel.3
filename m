Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6771AC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikw1+fL6btnWMYc4tslEQEKoB0CU6o+pa5SOHWA46gI=; b=rDJ7aERqPuaeHbS92YH0Loynjr
	qgSZmREdVsogaRo4ok/yaVsiinVPdk8qUPc3/RYXVH0/SfQXoUFV99beki8BkXI2qWMjeSm9SOg6m
	QCbI3rxsqB6dM4z7h6Jwt2Js9Rd/vtD4iNKFj2nyGFBBT7iJT/jrKT9/6UPvmPgV4I3wqc5rELOj7
	r1VTkEJrtIlkqnN8zfnS/+C1zczzd1p9V9dLxLbGF20wv2zwC1Fp4VYzFUwkXPPymSikrnUFD6XV1
	bk1ZShLJrFR4MfHga+YC2h3bkjaXlwqC8YXSIDjFIl/hDdx4aGvxpEjft6q9iQeUAOCxfTeoOjvAR
	v7OgDcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaYZ-0000000CR0A-11pC;
	Wed, 22 Jul 2026 17:16:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaYX-0000000CQzl-1rZx;
	Wed, 22 Jul 2026 17:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAD60600AB;
	Wed, 22 Jul 2026 17:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442951F000E9;
	Wed, 22 Jul 2026 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740588;
	bh=ikw1+fL6btnWMYc4tslEQEKoB0CU6o+pa5SOHWA46gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kYXSbZv4mVL0UQWusAhHj0XYr2/hUbIKw5N9P6IfKdCxtg9TDAMtJL673i/SLQsQy
	 yAJa3q4gl5e9gvGBdiZjfBZ9E5Io578KTu53K2WPu8rerzMCFmJIp45O9yz9KO3k4A
	 mBmufbr6HHb84wZAvttFbGoFwI3FJ7xm8jmb44krRBJI5UVID8c3hnWOVw8RJuAr12
	 J0Aj2JwL88XuuGc5YUsr1b6g2VnmVyWDYjkDEP5Siey6yYEgwS8ULNWFyXAvvYkGG5
	 1BJMwchk/g+x8CTeg/bR62Tbcwgt+dtLyxFlTIBMBLWC7R4TF8rPxP+uc1/m0CmdOS
	 p/RGgJRhAhStw==
Date: Wed, 22 Jul 2026 12:16:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org, huang lin <hl@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>, linux-rockchip@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: rockchip: Add RV1106 CRU
 support
Message-ID: <178474058544.1144777.17019195106018644429.robh@kernel.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714193656.2196447-2-sjg@chromium.org>
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


On Tue, 14 Jul 2026 13:36:38 -0600, Simon Glass wrote:
> Add the clock binding header and schema for the Rockchip RV1106 clock
> and reset unit. The clock IDs are numbered continuously from 0, in the
> same way as the RV1103B. The header also covers the MMC drive and
> sample phase clocks, which the CRU provides using control registers in
> the GRF region.
> 
> The RV1103 is a package variant of the RV1106 and uses the same CRU.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Renumber the clock IDs to be continuous, starting from 0
> - Provide the MMC phase clocks from the CRU rather than a grf-cru
> - Mention the MMC phase clocks in the rockchip,grf description
> 
>  .../bindings/clock/rockchip,rv1106-cru.yaml   |  60 ++++
>  .../dt-bindings/clock/rockchip,rv1106-cru.h   | 300 ++++++++++++++++++
>  2 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


