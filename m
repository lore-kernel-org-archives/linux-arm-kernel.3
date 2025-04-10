Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40265C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZn/B883RgMsLPIID5LgMtmDe9bGTls7z1CICv6lcL8=; b=kuT3nw76jBO56q79/eApcIKFlF
	aH1XRKblPgK/BiL812LxYa3WVKkSaum6MkDQQT7OFVS1XjlIPBwZLP+cdTbzkQVWKpHDctjtLNYtp
	OsLrSqueR9YRaOFqy/woY7W2RMFf40P5mCUc1tiVXKpUMUfcEo2JmTVtOG06z8bm1CT88JULYS0s3
	LPpsQJ1YbGJ4/3bXjlUWbJZFBr+IdZdtJAZG2Kq9yCFW+uru4QxgyYFBf5jJeNgGag0LD9q9tRKJ5
	D0SKEa8X3TdHKRg5Ny3l/yGZvdRzwHJNo2mbhyeKj0jFyBwAuEMYEMdqSEnYXAkdnFrbcu5675aUf
	JOp+txbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u6s-0000000B4fw-0ImZ;
	Thu, 10 Apr 2025 15:46:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tGt-0000000Auhv-2UE0;
	Thu, 10 Apr 2025 14:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yZn/B883RgMsLPIID5LgMtmDe9bGTls7z1CICv6lcL8=; b=l5re606NcoT9rQ16OVwhTiRvWH
	8XTByoVQxqz8+A6twXqlLlyFjLHQftHc8VdXa+Qmcvwjn/iHyAXxN+9hN1HwhiLXr6pMJ806Hv1Bw
	0LJI5OtMlA7HRe4WSnzpVPg5TrgEOy4S3DjuPmHTED/sY17AmTJ7ote25xJuyNmiPZNxdELKT9aS2
	GsBbWWCh/VQHpwqn8Hp4JIKghzaTJxGDKN6bEXKwPJxotlROEQI91PWrGVScIPV6AqxEPc+AV8OX4
	e3yFDu9xVFaSOLbUDzHpYixc7snv1PbihmoIbO4GJnaoe+hL3rt1I8RtUgsLJbZdDkt4N2Q25eUS4
	D+dA30lA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGg-00012N-PM; Thu, 10 Apr 2025 16:52:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
Date: Thu, 10 Apr 2025 16:52:23 +0200
Message-ID: <174429674412.910874.12215629980197538006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250401090009.733771-2-amadeus@jmu.edu.cn>
References: <20250401090009.733771-1-amadeus@jmu.edu.cn> <20250401090009.733771-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_075251_630442_3116A4F9 
X-CRM114-Status: UNSURE (   9.28  )
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


On Tue, 01 Apr 2025 17:00:09 +0800, Chukun Pan wrote:
> 0x0 to 0xf0000000 are SDRAM memory areas where 0x10f000 is located.
> So move the SHMEM memory of arm_scmi to the reserved memory node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
      commit: 8ecd096d018be8a6bd3bd930f3a41a85db66a67d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

