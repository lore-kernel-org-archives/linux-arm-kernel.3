Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD19E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NugO2eVOfNR4pSkovy7Wy+aY05Le8zqo8m6MuaUdEEw=; b=OgTFu4YdYziGVV5PYZ74eARG+C
	osMgzWmreGGOi/j+xRoQ4IYx53OVYbgjpCf9nJ4vDqHxf9UnMmXMeaDM+jBEPCzYRaB+uxTHrJ25l
	Q5Lavn8pHMifAGFODiPzwgkYW+Ldw68iHMa/y2qbSsHm8b43TKmla4vqVtJBhOD6QrU9k4iWYtdxO
	EZpyHqkdKhIxrhfsoayhw+0P5FfKfQNtaa/WbnsV5Yv7Id0/7ocUcOAjSDvqrUPCj5SZDRiud6zqS
	dWuZjspcr0SEMbbv/YI+RXEkJz81AOgmCb6VjRrmBXdPxyU3IgsiFy/uXBa9cd5UFuDNye39isuH7
	pz6nuzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlRK-000000014Ke-2be3;
	Mon, 06 Jan 2025 11:38:34 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlPb-000000013y0-3K4d;
	Mon, 06 Jan 2025 11:36:49 +0000
Received: from 8bytes.org (p200300f6af348600d06e0009f19b6c7e.dip0.t-ipconnect.de [IPv6:2003:f6:af34:8600:d06e:9:f19b:6c7e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BE4222E0016;
	Mon,  6 Jan 2025 12:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736163406;
	bh=YN58tjVz70PHm/pGFOJ+/GEdu/r7pxe7tJRI2ZBFXmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+eZgIxO/FoAd8/RTShOPk8F+f5IpkpVxsuPx4+tZ/b33HJTWqYVLLffeHEUgKAVp
	 +QEWB32R5ziD8qV4vLWUSPxDPMg+qQ/S/9AzF2qFvf1QrCbkNHUYLVr33dTgPQc07N
	 sOLK2KQtkDPiOv/ftv290QVXDlkRuo1Yg5rfNjFs6piSWshM5UNgx9GHc472Usn06f
	 ZVBYORJ/SCcnS0xhJAyLXsQxLfwZwT2GeoQD9ba8uLNhOIvKMhGHmf6V4RBqfK07X7
	 4T4uaZ7osSNna3/vMPLs9C1OJTyPZhZX/giQJbTdP578ibDMzyCKSt8DlFS1NRt23t
	 BMrVvluk5MxBQ==
Date: Mon, 6 Jan 2025 12:36:45 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [RESEND PATCH] dt-bindings: iommu: rockchip: Add Rockchip RK3576
Message-ID: <Z3vATdi6q83QAcU1@8bytes.org>
References: <20241231093154.252595-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231093154.252595-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_033648_050982_4CB76C50 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 31, 2024 at 05:31:50PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Just like RK3588, RK3576 is compatible to the existing rk3568
> binding.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks.

