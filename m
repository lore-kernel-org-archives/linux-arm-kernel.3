Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFFCD116E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ20Iy0RcHBHgkwxq2o8sUHkUfWWwKay7LCggNECWyg=; b=0aXUob9xN02nLs8ObFt1c2ZbSs
	JdgahaDJjJ6tD1VrGtP3TRA/2ZjDrmy8SBEugy2Gy/ixHfgMXuUOnz45rRoi4wSIOsDQbi28g/zTT
	eREodg21IfnwPXUiAzymeCKMC6Ie863Tjts9If7LeKu9jqMYhY7og7jCEwp/GO7czHULGhV1af3Qf
	0FthmoOg0qazsVwiUiyTgJH3ajVn2vTHAdBhRx9nuVu1u5rECur3HeYKnmlU7PBm5JIqi3aQ0YS7L
	mAAE5YIJZ9+GOMBocDRd/KsEKXbWWmtLVu8vtoVKTqCf7WQSoEyTq8I3YZWD8KFMpVvYx3alqN7rQ
	XHq8CfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQ1J-0000000Fnoz-29u2;
	Thu, 27 Nov 2025 00:38:01 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQ1H-0000000Fnoe-02ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 00:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764203876;
	bh=CQ20Iy0RcHBHgkwxq2o8sUHkUfWWwKay7LCggNECWyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=duCJEbmUPl0A54Y1u8LnbdpsMQtdW7BLOiZvOGnOu3g7CgGd8C886uT4RPZmWiPxi
	 WK6oX07ebhuv7vmGwct/dxh0g3+0YC+LXiy8r8x5Diam/pncqqi0n1L7tNXl8YKfGA
	 t0eh5i9ljzCeaL/tIFxhveCHUsxwA1cIUiLZ3yrFbv6LND/8mjpLFOJoQLLDAQiAkn
	 1AkxzUMuQIyPJYxouzCHDNOdBzoG5WyVa++3k0ZrEiBHMsXfwKgQyCCb0PeojNSZvA
	 bM/HX8sESNqI82kLc1G0kqEuB0RhvPxavXinraD9tE9xRhDeRtGd2wBO+bjpJCUtpu
	 vQii4AJok0U6A==
Received: from [127.0.1.1] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB7A26561D;
	Thu, 27 Nov 2025 08:37:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Kimi Chen <kimi.zy.chen@fii-foxconn.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com
In-Reply-To: <20251125-dts-add-gpio-to-io-expander-v4-1-e6d31f80470c@fii-foxconn.com>
References: <20251125-dts-add-gpio-to-io-expander-v4-1-e6d31f80470c@fii-foxconn.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: clemente: add gpio line name to
 io expander
Message-Id: <176420387574.173041.5260439773042865128.b4-ty@codeconstruct.com.au>
Date: Thu, 27 Nov 2025 11:07:55 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_163759_247506_CAFBF88B 
X-CRM114-Status: UNSURE (   8.61  )
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

On Tue, 25 Nov 2025 13:42:50 +0800, Kimi Chen wrote:
> The chassis power cycle process requires a forced shutdown before
> cutting off the standby power. The SCM CPLD implements a hard shutdown
> host function that is controlled through the IO expander in the
> Clemente platform.
> 
> This change adds a new GPIO line named "shdn_force_l_cpld" to the
> PCA9555 IO expander's gpio-line-names at index 10. When asserted,
> this GPIO signals the CPLD to pull the HPM's SHDN_FORCE_L pin low,
> which triggers a forced host shutdown.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


