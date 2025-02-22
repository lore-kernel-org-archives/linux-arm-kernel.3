Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEF7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd5waWu6Z02b7lT2L3RgwjYEybluLidOKnWnRtbDL2Q=; b=OTEcbjK3kpfYgpouknH8L8sGc8
	1l0gsDvi1wTmyiYVDrfYJZkwPszWfrtiS9COhBoK/DxZBEBY6n65zbws/p8eEARar/SGhVm6+uOzx
	681GF3oHMm6dDQnOSaunWkSWa5lrwk19h/hbsgbiJVptefdG6V0MAPB4heYvv8lSGoR8V32oREysv
	oPXUNOFEGUZN7GYfbYld3w9993lzRL/zZ+USMm2m4V9tpPHLsluN0XE9RgzjZW1i5sQi5Z+ftl544
	xpNpyUbp3oB5mB/FmEtm0YMiQwEPAj+AVNGaVoieG7GzLh5fL2dPmvQk0KD78G+M7nDPUFJZuF7Kk
	a0Tbo20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlikC-00000007Vp6-05rn;
	Sat, 22 Feb 2025 06:12:08 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tliii-00000007VYS-0J1B;
	Sat, 22 Feb 2025 06:10:37 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 946298A0A03;
	Fri, 21 Feb 2025 22:05:33 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 7AF37160036F; Fri, 21 Feb 2025 22:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1740204333;
	bh=Yd5waWu6Z02b7lT2L3RgwjYEybluLidOKnWnRtbDL2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMr+mxnGFLr8vi+1LmKsgBNc4ydYXyV9PROuwVCoPciB/ZQwaaeFxmgklS+4/1T6L
	 KGatAo5ZdYNb31wh0xYSNmngvMN2Y3XzEozbhSjnBo9hoFAWjk69GKNO50xAys2hIO
	 CyVrqbznGhvSyM5a/zKNURg7cz1vcjCyONQSrNEk=
Date: Fri, 21 Feb 2025 22:05:33 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
Message-ID: <20250222060533.GV16911@sventech.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
 <20250221231340.GS16911@sventech.com>
 <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com>
 <20250222043632.GU16911@sventech.com>
 <CALWfF7JWiZnqJCAqCK4-TjVuUTqv96+=u2pC2iNvTbCBOCLuqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALWfF7JWiZnqJCAqCK4-TjVuUTqv96+=u2pC2iNvTbCBOCLuqw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_221036_232986_4B31110D 
X-CRM114-Status: GOOD (  18.11  )
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

On Fri, Feb 21, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> > On Fri, Feb 21, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> > > On Fri, Feb 21, 2025 at 5:13 PM Johannes Erdfelt <johannes@erdfelt.com> wrote:
> > > > I'll also see if I can give HDMI a test.
> > >
> > > Please report your results when you do. This is one of the differences
> > > from the Orange Pi 5 Max. The HDMI1 pinctrls does not use the default
> > > pinctrls like other RK3588 boards (including the Orange Pi 5 Plus).
> >
> > No luck yet. I do see this message in the kernel logs 8 times at boot:
> >
> > [   41.552751] rockchip-drm display-subsystem: [drm] *ERROR* failed to
> > get pll_hdmiphy0
> Oh, I believe you're hitting this.
> https://lore.kernel.org/linux-rockchip/0dd48599-448f-4472-9a8a-54b7f0379c13@collabora.com/T/#ma4eb427de77b5a4806a2c2b5bef2fc8d4003f801
> 
> I included that patchset in the integrate-6.15 branch. I don't have
> the problem on the Max because it has both the HDMI0 and HDMI1
> enabled. However, with only HDMI1 on the Ultra, it's not handling the
> disabled hdptxphy0. A quick hack is to also enable hdptxphy0 also in
> the Ultra dts.

That was it. With the last patch in that thread applied, I get HDMI
output.

I'll see if I can figure out a setup to test the HDMI RX port as well.

JE


