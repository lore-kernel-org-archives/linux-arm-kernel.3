Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0825BFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtWmLnPN4QnCqQ/IWMLrtRtebL1fNe5ZZfybv4/p+q8=; b=FZGG3FZV3GOUmxH/6N36gM/eIn
	ExoMmCnIQAf2I+5qujn3GkQfP5dZy3/0lfWDKMLCzLSXPtwGUIygMBXLq9lV+orbQydtgK85s6hU1
	FbTWjpptEpAyV/thEgGLsWCN+JbUhLgzXA8gp/OOnWR0fjgJ+x8aCmT2LX0QCBryf6/cjvIyDsEw0
	z8yGcyfz80s3/H5EbeOUgPQ1EnD1dlVrqY+Yb2dPwJw8Sq8w9NWu5wzYtrbxMYrTHHrAOWs90y4xN
	GiKAOCqOHeGjLqM04uO88B0RRyYYn6ChbTzW9dgLQoIyVRRLN90lCTermlGTBVdj7fXizy3f1XxXr
	sc4VPOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHMs-0000000GbmX-3ePp;
	Tue, 05 May 2026 15:07:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHMq-0000000Gbla-2Cap;
	Tue, 05 May 2026 15:07:25 +0000
Date: Tue, 5 May 2026 17:07:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777993641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dtWmLnPN4QnCqQ/IWMLrtRtebL1fNe5ZZfybv4/p+q8=;
	b=BxvctZ7lAhUq26ygVI+U0SLQPVxx6jlTano3sCjyLWTgRIYPnfc+9lCzUzPMCHMmy+jOd7
	Atz286wW20YIF/U61MsrvRCCV1pDoyBnVUqkdZPR5XJI3JOrWEGnsq0zhJDB+MEY/KwQEZ
	4EjaBwMJ5PG05ZcS3FbfXk45+kLmn7w9/pbD2nF1B/pbSnZp5WjhOjfduDrBqeMmaPT4pN
	vre/MtaEKL7hD70W7MjMMMm93atECpFodu/wOqvaUfVqi1+zV4BX+3j3HXD6oparLa52pz
	Ji0/eFspMXug5dBC6wqbNumSz8U/TFX527mm6JJBcrtXeNOAAFyOCuxDlLl39A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777993641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dtWmLnPN4QnCqQ/IWMLrtRtebL1fNe5ZZfybv4/p+q8=;
	b=VX0aSoh/Ovgukr8ZhUVsJfyUm/RUc+feGJBtPwB84Qkn5bq/oV0pUAi5uj3Kyg4JXem7Yk
	telo4+qbw6v0//Aw==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: broadcom: bcm2712: add
 bcm2712-firmware compatible
Message-ID: <62cjph3247lcm54usdkgbc2oy6ubdqcg45ovtscgb3qkjayltr@6mvx6dcycyyx>
References: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
 <20260505-rpi-otp-driver-v2-4-e9176ec72837@linutronix.de>
 <6155d6aa-5e66-4043-a7b2-da447548056d@kernel.org>
 <64af1e4b-0cf6-4288-a3ee-f65fc9e14e94@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64af1e4b-0cf6-4288-a3ee-f65fc9e14e94@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_080724_702778_9CE55397 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, May 05, 2026 at 11:22:54AM +0200, Krzysztof Kozlowski wrote:
> On 05/05/2026 11:21, Krzysztof Kozlowski wrote:
> > On 05/05/2026 09:25, Gregor Herburger wrote:
> >> The Raspberry Pi 5 firmware exposes additional features. Update the
> >> compatible to reflect these differences.
> >>
> >> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> >> ---
> >>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> index b7a6bc34ae1a..7283078fd441 100644
> >> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> @@ -46,7 +46,7 @@ power_button: power-button {
> >>  
> >>  	firmware {
> >>  		firmware: rpi-firmware {
> >> -			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
> >> +			compatible = "raspberrypi,bcm2712-firmware", "simple-mfd";
> > 
> > This breaks users without mentioning and without proper reason.
> > "Additional features" is not a reason to break users. At least not
> > without explaining the actual impact, but even with the impact IMO this
> > is just wrong.
> > 
> 
> 
> Heh, and you ignored completely our final comments in last discussion.

Oh. I actually had it in my first draft, but then got schema warnings and
messed it up somehow. Sorry for the noise. Will change it to the fallback in the
next version. Will send a new version with the suggestions from Sashiko.

Regards
-- 
Gregor Herburger

