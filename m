Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ij1iSA9fklslnNcgneWEKunccclcxZxRrXNrqVXuxo=; b=eAJBel5Ch0sLn94tlDL21dqMCx
	k5eyfkIAccYlwyHqmGx2eAVhl+kajeBjh8ssbJtrNQ6K+lJPkCqvnSyV9Ss/nnRzI8lUwBMXXPOfs
	630TPOwPAjDXl6TUFCXXcssDJqhqL4bMBepngiwbsRgu40qnMrx9NcBA0c26cRoNE6NDfJ/DrfngU
	8gSqXikme3F28qlspLYn6/nfVgCPUrCAhHlriHFlyllx5yl7gq1y5LCkFjP2nfqYC6xRSAE8jE+Wk
	6169xuFW+ndvoda0uIPOYxJCKSbtxgakWqoni3u9dou1tNSBcQNKAAu1hKcR4s6keKw6fR3GcKR4o
	t+1GX3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBj9-0000000Fnmn-0dHI;
	Tue, 07 Jul 2026 19:45:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBim-0000000FnOX-0P7F;
	Tue, 07 Jul 2026 19:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9ij1iSA9fklslnNcgneWEKunccclcxZxRrXNrqVXuxo=; b=QlaTUEzWqoph4tNYXOWo/S/OP4
	huKUpcksH82KeEOGVOr5gtkikchYjdGQSuuoJgJqm768E/zH390u5xJF7rQrhC2Eeocmp1ZNOy+gB
	um5IukqbyaskBRC2xcnxE1jC2fcIdqApAeiR9wgWXtIKoU+Iibl1/ddQEtC7U6z6Tv9TobFAYU9Ao
	UAXJYiAs6gPWabnOQctuHkXOn2GmxWgwDWLvWUMUW3xvcAYd5BoV5x4rO8BKka5EpgBHildVcXm4d
	ChG2A0QJbNNWEhZAH7T63hqesyzkDuQHiaUGP2SBVVz7LKIpkYZvPTXLH4fFXmmP+hsDOElD7vsl6
	H3o+Gbrw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Petry <petry103@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Vsevolod Kozlov <zaba@mm.st>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fan speed control for FriendlyELEC CM3588 NAS
Date: Tue,  7 Jul 2026 21:44:34 +0200
Message-ID: <178345345844.664858.3572226528191999006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <akkAvJap-MtbKp8B@Vsevolods-MacBook-Pro.local>
References: <akkAvJap-MtbKp8B@Vsevolods-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_124444_141213_FD5B318A 
X-CRM114-Status: UNSURE (   9.55  )
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


On Sat, 04 Jul 2026 15:46:52 +0300, Vsevolod Kozlov wrote:
> The FriendlyELEC CM3588 NAS kit is often supplied with a case and a fan.
> Enable control of the speed of the fan using the trip points and cooling
> maps from rk3588-nanopc-t6.dtsi as a reference.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: fan speed control for FriendlyELEC CM3588 NAS
      commit: 2035369f672fed6ec8430e8876de38b2f5d3f7c1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

