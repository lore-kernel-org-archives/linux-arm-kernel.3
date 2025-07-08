Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576ACC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQuPrMl4qmbsQGIYF0VFRtd+Ry1sum32/xnLjEzzRFg=; b=qx4esYJWoWQZaKoNF9K6FQo5yU
	l4i/5ZrMd6gZ8KfPSK22McNNhPRB0AaoPMasy4kSe1Wes6Yn89jA+R43v2FopKOwYlNHb3Q9B5cYZ
	PYW1QemEepPHJrQ0/54qxSIaMbHKX6hg90MHWutrNR57BQc6Uij4jwsqhJUsk0UuUF6oem67GeCBB
	4kughuheQr+G+yQVEA0CdIbIphC+wBk1Di7hiRnj9sVeQjsLk1ylerokNuAqgBcfIIDHCOMpj20yX
	xiMftAelOYUi6wtF84O/TZEVAFpelwXloOK+slDqmBJnGnlLFk4bLNyHl6BwWNSVd0fDMTXkfzdGl
	Et3YUQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAI-00000006Mv7-31kL;
	Tue, 08 Jul 2025 19:39:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCER-000000068FY-3j4N;
	Tue, 08 Jul 2025 17:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UQuPrMl4qmbsQGIYF0VFRtd+Ry1sum32/xnLjEzzRFg=; b=rOI+tKZ8VknhFHMHWZsVpEboib
	SNeTsRDc0LpEf3PK4ppXB7bZtoeFf6vwFomrs3ikjIojODKr78grDWsUDjBUvq6h3lF4IzkbNz0cr
	gsh/1zI8dJ5LCfHk04YeMqWrLU4ReFQn9vOx4FWlJ3XFu0a4sZPSznkt2KdqsHQ/qfYDO6Hum/PjV
	KYfbCgLRDp9OdbvpymHn6CDgDfAqdVybFgWhA18EHJB+aLGA4uIOEwyran+uIDwls+NiXc83ohVZJ
	bnwEogr8vEmt+hjrqm48nZoaQxEgX5ydKxXVPHQ5ySsweuDB2aSu7zxsf12EkTu1u2dc4Eew7mBWo
	RsYj/ijw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCEO-00000008lh9-1mb6;
	Tue, 08 Jul 2025 17:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UQuPrMl4qmbsQGIYF0VFRtd+Ry1sum32/xnLjEzzRFg=; b=G/qoFhT9pYQEzuVrsyhoFiGJwq
	wxsivWG0AwDsw7VnOYFtSvVLThLZ+54dF99VqMaA5cxZFSQDShF4Tgt7bNG6B0dQohOo+0jOvV0rB
	i1o0ZSor4GIR7PEElnBAYtOS5QERcnwm50OTJP95OBEeCYIhJwp8OeIIGJtDPBlDK6tO4Q7qzdyAV
	rUVZWVovUFOLl4JgAEAWRVDizxGpY8odH2Ef4k+PA165yno0Nq0ko3BC3xWZ1ktvnOjWfZx3djLFU
	XQsUK6k6/c/+eDldJR3BtCDmknjwHfxmsDHy0Qa+l+9tx3mPRzikfhIr4IDuwTCD1XaLs7Hz06Tjd
	OR+cY02g==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZCE7-0005cC-SZ; Tue, 08 Jul 2025 19:35:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	long.yunjian@zte.com.cn
Cc: Heiko Stuebner <heiko@sntech.de>,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn,
	ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] drm/rockchip: Use dev_err_probe() to simplify code
Date: Tue,  8 Jul 2025 19:35:17 +0200
Message-ID: <175199006059.1731917.11035979004712647883.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
References: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183549_253960_D426B950 
X-CRM114-Status: UNSURE (   9.98  )
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


On Thu, 15 May 2025 20:35:54 +0800, long.yunjian@zte.com.cn wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Use dev_err_probe() to simplify code
      commit: 52008d6fe7fa84ecf23864c5cc373beb085f30b9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

