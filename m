Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DFCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4XcWHCpu3h5aG5qDaO09ZjwT9M3Yei0zyY4/p0jwJk=; b=z60YXUv4l3/UxiShaEEn0LyEXy
	ttYgbtyfcePIXBPtovCWeHF9BXllgRDgyhqOlz/qVZkkAs2ncf0MqTRdUPlHf2LpG6MfBAadbnZKs
	48HIZ3MWYK4S1+vnMtNnyPIJMw0TTmXzV6GDsN0Hel1KINEKAooyO1y66gjCuSyVHOdcbOkLXuRho
	3Zp/J4f4X42tWtrd904XMWKJYm42ebdJW5yn3m3vjUxRUTeWRm54COGXhJpFuYEPfQGRxk5E52qaw
	zNbJ/+hdyGcr13mGN1ofHevC41JGFsHBqcLUAeP+topwHo4nlZ615xN1vmVO5pvlxSDts7QnMtiiy
	1PUVkOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmNix-0000000C6go-2OG7;
	Mon, 24 Feb 2025 01:57:35 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmNfn-0000000C63M-3vGh;
	Mon, 24 Feb 2025 01:54:21 +0000
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1740362043;
	bh=O4XcWHCpu3h5aG5qDaO09ZjwT9M3Yei0zyY4/p0jwJk=; l=1858;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=iapxtGG+h+9UxAoIlecoA1rk0y1WgPGtg2zggAGok5nkYH6Ywt3u4tmFEvLNkcet1
	 glw32wLsZDc5/yykcrYsJy+vHb2ne7SIcx97cLnESw3vVTwizcpETwBbuyUoU/h1bC
	 KCIAtlaTYcRxcBk6Gi6gA6h/MCZMOBzNPGeV/o8O/nRcrEDyL9gRi4fUjDDRZHDSsx
	 JguxNkXc1UfkLxgYNFvGIXTcNNpnc2Q7ToffgYrlr52dZtRcQ+kURK3Sfl0ox9PtLT
	 l+QdwVbIn92F9Dkh2BtcC3K657mFnZgN/6fIyD7mXI7DvJmDFSG2sutDrO+2+ezsNQ
	 c7BvfXi3WkKbA==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(3140694:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 24 Feb 2025 09:53:29 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 24 Feb
 2025 09:53:28 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Mon, 24 Feb 2025 09:53:28 +0800
Date: Mon, 24 Feb 2025 09:54:26 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>, "fparent@baylibre.com"
	<fparent@baylibre.com>, Bear Wang =?utf-8?B?KOiQqeWOn+aDn+W+tyk=?=
	<bear.wang@mediatek.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "macpaul@gmail.com"
	<macpaul@gmail.com>, Pablo Sun =?utf-8?B?KOWtq+avk+e/lCk=?=
	<pablo.sun@mediatek.com>, "simon.sun@yunjingtech.com"
	<simon.sun@yunjingtech.com>, Yow-shin Liou =?utf-8?B?KOWKieelkOeCmCk=?=
	<yow-shin.liou@mediatek.com>, Chris-qj Chen =?utf-8?B?KOmZs+Wlh+mAsik=?=
	<Chris-qj.Chen@mediatek.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
Message-ID: <Z7vRUmETQaYRbEyZ@git-send.richtek.com>
References: <20250220143354.2532448-1-macpaul.lin@mediatek.com>
 <cb392432-e452-4460-ace6-54b3649aed52@collabora.com>
 <f09f880b7f9b642140109f17ed3f89aa44195b99.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f09f880b7f9b642140109f17ed3f89aa44195b99.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_175420_592833_534FF89B 
X-CRM114-Status: GOOD (  14.34  )
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

On Fri, Feb 21, 2025 at 11:39:09AM +0000, Macpaul Lin (林智斌) wrote:
> On Thu, 2025-02-20 at 16:58 +0100, AngeloGioacchino Del Regno wrote:
> > 
> > 
> 
> [snip]
> 
> > > +             tcpc {
> > > +                     compatible = "mediatek,mt6360-tcpc";
> > > +                     interrupts-extended = <&pio 17
> > > IRQ_TYPE_LEVEL_LOW>;
> > > +                     interrupt-names = "PD_IRQB";
> > > +
> > > +                     connector {
> > > +                             compatible = "usb-c-connector";
> > > +                             label = "USB-C";
> > > +                             data-role = "dual";
> > > +                             op-sink-microwatt = <10000000>;
> > > +                             power-role = "dual";
> > > +                             try-power-role = "sink";
> > 
> > Would be appreciated if you could also complete the node by adding
> > the pd-revision
> > property, enabling full USBC Power Delivery for the MT6360 PMIC.
> > 
> 
> Well, I have no idea about the pd-revision of MT6360.
> I could found MT6360 supports PD 3.0 according to the datasheet,
> however, I have no idea about the other fields like major and minor
> values. Dear ChiYuan, could you help to provide the value of pd-
> revision? The property has been defined in 
> Documentation/devicetree/bindings/connector/usb-connector.yaml.
> 
Hi, Macpaul:

You can specify the version information to 3.1 version 1.6.
Just add the below property into the 'connector' node.

pd-revision = /bits/ 8 <0x03 0x01 0x01 0x06>;

Regards,
ChiYuan
......

