Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F43C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 04:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYidVVPbXZ8EndCbxcLt4iY9PCBO9quW0Sn8Sh3yyAM=; b=1+qfULi/x8nYYfUYm8tOU0rbtL
	m2GOn+ixTrKZ1gzNrslJ6nQSXwEcPxqMI/aN/HHTbKiU2ZNc3hxLjcXPidFEf9jrWVv9FlkhNcyKc
	DtYrW3xi1o/oH1lKbxuaDaW9dYz9X7hXb2+Cpjtpt53+9xQgaxFDn+Ht64F64etXqEfpvpFVzPP6N
	2bagV68vnfy/PsHYg9mRu+hK/FhL9t8oPY24Wv9ACnEX1vgtxk5sgtOtbDTYDGZx6+qy4HFIeqnTr
	dG5dkn14mMjwmiSgBM8g81m8LdrALozHGJ94ClzXgho93jJkXg0c5YYExKy+bIVx5fjFOBJLjC7ME
	Xhj5GDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhM0-00000007SCR-2OOu;
	Sat, 22 Feb 2025 04:43:04 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhKX-00000007S2G-3acL;
	Sat, 22 Feb 2025 04:41:35 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 68E9E8A1124;
	Fri, 21 Feb 2025 20:36:32 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 51591160036F; Fri, 21 Feb 2025 20:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1740198992;
	bh=KYidVVPbXZ8EndCbxcLt4iY9PCBO9quW0Sn8Sh3yyAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDZVCFsYVj0up9ILlSts8dv0EmlHIke6IPWh9AU7WtWN97dKRCnY0UuOswdkseXF1
	 Rxcm9Ut1PzwfY91SV6uIMyz/A9KlL1KrBVB7gx98C3aSyvzbTt8UaqmhUTiESVnLtO
	 /uGlavYX82YGNuYAmENU5Vx7M0uY9Ik+in9B1wPM=
Date: Fri, 21 Feb 2025 20:36:32 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
Message-ID: <20250222043632.GU16911@sventech.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
 <20250221231340.GS16911@sventech.com>
 <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_204134_021494_BC7D00EA 
X-CRM114-Status: UNSURE (   9.87  )
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

On Fri, Feb 21, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> On Fri, Feb 21, 2025 at 5:13 PM Johannes Erdfelt <johannes@erdfelt.com> wrote:
> > I'll also see if I can give HDMI a test.
>
> Please report your results when you do. This is one of the differences
> from the Orange Pi 5 Max. The HDMI1 pinctrls does not use the default
> pinctrls like other RK3588 boards (including the Orange Pi 5 Plus).

No luck yet. I do see this message in the kernel logs 8 times at boot:

[   41.552751] rockchip-drm display-subsystem: [drm] *ERROR* failed to
get pll_hdmiphy0

I'll confirm with the vendor image that my HDMI setup is correct.

JE


