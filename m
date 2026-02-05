Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28912EC1EB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT0qu7L3vnnIYE49+ri/Zy0uJQR4ZsNRqa4iBhmuI7M=; b=YlJNj/TuGYAnQmXwk6JaMbj4KS
	vVfeP8RR5+z8LM1sM7ASI4oQm8UQtTbSbTlxDjwNg6CSoP4yYx6UDobto1IArpFh0tzHEvdeo+pwQ
	f2bTRLA0Etxza7hef0p0MrawaRnep0A61kPnpBarLbqyGnRl5Meiq/2BurfSqYg6ExqKZXvVWKG3e
	ilO9/CVeAOWDtsZRnbgrEIHJ44Z0+OAeLqJr7Q9QYieIUwQ7zRDUPQG/5LbqDQP+rjT3IQKHfRnwY
	lhgYWkmjU7EnGjQA8X0opDCfBvTkjA3dMt5vYsCZMDQKxqpbRSEIKG+guRJUahAWVHXcxI8t5mh2V
	KHdmF97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyor-00000009uWr-44yX;
	Thu, 05 Feb 2026 12:50:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyom-00000009uVB-0FtR;
	Thu, 05 Feb 2026 12:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wT0qu7L3vnnIYE49+ri/Zy0uJQR4ZsNRqa4iBhmuI7M=; b=a7mkXjf4LL5AgEXRoE2URl8R6v
	V0SZOFTlS11PqRt+J24lF89dz6lU8XCPJGCfnNUvrzx57QIL4pXQlxfm+TFsZbz0NrYt2zMtckL2D
	rXt5bL7n8mIF1kKxUtbACTaPfyOUNA8ikZ7vNfD6dT4kazpBqVtDokX/rT1LzabRKU70G6rtngotk
	jml4CTedCiY4fW9MfYUrXWAF5iAhlTVMRysCc1j/F9qFlcP5VswR2tifiL5CoB/N+J5/+dLt40qrs
	vg7e5CAlfhaDBRHRDI7yKzvs7GjKKGCytqSltdhxO6Nwpy2jR2RnH1ZA6NGZvse0wuimH6g1sNt1z
	qfUcQvWw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnyoc-00765Y-H7; Thu, 05 Feb 2026 13:50:35 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>, Willy Tarreau <w@1wt.eu>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Date: Thu, 05 Feb 2026 13:50:34 +0100
Message-ID: <3080333.vCJZsxu672@diego>
In-Reply-To: <20250728190154.GA24527@1wt.eu>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-4-kever.yang@rock-chips.com>
 <20250728190154.GA24527@1wt.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_045044_192386_16231574 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Willy,

Am Montag, 28. Juli 2025, 21:01:54 Mitteleurop=C3=A4ische Normalzeit schrie=
b Willy Tarreau:
> On Tue, Apr 15, 2025 at 06:32:03PM +0800, Kever Yang wrote:
> > From: Finley Xiao <finley.xiao@rock-chips.com>
> >=20
> > This adds the necessary data for handling otp on the rk3562.
> >=20
> > Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> > Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>=20
> Successfully tested with Jonas' patches on top of it on my
> Radxa E20C (RK3528):
>=20
> Tested-by: Willy Tarreau <w@1wt.eu>

as you replied to the rk3562 variant, does that mean the rk3528
uses the same variant data?

Thanks
Heiko



