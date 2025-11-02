Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5167ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86YZCJ5AnWudRKtVDP3aEHGusZb8fl4oXMhn5kTgedQ=; b=QngsjrRNFnhvcwrAWeqMvo2MqN
	QLsnPMKm9iOrVssbafujUjMdchP2wkBJU5frb4oz5nbxzrBY45s8CS97VoLhKMLt3isDru5t3dC8L
	h2E1bUsnaQQc7WbA8EBzy4UiXskU0fHK9p5VOSRnZJxARGKMDLXriN6IjQeWsNg3LdtJWnIptYCpp
	/DiQZXgZRjnG+2n2S35ohIXAtj4NhIvJgopVLNYYHXvmF7Dc/xnREtCFd9LO4lFPymfuTBmY/p5lS
	xJRE+QkUGHO7JgdXIRExgJI0l7wHAu2MdG8712P92eFJpopN0hF3nEQDCBUXnyBCR0JCB+pWNxuT9
	mSbdkGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVy1-00000008Utv-0W0x;
	Sun, 02 Nov 2025 11:09:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVxy-00000008UtV-3iTW;
	Sun, 02 Nov 2025 11:09:48 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DEFCEA98;
	Sun,  2 Nov 2025 12:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762081671;
	bh=2lVVhBbpubNaDFhGqgi+wPk/IWnaTCWLwy0N7I/rbXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4n1d71biUOjL5y9lMdwjwzMNigtVVwx/0BGWXY9ruKy7eFJhuqndjTz3rUndX5BX
	 26Slvi2Ss5TI8vO1uoeB3nHQeCzdwHq9NsguRTrl6mFmo+ASx1uotKqdnbcs7Is/x1
	 I5JCNgRC/Qj6BWSYaO2I3hvt2kl3mC56B1naAiL0=
Date: Sun, 2 Nov 2025 13:09:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias
Message-ID: <20251102110929.GL797@pendragon.ideasonboard.com>
References: <20251102002901.467-1-laurent.pinchart@ideasonboard.com>
 <39257a41-6719-4daa-a979-a9c2a629ec24@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39257a41-6719-4daa-a979-a9c2a629ec24@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_030947_264554_D09E8DD8 
X-CRM114-Status: GOOD (  27.05  )
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

On Sun, Nov 02, 2025 at 12:58:46PM +0200, Stanimir Varbanov wrote:
> On 11/2/25 2:29 AM, Laurent Pinchart wrote:
> > The RP1 ethernet controller DT node contains a local-mac-address
> > property to pass the MAC address from the boot loader to the kernel. The
> > boot loader does not fill the MAC address as the ethernet0 alias is
> > missing. Add it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > index 04738bf281eb..fa438ac8c9ef 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > @@ -10,6 +10,7 @@ / {
> >  	model = "Raspberry Pi 5";
> >  
> >  	aliases {
> > +		ethernet0 = &rp1_eth;
> >  		serial10 = &uart10;
> >  	};
> >  
> 
> Unfortunately this does not compile:
> 
> make[1]: Entering directory '/rpi5/kobj'
>   GEN     Makefile
>   DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb
>   DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb
>   DTC     arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb
> /linux/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:12.10-15.4:
> ERROR (path_references): /aliases: Reference to non-existent node or
> label "rp1_eth"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[4]: *** [/linux/scripts/Makefile.dtbs:132:
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [/linux/scripts/Makefile.build:556:
> arch/arm64/boot/dts/broadcom] Error 2

Ah indeed, I've only compiled bcm2712-rpi-5-b.dtb and forgot to test
bcm2712-rpi-5-b-ovl-rp1.dtb. My bad.

> I've made following fix on top of your patch, but I'm not sure that it
> is the correct one.
> 
> Andrea, could you comment please?
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> index bbad90d497fa..734b06ac5ba2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> @@ -9,8 +9,7 @@ / {
>  	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
>  	model = "Raspberry Pi 5";
> 
> -	aliases {
> -		ethernet0 = &rp1_eth;
> +	aliases: aliases {
>  		serial10 = &uart10;
>  	};

Adding a label to the aliases node is a bit of an uncommon approach.

> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 9f1976f0fd1a..26a99e72d441 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -22,6 +22,10 @@ &pcie2 {
>  	#include "rp1-nexus.dtsi"
>  };
> 
> +&aliases {
> +	ethernet0 = &rp1_eth;
> +};

We could also just do

/ {
	aliases {
		ethernet0 = &rp1_eth;
	};
};

and drop tha aliases node. I'll send a v2.

There's a side question of how the boot loader should pass the MAC
address to the kernel when using the RP1 overlay, but I think that can
be addressed later.

> +
>  &rp1_adc {
>  	vref-supply = <&rp1_vdd_3v3>;
>  	status = "okay";

-- 
Regards,

Laurent Pinchart

