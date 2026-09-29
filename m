Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700D6CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=; b=NtoIiRYucTCaadMo5q88Rk8fsr
	pjSUgLT4HPcG6IFZ9uHGbIlkbSy5Uu7Qc2ElEOP1iNT7Df35TlCIF6Dk9Er3jfTJj2dHDrxmnuj3d
	ZkxTLm15PFZu05wlyZd+FnNVhUO7RcdVL46ZjtnQ/mNaNSOoO0T1IX/K63lbHA3f7iE3Uga+pWMQG
	NZq0t/bIRJE0uX1T9WC+QuVE2y/iQYkE1w9WnEcsEJP69q2U64Z9PvS1BBYEury7wwJC/bigC4djd
	lf2sF8cpPFA9k/jdKrCDpWd0rC+QfZPU5qHwXYixyMh96YA17pUJvFdyiWQErjxztVGVhY87O8NqI
	89BVt7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBULX-0000000301s-0suv;
	Tue, 29 Sep 2026 09:41:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBULW-0000000300r-0Eqi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 09:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=; b=HzDoTg/eLG83Gqd3TZKwe0VhCU
	zvN3PzOIrn/jGHBbowdANjIK3tdt18XibT+IXZiCWIk1Vmx1hX5qMmC95blCG337omw0yiFU3Mytc
	nYfO6e+dtAP9pK75D60IUvOBlcza65AGcR5V/UkcuYK5idfBJoFbxs1hUojHvbKrAU5uglYxiSYlc
	tLHoYBeDL48TGmk3EcvC79O6XJxj3rv/fTwj1DVlpfdyvNBYc1C53RV9sUp2q1Q3QuECbIjqdvgTS
	oE29XEQc4ASj7mQkfzCKlSR6/JL7hEoo47aiYkk8q0jxB+i0S579J0wbpk+fmoofFzW4jWiRDZHGH
	n7AC8yJA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBULT-00000002Qnm-0RAD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:41:56 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso20522625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674913; x=1791279713; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=;
        b=RFfTg5/tTd2OwxFRR2SIn8kSywraEGbPp1Pv/aeZhtaWKCexdZP2tSHEGsKD3VLKsv
         jAqcIFmx890DIZo/zF5k2hnCvc/dZOKxguhRXyO63R4BLRV3jpirHQUNSNntqBIUKWi9
         Vs75ip4JEJ8zlCtsniWRvhBCTM6cft/oSb1z2VAoYJQGsLBiMTSf1YzDg7jvWKSdyzFm
         3cz76Qw81xSeSaPMQTW5JcFetH+S5u3MkA8vi114a0zKRsHRVX8OPOzzv25W6dZE7qID
         SB9o5UvXmt/N7uQGMt4oK25pRP5xY7WVc11u5Jpp58UTEPw+J/G62Vvto99Ed6IYL8YE
         lOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674913; x=1791279713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=;
        b=g+bocJrOjaCF5l4xG45Td7P2aVXvPFQ46BldfaII5fKYwhHTLZe50AsRmnIXw6riPd
         2SpWWSPrUyDYjJyoBfRW9zpu8poPbhoUF68KUdKUOi75XHWg605EDIFyMHCBFPJKWw+F
         ud7cVUhX5DzROZ5d0DDwucTUJ6jS7/BRO5TpnJSQTeyxJVUZVpxKI1rD8GQC6RbhKJh4
         04ygAeFWbD7OhbDpcfgf3o3Eh0yW4KFLm8rNN4VA+KtKsFpnsQaaVoy0P7I9Bn7SHA/P
         RiNpmXVY4aAWEfmjX7t2d/7YGn7UKP2Bf4K4AUbil8jv7kj+muEp0SLLiShuozyuAdvW
         ZBbg==
X-Forwarded-Encrypted: i=1; AKwUvBwPAoCSgcvmr8Z7gQdQAbOIbYpn4TKM3Xe5vEQ7pgoZ++60nzQNSfc5x2A+P0lBWLhRznHE1Dgj/UouHXQ9pvOX@lists.infradead.org
X-Gm-Message-State: AFuF++n4yRE4QY7M/iymeBGpkUrWtvAZaT4ZESTXx/gfi4fP2rVvA0XD
	W1pYSVxEM43nK53FZIL/NHOZPTlLuYKBkt5P5WQCcJlurgpn1b1v6gI6wl+VqVajr24=
X-Gm-Gg: AYBFou3UzPhMaKPo53jgD5LiqeSlHlO5zPy55DwIoSvpG/21LOVm8V0deZNoLKLQNNS
	hFoHXisnQP14vujexDR+SKgofMhL3sv+WBp7dIVP5Rfie11C9Mq9B+dMI3hHsX5zlyLwSXEYxI5
	Gku0NmEFn2a/7DhksKJQ7IEWNEEKEUZbnK+BB4OARvCUqhBhwxAaXgUHv1YYyxqNSJTvO1O7MF7
	06P7lGavx6r2qaiFLHhzOVKiMShOErO2+R7fHEiupkVqK7JCcgdjSbJvOiy2Q4s7xrq5mPSFhRf
	E6skKskFmVQDd6DXOhpkBiQ6EIhoIKmtVqKPq1msW4POuOZy1IlkE+JeEODf91QJzTuELUsyEvQ
	VU0URYDs/qIok8AzDUBjjWXFnP1gynDdoADLXiIfiupBHs88IA3tLxdufJVLcsdyPpD1v6kAmFt
	aTvqlX+mot+KlE3lE0XjOrjBlrmAoRRaBnrTNG8VPetnC1+T1V2s+aumRKuyb+MiWTO9j7wQsU1
	ck0gZV3AFiGO3Ybqwk6YEC56xAsKskFRhikTUsTW/Pcpg6krWnipKXWvNpTWexI22vPK81hoIYg
	6l6QOrnX8zu42URDIUs41pZjn5Mv
X-Received: by 2002:a05:600d:8652:10b0:49f:feca:b3bf with SMTP id 5b1f17b1804b1-49ffecab799mr95152725e9.8.1790674912690;
        Tue, 29 Sep 2026 02:41:52 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm64229765e9.4.2026.09.29.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:41:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:41:49 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <aruH3VNnY8rUYJIK@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
 <art_faJ7Zx5CaWfW@Lord-Beerus.station>
 <c97be589-45f4-422d-a4c3-e5b0a61f5b22@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c97be589-45f4-422d-a4c3-e5b0a61f5b22@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_104155_358996_31BF586C 
X-CRM114-Status: GOOD (  20.41  )
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

On Tue, Sep 29, 2026 at 11:32:45AM +0200, Krzysztof Kozlowski wrote:
> On 29/09/2026 11:06, Stefano Radaelli wrote:
> >> Also, look at other examples here, like Toradex. The actual variant
> >> should be the last.
> >>
> > 
> > Could you clarify what you mean by “the actual variant should be the last”?
> > For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
> > variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
> > variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
> > I had used the former ordering following examples such as
> > toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)
> 
> Indeed, the carrier board is the last part. Just to be sure - in your
> case the emmc and WiFi are on the board?
> 

Yes, eMMC, WiFi and the audio codec are configurable options on the SoM.
The carrier boards are shared across our 32-bit and 64-bit SoM families.

Thanks for clarifying,
Best Regards,
Stefano

