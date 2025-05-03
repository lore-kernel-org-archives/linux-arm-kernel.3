Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D416C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfWWm3z37dZisjAhfUtOyczLf2I0pzV8I3To02hyM8E=; b=S0kqf3C2nCT4Afnn6zLH4DKIxi
	YT880IVBwr+HEuVCBNaHXkE2BrXtvHG2qfQxl1nP5V/eotqgR6WNDC7/0irTY6Z7HioUP90YYVVLr
	QsMGWQU3MUnsImwbUPjsWc7+BP4b92Lffx9dF312hwuo6WbS8RxXGRF7YbRZPGFBtolWgoFOpVtg9
	G/2QSWay/m6kX00lx4MX90CR2Y9x94qVLKq+cGMiI86tKScTN3hbuDUgp/Kht7hB/6AIcZ9X+O/mv
	GJe2wHKmQ0Ss9K20UcQlQm4OBuxh0ghc4f6kEE3CariYdl3dbOI4k6YCIrPFf3KM5y1dg/CelRxev
	bJlWca2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBK6w-00000004VdW-3Wf0;
	Sat, 03 May 2025 21:09:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBK51-00000004VYD-2JX6;
	Sat, 03 May 2025 21:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gfWWm3z37dZisjAhfUtOyczLf2I0pzV8I3To02hyM8E=; b=VCqgJIU9EBQPWMZK9lEHQgSI+P
	LtwO/bRD4Y1+XxiS2+1jW+1/V1C4k/GUp/zaYDzUPE2AImcW6yIk7TlY/yke1gjkn/Dl/yXDECxBo
	lYvmNMuyY0iOVUSQUOYdAW+02qG/sqstcoXmP+d3KSuj0rLIQuFRL8uC/5D9Hjk0MsggQS59p04Np
	rAk39KqfUjvv/0ViLIw+GbqcSTvHO93XqleZSCNb8rAvv6yJfscjwqf/vBvFhXPd+c1QWbVbQaH/o
	ND8BZV/O719M9S/pol8RYs1xaHs4KzmH2EQu0HBocEJ33btfbv2oPQQSXh+jP2YbyHtdy6CZ/qd5E
	DpKhBttw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBK4r-0002b2-EY; Sat, 03 May 2025 23:07:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
Date: Sat, 03 May 2025 23:07:16 +0200
Message-ID: <14210550.RDIVbhacDa@diego>
In-Reply-To: <20250428102309.1501986-1-andyshrk@163.com>
References: <20250428102309.1501986-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_140727_590224_4215055E 
X-CRM114-Status: GOOD (  10.91  )
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

Am Montag, 28. April 2025, 12:23:07 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
>=20
> Note: I don't have the hardware to test this driver, so for now
> I can only do the compilation test.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3066-marsboard

Will hopefully get to applying it tomorrow.

Thanks for that nice cleanup
Heiko



