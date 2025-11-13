Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BA6CD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb9QVWLvQSLjszFx/cD4yNV/N7YJOyJ+nOOkxxmz2SQ=; b=16L85bITpvI+vEYvUk0QKSJ94t
	+WNwkR4SJe2G5Qbwcb0cvZTqRTcLCtrkKSqSfdrndCi7Dw+3U76Kj9hmXZK/oBddN4K2pbSnEuVEJ
	0CgOSiIo6sFo9n6IO6mg8sw7meXvxAY9yohj1lTjhaqvvLEi7oFudgJ8XsQiRysh8V+7JI1r7zWQJ
	CiPlM/P8DYF2cZPtdfpxhtXWQrOvVyUh+U1yOAwg35P+3gpo4S8kOWSxYd+E8rP2bhe2mnGk6QCVc
	M1/6il0gXGAeCSfmV03tq8IT2foZlnFlqkoHXrMWgvWmYr7E4VsIN1Av9UX2OUBHjAeqP9jwLkUk7
	IUdqXTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgNF-0000000BEOk-0kna;
	Thu, 13 Nov 2025 23:05:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgMp-0000000BEBT-1GrQ;
	Thu, 13 Nov 2025 23:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Qb9QVWLvQSLjszFx/cD4yNV/N7YJOyJ+nOOkxxmz2SQ=; b=sSt1Bii9OWPINrJJF8UotjfpPk
	B48T7ehLnvlEcg+eAWlmuo45tUBLAQ5sT060YF7Sckg2vi90GeHOZW6Jdl9TKbD7VLufiERHhetm+
	i7aZWswd5UaiBAcTz690xIcCFhwEosACwY0EhWbx0lYZrvOM/wa55I5BG7oto+oMDzwseRSZe1rP6
	mN5oRyi9q/yHsGaRUNNktfMi1zaMz3EU28AR926TYkVjkmeUKJo8JKIutj+qEbs+hTbdBut5xad+N
	GdB+uUnilwdghAIcNaW3xNp2zHCYpIPtAfRVdPNVk1fx0hfwyet7C/GTF+TaWvQD8/SFKkI7+5m0g
	+arKaUpg==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgMk-0005bo-2s; Fri, 14 Nov 2025 00:04:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/6] arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
Date: Fri, 14 Nov 2025 00:04:21 +0100
Message-ID: <176307502906.495066.9339764118786240746.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251101120010.41729-1-amadeus@jmu.edu.cn>
References: <20251101120010.41729-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150439_347317_EDDDCFAE 
X-CRM114-Status: UNSURE (   8.60  )
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


On Sat, 01 Nov 2025 20:00:05 +0800, Chukun Pan wrote:
> Add missing MMC aliases. Remove the max-frequency property
> from the MMC node, which is already defined in rk3576.dtsi.
> 
> 

Applied, thanks!

[2/6] arm64: dts: rockchip: fixes regulator for 100ASK DshanPi A1
      commit: 0b822c59c826f47dc63d9470b4710bd251266cae
[3/6] arm64: dts: rockchip: fixes ethernet for 100ASK DshanPi A1
      commit: 9c79c9e03547068404cca5139dfea281d655ff90
[4/6] arm64: dts: rockchip: fixes supply for 100ASK DshanPi A1
      commit: 621bb09a76fa12a9e61c9d745ae524db86abf781
[5/6] arm64: dts: rockchip: fixes audio for 100ASK DshanPi A1
      commit: e99d922d37351ddcd6e1d3f4623340db547c8398

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

