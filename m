Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDB9D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=; b=vyCsWbOat7HfmUhalqM9JUV7un
	yGMvzuTVk80nEugM3IrRbW10NIZgn/USMzeSHREpyGZ7Zo52AuMJOe6XhXKGFB7bTPcBa0mmvRtPk
	EL0L8CjUB6dLX4opkA79j0S7yCafkEg/OnMuG4IJKq/e7RyBuUlhnB3VtRUOetAFvUwUG369Y4Dmd
	R9Jvm6qMIiA3tI4iq2kIKTFhAVhqjl2ag1O9pLD6xeBOqrJM7ZrKYEjDIqfICIIJhvTR3mbugdAU7
	MEPdfnNnQzljFr5yk1KFkjMljFGGzx3keJkbkHK+su85UyOxwpGjhE368fAazQByvrx72td9sxEt4
	wTgmn0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA5f-00000003jHo-1TvW;
	Tue, 20 Jan 2026 11:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA5e-00000003jHT-0Ooo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 11:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=; b=qoU357eWTGumiaskj70f08Viw3
	+TBsZyQTvHRjNXsv09h5WjwucBQQYYDb7wS0esNOhaI3R4vEE6wboZK2doF4xW3T2mdbLnQ9Q/IbH
	8ZztyyWBbATJOhcHXoMTA0xVgdr3ytrdXobFpv7k8zYB0coug6qA4OFjnS1RyiLtQJypEp9ARHccM
	nGdI3LiHqjgvybrIppq1KzR87xAQOBN/9aARG8b3fP2s5HRlxwahgtkaX/IuvAATcNudRxS5uXxIS
	WHjjG6BYsuFzaKwfmMuofQXC3uDG7FiqsBWxfiICQ5xmCmEaGIsdNcmvxFjx6Yta3+oVBb8BpoJm2
	UvZ1dylw==;
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA5b-0000000Dw61-13OL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:40:04 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso1356111eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909201; x=1769514001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
        b=c7J5Rd9IPmCPInQEN9rNX8GpTC0xNK8sI5BInaXGYpwWIk1dvu3r9ohz4Y0mQFdqQt
         /FHrzCQz96hD0KDINAouQavGUM6jd4RzBYJC0mr6V0Sy2BEFSzr+HiwG1sRW7+4atUdg
         mlune4VmdgzWzcwP+ou1sXoQm4sKeEMZNn+UFzRxCFpAqFQOyPKd3VAuV9V6TNnjwyZq
         OdwPo3Uia8la7Z6sLnwjS9P/7c3MPwJGF4BKVdjMwQp0KWZRL8L+e6FvqOeSxqKBfe1C
         OTb6MFdYYSJbn92bZsVIcCdcGcBQ+TUMYpl/ezZ6y730qYxRwGcXZtHzSPCARfRsZJIe
         yh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909201; x=1769514001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
        b=nSM80+1jPsQjqkx5t2jHnpmM86VhxWddPKxMV7j7zl7jVipjCmIXpeDFK1rV+eIWar
         EKi4IqwYN8pbH2ZDtbsqI2UqnIp+mlypUoVG6Mz1IvJSZewMJL/9yg9emlEHT5gxb3KS
         Djf1bh92A5YS1GrxMfMOOiktTBZU99aD63iLrHmRzlo8UzPWATTYwoFmGeUb5UUZymb6
         5MOD4v3Ih3dVYJv/W+W+hVvs9DX6h3HWSYUuq8zqnIi8cpsCNiI1bRTT3U0xQiZvcm35
         xGrLy2tXi/knnlX/258LUainK0SRY72mO0YaEc5UL1NJ3h1/up9awdblEZw6GfhGkBZ5
         W4KA==
X-Forwarded-Encrypted: i=1; AJvYcCXSqzR2lBROTaFT5SXGXd3/sTf9+S0O++dCm1lglS/qle5x9UI1+F+wVXaqADstb1gxDDQ4Qx06DpyTmMisrbYC@lists.infradead.org
X-Gm-Message-State: AOJu0YxEfWY/zNwmMOUnohHYOWc/MbXsFgkuJE75vplUQr+0w2yLv3xC
	IKKmeLuXzaatBjyHQV28W4N7mjjlYA6+aOtv00nGyh75cf+8DD80HEhy
X-Gm-Gg: AZuq6aKGI/s+vUvvP+SowjCYsI6+eIEBt48MCt2AKPYXdUFlSaFVxhsxA1xi/RSiINT
	nAyCEDp3yxXFFnPBSlvpfkQaAJLLmExr8g9abenuGpfkqrscHlEkNNi+aOPJJjB2Qs7OaS1ZDNm
	Pz7ZPWXKbCqZcpjOti//Ecw1dIZIC33Es8nH2HkW+WA3nxhz+9DxwinWJJykS0r21RD7bIPLeet
	7bfuRrcQpkWs2EVDrhY1sur7upbUu/zjYJ1gCxyyC/DL7KG3viqCtAog7JVLORAQFbKwXjfc78N
	ObXBKACevOjUh51r3jbRwazb5OGG3q0BK61qqrrnXUw2KyWU1PvSMBjSgeWbyCBbmbn8GSEiL7s
	w26FduIv0qDUkrLrjG37G5CJUM+KWxT4BqmK9yRyLSYeZDv0Fswk4nsMfTKUw58L7Y8K4Yq+lLK
	80GUUpuP9fJQ==
X-Received: by 2002:a05:7300:2315:b0:2ae:5967:db5d with SMTP id 5a478bee46e88-2b6fd746cacmr1048269eec.13.1768909200775;
        Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6beeb4b9csm17558900eec.30.2026.01.20.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Date: Tue, 20 Jan 2026 19:39:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <me@ziyao.cc>, Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit
 K3 dwmac
Message-ID: <aW9ou-lsQQ5dVzqW@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9fL7r0AM0flALJ@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_114003_418607_F0D7C1A5 
X-CRM114-Status: GOOD (  25.41  )
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

On Tue, Jan 20, 2026 at 10:55:43AM +0000, Yao Zi wrote:
> On Tue, Jan 20, 2026 at 12:36:06PM +0800, Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
> >  .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
> >  2 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> > new file mode 100644
> > index 000000000000..58dd98f79e8a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > +  clocks:
> > +    minItems: 3
> > +    items:
> > +      - description: GMAC main clock
> > +      - description: PTP clock
> > +      - description: TX clock
> > +      - description: PHY clock
> 
> Why does the MAC require "phy" clock? Shouldn't this be handled in PHY
> driver instead, or I get its meaning wrong?
> 

IIRC, the "phy" clock is used to pass the phy from the mac core, I will
double check if it is possible to connect to the phy directly.

> Also, I don't see "phy" clock is acquired anywhere in the driver. Is it
> really necessary for the MAC?
> 

This is a mistake, I remove this by accident, if it is necessary, I
will add this in the next version.

Regards,
Inochi

