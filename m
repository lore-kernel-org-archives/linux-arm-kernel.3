Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8704CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq359tqEuOYujAesUVa9RiNZkwczlMtcTJsELCHonK0=; b=gyGxHrexQkCR/l1LT+xDPLCGLp
	WI/qw1EuMFdTK80V6wpkazw0GpAOWLCQkpMHlh4cx7ZmKIpWwaER8YrU26sK1Ho/4PNZmmGB+OPyW
	2a0oHYx8zPA3U2sjBWrL1KFO9mbvGXFAaGdzvCs69u1IzDmDq7TwzsYYvbedFgFK6Sa2C1RCQr/9p
	GnoCR+4b1n1KKRuE6KydiUZ2FKgqm7MRZskgkf8u88A7eg+QlWHzC/IpeIg3DAcO+wFT5+wk5AyJR
	H7IhgPXSkftar7gnqwymuWUqlx9wR+UoteF/1BtKs+UYzksE/Su+fJ/s5moHbuKp/kHDe1ZEfFPVI
	OuI3h4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7C2N-00000008PV4-2u3C;
	Fri, 10 Oct 2025 12:15:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7C2L-00000008PUg-3tXb;
	Fri, 10 Oct 2025 12:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 574736029F;
	Fri, 10 Oct 2025 12:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65215C4CEF1;
	Fri, 10 Oct 2025 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760098553;
	bh=hWBv5TGNZvVjCplP/ev/k4nohO6E6ZrobfMvadwzZhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eA8120haZolGu2WcpY2s4wKkm7jIqYjmTNsW6RQKUhowq4qQyINP9dOJ+ZniDOlSB
	 esvPlGsEZRJKcMHu615Aao5qvsXhrR8i3lOj94g+kVpWkaD0BJNvitbXrVIf6JDwfc
	 nPLSZUIQEP5Y5s1xYp8MG96JJMZbu4kDiT+e+aB7ryAXALV+wUxAzZwoceAe2tbOqM
	 BNiMMSyNPNZZTpKi77b7T7efoeOsvnNtmPov0/7EoQiVrvz1+WOBhhGIxXkfU2h/h/
	 nrC4zLTlRR4SHdXAcqTKu6r57v7q0DEuQDq1ASmTt+HX7DlUvDYzBJ4Bg/SioGE01B
	 4cBdSncQrOx6w==
Message-ID: <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
Date: Fri, 10 Oct 2025 13:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/17] media: rockchip: add a driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <HSTnNzc6MTLHGWih5qjlI2nvVECP8FVdcQVeBON4KlWYLtEaWIlNmEpKTU_vlqitbIIHMpabKnvnmpEQFqHYxQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> For example, the PX30 Video Input Processor (VIP) is able to receive
> video data via the Digital Video Port (DVP, a parallel data interface)
> and transfer it into system memory using a double-buffering mechanism
> called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> DVP and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> The v11 of the series adds a media controller centric V4L2 device driver
> for the Rockchip CIF with
>   - support for the PX30 VIP (not tested, though, due to the lack of HW)
>   - support for the RK3568 VICAP, including
>      - capturing frames from the DVP
>      - capturing frames from the MIPI CSI-2 receiver
>   - abstraction for the ping-pong scheme to allow for future extensions
>   - abstraction for the INTERFACE and CROP parts to allow for future
>     extensions
>   - initial support for different virtual channels (not tested, though,
>     due to the lack of HW)
> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
> 
> The driver can be readily extended to provide support for the RK3588
> VICAP variant. In order to keep things simple, however, this extension
> shall be submitted separately.
> 
> Looking forward to your comments!
> 
> To: Mehdi Djait<mehdi.djait@linux.intel.com>
> To: Maxime Chevallier<maxime.chevallier@bootlin.com>
> To: Théo Lebrun<theo.lebrun@bootlin.com>
> To: Thomas Petazzoni<thomas.petazzoni@bootlin.com>
> To: Gerald Loacker<gerald.loacker@wolfvision.net>
> To: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> To: Markus Elfring<Markus.Elfring@web.de>
> To: Sakari Ailus<sakari.ailus@iki.fi>
> To: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab<mchehab@kernel.org>
> To: Rob Herring<robh+dt@kernel.org>
> To: Krzysztof Kozlowski<krzk+dt@kernel.org>
> To: Conor Dooley<conor+dt@kernel.org>
> To: Heiko Stuebner<heiko@sntech.de>
> To: Kever Yang<kever.yang@rock-chips.com>
> To: Nicolas Dufresne<nicolas.dufresne@collabora.com>
> To: Sebastian Reichel<sebastian.reichel@collabora.com>
> To: Collabora Kernel Team<kernel@collabora.com>
> To: Paul Kocialkowski<paulk@sys-base.io>
> To: Alexander Shiyan<eagle.alexander923@gmail.com>
> To: Val Packett<val@packett.cool>
> To: Rob Herring<robh@kernel.org>
> To: Philipp Zabel<p.zabel@pengutronix.de>
> Cc:linux-media@vger.kernel.org
> Cc:devicetree@vger.kernel.org
> Cc:linux-kernel@vger.kernel.org
> Cc:linux-arm-kernel@lists.infradead.org
> Cc:linux-rockchip@lists.infradead.org
> Signed-off-by: Michael Riesch<michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch<michael.riesch@collabora.com>
> 
> Changes in v11:
> - rkcif: split large driver patch (6/13 of v10) into smaller
>    patches (6-11/17 of v11) (Bryan)
> - rkcsi: replaced devm_reset_control_array_get_exclusive with
>    devm_reset_control_get_exclusive (Philipp)
> - Link to v10:https://lore.kernel.org/r/20240220-rk3568-vicap- 
> v10-0-62d8a7b209b4@collabora.com

I believe it is the case and please feel free to correct me if I'm wrong 
that you've dropped a long list of sob/co-develop-by, I think we 
discussed that too, because of the level of change, it seems reasonable too.

On question on that, are these people aware of the change and cc'd on 
the list of recipients/contactable/agreeable to the change ?

---
bod

