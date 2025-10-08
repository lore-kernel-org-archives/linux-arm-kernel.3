Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFABDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/Y2E1UgoFPuo14z4SJwSxhBGld0OIJxqnM8ZX0s/uk=; b=WfY7hMrTm0UzXP4EysaXYQf7Kl
	bgAOOsWDZ7pJbueHDHBG7WWuJ9dwcnTk3ExO0bM/aAa/1mn+vrYddWRP+AM2jbOmXjGZfRKHQathe
	rFZQBIB9c/4bCOnVeONplzCLHoffI18T7aFN26SkvYK7C+ibmx2/rFf45xyxwQ+0xwvxw08PDBl0b
	6HczPiKYu7r3wyVcJJMNdL5LONKtg/s1XqVRuWgeqStTWFhMtZvYf8W/SPTiN5jCUHJVX/nRV563m
	DmPm0Fcg53IpRMXT6nktyKIMr1s7DQvIPOZTrsBzMROxN0aKn72UCKh8PEUIWZljxtOGvxVzoE4AY
	t2JkwMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PKK-00000003QOQ-3jPJ;
	Wed, 08 Oct 2025 08:15:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PKI-00000003QMw-0auf;
	Wed, 08 Oct 2025 08:15:11 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECADF191B;
	Wed,  8 Oct 2025 10:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759911212;
	bh=tsaypD/DbPUWMTuZH0R026MpaDXXQ9sm7bRAfALfNJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAfJD4JJX4a9In7LufZltWn8J6npzIvGlDXb8HmftJmNA76CuiIxrgz/njxp20d8K
	 GNr2kd4pjRvwTA/siGW+bAV5KVcHpZKiTYDg7SfoG/iSj3uAws7iQp1vlhdlysevgg
	 e2WMrb9xIBgf3L3Z6hSJW0ivjPCz6Nz17WipET/Q=
Date: Wed, 8 Oct 2025 11:14:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rk3588-dw-hdmi-qp: Add
 tmds-enable-gpios property
Message-ID: <20251008081459.GF16422@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
 <c5kwmvu3j72evbgdmjn6qn5nqx7ywbiwpzhnpeh6hjjhbz5vwo@jpe3onblwhmy>
 <20251006162518.GJ5944@pendragon.ideasonboard.com>
 <d423560e-dcd4-45d8-a1e4-5a8b2a21ef86@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d423560e-dcd4-45d8-a1e4-5a8b2a21ef86@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011510_347960_C126E265 
X-CRM114-Status: GOOD (  16.13  )
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

On Mon, Oct 06, 2025 at 07:42:56PM +0300, Cristian Ciocaltea wrote:
> On 10/6/25 7:25 PM, Laurent Pinchart wrote:
> > On Mon, Oct 06, 2025 at 02:19:24PM +0300, Dmitry Baryshkov wrote:
> >> On Mon, Oct 06, 2025 at 02:55:37AM +0300, Laurent Pinchart wrote:
> >>> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>
> >>> Add an optional property to RK3588 HDMI TX Controller binding describing
> >>> a GPIO line to be asserted when operating in HDMI 1.4/2.0 TMDS mode and
> >>> deasserted for HDMI 2.1 FRL.
> >>>
> >>> This is used to control an external level shifter for HDMI data lines.
> >>>
> >>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>  .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> >>> index 96b4b088eebe..eec0d40c91ea 100644
> >>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> >>> @@ -113,6 +113,13 @@ properties:
> >>>      description:
> >>>        Additional HDMI QP related data is accessed through VO GRF regs.
> >>>  
> >>> +  tmds-enable-gpios:
> >>> +    description:
> >>> +      Optional GPIO line to be asserted when operating in HDMI 1.4/2.0
> >>> +      TMDS mode and deasserted for HDMI 2.1 FRL. It can be used to control
> >>> +      an external level shifter for HDMI data lines.
> >>> +    maxItems: 1
> >>
> >> Just my 2c: since TMDS is assumed to be a default mode, shouldn't this
> >> be a frl-enable-gpios instead?
> > 
> > I don't mind either way. Cristian, any opinion ?
> 
> No strong opinion either; we could go for Dmitry's suggestion.

OK, I'll flip it.

> >>> +
> >>>  required:
> >>>    - compatible
> >>>    - reg

-- 
Regards,

Laurent Pinchart

