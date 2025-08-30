Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A917CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyeksMM363Muy7eoR4PZwic5CrAi696wMNmLIRYM+CY=; b=x0FoTfQ5p6Ms4tmIsJQdbmRLMq
	dO7LsEVOUSzxVozexcUW1KMCahsfbRT2atcD0IkghQ2NxpRgjTsJhP45g25AK4NtUcIAYSjL8Jfev
	5IShJFwwJXx/d/ur5eeH2URqRVvJAxuUFd9kSFVNo7bkEC5LTSkpLHu03vsM55tWrqF3SFnNe8d9U
	AqHwtNEyDQiGsoAa20oecrUyEDKNhGsPtGvYTO9ij6IaOSsrYgh1akdW0xlEoEEg2oyvqWOyIria5
	6DYh7B173y00n3ZpuGF/LVSg/nCpvgjHq6Inb68eWqUUdEn3nLe4cfSlBHt4S/+quGac5eTvAfsXw
	7VanTMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLNz-00000007unZ-3OgZ;
	Sat, 30 Aug 2025 13:12:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usL9i-00000007t2I-0Mfy;
	Sat, 30 Aug 2025 12:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cyeksMM363Muy7eoR4PZwic5CrAi696wMNmLIRYM+CY=; b=IgkJzNwoqvOdFKPjReSFGp06ik
	++yGvp7odhI7g+JD6FIgkhG0CIac09VbfKOD+gAcfAr2wi/Ok11FScytffpOhFkInA/VZ81D1QOMg
	XV6jCz84xbBIKdfi/cLMvMHQEFaDCiaQ/u8Tevs5DRMb49iw/x4ZsddCILbyR6JnIg1ka/QMtowzO
	4Vb4pN0UaUfQXfLHnEklWQThM8NP6THuyt29M8Y37aRtQVScqodjvyGO+VdIfX5315+t5G9XU/187
	rkbSdtJxnxQE91fiPfQVToAtNFRmFCi9ee7fNSlC2oZXdfTUNmLBmA8NUjtfQQk2ZeEh41YDMVix6
	tkubLmCA==;
Received: from [77.241.232.9] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usL9f-0007bC-IA; Sat, 30 Aug 2025 14:58:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Hewitt <christianshewitt@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] ARM: dts: rockchip: add CEC pinctrl to rk3288-miqi
Date: Sat, 30 Aug 2025 14:57:54 +0200
Message-ID: <175655867259.3578496.5154920723858883845.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250828165421.3829740-1-christianshewitt@gmail.com>
References: <20250828165421.3829740-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_055806_137485_4D063573 
X-CRM114-Status: UNSURE (   9.93  )
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


On Thu, 28 Aug 2025 16:54:21 +0000, Christian Hewitt wrote:
> Enable CEC control on the HDMI port for MiQi.
> 
> 

Applied, thanks!

[1/1] ARM: dts: rockchip: add CEC pinctrl to rk3288-miqi
      commit: 2850f6f1ecf2a42c6ae7a6d55874c9eb17eeb622

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

