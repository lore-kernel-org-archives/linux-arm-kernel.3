Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61500C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTfL/fvg5uCjNorELIHZpGNdVVCrNhFU0chckRh1dYo=; b=i1hBXVda6S5n5nLT7WK37kx/p5
	yedW3ZWrO14Ar19ldcDGGGMHxJyPuGkVYqumXaELLE7nLFza5wXTtAyJQRH301ukCxzqh/JuNXlZO
	J931DcTTaP2zlf98qk8A/Me5zDbog6fenqcpd5JKb7dOU34JxVElH4AtUxVxQNw94X8kjjufmh57m
	qn5gJfc34VA4YCHdSzTNvMUMCPw4//CsEKQS9PXgMtw/0auK0Lmd7Rl5y9dL2bPBEZV2BjJd27FO4
	YNNTW2fU8GpxNyPW12i9CwdfOOPZ5UVjyAyix3D8WLCWeC42og/0WNBSZ5NSONizCFznoJxpQFIMh
	8QxfM5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvko-00000007S9B-2jaF;
	Mon, 05 May 2025 13:21:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvcd-00000007R7n-0dmb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:12:40 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545DCU4O946261
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746450751;
	bh=yTfL/fvg5uCjNorELIHZpGNdVVCrNhFU0chckRh1dYo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QD7GM8TYI+aQOACJZ30G/WxcP6GgDD7+w7/oPCOh86Zgy813HxmhMEYpqqBBzOb6m
	 svK3oHoG4S8lKZvG8DOocDIryJidEhr5NUeVQ1EPv7/IB1YJUN0XOPuwO8/W36MQpU
	 uOWVStRJzfsuj0j2yj8pVtkxk7gSu0+5rFD9Sjuk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545DCUGs045176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 08:12:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 08:12:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 08:12:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545DCUnP108695;
	Mon, 5 May 2025 08:12:30 -0500
Date: Mon, 5 May 2025 08:12:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
Message-ID: <20250505131230.3ydwgftnqbbmrt5u@opulently>
References: <20250502142606.2840508-1-d.schultz@phytec.de>
 <20250502142606.2840508-2-d.schultz@phytec.de>
 <20250502144934.t6hjiwp2f64ovb34@deeply>
 <9964aeaa-0169-4596-a33d-c56bdb6edae3@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9964aeaa-0169-4596-a33d-c56bdb6edae3@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_061239_282766_FD98ADBE 
X-CRM114-Status: GOOD (  20.32  )
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

On 21:11-20250502, Daniel Schultz wrote:
> 
> On 5/2/25 16:49, Nishanth Menon wrote:
> > On 07:26-20250502, Daniel Schultz wrote:
> > > The AM62Ax SoC supports two temperature ranges:
> > > * A: -40 to 105C - Extended Industrial
> > > * I: -40 to 125C - Automotive
> > > 
> > > By default, use the lower limit (105 °C) so that any AM62A running
> > > in Extended Industrial mode will shut down safely before overheating.
> > > 
> > > If the bootloader detects an Automotive-grade device, it should
> > > override this and raise the critical trip point to 125 °C.
> > > 
> > > Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> > > ---
> > >   arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> > > index 39ff9118b6c4..40dcb9bab965 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> > Why not create a separate header for industrial grade and rename this as
> > automotive grade and let the board file pick the right grade used on the
> > board?
> 
> Mostly because I copied this from 10e7bfd8114c207ac and with the most recent
> temperature fixups in U-Boot, we also have the missing bootloader logic.
> 
> I would also prefer an out-of-the-box solution for that.

Personally, I am not in favor of depending on U-boot (there are other
bootloaders as well in the ecosystem) monkeying with dt nodes.

I suggest renaming the dtsi and introducing a industrial dtsi. And
depending on the samples used by the board, use the correct dtsi.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

