Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1C5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD5pkChFnmWgrszF5d2TZFlBk0vyaVCC45Ph73rxnSg=; b=Oh/6tck1DzK7citXWBVrGOTuZZ
	vSrYHDXrMHTLyHx/xZQ3wShUL9niqJQcDSMccvNx0J8KJL9++7qSRL+eNnIIcOBVx+WlYEZdEoM9b
	cC89HvkMhfHLlJmHwJBGHnPtVu4Hjf+8Vv3NhmCOklAnoNaOAdgzQAsTrcAxvkAuNvISdXRi7XnyV
	fQ/58TEuk/61cxc5Y4/sqt/C5ba3haxkHueVRH69uYSwR6iKotif52xI1x6EQK1LBToFrjKzJT+wI
	i1aY+QA/b4v+GxZq5Oo8P5BzKNlCTXdQATjt0n1g1tt8OzZq7HTpWm7Ecyf8zUa+ujBcvCdxx0CrR
	ekhif9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gv2-0000000GmCO-0rB3;
	Mon, 07 Apr 2025 07:29:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gjz-0000000GiQl-2Wap;
	Mon, 07 Apr 2025 07:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CD5pkChFnmWgrszF5d2TZFlBk0vyaVCC45Ph73rxnSg=; b=uEPwYIy5GXqjN4brgbrRj+p1ct
	URMzK34Yqnbi99ZeTq6NdHSwvBZbaNh4Q+3KIcfDSZbwmqeEXHvc/9JG5ANAusPVWKgkUTnz3ibzw
	K52w/opAnmJb9rJk0pmH/OeNbddbo99JJdk5M2EmNRuAIVs0nWVUpKBuQuw0exmxW7zppZMKhg659
	kqF63IZ7DNDPxkRj5gjbSYZqLhbIIZElAjU3yOmIRGQt9ABqciG8hvYbsCebo6jcYzhX/ApD2tqjb
	5j2Wap+CpklXuFw9VwzLbKO7VTK1wRrdvMOXdVFBONkvhZV2J/ysQnKBrSNkQHW0aAGz6Jyp1xWCx
	OREEDvpA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjw-0000tP-I4; Mon, 07 Apr 2025 09:17:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: enable HDMI audio on RK3588 Jaguar and RK3588 Tiger Haikou
Date: Mon,  7 Apr 2025 09:17:42 +0200
Message-ID: <174401024399.372530.2324362238627427658.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317-tsd-rk3588-hdmi-audio-v1-0-0b8ceb9597a6@cherry.de>
References: <20250317-tsd-rk3588-hdmi-audio-v1-0-0b8ceb9597a6@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001755_638269_571F6FAB 
X-CRM114-Status: GOOD (  11.28  )
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


On Mon, 17 Mar 2025 13:07:25 +0100, Quentin Schulz wrote:
> Both have an HDMI TX port and can carry audio, therefore let's simply
> enable the nodes required to get HDMI audio on that port.
> 
> This is based on next-20250314 and the following series needs to be
> applied in order to reach userspace:
> https://lore.kernel.org/linux-rockchip/cover.1741886382.git.robin.murphy@arm.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Enable HDMI audio output for RK3588 Jaguar
      commit: f46705afd1aafd843e28e981447c92469e846673
[2/2] arm64: dts: rockchip: Enable HDMI audio output for RK3588 Tiger Haikou
      commit: 200b3fa574c9377ff0b4e69a6ca4668939bf0cad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

