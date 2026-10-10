Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D10CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ksxmdb4yA1kWZOUC249F66a5/hkdvLmy1j/hlKj2+08=; b=dPz+7sZQ5Z+i4vE3Z7zp9O4SlS
	Mz5D5eWhDYC6sUrj2JCdmwkF1YLfejR70KSQg8RCBBcuxNpGj8Taw9FevxcBnhJQbDDW6QJqnLIJ3
	PQ/HSc3MlRQSZffY6jIItEAGluDMqQHhbjBeV4pX5J1I5lCoZPaM9XoCr8kw+M6doImAVHsAgy2NJ
	P5Xo8eEKGCG/mWbrQGcgbtCdqRgY8Q4D+Va4GW/r1KbuPwNfqlaBORof9hDbjdZv9GmwB4JVHfng/
	x8Hm06tYerXvaj3/OMnR3oZmCO+4bU9xUt1YvsZroT2llgy5AjeRRU3T5qOvVP7K2u8WFmAgwdJY8
	iVhGNfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV29-00000007to4-3TT2;
	Sat, 10 Oct 2026 11:14:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV27-00000007tmg-1fMD;
	Sat, 10 Oct 2026 11:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Ksxmdb4yA1kWZOUC249F66a5/hkdvLmy1j/hlKj2+08=; b=eHpJ7Neiep8sLffC/RolmkM650
	NifNLXRHCMbuWXxfrWJhg1p8V46EVUXMonAw0caFg2iUQTwJq91AmfPIVfNMGKKT6JFCXs8odTH2z
	Y9HcG/z0pGSHqUN/MDgiER0MvhWOg5z1bFWZXStpblSwC8VWBFFwpsUrhKj5O5GrZgxuaq/MoDodu
	6HPfuYiqPcHUWo5bogIGOedwnUWfKE0trBMu0UaSVGAZ0Gk6bxGdTSQLTaoviX8eksi7RpYy6ue0O
	+fWdEBTVl+rSOwpqm/MMzT4PPWKakeczs4sYFTNmDR1hDKQeQqDf8t16m/GRikGVkfwpI+0cKDLov
	F9Y1FGpw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the fan tachometers to Kobol Helios64
Date: Sat, 10 Oct 2026 13:14:10 +0200
Message-ID: <179163084342.3536058.13031584006257921159.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006-helios64-fan-tach-v1-1-1c87e72d42b2@iav.lv>
References: <20261006-helios64-fan-tach-v1-1-1c87e72d42b2@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_041431_494773_E1DA2D47 
X-CRM114-Status: GOOD (  10.97  )
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


On Tue, 06 Oct 2026 07:48:58 +0300, Igor Velkov wrote:
> The tachometer outputs of both fan connectors reach the SoC through
> open-drain buffers, on GPIO4_C5 for P7 and GPIO4_C7 for P6, but the fan
> nodes do not describe them. pwm-fan therefore registers no fan1_input.
> 
> Describe each line as the fan's interrupt. The board pulls both lines
> up, so configure the pins without internal bias.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the fan tachometers to Kobol Helios64
      commit: fc411363b8231315e5260662bac5223636321983

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

