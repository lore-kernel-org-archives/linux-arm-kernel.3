Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87880CCF2CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iYYlWq5RKphq3xtHuAjLTBgmtCUMliojUXRG4UjaZo=; b=d/CKpk49zclcuGp98S7UYFfYoF
	eex7Qo8W7xdHQFlccuzMH2EqFhOxy6FjVNZM+FoUBFNraNc76eXM9s0S/yhWv3Gx3hylEmN0X2Tid
	7laX8i1/H1jKDJnvxAXR4y6N9k6EICLtpksZBF6Ij8nSrPSorRi1zM1+kSW0GrcxyCMJiS088e/ak
	eepZyCNqGMFxXz81C5YTkb8BQMvwzu/WEaeZjiojQ+zSIyqKXYmGe5yj/mRRUkdHAqcow+GTLd9X6
	RjYrXSmnArtDWYgFO43oFyD84EX3ltDtBHAN1v/11SPIGc5Cwr5uzT55degMsVdLdhpnsV+0Nut6l
	s+vC93jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl3m-00000001agh-1Qwq;
	Mon, 19 Jan 2026 08:56:31 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl3j-00000001afs-23kf;
	Mon, 19 Jan 2026 08:56:28 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 592055FD8D;
	Mon, 19 Jan 2026 09:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768812984;
	bh=9iYYlWq5RKphq3xtHuAjLTBgmtCUMliojUXRG4UjaZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vajByuO2m3rIm5XGOXMJd9MmaN6MUFzdLp7pdgRDi47q/3HGvMK9/E8JSS+t75IdZ
	 BorcbBaGlbxYg9O2ESDONDIEntUG+zczjNiwoXemUmNPF7JhbhiEfxf9w6cv3oKJWm
	 s9u+WEuAMSvROa+EoLo02BdL+hsIADQH+tJIpX15oy2Qmj9z2y5UPaJRSYbu8DvVzJ
	 G0dADKJkmt/5WVGLZaXuZaslpofgoEGij34S9rvBbc5LbwN9CyRn9EfXaCiIJG7qs5
	 Zi7PhzD4w5TN77ppzARYJY87eIn/2gM+eCQWlhOZAX5CP4FtmsxbQF13nWJb/ncpwD
	 bZM6gIB3KeQNQ==
Date: Mon, 19 Jan 2026 09:56:23 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <piak4uh65p5rzyicotia4at2g2bdwqg3xyrln53v3yfjzyde5j@irwvikgbyexl>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
 <1030ddab-6124-414d-958f-c461c19bdbb0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1030ddab-6124-414d-958f-c461c19bdbb0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_005627_766955_AEC92650 
X-CRM114-Status: UNSURE (   7.36  )
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

On Mon, Jan 19, 2026 at 08:51:46AM +0100, Benjamin Gaignard wrote:
> I have already send v12 where I have removed the useless function.

Then either send a patch on-top or a v13.

