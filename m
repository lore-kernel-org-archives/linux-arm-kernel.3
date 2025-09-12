Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF3CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNb85WvVkdzaFQ+H0+Bd9NiDBXrFXVSwReeskHw/kb0=; b=stS1Guarnijso0gHtmDSJMc5Ob
	b5KMZSQowwTpMgWGmmXuNbdOzzH9IkMD/uxlsQEH8Ww/z9D/rPOA2dQyAaWXUz9239aVufCloshXI
	Rh7G3+e9SRC5PIuWEiDrKCRzrRPhdWgyYbtjIS2aPS9246+ayKbrdx/cNLs4XdI98kfJXR9APJg8c
	OrhC+Nh9mEz++7z2io42tgaIEocunzi+BVKlkL6elm3ofqBGsLB430St8rh1TWxHTy8zhk0Z5QLCc
	LjPjK+/aEsVvQY98uwsZVD8G1VQxh9w+QUgU/O6LybshXBB5FXZgXvCn3UrYF0Vfw3q6vu46CNNhz
	iyMedbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Fs-00000008yAE-0t2k;
	Fri, 12 Sep 2025 11:47:52 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Fp-00000008y85-2xeY;
	Fri, 12 Sep 2025 11:47:51 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4BA0D55365;
	Fri, 12 Sep 2025 13:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757677664;
	bh=O23FHartpNXa3B2+8P0e6umlSTmWF4M31wzrGfMsxNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TuGBNjKgGjc7yqBhEUgn6FK+hrsA0xOfz8y++MiUux96Cu5EPYKWt3cGVfHpQ1cpE
	 /RiikfxzkmAqO4Y5GF/SrUmOLpGdK3KgqFuGJIRMc/2MJrVOWZ06RoQFYtiK0gdSDF
	 rBxXdNbLB7IGD0PCef2ssrTmY3sQdgGpT6fEuonOyCJW94SN2K/MFwUnLKSYusdhwH
	 qIoztTMU6AQGs8mmyhrhDYG0UeVvnSN4QlLstjxHq1B3QryYndb9Ite7LO7QKIZfsm
	 lf0lscBIUmro4C1yDVaDjycQvSz5nLwdV9HbiSFehWRNXEoTY8dxV1JbdkIuor/8UY
	 FRXOYph4gmacQ==
Date: Fri, 12 Sep 2025 13:47:43 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com, jgg@ziepe.ca, 
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_044749_959795_31DB118D 
X-CRM114-Status: GOOD (  11.89  )
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

On Thu, Sep 11, 2025 at 05:57:13PM +0200, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  4 files changed, 841 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

This will not go in before Will Deacons comment about code duplication with the
Rockchip driver is addressed.


	Joerg

