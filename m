Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D31C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rO5oMc5NnK+5OhYBeYB9HiC4kstar/l6abOfZI8x0zU=; b=xLsgKGTkmbgnt3ehQQgbVDcO2s
	g36+3ayGZH4ufAv2HPDAUfve8ny+WqsRiv8lqHBCF9vkoFkz6/0Ht7MeZLR01EFAzSOJw00PDcqt1
	X7kKrO4rsbw/XOlle9MhKomKZ8J22RucN5TkGrbCE9D9xe7kNo17H/GEPRq7uwqOxUUNsAjtwK5zi
	OQA7e2s0DHGgdD79sdfYDcRYegNQ30AMqsi17N04Js/5WrMkLDdr5OvN2VSVKuSEf+XHikQ+jzAyp
	6zylxAK1avqwzt5/gbd3mSuPfvs0H0QwZy7PNLb4kyWrs9CByhIOQMYlELPRHi9v6IdkqjQOto7WP
	5WNsPiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlyi3-00000009BZH-2MYx;
	Sat, 22 Feb 2025 23:14:59 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlyfK-00000009AvD-14tJ;
	Sat, 22 Feb 2025 23:12:11 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 4704E8A3369;
	Sat, 22 Feb 2025 15:07:09 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 34591160036F; Sat, 22 Feb 2025 15:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1740265629;
	bh=rO5oMc5NnK+5OhYBeYB9HiC4kstar/l6abOfZI8x0zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFeK+qhInZPwmk40C8N9t24LVCw7lHi5cjCsmiBbQ8EkszYLJx0s6x8uxce9l8sXa
	 mW6A6XDBlOO9MF6dRVg6IKLq4bhPceuRMMXkZSh46y9HcxbhPTOMlzgj7HY6NWnUo6
	 bw4bdZCVdqFP3Mbtr3WeUlaXrx2WTW4lZpvZndpg=
Date: Sat, 22 Feb 2025 15:07:09 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5
 Ultra
Message-ID: <20250222230709.GA16911@sventech.com>
References: <20250222193332.1761-1-honyuenkwun@gmail.com>
 <20250222193332.1761-5-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222193332.1761-5-honyuenkwun@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_151210_413660_1914542B 
X-CRM114-Status: UNSURE (   8.83  )
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

On Sat, Feb 22, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> Enable the only HDMI output port on the Orange Pi 5 Ultra
> 
> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> ---
>  .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)

Tested-By: Johannes Erdfelt <johannes@erdfelt.com>

JE


