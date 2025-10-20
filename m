Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25450CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCETLYsFibjq+CsukzViDDTORlacs1ZM9GueRkvBoiQ=; b=VIg0QhT33MJxaMZza4ndfc+OF1
	7Yfu7Daq7JtbkPnH4eU7D+Xij/tSpEGnsMEeWXbYxcVsgbQnG16LBEfdaHq3XRdu7I7eyHrASSjQt
	51IEUbt1kJ7qmuMQRKbUkLNff6+XnUVb+MO7NvI4PjaVUxARg2wy0psJ/QQ3REbCSXQb2LNSw44Nq
	sF9R2jvsVMqgAGxTolTDjcSOUVHNH+DJ1O0gxy4Ak++OMRmmVqjxiBem/sPXKBcVCwr/cA85HkMuL
	/trU1MgPntrB60pXTEp5UpcFz67JN8lp9BTgLHEg/o4Ye49I695BizteUkKGGjHpN+dt3OeML/N7L
	YthNbBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApHE-0000000DcM1-39SE;
	Mon, 20 Oct 2025 12:46:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApHD-0000000DcLS-138m;
	Mon, 20 Oct 2025 12:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=iCETLYsFibjq+CsukzViDDTORlacs1ZM9GueRkvBoiQ=; b=XXjkX4+WvYBdC4vbQ4O1G/uG8u
	CUju/N3kgTonCqyPwsuBG1g3n/xL4s0gVfENRCOr+uDupJabPwZuAzP5C1pS1eG7wAWxBgB3j9VJD
	E+41QemnvaPdIoqxvOGRLFt5ICXTXhvnUPsPoScyVIFCmQNYC0phxOl9fbCPRF0Xqvi8iTw1QXbf/
	z0mQbgS1UKe6q9RBrbcofZPqDSIajoGIC1u8+8oiDGp5tBLIukS2xq63z0Z5CeKNyeW6M68hq1s2C
	hJpCvQ49f0y2WbXQvcUe1SfnVtQoc2qyOM8/RuuamSuv9Qfl6uNQGTGReMT2n38JH0ABhVXyqu/tA
	jrMUHRaA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApH9-00000007QT8-05Rc;
	Mon, 20 Oct 2025 12:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iCETLYsFibjq+CsukzViDDTORlacs1ZM9GueRkvBoiQ=; b=NdX3w7kUUi40I3knc1H3016F0j
	Yag6eG4tQ09/7ItC9tkDkRTOL9esr2bm8Q/ox54JUnDMGCdGrWFNvznVSQJm2nHjvlme+o9RwtJaG
	449+bJJqQ7F+DqQRoPrcuK9a7mhGZMDOm3FtAOSgl7Nen101eMV4Bk7ruKrwXTKNXisau5my3ijnl
	KvKnS8P4XLWuinHMB5DWh+JI4fj+uFXM0njHMhpRgZIeyZPsVA8kwlchpyydJZecgGM2VLjs/scFX
	qTxBRI6xSpwtmu9dE06F2qRSa3B7VxOi8IBv+vMe3Li1Bz6j6G7C4TeXNjpG4NU+v18UuE8JzImiV
	W3jLpg3A==;
Received: from [141.76.253.240] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vApGZ-0001AI-NB; Mon, 20 Oct 2025 14:45:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com
Cc: mripard@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Date: Mon, 20 Oct 2025 14:45:34 +0200
Message-ID: <8913609.MhkbZ0Pkbq@phil>
In-Reply-To: <20251016083843.76675-2-andyshrk@163.com>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_134612_326695_D3AB7C07 
X-CRM114-Status: UNSURE (   7.45  )
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

Am Donnerstag, 16. Oktober 2025, 10:38:31 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

But of course I would be really happy if someone with more experience
on general bridges could also take a look.


Heiko



