Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AF4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O79Q8up6Gy2hEMjnQITer5PbKSEwN1Pzj/8/BV+JwL4=; b=xbWoM6Qryfiohadd3w1diwLw4O
	EpNlFVbJMFGlAnhEac2waEFnohwzJmuBDfCRtArHEQ1iIiKSro0WSJmjDaeqsTMf4aAYCEafeydxh
	M/C88iW4heyTbT6s4oTRJw9lgXGVpBedHWGVdA9WCqFerDZruYkofjzg78VdXERNLnZ2Q7pVbX1/+
	MSbkE7w58+NkQDDTIHl9DOss3k2HbmUVJnR3NgRiNyl4kw03ZhsAEvyI9VMafitMgzjFEvXHY+9Td
	pGSl4W7eVL0pCLEk2aHsgZDLSMhuqLUuan8vmg+cXge/VgTrYuGTjsSaoU5opQ9FmAgG/AbVTlJTq
	Mr3QU4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sKr-000000009ks-0R12;
	Fri, 18 Apr 2025 20:29:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sIu-0000000098V-11i7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=O79Q8up6Gy2hEMjnQITer5PbKSEwN1Pzj/8/BV+JwL4=; b=eXr9MTqdlq9ohs6A/9h4SUfc9g
	URu7Pe6Rtniim9/50hbZjCEspUSIRrZO5c9vO9opoZKrVynLKH9QDhASi6zX8s/JuB2EXl8pSjeFd
	4uRDz54ZFiqqTWqM6a9mWuCLl3uFlJ1Ac970YA9oSySo6C68axjiaA/PpkNPO9mijY90=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5sIZ-009wCP-5d; Fri, 18 Apr 2025 22:26:55 +0200
Date: Fri, 18 Apr 2025 22:26:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <94075f0a-6e17-4106-879e-3aa5193f9ef2@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_132716_283671_9ACDDBAB 
X-CRM114-Status: GOOD (  21.61  )
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

On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> As discussed [1], the comments for the different rgmii(-*id) modes do not
> accurately describe what these values mean.
> 
> As the Device Tree is primarily supposed to describe the hardware and not
> its configuration, the different modes need to distinguish board designs
> (if a delay is built into the PCB using different trace lengths); whether
> a delay is added on the MAC or the PHY side when needed should not matter.
> 
> Unfortunately, implementation in MAC drivers is somewhat inconsistent
> where a delay is fixed or configurable on the MAC side. As a first step
> towards sorting this out, improve the documentation.
> 
> Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/ [1]
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../bindings/net/ethernet-controller.yaml        | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 45819b2358002..2ddc1ce2439a6 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -74,19 +74,21 @@ properties:
>        - rev-rmii
>        - moca
>  
> -      # RX and TX delays are added by the MAC when required
> +      # RX and TX delays are part of the board design (through PCB traces). MAC
> +      # and PHY must not add delays.
>        - rgmii
>  
> -      # RGMII with internal RX and TX delays provided by the PHY,
> -      # the MAC should not add the RX or TX delays in this case
> +      # RGMII with internal RX and TX delays provided by the MAC or PHY. No
> +      # delays are included in the board design; this is the most common case
> +      # in modern designs.
>        - rgmii-id
>  
> -      # RGMII with internal RX delay provided by the PHY, the MAC
> -      # should not add an RX delay in this case
> +      # RGMII with internal RX delay provided by the MAC or PHY. TX delay is
> +      # part of the board design.
>        - rgmii-rxid
>  
> -      # RGMII with internal TX delay provided by the PHY, the MAC
> -      # should not add an TX delay in this case
> +      # RGMII with internal TX delay provided by the MAC or PHY. RX delay is
> +      # part of the board design.

This looks good to me. There is nothing here which is Linux specific.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

