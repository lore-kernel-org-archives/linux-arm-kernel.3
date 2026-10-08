Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5799ACA6012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHpzv6iAx3FY+i4Ey0PY1RHcS/I7ApyfzhqLqWfAGOY=; b=cLOnBBpmZz6L7GgY+QkYmEBztJ
	SeoBrSOvL2u1bixG/NjpXQ/XzRmstbD9wJY+Sc++iflbXpceTokVErYi/BJMYT0I+l6U8zOZlmaMj
	2Vv/yaDdC+gnV+QL5f0s1nJGjCdQbIBv+N++EpjKdy1wUNhfaiBWrk8uFATHu0uD5aEaZPBFYJI5i
	chWVJUkS3NsS9xJYlHdGsjRA4ITuTbEp1aJWabxsRC2tKMRjD5IGsajaJh5daQO7qr1l3IHeAiTo9
	D2L5NcKQUHaMgckve4rWoz/5TtQpK/+8l6rKCUl04QOzKc/LZ1MueX7MqoG7irq1/TXrZEpHX5Xp6
	FrGj8r7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpnC-00000004aeB-2zLD;
	Thu, 08 Oct 2026 15:12:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpn9-00000004adF-30Vk;
	Thu, 08 Oct 2026 15:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vHpzv6iAx3FY+i4Ey0PY1RHcS/I7ApyfzhqLqWfAGOY=; b=Ch6IyZgKlEU0gTStzX8o3mvkYX
	ZnFzoheKscaDqzQ0XsbGFK8M0tbsMJbzj1AWxBVYyt+APc+k60NaUiklWo186+ETVUXpcdBrDFSGg
	yY3NpoVhuagYGmZIt9AZMnfBMevJXT/g5bn+a1j919jX/Uaa2twRkYpf7QVqALfOIcyh3RQ7M5OqT
	fVjzWC5hn+X/fbhvNlb+dPWUL4NnF+omS4K1vl62NG0gzEeqJMEU/1M0iR23KPyeCXayHT2EqvTaz
	9wQ4F9mvEVFUJnBiKaoQNpZSsE/GC8uOF9PKWlS6T6hFO0xxsVH+w6+MHOEeonOPKrhUN1xatIvvv
	tma/MDcw==;
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
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: fix adc button voltage on Radxa E52C
Date: Thu,  8 Oct 2026 17:12:02 +0200
Message-ID: <179147232048.3420474.12269525015262029428.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
References: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_081219_942437_2895E951 
X-CRM114-Status: UNSURE (   7.38  )
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


On Sat, 08 Aug 2026 18:00:00 +0800, Chukun Pan wrote:
> The ADC button voltage should be around 1.8 V, not 18 mV.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: fix adc button voltage on Radxa E52C
      commit: 682baba589548b8f8df05e0a330b2ad2b8ada3e3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

