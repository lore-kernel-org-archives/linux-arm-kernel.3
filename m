Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5533CD29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QpAp4QkWR9PBHqqIXcZgHZKXXztp+I8Ih4YTO98MnY=; b=gz5nHOMjgvlliHzBnDBQHGMEwv
	WuVBQemBSGNhxpJErfVdUnH3Y2h+aBqB/PTz1v2si0Ey+1u5YKFv5h8WGQK/Mrq63DMil4gQDgOQu
	608w7Jb13SVSJOVNzNi/8JatEWL2mp1lmihAT8eKlX+2vf78O8Tl6saAo8zLt7nwiOTKyk8/g84sQ
	t9xkoXAP0lE+dELhf1K/FXaCMU0TWeoIDHApr4C88w+30gvmb7eklEGlYkh2oFE9ThOMvfLNerJre
	Mf6ivIdJYDD8edszoqLxEr+0EqnFDecjzRBANO5to5DePyQ4CjEt9M1ug7LuxR0NPmFYzgERdR0gw
	8a+xjIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhptc-00000002Dqx-3vCx;
	Mon, 19 Jan 2026 14:06:20 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpta-00000002DqB-2GyU;
	Mon, 19 Jan 2026 14:06:19 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A8A165FE3B;
	Mon, 19 Jan 2026 15:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768831573;
	bh=8fE/fVBEgdOLpzuob5JArOL9qUED4Igf5P6wZV9E7zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xPgVoupCZJ21WG/9NetjaYmj37rlGXT0p1h01g/8PJf/5BIF/sDss8wVY7EBEuCxc
	 o50eZsGy06uMek/GekduYUc5aIaus/KwqqpL5mNJlrZYYzH6u0UJGE6jqYJfgw5HpX
	 8WyvB+OC36TmRRvmPVpg870uPg62YqoWwjrbQOPPl+TGMMS5Xbkd990Qq0zpCe+C05
	 5PynYXLJG2n+yhU6JGOenybtrAbQIEXemWff2IbFUZkGoVVtb2tNqkcJoPSthab6Np
	 B8buqRrGdK6s8V3FOkjRGjak08I9MEp0uu6DMJoleA/1Y1Ld380PutUAMZhAOYKicD
	 UZqqaTazCQs1Q==
Date: Mon, 19 Jan 2026 15:06:12 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <f2v4y2fi6dw44zfp4uxn6d5v5hq4sukwds4hxn4btn6zxr7vrp@b4qbub57vgft>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
 <d81c0f26-ab36-42a9-bc40-b9767aea038a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d81c0f26-ab36-42a9-bc40-b9767aea038a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_060618_797018_DE9217C4 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, Jan 19, 2026 at 11:28:11AM +0100, Benjamin Gaignard wrote:
>  * This hardware block is using a 2 pages tables allocation structure.
>  * That make very similar to Rockhip iommu hardware blocks but it has
>  * it own driver because the registers offset and configuration bits
>  * are completely different. An additional raison is that this hardware
>  * has been developped by Verisilicon to be used by their hardware video
>  * decoders and for a general purpose like Rockchip iommus.

Please run a spell checker on this (e.g. raion -> reason, developped ->
developed) and I think the last sentence lacks a "not". Looks good otherwise.

-Joerg

