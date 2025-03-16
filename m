Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A7C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 05:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KLKvl+aHW6bUzj8xDpdQzJSFWD8KkS/Qq72RQE06U8=; b=TDBj0M3O+csNUhEm1L1TXDeDz/
	IaZci96QeDiBAqm9ZPMw58EXCrClUdLLYB/BbaToJEvFoYBwbWgIDKycns25Fn2b23lVbfMkYtX5d
	Q77siAtx/NJh65kV+4MKGQHEbCXlLdN4oqjd8DLRGCzeKToHOPpsBTfdi4u7xcVvcnuRYZZjpCYns
	Ssa+PgB3OUqojGe5Qw8KNCqXPi/clhEcp2GlizN5GZVnGOOkFrq7Wfm2Ajb8intL+VMq1ErhGd2Zr
	OlHtvq0z+zdSavUDlqcoQuLknD7uSvcCzlAcCzoZiD2aUNeaEHOkN3x1FDIwLlQgLVO40o/PsW2ao
	W/JmkwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttgCC-0000000HI1k-3a5K;
	Sun, 16 Mar 2025 05:05:56 +0000
Received: from mx1.riseup.net ([198.252.153.129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttgAW-0000000HHye-1iRd;
	Sun, 16 Mar 2025 05:04:13 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4ZFmGr5jwHzDqLs;
	Sun, 16 Mar 2025 05:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1742101445; bh=lLozEeBLlgV86HlgPg18pz4OFD1viZMm++QDeHafczU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rATON2WrIr3NZdUK1s84wWU0dJErmcUiGbauVGOR+SWUamvwpPyoiiVIONPhngaPD
	 n+EVodYWlUjQ9MWoWA8XFnOXVsaoUxtsN/u1MT0q5Qd19agTgA+DJyuM8IKe4O5vtx
	 6gpI5T5RY6b02kDYStgsoiXbhAq8kCflfp8PYBVw=
X-Riseup-User-ID: FA07B3CEF15B9BF855EB57A064CA13396EA4C9B9044372EE883EE87E4D753941
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4ZFmGb3mRlzJqbv;
	Sun, 16 Mar 2025 05:03:51 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: joro@8bytes.org, will@kernel.org, Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Subject: Re: [PATCH 0/3] Rockchip IOMMU fixes
Date: Sun, 16 Mar 2025 05:03:43 +0000
Message-ID: <7951915.lOV4Wx5bFT@melttower>
In-Reply-To: <cover.1741886382.git.robin.murphy@arm.com>
References: <cover.1741886382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_220412_545958_3E171009 
X-CRM114-Status: GOOD (  12.91  )
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

On Thursday, March 13, 2025 5:31:03=E2=80=AFPM UTC Robin Murphy wrote:
> Hi all,
>=20
> I was expecting my DT probing change to flush out issues, and it seems
> some weaknesses in rockchip-iommu were the first to show. The first two
> patches here get things working again for me on my RK3399 NanoPC-T4
> (with a console on HDMI exercising the VOP MMU), the 3rd patch just
> finishes the cleanup since I was there and could test it.
>=20
> Thanks,
> Robin.
>=20
> Robin Murphy (3):
>   iommu/rockchip: Allocate per-device data sensibly
>   iommu/rockchip: Register in a sensible order
>   iommu/rockchip: Retire global dma_dev workaround
>=20
>  drivers/iommu/rockchip-iommu.c | 61 +++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 35 deletions(-)

Tested this series on a RK3566 device and this fixed kernel panic/oops on b=
oot=20
since next-20250314.

=46or the whole series:

Tested-by: Dang Huynh <danct12@riseup.net>



