Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B7C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe2Uiqklm0XdQU3ppK07d6zd7UkELYQebN6R6LnbmaY=; b=TX8ChGxfTLWV8623yb/09uAOkQ
	+BIdtFI+Pkhkj/9/kW3N1j7ymUTWIhlJT0+kn1+a+1KDFgAUsw9di/OnlZkjRaU1CQB+ysLdTpL7J
	+1Vy7pvsU3MADyCH8ve8DrfPBN74Y74Cxt2B297vEPGw2AMWUIDxj9rtsSy7IRpUQf3RlqmOZzzFR
	/MYAB34tmKNhqGgi9lLtO/S2bpKjvoSO4NEJeRqAXzMh5cvCoJHHdIB3yqe2mQn8+wzHkHln4Wgx1
	ginM+7P8OqcJKIzi6VYpN5aUaKDzyX19FW7SnckATLNRutnKOtS+g9UFTj3ndZYAEsaY1XMAcE322
	eH7kZAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNZl-00000006o7l-13Hk;
	Mon, 11 Aug 2025 08:08:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKR-00000006lIv-3bTP;
	Mon, 11 Aug 2025 07:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qe2Uiqklm0XdQU3ppK07d6zd7UkELYQebN6R6LnbmaY=; b=s7UJ8GDO2Nro8PG7wP48KSllY8
	626sRDJXNvHdKXZwXmm51nDDbFg9oG2s66kpk/SGt87LWGGU6CBY5sDHxH65vD6HPzOw4607NLJGz
	vJgYcG/ekDpMcXZ2gjHBh9TVM8GVeEsqrArwNEtbrOgrR57FEujyiQdOwpYy6LT0jJA8937eB02W9
	yUChZTmotqNEGZG46BjRRVNG6PTIy/zCvPvhRBPnYpoM5IaqUW+bO+DCxK+WeShGoZHzqAXvcV3+z
	xUz40IL2xYfy4tnbhDWYuWUuavNyePIHN9MTKr/ouzQMyA/u7QgnkCKX5QHpaNair4uwiG8BrzcmR
	pdank1qg==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulNKK-0007Ro-Dt; Mon, 11 Aug 2025 09:52:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] arm64: dts: rockchip: disable display subsystem for Radxa E52C
Date: Mon, 11 Aug 2025 09:52:00 +0200
Message-ID: <175489870461.808197.2395932631261103539.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250810100020.445053-1-amadeus@jmu.edu.cn>
References: <20250810100020.445053-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005223_894682_49F055E7 
X-CRM114-Status: UNSURE (   9.59  )
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


On Sun, 10 Aug 2025 18:00:18 +0800, Chukun Pan wrote:
> The Radxa E52C SBC do not have HDMI output, so disable
> the display subsystem.
> 
> 

Applied, thanks!

[2/3] arm64: dts: rockchip: mark eeprom as read-only for Radxa E52C
      commit: f18c9e79bbe65627805fff6aac3ea96b6b55b53d
[3/3] arm64: dts: rockchip: improve LED config for for Radxa E52C
      commit: 6f36b1fdb80dd1fdd24742af4ca435f76f73dfe9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

