Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A461AD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smipNdqhzJnF+g6Gddp85s4y2D/OwlJ5ZxuyrObg2lk=; b=Q68tw9ReOgGo+8/8SXurWS9lBh
	Fw+JsqXVVwxWR6CM5GBlxG11DYEVIFvWm86HYq8hoP5xBQ3JZCmPR5c325Rek8CrwD60tukw/Cw15
	LqerJyxRHo2fxWZZ7dpx9JrKUY0B87Q1jgSsybyLq9zYAOsZT1m9fnniF4qAay1UY/3RtSQQsaYRg
	EMFNmM8ihPnlYiCD7+3vo8j67QFxVEDtI/J4SUMa17to2tCNmdc/W0yqVWNcAhF9cBNbljQxJxNL9
	mI+ebYjIFBzoruptZYe2p/8qQxdj3NAR5ed460jnsFbMhm772BmLURMWX5WTVfJwcnTJcIuAwOjoj
	sqMnAiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8pA-00000003bv9-3O6Q;
	Tue, 20 Jan 2026 10:19:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8p9-00000003buB-1sIn;
	Tue, 20 Jan 2026 10:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=smipNdqhzJnF+g6Gddp85s4y2D/OwlJ5ZxuyrObg2lk=; b=az07Q9ZGIiqIaCTT2m1pHRV6w5
	y9U4YU8TBOCmovZinPXUcI6tv4NUW4IB8glFSItgdVlDTAHtY4fUWBtsqiAzLdKMM5gSiQIynUdW7
	jQivHx/lpcQmz3a4Lc5Alw0TogFZYGft2/4xsX/NwpWZA3uFKkh4kMmVFx1+2YkUqn+hjFvuwVhqC
	FlAmvnRIFaBNzZ5NxqefuvolWua7nvjheNtzg61YwUNn6oJv8Jz+pQnLn1EGsnWidJL10upbz42r7
	Z2xTW2u/WMo8J0PtxF0LDuchNHqGWzZaiX58cFpv6vb72HLMy65dRJM/iMJPxYN2fUQDyYsR7SpE9
	+aMKm85A==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8p6-0000000Dmvy-33zd;
	Tue, 20 Jan 2026 10:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=smipNdqhzJnF+g6Gddp85s4y2D/OwlJ5ZxuyrObg2lk=; b=tGCCTTBwS6v2WF8g5pz+A1eker
	Ov9EN2OdZMYm4IS0IwCTNTJuXFyYnZUFMmczXfRfh/A5EsvcD8Ash+yc4VppDt0Sq5gPtvkPQ7kNF
	cDiRLUjC0GHAYqSxxEkYPcvKJDZTfACHHp3VCH68iTAj+iYj1GjYR4+mSBpFCE4N6iYr1xR4EKkp6
	QlO+gXYLLtEM+Kn90QBnD9lqVsdh1F3vVdB+cRFxrOfNFMxwpF94DFfUk7o4LxQ5D7XoCVAz3Lxhy
	R/h6d8KnAtiRkDdn3lq5ZkhnAZmw5aJRagScX+JT7zBx56EciIDMsepbOjdUBvUUsh9cyKBG9wuIN
	Z9b9S9Eg==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi8oq-003MG3-Gz; Tue, 20 Jan 2026 11:18:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Tue, 20 Jan 2026 11:18:36 +0100
Message-ID: <176890429956.373062.16944190406218992913.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260117020738.294825-1-andyshrk@163.com>
References: <20260117020738.294825-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_101856_880969_6845C9F8 
X-CRM114-Status: GOOD (  11.28  )
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


On Sat, 17 Jan 2026 10:07:30 +0800, Andy Yan wrote:
> The different Video Ports support different maximum resolutions.
> Reject resolutions that are not supported by a specific VP.
> 
> Only the output width is checked because the hardware itself does
> not have a hard output height limit.
> 
> Filter the mode that can't output by the VP/crtc.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Add mode valid callback for crtc
      commit: 88b14b9279d824dd84bdda20c7b2fdb4b285dd25

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

