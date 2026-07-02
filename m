Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC8DC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Oq1SCAGAkg/fhNyb4Dij2RBKiVngEznFtGkk+Zdb+s=; b=EtKpWr8x8wP1B6OdMhBNRJijRH
	Ld0jkLu/DoDiV+yL0BPJ1yvTKJXgFbjtBkjl6ExVYZIbJz5gwokaG76R2vfhioOib29Zynd0bmw8P
	k+o67mDBCEyanBq1pBOX0zxG121XL08rEFdJMAXa4DJY2s/Cjj4ZKoJqsKqFpSBfsJv6cXl61DTtR
	N3J9sWBsztLvlzOnfypFuFj5ZNf0F7tIxwESq9ErVaX2WJPai6uqrihwlefaGebZg4G8Udgsg9FZ2
	sQUf/VGCSpHyP+MrMXzGXGp/H115uZ9NUy+VlJwHNMyY0JYtv0Mlv6l1OUQ1s1Jf78HgctV6oeaIu
	poerxRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMin-00000005Jab-43nP;
	Thu, 02 Jul 2026 19:05:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMii-00000005JPr-2tOC;
	Thu, 02 Jul 2026 19:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+Oq1SCAGAkg/fhNyb4Dij2RBKiVngEznFtGkk+Zdb+s=; b=tzVMbT8lbygAzCdhc8BqUypZKW
	yg5nCOEQKKL/33FmiKBzgAXdOW69t7yuWKEAeZuvOQxGhc4h0t8KtVW6L8xoAy00o0/gs1rSUEu4g
	sXuSZOMRd82BzkcYMUqJfi62TLAR9HA3bCtl9Fsvh5uwHBifwuUVIqu+xIUPMxTuXGz/wM7wZRJvU
	kB7TNA8sgRO2KkKf4m4reC97uQJf9O2qMb+0Y2g1JsDWJWYd7aF2fvqavcGvNmq/+gipt39Fdfzih
	8OiCRoIV2EILJapHv+K0LFkNh6jUniCQzxcsTagsPzzf00wFRYSUh2eAYsM9YAvvzmrXEaO6tG7ta
	MNWYj1kA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add HINLINK H28K
Date: Thu,  2 Jul 2026 21:04:49 +0200
Message-ID: <178301901910.3838694.10638773555392224178.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610100006.366963-1-amadeus@jmu.edu.cn>
References: <20260610100006.366963-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120508_757344_4B9B4956 
X-CRM114-Status: GOOD (  11.33  )
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


On Wed, 10 Jun 2026 18:00:04 +0800, Chukun Pan wrote:
> The HINLINK H28K is a dual-gigabit SBC based on the RK3528 SoC.
> 
> There is a version that SeeedStudio distributes called LinkStar-H28K.
> It's no different from the HINLINK H28K. The schematic can be found here:
> 
> https://www.hinlink.cn/wp-content/uploads/2024/03/20240428015024130824.pdf
> https://files.seeedstudio.com/wiki/H28K/Open_source/H28K-SCH.zip
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add HINLINK H28K
      commit: dce1f5a78a4f645ec3fae9b45b1453b989d3fc69
[2/2] arm64: dts: rockchip: Add HINLINK H28K
      commit: 145d4af4b204e1fb565a498c6c8f801525cc0a4e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

