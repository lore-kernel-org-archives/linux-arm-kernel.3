Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58304C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O2GEQZPczO3qpUD8v8+5WOVBoh1pvPM9twx2k6GZy0=; b=Je1h0drGXLk4qBv9czWVWv1x3a
	p7hyjEuuiUjZouqO3qjU9GQ+I7Qv+Bjlb/T/smFu0QoxMae+G/pcsNdVFW6UuesAoufirjrRqvCXz
	EyXkRhl8LK5lE8EGoNiD+aZLheJTBWRMISMkkouc6NSSeaC1zFaNe33RY8B4Q6qzzAr+je4UcZR8p
	2oS7Zas3fUEQoxOyWAElJMv4Axh+47I9YIbSYdYQ7NfPoswpnSnVVqhwOkQjfwC4vHqdQksJ6WCbj
	Nnejzsvg+D4O0pbxbEd7FdV9ydjxPbWtkRx/O51tYx7FOkfHjCR97pLHpzgUxkDJznO6QXut/hsLf
	y+AEJjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSdn-0000000DvlV-244U;
	Tue, 20 May 2025 19:28:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSLh-0000000DtfO-2npW;
	Tue, 20 May 2025 19:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/O2GEQZPczO3qpUD8v8+5WOVBoh1pvPM9twx2k6GZy0=; b=HSiHYHx4r9iqZJiOo8GxDZREQT
	TMsOuR+9VyrdruhHYd7Eu7xfCyTEPiWYoxlsT9hVqNDl8nGLNC1soUGu1xcbOQvM79RXRQrEYrTUt
	fm/PTTYCj//iE42lpPCBOPTDeQQ4cPUTpd7RBi4i4FXOm7Z8mu5wd4sAnx0pUx+j6kvQqk2jTZEFR
	5R8zLTDtSVLkAlmR7GGK6wwbgBD/XvV0g7vUUlUhPvTDcFokb6KBVsuVsfSCfDCTjTYXAUeaineAn
	oxwM4Zet8vevjVBuhYHAn5Y0YQ7t1jn7HRfx04i0SfsaxcLFfB0Xwzd1bslVQH9kIKODEz7k3j3MN
	etJvbvWg==;
Received: from [61.8.146.112] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHSLc-0004fK-K7; Tue, 20 May 2025 21:09:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588
Date: Tue, 20 May 2025 21:09:44 +0200
Message-ID: <174776817931.2879626.2353360288998148542.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101909.62754-1-didi.debian@cknow.org>
References: <20250519101909.62754-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_121001_711027_31F20601 
X-CRM114-Status: GOOD (  13.43  )
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


On Mon, 19 May 2025 12:18:28 +0200, Diederik de Haas wrote:
> The assigned-clocks and assigned-clock-rates properties were moved from
> the scmi_clk node onto cpu nodes in commit
> 87810bda8a84 ("arm64: dts: rockchip: Fix SCMI assigned clocks on rk3588s")
> 
> During review of v1 of that patch set, the following comment was made:
> 
>   why aren't you using OPP tables to define CPU frequencies.
>   Assigned-clocks looks like a temporary hack because you haven't
>   done proper OPP tables.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588
      commit: 6e0f32da68fac556327666f8f81dfae7405d1c25

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

