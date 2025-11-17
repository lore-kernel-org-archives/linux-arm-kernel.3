Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BCDD59F5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2xVl9GtYDKziiIkptsRgm8RTLyYPV0xJz1nP0LWBYs=; b=rpPPSP2hVRKH82Ho2qDgyVoSG6
	u5+FMlEbJTfCmitOBsVmcHMiFe7WbE+QYRuvk28YG4OH3GcTCUbPgUk6nZwGxxewzpqLW34sRkPhd
	tMj3Rbrej6SPDULbuD+J931r2udb3Q29hoPnsMZFdPerknDWIr688c2LGNuOZ5CHru0AYFqtNaC4o
	M9Im0dl2Z9j0+9pLXG1uVHoNN3Lpju9IKX5czKsn1vOgrtyqowu0hZ3qZHIrtbjVyiL0f3e8zWCAS
	BsiLFkXhbd5p+gQie2W39rsr5PXFLvvwqulgzKnRwMdMQHpfsEXQzuT1gqRVdgEKmjluNGol/LrRV
	ET+77q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFp3-00000001KBD-0SCY;
	Sat, 13 Dec 2025 02:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFou-00000001K6j-4BQx;
	Sat, 13 Dec 2025 02:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/2xVl9GtYDKziiIkptsRgm8RTLyYPV0xJz1nP0LWBYs=; b=ZMPqIEkMzHL1G6QVIx2OqiFYWS
	vJdUaBcDA4M0LRw4VFgStm/Zl5DhCAI6jASfcyjcTc3BYttoCHkVJTxSjXWew51D+BcAq+270fDuI
	JqJuMpK0HVvh2D3y6F0BPr9h3AVjksgctmI1eSpjcwbxdixzK8484i05pXpnzhXo658C9x5CKBJJ4
	W3BRscjqUXHzPMfME/07xqwzWd15lAaK0nw42u2nZlC1cXJ1AKzTtx/0OL8HkfqrbneSx74XivAoW
	2nEVKiGbO6A0AJj2vog1wiZ102a9dgZWFi5TjJ2LuP/OQ/o46YV6jTKFhFSLfTHCV8sgBNM2EiGmJ
	Jd/+0oUw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKw4h-00000006yei-0ead;
	Mon, 17 Nov 2025 10:03:11 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AHAthamF3462592, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763376943; bh=/2xVl9GtYDKziiIkptsRgm8RTLyYPV0xJz1nP0LWBYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=COX4WNgH+/v8wdJ1B1b4fetKPl+lji2q0miDHYVP4bUr8ja6PfPYuW5c+2Qhr2G72
	 G22oNH2B6supn5JexMxJIcOkVdKRwNy1ySh5iomj7kEKgDpYkpBk2cPjPmAqU7XrMH
	 h38MtVz+BkqC6uTmN+qiTx0MAF3X7Q3wP86AEh42pvjBAL7GpXLHjKtsfByalGtU7P
	 nvL+O60aj29GdKw1sNTKbIy7Fqkn5e0ToaWNdm/TIz7kQcDGrw084h94T7R4wpVmvc
	 W4WmV5m6bJ1BkyS48JpKYbi4jysBdZefAk0HwQo6FqYxDcIwo9ufA8xFA3OWp40R1A
	 M6qKkGNS1kzPQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AHAthamF3462592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 18:55:43 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 17 Nov 2025 18:55:43 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 17 Nov 2025 18:55:42 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Mon, 17 Nov 2025 18:55:42 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <conor@kernel.org>
CC: <afaerber@suse.de>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <devicetree@vger.kernel.org>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>, <krzk+dt@kernel.org>, <lee@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <robh@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: realtek: Add Kent Soc family compatibles
Date: Mon, 17 Nov 2025 18:55:42 +0800
Message-ID: <20251117105542.14789-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113-preorder-task-4e5ba09580d8@spud>
References: <20251113-preorder-task-4e5ba09580d8@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_100308_449405_5727747F 
X-CRM114-Status: GOOD (  17.53  )
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

