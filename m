Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C62BD5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shJRP66gOhT4DazMS1XuGuw7WkBdrSKa9fDvAIGOtx8=; b=ZCdJr5PJMA8Pgcklfc6NYPUoX5
	EO/HlH0vfartPFPjHRC+NfLsKl8ybQiNn7bG0b0xnp4+OAP++s57TXs7k2GmolitJ9yuK66UPS3Kf
	4fS93hHkwM/uznHGwUQb5WrziOiJdB2j3HiRgADdM3EPeTDzHId0PaNxoioEPK7xgzMpWv/rUXIEe
	lfmp5P3An6Z0AZPh709faF7M+V6hYQ/QMG5Qls47t0+OI/ehsiUekDjebAzq94NzD5oimo46oEare
	az6fU8MPVHi338FW3Ysxd9zGjjMSWuPlRmFDNG4YHjAO2eWhUecBW6Ir6k1ORMDpLh7u6YKWpED1A
	i81C7DkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98TQ-000000088VK-0OsD;
	Thu, 07 Nov 2024 19:47:20 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97zu-000000083DF-1AV7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:16:51 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20ca1b6a80aso15578585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 11:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007009; x=1731611809;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shJRP66gOhT4DazMS1XuGuw7WkBdrSKa9fDvAIGOtx8=;
        b=Hqwujl2hHs2E24jV1s9onFBXnQlTfEWyok5x6XJZczsT3uGqrZ96vCHHAzKt+SETM8
         xZEXAeokO4bKJ/PEMjwGPH2pj+rlHO/6lXSNu5g+bYCzgLHJ4Ln53suK+rW3gEeQCw3B
         Um93iDEw8/W6A4XV4dyxtSPB2KeFdpQtNMAVnUugVSS8WyBRsPzEhrMJNoQwrTzOeegr
         5D1ZO5BUOYwockINPWVav7DI39qCsFXO32g0pothbK0PudOOiH/cC2/BKKxAqJVTrKYv
         vjkQHTpq75HavLvwmLdjygzfddD4XnCmR3SBYLDVSxU7mqQAuIpQ8KJDBFYzY80G5LXZ
         OwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5DgbSj3/j5cZoVsCvaueauzsX1qwlwK5JsbmfII1y97sHoDvYhdiod2AxSGMSvOAZSQ7QzC5fL1217PhBMJc8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7aAFVcvx1GpZQTVCZU3MWWMni0Vm4hMnL0IP8XBklbXN9DkaU
	WZXDql6Z2+6JXZ5psvIeBnGJZ6yQvEWnicmFn3eMat39F5Z6iV+BS0kbAnxK3ss=
X-Google-Smtp-Source: AGHT+IHCwxuyvUx7QMGwsvCo5NxhXWDcduS3t5NeeWQsOyZnHRWMAi39zpy99fSjHtRjJzPSmc4iOQ==
X-Received: by 2002:a17:902:e747:b0:20c:79f1:fee9 with SMTP id d9443c01a7336-211834e1040mr259375ad.11.1731007009332;
        Thu, 07 Nov 2024 11:16:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7e44sm15883785ad.6.2024.11.07.11.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 11:16:48 -0800 (PST)
Date: Fri, 8 Nov 2024 04:16:47 +0900
From: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, Bjorn Helgaas <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241107191647.GA1869604@rocinante>
References: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241106222933.GA1543549@bhelgaas>
 <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241107072005.GA378841@rocinante>
 <AS8PR04MB8676F00E8F76B695772EB3B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB86765B904FEC1AA88F6F83468C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241107163058.GD1297107@rocinante>
 <ZyzxdnC4mm4GwoOx@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyzxdnC4mm4GwoOx@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_111650_338557_A1A41001 
X-CRM114-Status: GOOD (  23.36  )
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

Hello,

[...]
> > > > > If the changes aren't too involved, then I would rather fix it or drop
> > > > > the not needed code now, before we sent the Pull Request.
> > > > >
> > > > > So, feel free to sent a small patch against the current branch, or
> > > > > simply let me know how do you wish the current code to be changed, so
> > > > > I can do it against the current branch.
> > > > Thanks for your kindly reminder.
> > > > This clean up small patch is on the way.
> > > Here it is.
> > > https://lkml.org/lkml/2024/11/7/409
> >
> > Thank you!
> >
> > That said, there here have been some concerns raised following a review of
> > the new patch, see:
> >
> >   - https://lore.kernel.org/linux-pci/20241107084455.3623576-1-hongxing.zhu@nxp.com
> >
> > Hence, I wonder whether we should drop this patch and then focus on
> > refinements to the new version, and perhaps, once its ready, then we
> > will include it—this might have to be for the next release at this
> > point, sadly.
> 
> I think we can continue discussion at refine patch. Add kept this patch
> because it really fix some important problem. Refine patch is just make it
> better.

Sounds good!  Thank you!

	Krzysztof

