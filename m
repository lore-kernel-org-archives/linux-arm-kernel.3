Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCA3C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA22utvgRUdA5DBTKJr5qtockNVUiH7ZtWJLs1w/PPQ=; b=MbMcI4u1xLQl2O71TDA59RNktE
	JEWd7oSoQCZtb/0dMpDoC/9VmXxZ7Q2xfUaqg6y8qGSdsg6Bv4NertVZdLiLtLbNiMkP9zDA62S2N
	F7ZTeMj3+U9JWjw2/a5Vi/IjUDEVev81j5i/SjDrNeIK2lPxrvPUyYnJgNOJMejmE8klLtLckzv2o
	KQJZBO9oXmORsBblsquoQbXo7Q+Fmob4A9H8QbKgaC+CceFqWJKwJvucfnIC7DnnjV1vbYYeEsk9T
	o+uxwT+GpBgHrUjhUeQT5nDn+c4oCrBk8JIIl1G2SlBRe3k9cWhL0RVPUBO96AG96Q74WFURYSIY5
	D+7ka4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtoS4-0000000G7Mf-3fFr;
	Sat, 21 Feb 2026 14:59:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtoS2-0000000G7M0-1JmA;
	Sat, 21 Feb 2026 14:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xA22utvgRUdA5DBTKJr5qtockNVUiH7ZtWJLs1w/PPQ=; b=Wx3BCHB/7X48J37ZF46L83Wl/k
	ueplWD6JS0yylKYIteTeSvP2nHfEOmBcGASYFdlda8y9op5ARPjGtTxtiV9MkM0IO4dVuQz82aIqp
	5hoHZLupoQ4jd2xFv8NdcdItb0JUidFbUxVq6/OKaBFTLjw3yvb91WSika0/bYal1pM3I+0g0U0+p
	ZzniUxNbLvFje/SCmuMnsuTEqaW7TgM+r6AvPukQ9w5GPttUynX+eKMcJy0q21Rc3/R4yd7C2X9B4
	Ao7KyYRNCPibJ899dmpbjq0YvEl7FHWrVowUqqDgUTNNIK0+oVWWPdZPgCBY97ekIsVSt9xbL2Di1
	zTYcINOA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v2 1/4] phy: rockchip: inno-usb2: Add usb2 phy support for RK3368
Date: Sat, 21 Feb 2026 15:59:18 +0100
Message-ID: <4689639.clyjiGRsXx@diego>
In-Reply-To: <20250909132958.26423-2-cn.liweihao@gmail.com>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
 <20250909132958.26423-2-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_065922_356393_BEAD07BF 
X-CRM114-Status: UNSURE (   7.66  )
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

Hi,

Am Dienstag, 9. September 2025, 15:29:55 Mitteleurop=C3=A4ische Normalzeit =
schrieb WeiHao Li:
> RK3368 has one USB2.0 PHY with two ports. This adds device specific data
> for it. Device specific data get form rockchip downstream source [1].
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/phy=
/rockchip/phy-rockchip-inno-usb2.c#L2805
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

just realized, this patch is missing the phy maintainer/reviewer as
recipient, the phy-list is likely not enough.

Please use scripts/get_maintainer.pl for the whole series, to get necessary
people. Because this phy-patch needs to go through the phy tree.

Thanks
Heiko



