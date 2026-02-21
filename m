Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1B2C624A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 22:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmPg3krCGLYxqdO1s2V7OVlTQkXVv33YeZdELw95jYM=; b=VmNL3FY/sEJOI7FvrH9nLSVMMV
	Vxf1frl3a8ZcYJc9BfAe70kIPeAbO/odiBC9o22sP07YjPOLQFldfN0NWR4NLEltb4uk1cQsArKqo
	RfYqEl3ZCNGm7xn0SIvMkqDlojr35zMI5vbnMJcLtJFbSK5wdEb3Dpd2p9rdwcUGpPSrUdAQIMOzQ
	QZ5tQU376qz/WdD72Y3nL6m07xK/65ppAyUkdhC262cXMePHz4QAQ94YZ/9bD629RwV04Uar2W657
	Bw9htejXZsozIn4Hw8TqQb0meOMS0PJ8AvljFRJqfV9VCvlvWS15WOXJxru7cT+q2rqEDxYdxmdqb
	jbfd051w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtvIv-0000000GLRJ-3Zb1;
	Sat, 21 Feb 2026 22:18:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtvIt-0000000GLQf-3ml6;
	Sat, 21 Feb 2026 22:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wmPg3krCGLYxqdO1s2V7OVlTQkXVv33YeZdELw95jYM=; b=WVQs//KY+NXeAo+Dvue1fb9wQc
	DIsj5/8yTFxBYQJbaM3qvfi25vwvM5BRljDrQp12BKMkC+nTc4hAWsB5UkJiSqoA0HC4WoBqOhPDr
	Wlq0QiUIkOc352X2M0Rwzoe+sTXM0lWC6J0v3wua7o56zEy/o2ay8CXS6VP8OTBdFIeVrESTUsJrI
	b8E9Vq7jmghyeELDjJh4/qjQMsnlun9/CccB75HZnVCvSzGR58GiTLx8EOrxnNjbeBMnsptJA/UMo
	gG8IMpHIBuarUK3B165gmG+FGiU1td1d12W+zqRFpJDXNfErvtsb2vgmsa3LBhWvj8zcgFINiRDuL
	SrKqTYGQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v3 0/5] Add DisplayPort support for rk3576
Date: Sat, 21 Feb 2026 23:17:56 +0100
Message-ID: <177171224758.1745786.7493605269440201268.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_141823_943233_AFBCAC6A 
X-CRM114-Status: GOOD (  12.77  )
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


On Fri, 06 Feb 2026 09:04:10 +0800, Andy Yan wrote:
> The DisplayPort found on RK3576 is very similar to that of RK3588,
> but work in dual pixel mode and support for MST.
> 
> This patch series aims to add basic display output, not include audio
> and MST, which will be the work for the next stage.
> 
> Tested with 2 lane standard DP port and USB-C Alt mode output now.
> For those who want to give it a try, I have a reference branch here[0].
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: rockchip: Add rk3576 DisplayPort
      commit: 3410ab9fbd642e24f21d2fe6db6e995fa14991de
[2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
      commit: 77ae37018a2705f5abe8cc428e3496651258901d
[3/5] drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
      commit: 388bb0899bc9acdb6e4eeaad9eb9dce3427ceca4
[4/5] drm/rockchip: dw_dp: Add DisplayPort support for rk3576
      commit: 70ad4780431e3936e9cb0cf13e286d304b418f94

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