On Thu, Nov 13, 2025 at 08:30:07PM +0800, Yu-Chun Lin wrote:
> > Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.
> > 
> > Additionally, convert legacy DTS-style comments to YAML description 
> > properties, following the pattern from the ARM bindings conversion 
> > series [1].
>
> "Additionally" is often a sign that it should be in a different patch.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Hi Conor,

I'm planning to split the changes into two separate patches:

1. One patch to convert realtek.yaml to match the DTS-style comments,
following the pattern from the ARM bindings conversion series.
2. Another patch to define the compatible strings for Realtek RTD1501s,
RTD1861b, and RTD1920s.

Could you confirm if both patches should include your Acked-by tag, or is
it only applicable to one of them?

Best regards 
Yu-Chun

> > 
> > [1] 
> > https://lore.kernel.org/lkml/20200622125527.24207-2-afaerber@suse.de/
> > 
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> >  .../devicetree/bindings/arm/realtek.yaml      | 42 +++++++++++++------
> >  1 file changed, 30 insertions(+), 12 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml 
> > b/Documentation/devicetree/bindings/arm/realtek.yaml
> > index ddd9a85099e9..be529490640c 100644
> > --- a/Documentation/devicetree/bindings/arm/realtek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/realtek.yaml
> > @@ -14,21 +14,21 @@ properties:
> >      const: '/'
> >    compatible:
> >      oneOf:
> > -      # RTD1195 SoC based boards
> > -      - items:
> > +      - description: RTD1195 SoC based boards
> > +        items:
> >            - enum:
> >                - mele,x1000 # MeLE X1000
> >                - realtek,horseradish # Realtek Horseradish EVB
> >            - const: realtek,rtd1195
> >  
> > -      # RTD1293 SoC based boards
> > -      - items:
> > +      - description: RTD1293 SoC based boards
> > +        items:
> >            - enum:
> >                - synology,ds418j # Synology DiskStation DS418j
> >            - const: realtek,rtd1293
> >  
> > -      # RTD1295 SoC based boards
> > -      - items:
> > +      - description: RTD1295 SoC based boards
> > +        items:
> >            - enum:
> >                - mele,v9 # MeLE V9
> >                - probox2,ava # ProBox2 AVA @@ -36,25 +36,43 @@ 
> > properties:
> >                - zidoo,x9s # Zidoo X9S
> >            - const: realtek,rtd1295
> >  
> > -      # RTD1296 SoC based boards
> > -      - items:
> > +      - description: RTD1296 SoC based boards
> > +        items:
> >            - enum:
> >                - synology,ds418 # Synology DiskStation DS418
> >            - const: realtek,rtd1296
> >  
> > -      # RTD1395 SoC based boards
> > -      - items:
> > +      - description: RTD1395 SoC based boards
> > +        items:
> >            - enum:
> >                - bananapi,bpi-m4 # Banana Pi BPI-M4
> >                - realtek,lion-skin # Realtek Lion Skin EVB
> >            - const: realtek,rtd1395
> >  
> > -      # RTD1619 SoC based boards
> > -      - items:
> > +      - description: RTD1501s SoC based boards
> > +        items:
> > +          - enum:
> > +              - realtek,phantom # Realtek Phantom EVB (8GB)
> > +          - const: realtek,rtd1501s
> > +
> > +      - description: RTD1619 SoC based boards
> > +        items:
> >            - enum:
> >                - realtek,mjolnir # Realtek Mjolnir EVB
> >            - const: realtek,rtd1619
> >  
> > +      - description: RTD1861b SoC based boards
> > +        items:
> > +          - enum:
> > +              - realtek,krypton # Realtek Krypton EVB (8GB)
> > +          - const: realtek,rtd1861b
> > +
> > +      - description: RTD1920s SoC based boards
> > +        items:
> > +          - enum:
> > +              - realtek,smallville # Realtek Smallville EVB (4GB)
> > +          - const: realtek,rtd1920s
> > +
> >  additionalProperties: true
> >  
> >  ...
> > --
> > 2.34.1
> > 


