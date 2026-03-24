Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6BEFEC0FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nBnkj9tfTuMXhIzz+DGJVWVI0zu+01Vvu5cL1hf+R4=; b=c2TObT8vW4VHvwEpy3zWlDeUO+
	bVzS7EBAre29PcuR5az48sX7/1a3viO/dyjGCYVaT2JSZe010cAk/4hi8Q39NfF0h8nczWz7Xv13K
	nNRAi5RmFYfFnv/POu/f4pCMI6CcMDWnBdOx9jCiZt0QldqXhF4MH1fN+ZcDRvjTdQwZu2U/5YMjH
	/OsYFinO+i5RymRqg0YnTp2v+1OmC8wGrqVROkHNSZVIOdKMmdG4hV73p78yxxtdHrVwPMHZtn7LO
	0np+/g0i7PIvMnUw6XsTSAoU1bA9DXGiQsqWNG3KThOkLUGhES8Bx2RxHfyh8tW1KniiZqInc6fiC
	SI0lVe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pR-00000002B9A-1rI8;
	Tue, 24 Mar 2026 19:54:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pE-00000002B0i-0Rrp;
	Tue, 24 Mar 2026 19:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9nBnkj9tfTuMXhIzz+DGJVWVI0zu+01Vvu5cL1hf+R4=; b=jpPR/w5+QDT69WE/LB7EDTmkVn
	xvQuE1G8RK2io4DmyM8p85uN70mgpvwvel7qm5CHpk50bNHSmLBNxJBnZyFr2NNhG2g9wiMSS/Zs0
	78ks52yvecjAVEFvZfUPrFwFOBdPpmfIcdx+XcWnf8tNGLE+XYhJdQwAuv/7nu5I+RbuhNhTPMLuU
	Ckpn1sCcz9nSFdG4ZNW5bfV+aumGT6BT4MnEiNIyy5skJW9InBXi3o2QrfFzL+0mDUWtBK84buBZx
	uWKb39kzkuiNXC7l7oW9btdK9UhWSr0bDbdnQKx5cHdLAhdrR549NyT7r3mX6GJ4YopC10+AQ7Nt1
	Yem/EVxQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH 0/2] Add SPDIF support to RK3576
Date: Tue, 24 Mar 2026 20:53:55 +0100
Message-ID: <177438200683.818857.15979454514161981065.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_125404_191399_8B9CEEFB 
X-CRM114-Status: GOOD (  10.22  )
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


On Mon, 16 Mar 2026 19:22:59 +0100, Sebastian Reichel wrote:
> Add SPDIF support on RK3576 in preparation for Displayport audio
> support. My expectation is that Mark picks up the DT binding via
> his audio tree and Heiko picks up the DTS via the Rockchip tree.
> 
> 

Applied, thanks!

[2/2] arm64: dts: rockchip: Add SPDIF nodes to RK3576 device tree
      commit: edd3173f3d4424861c1e036b76f0f30b581bb4bc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

