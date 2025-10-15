Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5FECCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM1aYAgMdOp/DAeBDMg2FxvR5/rP1mT9Bp6FUbFmyb0=; b=h8+z5Hhlpr9LArgCbVsFYZrSIW
	+TjRw+LvFGwNLwyahL/6uuFP5d39g/gMLhZ/fIYqqammaQfdqP6HXZ0pqeVBrfpdJHfs9e73wHVri
	F9/G2tEaSZL+34UIwYh6nBiEYunOT9Yz4kBn9UwLWVJWZ9x3SB41z7ZmVileZuO7+itYadW5NJFWO
	q0yJQVFK9OgMP7jL5dKP3ZjvXsdduDqF17n5ILLmg0xc+YUhwN40EgJ2DQD7x8xHnwSwWxPmcI2W8
	moq0gtB+tq8JCxuTv5hPL2BoVawoaset+81HZ0kuf9Gjp0dPOn2ePE75rsC35MBRWK8TpNjqIoSdS
	R32uv4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tbE-00000000TdF-1f6c;
	Wed, 15 Oct 2025 04:58:56 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tbB-00000000Tcs-22i1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:58:54 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F4wmum1318058;
	Tue, 14 Oct 2025 23:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760504328;
	bh=qM1aYAgMdOp/DAeBDMg2FxvR5/rP1mT9Bp6FUbFmyb0=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=YUD0feHE/X0dHO2pNZp/TxEyKJSxN8mI7i6Rk6MygplaXV6IRjkBv61m/ClLg2MDi
	 valbzwyavkTHkCfc6bh4sVHY4H+OwFecoH34YRkClax/dAo71ke7Vv1etYOTA/J6OU
	 YYDUMmKT6Zctyk7fpDKw2MgseokLNwbxx22xovng=
Received: from DLEE200.ent.ti.com (dlee200.ent.ti.com [157.170.170.75])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F4wmui551616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 23:58:48 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 23:58:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 23:58:48 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F4wisn1323981;
	Tue, 14 Oct 2025 23:58:45 -0500
Message-ID: <1b2b23293b01cec8161bc749bb864b18b3d41678.camel@ti.com>
Subject: Re: [PATCH v3 0/5] TI-K3-DTS: Cleanup CPSW DT Nodes
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Dominik Haller <d.haller@phytec.de>
CC: "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
        "kristo@kernel.org" <kristo@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "srk@ti.com" <srk@ti.com>, "s-vadapalli@ti.com" <s-vadapalli@ti.com>
Date: Wed, 15 Oct 2025 10:28:51 +0530
In-Reply-To: <df6acbfe5d30956ed66e2768fa595c36d2ebe98a.camel@phytec.de>
References: <20251014125349.3408784-1-s-vadapalli@ti.com>
	 <df6acbfe5d30956ed66e2768fa595c36d2ebe98a.camel@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_215853_739276_150434DA 
X-CRM114-Status: GOOD (  15.03  )
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

On Tue, 2025-10-14 at 17:07 +0000, Dominik Haller wrote:
> On Di, 2025-10-14 at 18:23 +0530, Siddharth Vadapalli wrote:
> > Hello,
> >=20
> > This series cleans up the CPSW Device-tree nodes by updating the SoC
> > and
> > board files to keep CPSW disabled in the SoC files and enable it only
> > in
> > the board files.
> >=20
> > The following is a summary of the SoCs, CPSW instance and the Boards
> > that
> > this series affects:
> Hello Siddharth,
>=20
> please also enable cpsw3g in our k3-am62-phycore-som.dtsi and mcu_cpsw
> in our k3-am68-phyboard-izar.dts.
> Unless I'm missing some other patches you're turning off ethernet on
> those two both platforms too.

Thank you for pointing it out. I will include them and post the v4 series.

Regards,
Siddharth.

