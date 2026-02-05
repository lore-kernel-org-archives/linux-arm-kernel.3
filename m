Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9C4ECD99C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFzm42e76Z597KeTmPHocIarRb+BvtjOmw/0uWKVA5o=; b=0lhcOnhRb2l0JwX2xTwDQN/Kk/
	ywX/43RT0KPI8sWNST2WKTU24oim1TO7/84GweqCZU/0JhtD9V8nLPLO04V0EU3PwBlD90UsMcDfI
	+EDhUf+q3w6nDA4ZIWzudrVfyvGhodo0MRfBiClWuIXAszFtKtwTJU8Wxgf/S5M786eGfVu8cHCZy
	Nvh3XqPYHA+5acnb17XZ9wtTafPlFclc3EDlDFcBofrRWfr+xTJRBZt1r+rJPyz0mr3Fx4mrQ0Crr
	1CqppXYUdteeApEwVJJ+bEyNYNIZFkYej23A8YBq0MK3vPOL4YDdL7DoiDDs0cvB7d1oF98DH2BHu
	nH7OKKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5is-0000000ASfO-32Eb;
	Thu, 05 Feb 2026 20:13:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5iq-0000000ASf4-1lAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 20:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED25241906;
	Thu,  5 Feb 2026 20:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC12C116D0;
	Thu,  5 Feb 2026 20:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770322381;
	bh=IAMn24H4Rp07Oxy7djbelxWkI0dUA/JKZxZTOAoM1SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKbxwf2eFpBt8PdDi+UPXtwziizAJtzpRN3UClurmYnbSTzRoxtgos8f60HHnT4b1
	 ceITNGU/LoPUqMN7U0Rktsw9lC+5Mr+RO11GzD2X5DFbrd+xsuzcWUPyOiQn7zDMlo
	 otv2S7xtGHxFKIZBwRKWMA+dQXiOpZO5kf0kkKdGQ2yOQjXku2mLzzhSmJCTL8zSih
	 21ymIcSXWj3eKMFbzle8Swj76kNlLcMvF8GjQyuRjo9x5ESgy1xX0OPJC5adSaASoY
	 +yu5JP0uQDyYFBmN6e8kke1PG9ccF2Iimq1Oj7CjPzxa1AjCv3iIH1iWIcZ6BKTVWL
	 ojWAleVL+DybQ==
Date: Thu, 5 Feb 2026 20:12:56 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Debbie Horsfall <debbie.horsfall@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <20260205-vagabond-silky-ape-dc9b8e@sudeepholla>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <76da2e9b-1b57-4bd1-b577-9001d01c7b9a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76da2e9b-1b57-4bd1-b577-9001d01c7b9a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_121304_490713_51ACE792 
X-CRM114-Status: GOOD (  23.80  )
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

On Thu, Feb 05, 2026 at 01:35:46PM +0100, Krzysztof Kozlowski wrote:
> On 23/01/2026 18:37, Debbie Horsfall wrote:
> > Introduce the Zena CSS Fixed Virtual Platform (FVP) dts. This is
> > currently the only Zena CSS variant, however the common definitions are
> > included in a common dtsi for extensibility.
> > 
> > Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
> > ---
> >  MAINTAINERS                              |   1 +
> >  arch/arm64/boot/dts/arm/Makefile         |   1 +
> >  arch/arm64/boot/dts/arm/zena-css-fvp.dts |  55 ++
> >  arch/arm64/boot/dts/arm/zena-css.dtsi    | 826 +++++++++++++++++++++++++++++++
> >  4 files changed, 883 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90d88137adf1..d1d2dae6a71e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3727,6 +3727,7 @@ ARM/ZENA CSS PLATFORM
> >  M:	Debbie Horsfall <debbie.horsfall@arm.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/arm/arm,zena-css.yaml
> > +F:	arch/arm64/boot/dts/arm/zena-css*
> 
> Eeeh, this is getting more and more messier.
> 
> All ARM designs or at least all similar like all ARM FVP should have one
> group maintainers and that entry now claims "versatile express".
> 

Sorry I saw that you have already pointed towards the above only after
I responded to 1/2. I agree this is not scalable and it is hard to categorise
them at the moment. Hopefully we may get more clarity in sometime in the
near future and we can rework them then. For now, your suggestion sounds
the best approach to take.

> Additional entries for submaintainers is fine, but honestly with this
> split of bindings this is getting more and more messier.
> 
> I know that ARM is kind of "special" but when it comes to SoCs it should
> not be.
> 
> Sort out this mess, please, before get accept another platform.
> 

Noted.

-- 
Regards,
Sudeep

