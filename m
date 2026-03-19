Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBC51091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1WNWhIO3YiBXIdvt4jOGaT6noglgn3Bsi2PS9Y4M5g=; b=lFz3HwAun9zfEOcesGEyxV9w2U
	VFpjJ/iQZKkS48rP8m9yVtC4aylze0NeSZmgjn1+bBaEwV5a+cbaUdA9D51XBKP2tlWvcm8/dgQ//
	E33kFSsHEO5mLxK1Y9svanIF9QOcN6G+Yf5f/Oamk8BsjRlPHPqPjynxlH+bN1uqc5kelcIwzq48a
	BxjSc2uZnAFYEDgEM3Ni3UljRJI8dYFhr+kwh1XJN+PFIYXc0tb/1JUm3nzDXzYUoAgH31qzMbe/L
	rPqZpBkTIsva4ws0zVVs2zWS1PVW4kHAGuJQIVPgzwZiluvjGeX+Xar4gai94d51FTA/rGnmWX5J1
	n48sF7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hrw-0000000BHSp-0kTw;
	Thu, 19 Mar 2026 18:13:16 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hrr-0000000BHPD-0o6I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M1WNWhIO3YiBXIdvt4jOGaT6noglgn3Bsi2PS9Y4M5g=; b=dBZo24Kqd4fO2wKVlBncyVhcwq
	JCABMSHnPWjcMfSW5UU/9SsoyEkjOdxiFyTO00AB4TLM3O3SK1fqkBUWvH+aE2u8cS933Pr+SPseC
	u5B4eMdnIN/VIpyHT/O97dqW4fxxCaAKD7j5+m2UQLjIyv+PIbB9dyuQGDoMcxBOocVlMchEa2pAa
	TgPD5yowf/CHyL8/URPwKmLm7JGHw3z1FVIBFYEB+i8gaLCl/ckqX074lmXBumsPqZGGsXld6eHO+
	QiYnIfSVMS6jG+mcRq80HuYKnzPzxayqE7kEMW/pfAbzafFPnQiQSUFDXyUXwxxGYVpgMvOSyC1mi
	B9A2/gug==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Hrn-000000018rt-3cwE;
	Thu, 19 Mar 2026 19:13:07 +0100
Date: Thu, 19 Mar 2026 19:13:06 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v5 1/2] pinctrl: sunxi: pass down flags to pinctrl
 routines
Message-ID: <ofzcfuc2ueuxpt2bvknqui4jirvsfo4u53hkt7eqptdrl2uo6r@uv4ldiyzxljr>
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
 <20260319-rc2-boot-hang-v5-1-092834a882b1@mmpsystems.pl>
 <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_111311_573429_93E5459A 
X-CRM114-Status: GOOD (  19.06  )
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

On Fri, Mar 20, 2026 at 01:42:18AM +0800, Chen-Yu Tsai wrote:
> On Fri, Mar 20, 2026 at 1:19 AM <michal.piekos@mmpsystems.pl> wrote:
> >
> > From: Andre Przywara <andre.przywara@arm.com>
> >
> > Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
> > which the new SoCs (A523 family) need to use. We now have a comfortable
> > "flags" field on the per-SoC setup side, to tag those quirks we need, but
> > were translating those flag bits into specific fields for runtime use, in
> > the init routine.
> > Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
> > some of a boolean nature.
> > To avoid inventing various new boolean flags for the runtime struct
> > sunxi_pinctrl, let's just directly pass on the flags variable used by the
> > setup code, so runtime can check for those various quirk bits directly.
> >
> > Rename the "variant" member to "flags", and directly copy the value from
> > the setup code into there. Move the variant masking from the init
> > routine to the functions which actually use the "variant" value.
> >
> > This mostly paves the way for the new A733 IP generation, which needs
> > more quirks to be checked at runtime.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> 
> Please carry tags forward if the patch is unchanged.

Will do. Sorry for ommision and thank you for quick review rounds.

Michal

