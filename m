Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1BACCF2D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz4fq/2gZmrr4eM2bJ/JqRO0I42RpevbXQK1bWur0vM=; b=EF5vVbyPu1+bV76+hKIN63V4i4
	HxfwZgP+2iFb1fCuCmYOcGVED5LwUYGMwGY4ZqEUQNxmGtw5K0BLx0IWeboX/q8+i9j84vStD8Tqu
	fACx0rbgfZcWWqCFnarqctAJ3tYmfzKiWot+br/I1M0R5qxbGtdsqPP7VE/dQGbsrMybz7V0Jz9Gn
	u/XU0ZPMH6IDJ9OpXw85uhiXqSe9ph/Kd/sRvBTqkZlNswk1EhixF3gd+AzRWZcn19E+3ZR2zn5L0
	DxKEDEjoEN8dVNBJLab4JGdk5UW8rD5Pdk2MPpkJGp55xYEmyyCV681LMZiaIPklRzJ1y+PqFKt/q
	ERelkM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl63-00000001at1-24NW;
	Mon, 19 Jan 2026 08:58:51 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl60-00000001asE-12wP;
	Mon, 19 Jan 2026 08:58:49 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B65D85FD8D;
	Mon, 19 Jan 2026 09:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768813126;
	bh=Lo8mZoaaii8JRD26jt3FCJPkfvZqzRGPmpdFFjziTNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlZN88K30kX5xY42fu7pSaEAKeJHxEGY2cNJniqi84AxkUGHPHeBS6TAY5zmygyOM
	 J45FU/+v4Ebje9id3gPMEGEcx+JGmFMB+7b2/0rUkLpBIVYnn8roF4n9Sfnqcgrlum
	 khdtzpIN0iWDXUwsvy8uYVsEnQiCTz6kwdewROxCqevdX9vTtGkyIjSAIeSZMWd8tU
	 qcAvUDDx/0Q5jgi3iHGBD/6SmfmltU+831vv65eFcqx/fx86YmOAOZCvn8MMzrR/8Y
	 0FFmoN8xOtzCtrTogxk6yERoo4TTSZdTHstpzIfa7GOChmAiwxkZjLHCoIZhVPX3B5
	 VU389lM1p7vtg==
Date: Mon, 19 Jan 2026 09:58:45 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: will@kernel.org, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v12 3/6] iommu: Add verisilicon IOMMU driver
Message-ID: <62w3kf2jmjoswnjvhszu4zl4sc7e4ut7qzmdkkiifkrzah5qhm@vaujr4wa4ozm>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
 <20260114100922.149187-4-benjamin.gaignard@collabora.com>
 <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_005848_484023_88E5C6CF 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Jan 19, 2026 at 08:58:37AM +0100, Benjamin Gaignard wrote:
> If needed I could add a patch or send a new version to add the following comment
> for vsi_iommu_restore_ctx()
> /**
>  * vsi_iommu_restore_ctx - Restore iommu context for AV1 decoder
>  *
>  * @domain: iommu domain attached to AV1 video decoder
>  *
>  * AV1 stateless decoder could decode multiple bistreams at same
>  * time and before decoding a frame it is needed to restore the iommu
>  * table to avoid mixing decode contexts.
>  */

Good idea. Please add that with the other comment I requested and send a v13.

-Joerg


