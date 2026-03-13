Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8812107BCCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqK4MWNrO8rqxWDIz9KeUr6nx3Y9Q/ulNkMGXJyHS+4=; b=1JT5c0YMLs264cJ5MGGTw1VCVc
	cY1ltljQAFhYWy0qpG827PrUtZGsjmVpNUziAkNW0SLRo8lSx8SuOiuP04AEs176vWe+2nX7Ek6RH
	yFiPuRLszQnJxGssp/U4IORRxvAx2SdJHmNnQ+yAnRwYFdlu6Z6WAQeEwQz9jkT4OBTIWJLWngcHO
	XskicEGTJFYyMqO0oYITUtXw3QsS+4Vm+f/V5eXlJQx0IjmdrvhdoHjSsLDomHdaCudRajg9htm0t
	uvedR02wmly6oNXji09wmsxqKp8gXftYT62/jHAO2s46HO/b6NrjQgm/55D3SdN65mEuGm0KTyxAD
	s3kHHFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15wr-00000000jAv-1UdO;
	Fri, 13 Mar 2026 17:05:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15wp-00000000jAa-1gK4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:05:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439af7d77f0so1991367f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773421513; x=1774026313; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqK4MWNrO8rqxWDIz9KeUr6nx3Y9Q/ulNkMGXJyHS+4=;
        b=AJJb0hJCNXpjdsjmEVWQRyQQDNNF2gMHCDqaSOJAe0YrjNoLquwDrfRu2c2G4GDEKa
         +7XSa8DCkcstZN8obPbnZzArNGlhpe3X+VdMAbq1dB02wJRh0KVKKUi0RJ+WIu5/dnJK
         PbdDailNly/qo2TcCKTemiGgMcya3MXVbZmUP3nu44lqVAoXpdokYMGQn25sicy5dhdO
         K1jM/pRWOqcRwhI2KaajdMY+iz8erUebgCxcf453kZVlsOVz8fVYJGowsn7HSwBtN//k
         rfHI7OlFCuaCjPm3yjw6rMX1575U3za8G+XE4YQjYu6uugEly6VV6JfaTRmAAROtB9TI
         1k5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421513; x=1774026313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqK4MWNrO8rqxWDIz9KeUr6nx3Y9Q/ulNkMGXJyHS+4=;
        b=qMMNNlQhir/UR5afCBc0L1pg6gEmQVq2oaP1Hs3gcN/CbYUpwQ2jA7YxleNGDr266r
         YvVdgrAXcLFSEbbYc0dGKp5QgmY8pqmgQonpXyBFLzM8nB/7o19NHeV9P8bXMc/imwqJ
         lOi1w+yWe4zT7KCuzkbni/Gye9vrdIcJdFBw8of/LVm8PXj6DXMvqxLadSfJnvg3Rbqa
         zuYdxo8q4zu49vuonnrnVdafVhoxse8K7Rl+j0elYnl0fOw3ox3xEaw7SyovWeXj4ifn
         0KsL+BTuCpUiIobrNK1tU9RtgykGUhsslVfff/y0qTKz1AHCibW+jMzwtcXNFnqiaPYw
         BrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuX8Ll07857PAIq4mTf6kNpSPofIbxXQSw1gAk40E5biYIAQaN5Ba/BsEkivkAryey4NnlCY6HXoLzrzvFJrQR@lists.infradead.org
X-Gm-Message-State: AOJu0YxlLPEjomgeZjvDyagJf6tOU1CZILXTZLOepQNf3BlTeVNwhgE4
	S04G1Koi89Gf1LCeTlTvvBv8/kZP2dNFjvkQlK8ogOAJRxmLeak89SyH
X-Gm-Gg: ATEYQzzocZpCcqQD5vhRTkIEcUTYNAovGJgWTV2IHBirurBZtMJEnqJBOdY2qnNZm/q
	olzWMwn9daQohOVXhOBvc6ps4Y2/zDEz0pQbtBnjqJ0uyQtMm2hdzCN7Mi5W4/3BarVjHjHCKJV
	tIuab860boQT3pficjL0yMKUnx9TZl3ydKKXz++UCSG5y1xqrLQ0cHsOR1bmBGyfw8MEjOrT/yV
	kDQwJjZby0mMySQpoGDP1mfBZ83/u6L3jv9NOm+sN83P+StUA/CksztdFFX6z+f4wtt7x/rsuK2
	VP8MPZ+tPtS6PIwcFsINwgZiV4rtmv+34uR88qTI3v1BuOCom9fLQAmndDIN1nB45+gxtDDV0bS
	xARca3MZaffUrp/nDzG+I4jLgZrunRATK9nj/MJoGLJ0RJGEt/fRxrEBKkp85dqlQFewTxeZ9Im
	GlpyRmi7dBR2pFfTWTwG8tTil+9cvE/CA8ua3ffNXF1cnpGR+9LGlW9n8CXreW7SxdZlrvE9oJa
	S8nYXnNs0PlVYKmTeNL7Ef+0v3AfCMlz1OyMpDTc4vfqw==
X-Received: by 2002:a05:6000:1866:b0:439:ba69:101d with SMTP id ffacd0b85a97d-43a04d79003mr8013170f8f.1.1773421513225;
        Fri, 13 Mar 2026 10:05:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm10531876f8f.36.2026.03.13.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:05:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:05:09 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
Message-ID: <abRDxRK_GFYwmAGE@Lord-Beerus.station>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
 <abQ_d9fGarNobYdo@Lord-Beerus.station>
 <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_100515_466589_E83B5285 
X-CRM114-Status: GOOD (  23.56  )
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

Hi Fabio,

On Fri, Mar 13, 2026 at 01:52:31PM -0300, Fabio Estevam wrote:
> On Fri, Mar 13, 2026 at 1:46 PM Stefano Radaelli
> <stefano.radaelli21@gmail.com> wrote:
> 
> > Correct. It is not included anywhere at the moment.
> > The Symphony evaluation board uses the IW61x configuration.
> > The imx8mm-var-som-wifi-brcm-legacy.dtsi file is kept as a separate include
> > so that carrier boards using the legacy Broadcom-based SOM revision can
> > include it if needed.
> 
> Then imx8mm-var-som-wifi-brcm-legacy.dtsi is dead code. Nothing includes it.
> 
> I don't think we want a dead dts in the tree.
> 
> IW612 has not been upstreamed, right?
> 
> People using the Broadcom Wi-Fi on the old board may still want to
> continue using it.
> 
> Please don't break it.


Thanks for the feedback!

I might have misunderstood the best approach here. The reason I split the
WiFi/BT configuration into separate dtsi files was to follow the direction
discussed in the previous revision, where we decided to keep support for the
legacy Broadcom-based SOM while moving the configuration out of the
device tree, giving the support for both modules revisions.

However, I see your point that if it is not referenced anywhere it becomes
dead code:
Would it make sense to add a legacy Symphony DTS that includes the Broadcom
configuration, in addition to the current Symphony DTS that uses the IW61x?
This way the existing boards would keep working while the default board
description reflects the currently produced hardware.

Or if you have any other suggestion, I'd be happy to follow it!

Best regards,
Stefano

