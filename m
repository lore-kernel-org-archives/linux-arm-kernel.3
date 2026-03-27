Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BFD10F285E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV6E9yjY+PcJxkfGX/VZyyMBIRVFPjQlBGDGet9H4gE=; b=oiJrr3OU2XrBz2fa3s7SQRJ5Lu
	PDn4PpURk23m1jYZw66SG7u/oJIGbwMmJMd+EchNcwhm2UJSZyYBPouVtjCnR6I2/tYzP0yaMDKbb
	QFr036TTnT+apSXLmtagQgKcQYHEDvzrx5uiqyQTXSbuz1G4DOhUVOOrSgn9LJKFBq7aeSvXa/FRk
	7BvCcujYOuRHImj76eg4C7NaevCZNHqiD4yWZh82b73nuus5EDN/eGkOpLQ4lchHWOG0vpPRFQYJn
	XHwNBD4Vb8vt/USCMDce4Lwo/D+iGEzRWmxNznFG26LuCMc5miJkLDgMSt7GKnrOWY1MUBHoAm/bG
	+l8xQF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ana-00000007qet-3Pqu;
	Fri, 27 Mar 2026 17:16:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AnY-00000007qe2-0yuO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:16:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so23033955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774631798; x=1775236598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vV6E9yjY+PcJxkfGX/VZyyMBIRVFPjQlBGDGet9H4gE=;
        b=sV5+6Miz2phnrpsiR+ZY6Ym7PtGBzPgLIlIAG9P+ai8QoueYkji8grzMMyX+aXkscQ
         0T3OUNuHeA+X4nKmRi2JlhSEzC/P9uBonokGyvdE+NwMllfPDRxUSrjmMZiB8cnnm8Gr
         rt5NJNTP/GKmaOcNBzDJklTMvYK4HyjrRHbZYA9a3JL5lCytBxz7litd+nlEjLO4LvM3
         r7uS+SCOnrzD9V0Q8HiGLtfzU8dwXXPgzXr3WpMRU164H2Gg7U9BqOh9p7rvM1zIbbn5
         YBNjffdqFZp8C2KTdT4LhrSOpb4+cK0b/plM7b1J343kDR1FIPHV7w5zQq4rws+EeS4A
         u/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631798; x=1775236598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vV6E9yjY+PcJxkfGX/VZyyMBIRVFPjQlBGDGet9H4gE=;
        b=OKeLi/P/BqDETxcGYDY/0xBgef/PGWfq80HOLzSa9Odib6HzJkSa0CNYz2MmzZR1z3
         +7BMcNmtfkaJe4dLlL3HtUUN0HqXGVmI+Dsaz2jsqjRqVxgwRQk6HMO8NmiKjXQduXLs
         75O5gz+HkMcn5jE+sIdaImA66+Zj2wO1LwXYi9wwvNhcnGDhhd33UR5lYXJk9YA/DWq0
         /dHgt9yXfRkKJ9R06qDORCqhENOxC44Bt2wtSv+5oPLJRQvePgoJzHi8RaB75yj+kpC6
         FCz25NQXF3Zu0nLi4VtVW751Z1gbbaXntCcmeCLEFZXIBOTEK00+7gmDRZx8Q86siKTq
         NGnw==
X-Forwarded-Encrypted: i=1; AJvYcCW1U/Ig8doLTy8uVIohfH/cgkfAkyraoUotO+zKTnOXg0xAn8abckyMz8ruLrB6es/eu9IMK8OTTfmrs4KcmFsE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw50h8CPV4S/XgKtQjAl/HDGpeIjexXWWR1k2An+DoOYVxKvjE8
	plRtDjpQhIzpUKcrSnK2g3uiGVlrAMOX8R9eAlYzYsviQGcxBIMM4i9T
X-Gm-Gg: ATEYQzxB/5oxKGP7hRWMuqMpTOwxTICmJlfdNbJPgBVjPB0SXwF8tUJB9s/Ts84eya1
	NxIscZvNaQUOaKyuR2i1LmJHMDRTOYUVQg8jArkYltMYTlZtQKBPpdoh268eBThbhfAUGtpO+qi
	d2EL804ZKllieJQxF018fXPwsW7jRb3hWgWtcn8axmauilWGGNWPgMbDQ2PE0TnPyOyNoK4HbtO
	xhOkLT7FddAFbOlEdT431vNHXfN18ojRshQl4bcnej87Bh8wXo0RCa0SyXox5AWT9JhRJ71WiBt
	o/DMe0tgUevDun/L7CpnrfA6R4okbf43RndZX+FH6VVugyHswwW7TxJhXB4iorkzWK8cibvv0Sb
	vv2BuFGDtCbz/lBOW+ixp5yd4T2T0WcPhzrzOVUveINvDMbNXwsyEC1xeC3x9kAQgevZIKpCPU8
	V5bmvlqT7N/NMNzQsa1McwYHbKImwkpe+JksyLoX3uC/C3O5qE6zsdDOuVNEKibv/7GoCUfSMES
	TNymeG33yFqrTTQMBYANIhCyOhBn6HTztPtZF73HF8=
X-Received: by 2002:a05:600d:1c:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-48727ec7681mr45535245e9.21.1774631798048;
        Fri, 27 Mar 2026 10:16:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9e85fsm34322455e9.1.2026.03.27.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:36 -0700 (PDT)
Date: Fri, 27 Mar 2026 18:16:34 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <aca7ckVY9ure8Cwe@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_101640_295048_597D9C1F 
X-CRM114-Status: GOOD (  15.98  )
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

Hi Frank,

On Fri, Mar 27, 2026 at 12:51:25PM -0400, Frank Li wrote:
> On Fri, Mar 27, 2026 at 05:32:43PM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > RGB_SEL controls the routing of some carrier board lines on the Sonata
> > board. The two PCA6408 GPIO expanders depend on that path being enabled,
> > so describe the selector as a fixed regulator and use it as their
> > vcc-supply.
> 
> Does below resolve your problem?
>  https://lore.kernel.org/imx/20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com/
> 
> So needn't hack select as regualtor
> 

Thanks for pointing me your patch, interesting improvement!

Actually, in this case RGB_SEL is not meant to model a selectable mux
on the Sonata carrier.
On this board it must stay asserted permanently, otherwise the
downstream path to the two PCA6408 expanders is not accessible.

Modeling it as a mux might be confusing for users of the DART-MX91, as
as it would suggest that the routing is configurable, while on this
board it is actually fixed.

Best Regards,
Stefano

