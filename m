Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676E8D63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7cbPIf87TwiKZjpYi5GKKH2MYKnXb0GCtVB2i4GALE=; b=u3xm0SSd9I1S5BxsM6XtVu3/Uy
	g237sfHrXR49V9cbGi7hQYYXd1oGcJIhDTu5kIFkBeZWl9a+fPe/TpCUF+wMmAy9M2Rxr971UaF79
	U8b52m0l5o+ey2RzJnA73mac3MvgNVTFHIpLUzTI9xaOEgiRz/4YE3yu43p+LtQMY/UvLXSlsnals
	376hdXps9vL/yVUtsl5EvwNTOSE0f/m5I2O+4stvGqa+d9H3PaGawCy9J7YumKTGGZk2C3QvqYPhE
	+3z2nu2fsIfOrDOC5NwXsp8ycqq3NvHNgbDRT1hQ9Vl8nh9QKNGGiufmfi2VXV5vGNfpQuFy89t+Z
	LYY9Heww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlvF-0000000FZrY-3sR7;
	Wed, 20 Nov 2024 14:43:13 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDluI-0000000FZkB-3KXP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:42:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEg6wA060354;
	Wed, 20 Nov 2024 08:42:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732113726;
	bh=h7cbPIf87TwiKZjpYi5GKKH2MYKnXb0GCtVB2i4GALE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Th4SUrKXKt06zhdXslQR+c82QnwJOKZ+tJM63SBJnCcX9csoKKU6fW0pKEmUFwMUC
	 Y/URflkntpq6AdKOYYfzg+JPxn7kn4kU7h/1RfO0BKsUIYgWls7UUBDvkzTY9/Oeo/
	 EsgAyMhPN7d/Zz+znizGx5M5SvP7VeGIOSwKxbhI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEg66H087120;
	Wed, 20 Nov 2024 08:42:06 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 08:42:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 08:42:06 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEg6OW006418;
	Wed, 20 Nov 2024 08:42:06 -0600
Date: Wed, 20 Nov 2024 08:42:06 -0600
From: Bryan Brattlof <bb@ti.com>
To: Rob Herring <robh@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
Message-ID: <20241120144206.e2axrtmg2tgcronw@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
 <20241119173602.GA1858974-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241119173602.GA1858974-robh@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_064214_914580_53C863AD 
X-CRM114-Status: GOOD (  10.82  )
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

On November 19, 2024 thus sayeth Rob Herring:
> On Sun, Nov 17, 2024 at 11:34:07PM -0600, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. All of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >     https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
> 
> Bindings are supposed to be a separate patch.

Ah my bad. I'll split this up in the next version

~Bryan

