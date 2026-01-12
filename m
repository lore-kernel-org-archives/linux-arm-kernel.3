Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E182CF45D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duNUX0jA1Rn2LsfPAdwFfvvbV4uIr+G5K/kRn8EpbrA=; b=KQrpYPEI42pQTMILeuR/+b7CxK
	WIm+5Zpo+JiuL+sJiIvbfHASidT3gnxxn/OIQHZT/ShqGGBYlkfBNjxhqc/b8DproVcNrkkb1vd/4
	+OOmdsZVzoK8saxvlKogyJmA3Xpwr6Yp9PQMckpBQPQW0oWNu0xJOTSIGVPMSnlulEsmCVJ4AneNU
	hY9eXlaUiDdRBiIUB59JSxhnv2MxP54OyK84A6X5S9lhBavN746/23ael0CVraDWpuhzF96pAb7IF
	8EeLIwqqMThULOa31WxKm914EgcFBBtLUE5ned/QoyU/lg6d1++NplrwcybCJWeM+MVBe8pqa4a6l
	iEQyedWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRja-00000006KLS-2wjD;
	Mon, 12 Jan 2026 23:54:06 +0000
Received: from lgeamrelo11.lge.com ([156.147.23.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRjX-00000006KL2-49cs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 23:54:06 +0000
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 13 Jan 2026 08:53:58 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.151 with ESMTP; 13 Jan 2026 08:53:58 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Tue, 13 Jan 2026 08:53:58 +0900
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
Subject: Re: [PATCH 1/2 v3] dt-bindings: arm: lg: Add compatible for LG1215
 SoC and reference board
Message-ID: <aWWJlkzlb6rHbKTF@BRUNHILD>
References: <20260112053421.3185738-1-chanho.min@lge.com>
 <20260112053421.3185738-2-chanho.min@lge.com>
 <20260112-agile-elite-tuatara-dea08d@quoll>
 <aWTWwLsm+ZoR0aW/@BRUNHILD>
 <8d9b4ca4-5db5-49f0-8178-b528f9cf2eb3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d9b4ca4-5db5-49f0-8178-b528f9cf2eb3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_155404_363037_9755D6B5 
X-CRM114-Status: GOOD (  11.87  )
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

On Mon, Jan 12, 2026 at 05:31:26PM +0100, Krzysztof Kozlowski wrote:
> On 12/01/2026 12:10, Chanho Min wrote:
> > On Mon, Jan 12, 2026 at 10:07:05AM +0100, Krzysztof Kozlowski wrote:
> >> On Mon, Jan 12, 2026 at 02:34:20PM +0900, Chanho Min wrote:
> >>> --- a/Documentation/devicetree/bindings/arm/lge.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/lge.yaml
> >>> @@ -24,5 +24,10 @@ properties:
> >>>            - const: lge,lg1313-ref
> >>>            - const: lge,lg1313
> >>>  
> >>> +      - description: Boards with LG1215 SoC
> >>
> >> 1215 < 1313, so this looks oddly sorted.
> > 
> > Agreed, the order looks odd numerically.  
> > But it's intentional to reflect release order (LG131x earlier).
> > 
> 
> Then you have to remember and enforce the sorting rule here, because I
> won't be able.

Understood!

Thanks,
Chanho
> 
> Best regards,
> Krzysztof

