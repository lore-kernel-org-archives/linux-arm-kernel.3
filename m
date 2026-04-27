Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A5FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp6hw9YMUgyBOlWT7AEyu22BSsvL8XW4ydyheGX7ebs=; b=1oov/pJG1YvJn62YULocTTTdS/
	JURB5BH24rdAthRUiZ17r39WPBxdti1Hph9Gn2Mp1XqioPbRhyCdfXGerIIKDtyKgDkA32yVj5XaS
	Xh7Xl5y7pjJoeI2/7MzP2BRS9IGXjjStWOzT6p5RrPmdRifG3XNe+qcbMwwws50YPo3j4/XkjtgHI
	XZ6eZMkCiz00hi0ypnNIwkrEx8l1/Iz2rO4ZnWN5BqssPb0K8OPhjd12q+3W+m1G/MWbOyNPZ6UsQ
	7HgqXBYGvGi1qTps76llaypTYqaPrH2B/zjJ0tibb+PA32/TWquZGVVxsMDEiKLAmDZtjaEVeFNBY
	3u3kH7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJLx-0000000Ghrc-2tP7;
	Mon, 27 Apr 2026 10:38:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJLu-0000000GhqY-3h2q;
	Mon, 27 Apr 2026 10:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Yp6hw9YMUgyBOlWT7AEyu22BSsvL8XW4ydyheGX7ebs=; b=ungP194ke67KZU5pOYDrDK4HRt
	39+h5iKodZrPPc3WP3GJYIdwdDcuK7sfhBdP/fYS8mBpBW0L+4x7+27aTH8nwmc6AVV4RkcoT7DQL
	IkYwhSHkJRRfA9FPYpGD4uGLFm0ZI50bARTZK4MxIq/FDHWr40hHzrnqTDe/8VSoZGfJWozga84HQ
	dTJRkKQGn3u1R9MosVaskZDpqpb55lW9AvrkzxjlGm102hV9MJGIFvnl2WC4lDCVylE54QDvn+rPr
	nj/JKQmt/ZRhA5tZmTcyE9H0Dz+Nxzz34vQ/1ZwD8fuDmhEvIsml4+mPFHCnzS4g9jZXFhu0c+gef
	y2SGQNEg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dennis Gilmore <dennis@ausil.us>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dennis Gilmore <dennis@ausil.us>
Subject: Re: [PATCH v8 0/6] Add support for Orange Pi 5 Pro
Date: Mon, 27 Apr 2026 12:37:57 +0200
Message-ID: <6856027.GXAFRqVoOG@phil>
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_033810_937419_8DCA7694 
X-CRM114-Status: UNSURE (   7.88  )
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

Hi Dennis,

Am Samstag, 25. April 2026, 05:10:05 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Dennis Gilmore:
> This series adds initial support for the Xunlong Orange Pi 5 Pro, based on
> the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe),
> a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), dual HDMI output (the
> second via a Lontium LT8711UXD DP-to-HDMI bridge on dp0), and a 40-pin
> expansion header.

more as a general node as the dp-hdmi thing is ongoing, you might want
to just submit the orange-pi5-pro basics first and do a separate series
with the display parts (both driver + dts integration).

That way the core board support can already be applied and get testing.


Heiko



