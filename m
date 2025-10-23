Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C83BCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGbadfXdorcMPnmwNXVNWcPnkf3aCIvQIT89nWPARCE=; b=l5bHtHM8UDwFYDqud9AnaOZS28
	12HxMctvOJx74IPbSMuQAXPe58gsuTedw+VXiikELVscwaNIrfUJGThJtlhwsbI4uuA4SU+w7FZum
	CXFlPHBhuymomkfp4TL5jAxsYesIlmsStzfMW/jxHKjzrkXZbkwgKPKwDD/gwVvkGaLFQh8wTqJpH
	04KIVhAQeH9oG9WAJC1Mgv2NF5RH+uxLyxg23jKtXbN5CEiv7fVXMHq050fE4D+RlZN+Rgia3RphY
	rJXgwsqvia6D1Cxq/0Of92wd/cwbaXdqvotFZqLN3vuoG18T6i/8uD9jK6Q++j25vRIWih3raFHnv
	oRMIDtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpFB-00000005Gn5-3d4K;
	Thu, 23 Oct 2025 06:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpF9-00000005Gm9-3GRw;
	Thu, 23 Oct 2025 06:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aGbadfXdorcMPnmwNXVNWcPnkf3aCIvQIT89nWPARCE=; b=T/8BvbbNQi3+HZMJPGmEbCHmyT
	JeNGN4T0dBe94psOisbpS0o9rYIy/9QivrB4Jy9MeNNr0VR19zDlZEbBcMPi2uXypKnL2sa1GvZpo
	zNlpniVrfyAIiZs2hitv9JDMuVVli3HwOCL0C25x7fdaDaDZ9U1VwSM6JQtwD9FCeM9CiW7sxDzco
	xODj0rOPyNB5HIpZLVLzQIqUcyfMrllRp8BCeut8stOYg/uajRMn4H+I6zi1LqHq8B1RUozWPU7B5
	+rUAYBK8uZ2Yhy2t0zq/0EQFNt72VZrALhYC+1EU7z1o6A5bTZUl/hL+dgmzsMTHHNuWcjoOsDdow
	fH2ZFsWw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoNQ-000000018fD-10Wz;
	Thu, 23 Oct 2025 06:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aGbadfXdorcMPnmwNXVNWcPnkf3aCIvQIT89nWPARCE=; b=xtr/5YZlHNoxBEPSRG93Jpb/9z
	/pNZd5Xgf1O4YmC64aLItyQI3crzt54lkDeYg2xBWhUDcyy6t/Qq/ZLObRj8pVhTTpUcsLlyT6ZMf
	zjvMUEy0Nn59qkLFt0f7B468C4xVfQy/K3QPwAdHsxBmtbsBHsWl2FcbfVB4R/ZC6+otj4nln3+KZ
	PbKZLuWBui8eSn2yXXuDMnaCRYa1HA23PSzg0q7rPzDNyIbn9GwSmA5r1FXk2SuqP1GBl8i1TZ2B4
	eHze05UMkDQWRgBA2v0w3mbpnyKdgARzG0YVHoH5B4+Hkx7avsZUJ18JvFVIdFL25T49EoYhufKgP
	ahCsokVA==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBpEv-0001An-Ui; Thu, 23 Oct 2025 08:56:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
Date: Thu, 23 Oct 2025 08:56:00 +0200
Message-ID: <3705026.LM0AJKV5NW@phil>
In-Reply-To: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
References: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070045_433424_61BA5280 
X-CRM114-Status: GOOD (  11.99  )
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

Hi Dmitry,

Am Mittwoch, 22. Oktober 2025, 18:19:48 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Dmitry Osipenko:
> Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
> is backed by a virtual device that isn't IOMMU-capable, while VOP is the
> actual display controller device backed by IOMMU. Fixes "swiotlb buffer
> is full" warning messages originated from GEM prime code paths.
>=20
> Note, that backporting is non-trivial as this depends on 143ec8d3f9396
> ("drm/prime: Support dedicated DMA device for dma-buf imports"), which
> landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
> initialisation"), which landed in v5.19.
>=20
> Reported-by: Daniel Stone <daniels@collabora.com>
> Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
> Cc: stable@vger.kernel.org # v6.16+
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

just a process remark for now. This v1 so it definitly shouldn't come
with any Reviewed-by-s pre-applied, because this should happen in public.

It's not a huge issue here, because I do trust the people involved (you,
Sebastian, Daniel) and the change is small enough, but please for future
changes, let Review happen on the list, not on private channels.


Will look at the change itself when back home.


Thanks
Heiko



