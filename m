Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F8AD232CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 01:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dzx46E8hvt548bI5MaSrLK7wCaDR96dFQwKv+ooNdRA=; b=IWsI4It3FOFoZJ/HPeFjG1pX1N
	3xOpblS1XNwRvSqjqPAjE4rRt2VeYOLI4twEMOQr9RsiCk0IEH7Epn5gm/hiZQDRhdfBngr8ehqGI
	NCaoNJ9147u9qy33ULsJb00hcjJobQcii+qwJSFekNm3zSvdYSlljz9f6L/9BwRQ3gTDoJoommRgt
	WuMdsUf77X7G9aL5MqVTm4TPMOY+Zm4qoJtwZUZf+JE2LMLCMFoYWJ8B7HPDpiLLQqUyayfv9bK1Y
	JMQ16K9LHdBb5SMgHpx4Cj3zrf9hcdoMV36+y5NSo18TSRJm67tKqpnEH0t/hmXbhd5R+mnbYVZLC
	hMtcqhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1QY-0000000154Y-2ii6;
	Fri, 09 Jan 2026 01:36:34 +0000
Received: from lgeamrelo13.lge.com ([156.147.23.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1QV-00000001544-3VSW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 01:36:33 +0000
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 9 Jan 2026 10:36:26 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.151 with ESMTP; 9 Jan 2026 10:36:26 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Fri, 9 Jan 2026 10:36:25 +0900
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
Message-ID: <aWBbme775HmH6drB@BRUNHILD>
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
X-CRM114-CacheID: sfid-20260108_173632_201227_5A153AAF 
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

Hi Krzysztof

v2 will include:
 - "lg," prefix only ("lg,lg1215-ref", "lg,lg1215")
 - Drop "^lge,.*" from vendor-prefixes.yaml
 - dts coding style fixes in patch 3

Existing "lge," → "lg," conversion will be sent separately soon.

Thanks
Chanho Min


