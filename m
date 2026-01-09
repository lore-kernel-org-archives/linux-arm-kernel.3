Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBDDD232CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 01:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1EpyFVV8pmkGVTLpAM6e68j7yz3D1NSo7Hl2xUtCiE=; b=soVNsVKVwvYsQ34/UF11ZfbBJU
	/kvLUfVvk8F+kVHgt/ySAU7Px1D4TjBTqUG1U5MQZ/Korx1LdzIGzkMpWgFsHMMTFtOONKliY7cTR
	QLBunepyGQN+vJe4aFL93Adf3xS4CWP9IU5MTbpMVeTUE1T39jgqRwFiw5yz/71RMBvrMvPQEIkQj
	fGvqXovPB10VaxYoXfs1TLZhy8Qy2rJVre9IXU48I4SDFQrFrejZxFmi0pzAkgCGna579PfdJvvDt
	GAxJRBFwYkcibpv7lRbMwjk+icQWSookza+Ksl0oMLR+SIy7Y5O2j6gQhejm6Yjitq5f/w+sxWzvP
	A0qXGRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1La-000000014lz-2J4o;
	Fri, 09 Jan 2026 01:31:26 +0000
Received: from lgeamrelo12.lge.com ([156.147.23.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1LU-000000014lY-2C4z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 01:31:25 +0000
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 9 Jan 2026 10:31:13 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.126 with ESMTP; 9 Jan 2026 10:31:13 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Fri, 9 Jan 2026 10:31:13 +0900
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
	Gunho Lee <gunho.lee@lge.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add 'lge,*' for LG
 Electronics
Message-ID: <aWBaYUTp8dOTIEGz@BRUNHILD>
References: <20260108082213.6545-1-chanho.min@lge.com>
 <20260108082213.6545-2-chanho.min@lge.com>
 <49d28c7d-a08c-4543-b3bd-a23d36785c28@kernel.org>
 <0b80d046-6141-4389-b666-592859468b8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b80d046-6141-4389-b666-592859468b8f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_173122_855599_5007FCEC 
X-CRM114-Status: GOOD (  16.67  )
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

On Thu, Jan 08, 2026 at 05:46:53PM +0100, Krzysztof Kozlowski wrote:
> On 08/01/2026 17:39, Krzysztof Kozlowski wrote:
> > On 08/01/2026 09:22, Chanho Min wrote:
> >> Currently 'lg,*' is used for LG Corporation, but LG Electronics uses
> >> 'lge' as vendor prefix for many of its device tree bindings
> >> (lg1k SoCs, etc).
> >>
> >> Add 'lge' vendor prefix entry to avoid confusion with 'lg'.
> >>
> >> Signed-off-by: Chanho Min <chanho.min@lge.com>
> >> ---
> >>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> index c7591b2aec2a..6c31fa4bee6a 100644
> >> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> @@ -907,6 +907,8 @@ patternProperties:
> >>      description: Lenovo Group Ltd.
> >>    "^lg,.*":
> >>      description: LG Corporation
> >> +  "^lge,.*":
> > 
> > NAK, we have been there and I do not change my stance.
> 
> Unless you meant to add it because of EXISTING device trees (predating
> commit fc75109288709 from Rob), then add with deprecated: true and don't
> use it any new compatibles.
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

v2 will include:
 - "lg," prefix only ("lg,lg1215-ref", "lg,lg1215")
 - Drop "^lge,.*" from vendor-prefixes.yaml
 - dts coding style fixes in patch 3

Existing "lge," → "lg," conversion will be sent separately soon.

Thanks
Chanho

