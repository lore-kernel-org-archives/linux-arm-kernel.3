Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B12EF070A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 04:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hl8nbIm2/95ld6KWiU1DcqjNMBN/B2bpYb926e78xTE=; b=YE+djPA5+W+xEp0Ysj9TR+/Ar+
	4OazartBnGUl7HfoUzHT+Cr7w3oA+znF0lIAj5XCHTqZVI2sY7iwSY5xDNXIEIR+YvmHR3UgUsuha
	OMS3dUHsSMrIJX8MPjB66b60WEgIC1SMBlwjIAhqscOTXGa03O4nkrEUwtIgFfS1QLnU2DcRpKI4X
	nFlSH8XYX0qAj0KhK+PlSRRHODV3mLsgOiae0FBzRTjVYGCdkhx+x3CXwopKzmuZukJiRvnkvmoOQ
	4fbMtfB7U2QFIf8IC88/oq85T60SdIV4fmVDuZDB16PWxXjzHlchljIOarKeFb26Fm2OpaU3RMN1z
	PCxooQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJEf-0000000EpI1-1mXr;
	Mon, 09 Feb 2026 04:50:57 +0000
Received: from lgeamrelo11.lge.com ([156.147.23.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJEb-0000000EpHE-3g2i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 04:50:56 +0000
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 9 Feb 2026 13:50:43 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.121 with ESMTP; 9 Feb 2026 13:50:43 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Mon, 9 Feb 2026 13:50:43 +0900
From: Chanho Min <chanho.min@lge.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Kael D'Alcamo <dev@kael-k.io>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm64: dts: Initial support for LG1215 TV SoC
Message-ID: <aYlno8qlBo8enX4t@BRUNHILD>
References: <20260112053421.3185738-1-chanho.min@lge.com>
 <aYFM+mHqhfCuWgRP@BRUNHILD>
 <af35d335-96f2-4404-a6e2-e85c68cb2757@kernel.org>
 <7bec9ff0-29c8-4468-9d31-2d2b483e2aaf@kernel.org>
 <aYZ/k1SuZ4dTaV8u@BRUNHILD>
 <50acc90f-1efe-4bf1-8c87-a4d3b6fd825c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50acc90f-1efe-4bf1-8c87-a4d3b6fd825c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_205054_240559_1184A1AB 
X-CRM114-Status: GOOD (  23.11  )
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

On Sat, Feb 07, 2026 at 10:39:57AM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2026 00:56, Chanho Min wrote:
> > On Fri, Feb 06, 2026 at 06:15:25PM +0100, Krzysztof Kozlowski wrote:
> >> On 06/02/2026 18:13, Krzysztof Kozlowski wrote:
> >>> On 03/02/2026 02:18, Chanho Min wrote:
> >>>>>  .../devicetree/bindings/arm/lge.yaml          |   5 +
> >>>>>  arch/arm64/boot/dts/lg/Makefile               |   1 +
> >>>>>  arch/arm64/boot/dts/lg/lg1215-ref.dts         |  50 +++
> >>>>>  arch/arm64/boot/dts/lg/lg1215.dtsi            | 290 ++++++++++++++++++
> >>>>>  4 files changed, 346 insertions(+)
> >>>>>  create mode 100644 arch/arm64/boot/dts/lg/lg1215-ref.dts
> >>>>>  create mode 100644 arch/arm64/boot/dts/lg/lg1215.dtsi
> >>>> Hi,
> >>>>
> >>>> Gentle ping on the LG1215 series (v3) — Acked-by received, but still not picked up.
> >>>> Any update or is it waiting in a queue somewhere?
> >>>
> >>>
> >>> Why are you pinging yourself?
> >>
> >> Sent a bit too fast... I meant:
> >>
> >> *  # email/list and role:stats
> >> *  1 Chanho Min <chanho.min@lge.com>
> >>      maintainer:ARM/LG1K ARCHITECTURE
> >>
> >> so if you are not taking the patches, no one else is going to and
> >> platform should be removed from the kernel. Please confirm your choice
> >> (I can prepare the patch to remove LG).
> > 
> > Hi Krzysztof,
> > 
> > Sorry for pinging incorrectly.
> > 
> > I will take proper responsibility for the LG SoC patches going forward and
> > handle this series appropriately.
> 
> maintainer-soc profile will have valuable guides and expectations.

Hi Krzysztof,

Thanks for the pointer — I'll review the maintainer-soc profile and follow the expectations.
I confirm that I will continue maintaining the LG SoC patches and handle them properly going forward.

Best regards,
Chanho,







> 
> Best regards,
> Krzysztof

