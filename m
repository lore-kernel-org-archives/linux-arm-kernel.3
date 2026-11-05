Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC039606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJJz7T9a;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZbxks3i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=; b=MJJz7T9ayeRr4T60nFxwEngk3E
	OpHJL3bXbJkXC/4cMqTBSd4MCvMROkFrPpS3MiYbDqEjjjA4W9BT1bqdtXFEaT2dA+QvZVxulXG75
	WBmCriIpslx85f5Cmw1LMRDwPyPtHhfRVd9At0DmkKGLwxIqhKp2jfrJCdT3YBBvEPAJh29zhBFxs
	vtfU4GmR6a0SI6kRZN3N4pzEa4JOZ/UkG6rXIVxK0q+7lq/9kGZlZV6K4gbpv3WTPKiTFnmrYyflk
	xVTpvsUJGj7Ei8WuP1+svNUj0xGR2G3Ym5ba1VwmyESheIXadlTu9z1CBe/15DLugjd6gzI8AwISt
	lm026rMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1W5-00000009zTE-1ZFD;
	Thu, 05 Nov 2026 17:44:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1W0-00000009zRz-2Lxt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:44:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24389105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900683; x=1794505483; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=GZbxks3icVeYOGBNVdbA0H+Py7gSJkD7Pr0HFQQryfphT1IbWvUe1bjo4uNAQL1VQa
         ZhXMXdNm3Oo4bc//D/gYgz619dE+/MXdUY4vZh9vyhktfS84qygs8PgezoYkIx4Lnkzk
         6ApMHbdNu1ZEguf3OhzrKWTd+rbo1fQrh4hjx3y/FXvR0pv1EuIuMwvdHV1/7b1P+RNN
         B3m8KrMniII2RPEt/Dk9skbmeoxpHIH13Wb9z6aHZxUe4QHbmkjKth2KcI0DrERI5aG8
         gPSWS/6zudqUvk1t6taryDhcG0wHhc/TH76kQjYrhf1XNN5Z0Y6+lXpXQOk7SvmWAgmA
         Yv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900683; x=1794505483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=DZDFzo7Jn8mT6Jwjh+BZhRU78aMCfW17fxae+18ABqA5uyNvzs1fn4quHroxVMnSUC
         Zbd5O/GVpi80UTBYv6vPfs85DRSGwsYw+MxdGB+f5FBlDncsjTBsQ5nqul6INaikA9cm
         Wa+SB/QXt4H+Skqr+qBJol/KMMCPHiqIRBM2lHHgyOiTViUZLptLDxgDlUimgcQNh+qJ
         C8lpoYfTjyZQHAal6CXaM/GtA8uYG7Py6gyT8Xk+OOM2Bl3NSU14w/Lo7Uma5rl7Sawt
         27DlYiEI7GifM2XOniKVdFM6SQzdIT+l/mjyOlIihy8N7C7Es/9ZMLJDNNHbtR8dIdXu
         tpwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlyP9pqTrbAtdFDl1i4zQG4Az0RmnE+0FLtzzB+PJOpM4On63zapE/aSxDPkmqSfpLEYtj5rZd0Y2zn04dXoU/@lists.infradead.org
X-Gm-Message-State: APuU4Z8dl1/ScFoe9lcoa2DnvHL+R/Ej1o9pSOgeKS1MmBiwCmnkvyJx
	22tbkovMB7Lp/yM8NYdYjnp37DIKVRVuOlE7s+DjyDOvsgCEHjMJrXAR
X-Gm-Gg: AYBFou0FJeqBOJAU15DldAQIKbK6PTMYe7ANqz48D2URMzwdozgN0AACWpvKQeNIq8N
	tD6kdmCjsDePaP/PBehpjEDq67wdw/Xc7m4XZoTVG8fQRsJyhCvCDw28lT4f/MIwdwSkJTkzGCq
	mOFVteStO7ugnm90xjmCI8oY6xkwC2nNuzu4SRN2yQKFARVm/5Ep2liSCGDnM/Pxi6ELVtSkta4
	kqdwewDovhYFUgy7uK9gmPM3AyR+DzlgJnIp5aqXiutvtjBZx3QDdEX67h5D2mBNYtkH5aq2pnm
	PYy7nJ+rthlF31Gwik3hH33M3vccbqpNVAbx3M56H6zqTHFfw6y/V4PZQZgf8aS1qwcxC6ukjmd
	eyT7TLl6Af0cX86wE5dZQzfE2wXtyTV5/Kiq2wDFSsbshITr9AUl53q+Q9ko8plqH9VjlCmPM+L
	kMfHQozW8dytymWYkt3B+cGXHUDGd6W69ent/JkVbyD/uV/bS+8aDnpqNRMcnnL+WHEI1i+zs2/
	nE1v2GO8fx7wwMqaNkPc7/U93aLOswCWyA2nAMk6sd88iNYYsoddr4zuBXBuraZ3jlFvTy9gZXt
	sTCC+5sLbgCAlnlP+zAQUUdMIY7NlD9OtG125tLzyUf5HwzsMOCIgtm52gMBfvYRftne6NUSEqu
	zciambfqP0KdBIuh3K61RGs3DSrF0xijDUu/B7aL+seOtynmdEM0y1xSZ8A==
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr454773675e9.14.1793900682397;
        Thu, 05 Nov 2026 09:44:42 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm86889775e9.0.2026.11.05.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:44:41 -0800 (PST)
Date: Thu, 5 Nov 2026 18:44:39 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzAh7404GAsY-U0@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auy-OW_td7N8oHK_@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_094444_733738_37DA16ED 
X-CRM114-Status: GOOD (  13.15  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:34:49AM -0600, Frank Li wrote:
> On Thu, Nov 05, 2026 at 11:17:39AM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > The Ethernet LEDs are physically on the carrier boards, but the
> > VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> > include their LED nodes. Other carriers therefore inherit LED definitions
> > that may not match their wiring.
> 
> what's impact?
> 

Hi Frank,

There are two main points:

1. The SOM dtsi is intended to be reused with different carriers.
   Defining the LEDs there forces every carrier to inherit the reference
   board’s LED configuration. Customers then have to override those
   definitions or explicitly delete the LED nodes if their carrier has no LEDs.
   Keeping the definitions in the carrier DTS avoids requiring customers
   to undo configuration for hardware that is not part of the SoM.

2. The Ethernet connectors, LEDs and their wiring are on the carrier.
   Their definitions therefore belong in the carrier DTS, while the SOM dtsi
   should describe the hardware on the module.
   This change makes that separation consistent across our boards.

There is no functional change for the existing Symphony and Sonata boards:
their final device trees retain the same LED configuration.

Thank you Frank,
Best Regards,
Stefano

