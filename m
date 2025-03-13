Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC395C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5mdS2EnE4cpGSwW2dj+33eKcmSk0c9tKXjXQcM25/Y=; b=chZTAsKZUfDHGlMntYkJTz80tb
	etuOhMIwY/FkQKURI+ilj2Gqy0IPHZg0AVkXu9bRVaV19a1iksgQovqyBQNchffK77/Y7vMcNiydp
	TaJVLs/BJo7CZGRL2d9LPqyL/Tt/mG/DbPl9CrVAaJLUbbjD1v7OKOD+m4n5mpTcafsL9JqFIS6ix
	JRalnBex3v8hw46ylM4S481PNC0BTBm9ofsyM1rxFSQupqeocrcId8WauHAW7mCemGVsqEhQnhbG0
	cn1JxGhjmbj1LatMX5/io0MGeVXBV04d47o0GL3uiS8s79+CtyCB4ZwCKsuDvvBZFx8BGHEyw7oLQ
	GHLoKjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnrp-0000000CH4o-1p3x;
	Thu, 13 Mar 2025 19:05:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnq9-0000000CGd4-1A71;
	Thu, 13 Mar 2025 19:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H5mdS2EnE4cpGSwW2dj+33eKcmSk0c9tKXjXQcM25/Y=; b=zjw9b1/WQHf2OAGZlzSVLoknvh
	L1RzSpSTzDaBy2/7e0enIt/0atwWM1R3t4p6z7c+Lnp9Kqve3jzidGIU2liFppchMDCJ/55q3o81w
	wBmcrUYreJ14Nl+B7ENvo7tK0OH1ZmtsY8/c0UnHNNz+gu04WenM0+w7HgetKI5XlUgGYuG8mkSh8
	lEllzjETEAnNXmGdbyWXjj8MMiE5V/9s4fo/aMhSSXgEKAcJ+5X+VSiqLyqWVn4FiuW1RLhqOw8vz
	LcCcK+pI1jy9CJy2gEJbZyAZvLAOZ/0xnSZkRtjgcKlUAZG/vq038NnSC1FWFqmSfZQZvM8XjDBvC
	fwApDVeg==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsnq2-0001sH-Jr; Thu, 13 Mar 2025 20:03:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI audio output for ArmSoM Sige7
Date: Thu, 13 Mar 2025 20:03:13 +0100
Message-ID: <174189257844.294070.2578524540715601524.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312164056.3998224-1-liujianfeng1994@gmail.com>
References: <20250312164056.3998224-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_120333_314729_4AC46446 
X-CRM114-Status: UNSURE (   9.96  )
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


On Thu, 13 Mar 2025 00:40:49 +0800, Jianfeng Liu wrote:
> HDMI audio is available on the ArmSoM Sige7 HDMI TX port.
> Enable it for HDMI0 port.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI audio output for ArmSoM Sige7
      commit: e2759a8d452bcc1b64ecd4e819411fa26b6ed72e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

