Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3817C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PECLFrwCRzXjctoZGg6pPonND+ApxV55wwv45R2Kk/E=; b=sExovDlb+TFRByxh7iqx7N8Toc
	STG1NoMM/NGVgrwXZNSBnhYXosx+ouePDow4SR4kW1pUk1joQhrWCB4oT4cpGPNqN2IzxxqRAvL+/
	ANRV0dJfxFKZdaQP/YGSCV3LHCDZu4Tyx+BMcbVrrZLi7YiuR3sUwtsuNkAtSW6dWzPV2VyM0uDRC
	HXgbz1ILO71sJz2QMScvXN/5+rMIWdaxDc6aqLr27bqkdgpT3dD01VH3UjHP4Qife8R6JCuINc4pX
	MUPUDFW+8BFQUzIc8gWP1a5ZNwvBLX2+x/RzsKXSWBg0jSpUjRuYE77PykUo+jk2e2JbFmb3RaNfS
	JSsDAIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubddM-00000004uyj-29ex;
	Tue, 15 Jul 2025 11:15:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdWu-00000004uAq-3zDZ;
	Tue, 15 Jul 2025 11:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PECLFrwCRzXjctoZGg6pPonND+ApxV55wwv45R2Kk/E=; b=mrZIiswgEdrJK23nhmmNdl07gy
	LsxjH9aVBouzhKSC8PyL1SOxB2E6TKrs4YO+0CN810+5EsMSt7hcFyu7Tje26slFox1ez8ln9IaEb
	53jyV2r3wS/kVlzopZF5bBBq7+Btxwi1Risvy3V1EpQxCnq/BBDQs+OKhF+QjjE9fs8r3L38OtJUJ
	BlZL1o8W1qBCS2VaWKgFZNpvbK0Q/9fXw0td+ZyPOsfKFN3gvWZwn20Q3mzXBslwPNSXJZc430hWC
	+lMHe0d7IKKH5NRqZNp1UNBFfU6vSBb7Ryr66dA/E+E7f/xryAGHomJO7cSsZ5+fFdA3ESo+0wjD6
	BvXzMc+w==;
Received: from [194.95.143.137] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubdWq-0000O7-KR; Tue, 15 Jul 2025 13:08:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add rtc0 alias for NanoPi R5S + R5C
Date: Tue, 15 Jul 2025 13:08:44 +0200
Message-ID: <175257771275.2527819.17809492107036436712.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250713161723.270963-1-didi.debian@cknow.org>
References: <20250713161723.270963-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_040900_989226_5C4FBD4B 
X-CRM114-Status: GOOD (  15.50  )
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


On Sun, 13 Jul 2025 18:16:36 +0200, Diederik de Haas wrote:
> The RTC_HCTOSYS_DEVICE module defaults to rtc0 and should (highly)
> preferable be assigned to a battery backed RTC module as it is used to
> (re)initialize the system clock.
> 
> The R5S and R5C have a connector for a RTC battery which is used by
> HYM8563 RTC. Both devices also have another RTC from the rk809 PMIC.
> To make sure the HYM8563 is always assigned rtc0, add an alias for it.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add rtc0 alias for NanoPi R5S + R5C
      commit: a2df3aead3e023857330a803c664ee97a7bd9b97

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

