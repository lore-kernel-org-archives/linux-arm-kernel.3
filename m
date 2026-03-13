Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192A7107BCD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKgNDhaBbbTv/+y1AavDqvCj/t0nPjX4gBTDUg9TX6c=; b=0EaSOPy0jdI75eTZTy/MRBIncP
	2+iRIoo7WGRWfH3SffHs8WNwEUkTUzv9L6x9K0YL1DlCNhrDbz+K6RT0FVQ4BXleUgkKfpKEE2Qlv
	CGOgYm3nYYZj1c83IW3JQL2v9LuCG8/0cqJdwjtzlULDV34PUS3aECwZkM3xMhesnnvyaVByc+kzE
	h/ZBLTSyFYxzqqj1Q8tIC+8IPpygEeaNq1xlwqBcWJy1rjdIxvh6asWoFBhY71NxtDgmRWbxH9vzL
	p6mm+LFnv0TQydIHWXsQSpOTSUtsMuMEUCek2AsO5sZA79wN6D1Ad15z4WjPHxmZtxaWCr8/XicvW
	jLEltJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w176x-00000000t5L-2OIh;
	Fri, 13 Mar 2026 18:19:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w176v-00000000t3k-0Jtt;
	Fri, 13 Mar 2026 18:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HKgNDhaBbbTv/+y1AavDqvCj/t0nPjX4gBTDUg9TX6c=; b=HlmU1vlo3KIO02qMTLyo611JUA
	GuevmmkW1ZLGjpkbUIKBW/wYpXY4r4MU3RopnV9wal8pRzJkJxYE3kl0UdiI7Gb2dgvITJ25JwOeX
	zr+GJp0GJ2RHEXmlIqbjhv4ZjQfgEMmAeX4PTYKceOjmSzS1zTopO57NDwvwNSidPy0Jx6s32O3n5
	pWl/9HjA85xY6KDyM9j1DraGCE6HZr24XhznLXOxhWaDgripj7ovjc3Bz4mkH03HBzXR8zmjK+JWX
	EQgsCzncfzBMK58BSRm5pw5up7l6joAi+svisTOFsMD2xv6KZvwHvq9EgKVx5jFvi8FYDT3AF0VMj
	vTzCcdYw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io
 expander
Date: Fri, 13 Mar 2026 19:19:39 +0100
Message-ID: <6246776.lOV4Wx5bFT@phil>
In-Reply-To: <20260313-wv-io-expander-vicap-v1-1-11001fb3b744@collabora.com>
References: <20260313-wv-io-expander-vicap-v1-1-11001fb3b744@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_111945_133110_42EE94E5 
X-CRM114-Status: UNSURE (   9.61  )
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

Am Freitag, 13. M=C3=A4rz 2026, 16:53:29 Mitteleurop=C3=A4ische Normalzeit =
schrieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
> is broken out to the PF5 mainboard expansion header.
> Enable it in the device tree overlay for the WolfVision PF5 IO
> Expander board.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

The From should match the first Signed-off-by line.

All later Signed-off-bys are from "other" people handling the patch,
i.e. that other Michael Riesch ;-)

> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>


Heiko



