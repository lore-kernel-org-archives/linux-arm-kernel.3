Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FBACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bbLd/ReiMVal7BI3TQK6EkG9qzsmUQTFJ7L4iRvVGQ=; b=NMDjqdCehAmlHqTVXjM+hcqzCC
	lvSvhQwor2YBOSjbM99oMAjz0tABUlN9MEBFCsCdoHqmxYKeTd90g8NFg5YrejYnt0kUfN6vk2anK
	RME9mDwJFxPO7JnM5XQhhYVVktDbHTs0tThv0UcQIgY5/cTGEnrWnCAlOejVq1JzJubyfW19wRZbo
	XhD2/UiIuHOXf/OlQ9S0BCWOLdoHCKb75pn+CHjp9td2zjf0jxy9ynhsazvb7T8//jByk+sq2JivB
	DJhe5yly8NNlHA9badEQNUIi9OeFcfbg4ZkY+m95ktoiQULy5Qsgcm5J8Vxj4RNAR8mJdpl7PY8aI
	jjABNI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEPd-00000004Cgi-1IFK;
	Wed, 27 May 2026 13:35:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEPa-00000004Cfz-1QrQ;
	Wed, 27 May 2026 13:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7bbLd/ReiMVal7BI3TQK6EkG9qzsmUQTFJ7L4iRvVGQ=; b=Q0uEJmSC2jorPw/8uLKDtgqIft
	zOgIaT7DfctgL3B+ol+wNUa8zWAEcEOn5hhJqktN64wvxF4qgG3Ns9PylFEd7sN71wq4MgZJfMPyJ
	lpbu8lfei6JrSi7lVJn3R1M6b7HrRs2HU/ZMfabpTSqDyygO2NUhzjyVzztiY5K/8yC/5HMue/2Ej
	N8GUNcyGSmQmgvGlkmabT2y8T/NBIt1H5yOLjXPxFGerCwhwfuv3Uyi3yk7YXsktvmP9zJ/kXFcOc
	HPzqJdpulAQYuFzulBcEWHwTD1Q0VeoVG1OfPLf8h7YWbRpYCiNaJ+rBTF4MIwFZo1sBWK0xx9I/C
	N9iP95xA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	nicolas@ndufresne.ca,
	sebastian.reichel@collabora.com,
	m.tretter@pengutronix.de,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: (subset) [PATCH v7 00/28] media: platform: rga: Add RGA3 support
Date: Wed, 27 May 2026 15:34:55 +0200
Message-ID: <177988888078.3803653.9229622993223830333.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_063506_485483_CCC4346C 
X-CRM114-Status: GOOD (  10.31  )
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


On Thu, 21 May 2026 00:44:05 +0200, Sven Püschel wrote:
> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> peripheral, which is included in the RK3588 SoC. The RK3588
> contains one RGA2-Enhanced core (which is already implemented by the
> rockchip rga driver) and two independent RGA3 cores. They feature
> a similar functionality of scaling, cropping and rotating of up to two input
> images into one output image. Key differences of the RGA3 are:
> 
> [...]

Applied, thanks!

[28/28] arm64: dts: rockchip: add rga3 dt nodes
        commit: 25ee898961a2c661e4cd72bc98f0060f1cd11222

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

