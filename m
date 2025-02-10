Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3E8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciWRVZkQ9j2tyd4uX+oemeWAvXhKk4+4yp01dpYdRZA=; b=ehRBAQNRuM7ZJWu4bKP0UMMRdM
	4rJ0BLjzahMEGeNH5UX2kP7Tgl2B6u616vxx+sEXO0f8U3XDoAa7TrPldFtB31yoNM0MYqZ2uw4dF
	Inumh22lhqqChXxYYEk/83YYjlRVQrMYznQ3K8EfE48OAHwpzTJ/1EqCscy8J/rFkfBlNLtxqssw8
	2kE47dsjMq+tjUoVtvBc4KZNXzXErAbd6brvVXpjs3Rrn6N9GpvFgIUALveuCRATHOKMDrJu2ic6E
	P+xABdsZ56Y8GUPj7f9QG+gSVhgLtCusg41Lk1EZh0wEcPxwmJJRsPpix00144ipRzvkKtP0QNS3v
	MjVefW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTcC-0000000HVT9-1S2u;
	Mon, 10 Feb 2025 13:14:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTam-0000000HVK3-3B0J;
	Mon, 10 Feb 2025 13:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ciWRVZkQ9j2tyd4uX+oemeWAvXhKk4+4yp01dpYdRZA=; b=RAV9hxnjvFFmJpnvDXAaLc7cvc
	D1+sixqRRZYRhNw6BXb4RXQz1s00EyeV0zz+wgQsvReL39hoRcoRK9IsZ7z9TJ3jR76vIN5YM+C0p
	wDjt0GHSHoVsdrOBC3J4dH/zqJE5kMJHZbJ0+Uow2M5m5yU4x64/772J5uNZI3xxH95hkIPlvIQ3E
	VK0oW1JlR6Hz7AZ2zZRFJhlHz5Q+YGlQhKCIdGvLwiDlpgBt/Tv5CtjbNR5NpeCi+uFDuavZGWP+D
	vnzjZAZpbDm0DrWinjUL6llQcUVAtDHawKtVpFCZdw55bbbmC+rzs1thcgtcEG5BYAutYK/GcvVSu
	/3PdCOgw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thTah-0002q6-Oy; Mon, 10 Feb 2025 14:12:47 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Jagan Teki <jagan@edgeble.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH V2] arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS
 Modules
Date: Mon, 10 Feb 2025 14:12:47 +0100
Message-ID: <2928143.Icojqenx9y@diego>
In-Reply-To: <CA+VMnFwHEXWP=d_X0T0E9fHFDCkXHxpvgML6jAHNfh9ikXTZWw@mail.gmail.com>
References: <20241227132936.168100-1-jagan@edgeble.ai>
 <CA+VMnFwHEXWP=d_X0T0E9fHFDCkXHxpvgML6jAHNfh9ikXTZWw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_051252_822041_8AEA2AB0 
X-CRM114-Status: GOOD (  14.68  )
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

Hi Jagan,

Am Montag, 10. Februar 2025, 13:51:07 MEZ schrieb Jagan Teki:
> On Fri, 27 Dec 2024 at 18:59, Jagan Teki <jagan@edgeble.ai> wrote:
> >
> > Edgeble-6TOPS modules configure HDMI1 for HDMI Out from RK3588.
> >
> > Enable it on Edgeble-6TOPS IO Board dtsi.
> >
> > Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > ---
> > Changes for v2:
> > - Rebase on top of Cristian's series
> > https://patchwork.kernel.org/project/linux-rockchip/cover/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
> > - Update hdptxphy1
> 
> Cristian's seems merged, please queue this as well.

only partially, i.e. I merged patch 1 of 4, because actually enabling the
hdmi1 controller needs the alias-removal from the phy driver, see
Cristian's link "[1]" in his cover letter.

And phy maintainers seem to still be otherwise occupied [2].

Heiko

[1] https://lore.kernel.org/lkml/20241206103401.1780416-3-heiko@sntech.de/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next



