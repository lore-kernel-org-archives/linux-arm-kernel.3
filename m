Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751F1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzKdp7Hcvs6+zEuzXa7LVO8auZ6H7XjMLgYVqU0x/Zg=; b=lctcJae0WN7YUpsLQ7UWIx0FcH
	8MnTL1fZGXfVcSDOqE+/o29uYoqbTQBcWuINyzQ6hJMghbDS5AKiYvS49QtD82GA1ABylgobUzQlE
	AlDjBRxyKAIWOzavhrbxf6QA/5a8LPTelvJZ3C9mV84YvkSN8+rLJOkbTlTmreDqm/L7lQWA+gT4L
	/IEsWS8e6SYIqTNqVT4WwAC1/9By3FZI4cvs00CUkuaKZ8wncwuuc02bUNvt25jSMA10I+kvEnVf9
	3BqjZt2aY/IOxbvDstngT5j5RVB883bihK4Oe/tFuCLOt07t5XyzivQcTZob6lKpPZef1IEMsunYx
	TpOvy3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZeZ-00000006ee4-22ws;
	Sat, 11 Jul 2026 15:30:07 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZeV-00000006edN-3xYX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 15:30:06 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783783798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GzKdp7Hcvs6+zEuzXa7LVO8auZ6H7XjMLgYVqU0x/Zg=;
	b=IWykNoSpjn7zW6CuDj+8yy6zrE53QZYDQY2TzlqVtj1c/WCfWhVl5oUwsq3Pld2XnFxavJ
	OKeLDcV/KyN5suJ2aH1WQVEyg4gcRMhLCpT1prSSIOYp38kOvKYEXQhEcNHQjx0afWN+VX
	+EdqGbLAfKwg33sq0+4BBveY2JjDcKK5IuF+Ncs8koPzsyU2lRxld5eD18854judDqrTo8
	8cK21M6hgoN4iBwdB2b+1ENYTUpLRy6GVzi3CaoZfcMXqv3Drl7huNW2ppa4bjtVF358fy
	v6OXN6B8Y1h0B6i6I9mpOvyaFxAl0ZRbXRpZs4LlfUeZq6Grs/KqXaowmLqR7w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Jul 2026 17:29:52 +0200
Message-Id: <DJVUKXFUVH2Z.2O9IM7YHJOKYT@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Marcin Juszkiewicz"
 <marcin@juszkiewicz.com.pl>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Fix USB hub phy-supply config
 for NanoPC-T6 LTS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260610081400.758687-1-diederik@cknow-tech.com>
 <20260610081400.758687-3-diederik@cknow-tech.com>
In-Reply-To: <20260610081400.758687-3-diederik@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_083004_602345_4B328359 
X-CRM114-Status: GOOD (  13.52  )
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

On Wed Jun 10, 2026 at 10:04 AM CEST, Diederik de Haas wrote:
> The MTT USB 2.0 hub is connected to the SoC's USB20 HOST1, so the phy-sup=
ply
> belongs to u2phy3_host, not u2phy2_host as that is for USB20 HOST0.
>
> Fixes: db1dcbe5f752 ("arm64: dts: rockchip: add NanoPC-T6 LTS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
> index 0ee67ee24f3c..0e15a2e1f2ff 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
> @@ -38,6 +38,6 @@ usb20_host_pwren: usb20-host-pwren {
>  	};
>  };
> =20
> -&u2phy2_host {
> +&u2phy3_host {
>  	phy-supply =3D <&vcc5v0_usb20_host>;
>  };

Please drop this patch.
I was hoping to confirm this with an M.2 WiFi+BT card, but let's say the
results were kinda disappointing (to put it mildly).

Diederik

