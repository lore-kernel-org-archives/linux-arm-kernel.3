Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917B4FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8YrPdCR+u03ef1UAvjgy6RoNtkjTp2zBuXHNNCd0/s=; b=B0HubEMJwVnEXQr9jq85bL6DZS
	XoRleRiG+DsPw55BDzG/fUtYJpuUlkHpRIfDA5+0kbw0PNGtPELVsc2pclzm6iqSyMOot7ZTUwTyK
	nmyKxeO/se99lXtzN8UuEPe0eGn7MB04YrEqMbw5dWLeBb1Ae4rRrZRMr1ChOxsjb53cwipToQ1b6
	5nZ/omKlL4FUMyH/m7NvtNC+ca3N2Biy7gYcYX1R61thkxjAmb8d2iwSOR+9GTqM8bZ6UxPbzl/m4
	CRddZ3cGpxUqUGOhjHHemqZX6sxGXfRyv9nHxYf0s0lH+vu0HLIJHXHGo79j+w9TDrByt1qNZGR0A
	VzwifUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Iy-00000003aje-1vtp;
	Wed, 29 Apr 2026 12:46:16 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Iv-00000003aiz-3cxO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 12:46:15 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1CBE622B80;
	Wed, 29 Apr 2026 14:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777466770;
	bh=F8YrPdCR+u03ef1UAvjgy6RoNtkjTp2zBuXHNNCd0/s=; h=From:To:Subject;
	b=acc7YbmWC0WpRoKbLyQBQKAchhy8m8X/n89Sb0CKBYtXDTrGj/yn//yUoCln5LCSK
	 qFAMpgjVJponjMPWoVqOXbGu72KDNJjsiB1kuDuQ9wI7oZOnOwLR8ky/pj2z8tOddT
	 sbkJjJfRrsA0co2gZ2eNZ6WuuS3De3zw9ZJ7jGG/uGOfi3PFt//Tvm1gseUF3fYBd0
	 EpUgXHZVHmKoMSoBkdYB0qk0yTRlmLRJqZl1fhin8WJb6sdmn4RiUV7fmmWmVfn2sk
	 QRj+62AYVPf4EJyTkGhLes8Pav+FnDFNA7u9JKEOWmaGm8iUaYUBlnr9whZaJCdc60
	 LrE0HzWq2EfFw==
Date: Wed, 29 Apr 2026 14:46:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
	justin.jiang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
Message-ID: <20260429124606.GA62742@francesco-nb>
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
 <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
 <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_054614_382026_9A9F09DB 
X-CRM114-Status: GOOD (  10.11  )
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

On Wed, Apr 29, 2026 at 05:26:02PM +0800, Joseph Guo (OSS) wrote:
> On 4/29/2026 5:26 PM, Daniel Baluta wrote:
> >> +
> >> +&flexcan1 {
> >> +	phys = <&flexcan1_phy>;
> >> +	pinctrl-0 = <&pinctrl_flexcan1>;
> >> +	pinctrl-names = "default";
> >> +	status = "disabled";
> >> +};
> > 
> > Why add this if it is disabled?
> 
> The resource of flexcan1 in System Manager is assign to M7 by default.

I think the correct status in such a case is "reserved", am I wrong?

Francesco


