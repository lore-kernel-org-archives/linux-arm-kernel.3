Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EDEFC5907
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTiV+7M8bDPB5RgaNqKdBFimBVxJbqD8RZxZc4n1LbQ=; b=w+fBSJBsQcW9a6bnYBofGqFHzm
	7OrtkYnTdEIUAJUa/mzBYyr7478v9xPQFwLRt8DRE4pKJ7MgEQElpSCuGFqkQKOhhLF4br2Yh4I+O
	Fb5ifUwrikXpzXwB4C3U8LQGaI5j9jGuap/qa/2ChhoQWLux+xGFkB5DEeailILTKikGl2RQl/wrr
	/px4XpCTlHD9pf/ZwaeN3GosJrha7PMl05uVQbVx+YfkcSwccIg25iXiFZnkmuwz0heZdyov7ydbp
	0ocDUf70l48/+CCvtDCiTA1JzflTYuoOVHHnMN3zBXsuie0gUVqVPz2+F3+DOEHD2RxZfsJnf9183
	vDjc/sNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVkz-00000005ZUS-1f0S;
	Thu, 26 Feb 2026 07:25:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVkw-00000005ZU3-3YuW;
	Thu, 26 Feb 2026 07:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 203F542E1D;
	Thu, 26 Feb 2026 07:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6709BC19424;
	Thu, 26 Feb 2026 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772090754;
	bh=MVMppmnDaxJ0p8khr1M1MIEYFy0p0GyoafbyqGtoHrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbVawm3e0Fz+jOlSNrulCzWFmus7hdfmcyD2ZgjmgUZvk5MnozYxZ2CsxPiMkOuuB
	 5+H41/YooRaLn5BRievRqKiCqaGNGS8rzsbbEfXRxf39fND+TUBh5GfmIFaxBwleMo
	 tisXXfKun7Am+3iwx3L7Egcqx309McOFI/660N2srl72XEsBlBNOolAeuWB5cVJIbG
	 GPsG9A+MlvMHefWf9Seh51w8Z/qvsg46/WiP4+iRktpwW4op05pYRfwKzA4t6Yl5Wy
	 DW084hjKPEDQJCmCxTFonaDKwPj4i+KqLq2PQjkUJ0D0ts+cngvPsWWF6oskfhCqWD
	 MSHfJbx8MlL2g==
Date: Thu, 26 Feb 2026 08:25:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-screeching-manatee-of-amplitude-6dfbf6@quoll>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
 <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
 <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
 <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
 <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_232554_929084_D2AA2821 
X-CRM114-Status: GOOD (  24.56  )
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

On Thu, Feb 26, 2026 at 12:26:37AM +0200, Cristian Ciocaltea wrote:
> >> Sorry, but I don't quite get why would this be a better approach than just
> >> properly list the items according to the HW layout, i.e. following the
> >> address-based ordering?
> > 
> > We always expect the list to grow, to have common set. That's rule given
> > during reviews multiple times. For multiple reasons, also explained
> > (consistency, maintenance and actually proper description of hardware
> > like the main reg address space).
> > 
> > Probably this was also given to that binding during discussions when it
> > was upstream, so your change reverts previous discussion and to that I
> > do not agree.
> 
> Thank you for detailing this, I get your point now.
> 
> After digging a bit further, it looks like the "function" naming has been
> introduced as part of the RK3588 support via commit c6ffb7e1fb90 ("media:
> dt-bindings: rockchip: Document RK3588 Video Decoder bindings").
> 
> Morever, it also sets `reg-names: false` for all the SoCs other than RK3588 -
> sorry for missing this initially.
> 
> Hence "function" wasn't used at all in the context of the older SoCs, while on
> RK3588 & RK3576 there is no indication that "function" should be treated as the
> main address space or anything like that.  E.g. RK3588 TRM clearly shows the
> "link" range at the top of the listing, starting at video decoder unit base
> address:
> 
> --------------------------------------------------------------------------------
> Config Register                         |   Base addr
> --------------------------------------------------------------------------------
> VDPU381 core0/1 link table config base  |   VDPU381_core0/1_base+0x000
> VDPU381 core0/1 function config base    |   VDPU381_core0/1_base+0x100
> --------------------------------------------------------------------------------
>                                         |   VDPU381_core0/1_base+0x600 for Y channel
> VDPU381 core0/1 cache config base       |   VDPU381_core0/1_base+0x640 for C channel
>                                         |   VDPU381_core0/1_base+0x680 for head channel
> --------------------------------------------------------------------------------
> 
> Assuming the reasoning above is now good enough to move further with the
> proposed approach, I can prepare a new revision dropping the unnecessary
> one-entry item from the reg-names, while keeping all the rest in the series as
> is.

Yes, with drop of the oneOf this would be fine.

> 
> Regards,
> Cristian
> 

