Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04E1C282DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awHUw86wmAjtFZl9KswCDV7V33b+lKzle+H1DTBoaPk=; b=Xmy6k8fbGYnxtvXT0SjgF4eqA6
	L2YAUN+Zq4FH7mVHa3YBvBq2DF6VEBn+Pbf9C4W6eAJ+TUXQR0YrxgHXlwQUNjXXTBILWx9zmdplD
	V+SAWdTTxbQWhsk4OUQVPyr8JM6aHe9YulSyOUsVmx4ikFG38xGBc8Ds41LqpENcZ8J5fiR0968xr
	hUnOLKcpMKpP61Az9lTD9fR3mONHEDdt4IXPFMH7zyg3/ch1lZ7tSH8WyW/zMH0LmUARHAoVC+4eW
	fBu8qP+Tp5fwSuB71rVrcMbsfM+fs9wbJKZkF6EPtK3ad4HfKRVK19k+XW2mHlp3p1IIx9ulqoSn/
	MuIvE7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYIX-000000066lw-17IG;
	Tue, 04 Mar 2025 19:51:25 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWTs-00000005j6M-1u6y;
	Tue, 04 Mar 2025 17:55:01 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2235908a30aso100889135ad.3;
        Tue, 04 Mar 2025 09:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741110899; x=1741715699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awHUw86wmAjtFZl9KswCDV7V33b+lKzle+H1DTBoaPk=;
        b=qec0cVrkdlQy+qNb2Y37ApEuXW+gz3WFEAIdGUl39jls9YYk92BVMZ27EumYQmK2hi
         oeTg62z38lG14NbRYFFj125gOWWxyZyLu9/L7DoEcNkpBz4BiRV8HViCuRvPICtd4UlQ
         vGPkt0WIOVVfKFdWn14BQYmgO8Bi1RV5Zb05xYtEviyKeY8GP+FV4iojojv2gkgfyzd2
         UrAos67Gb5lrkI010IGrKwmQG8QC1gVAYG9Kq6+iV58ebMMxZ13dO3WuQcf9If5U3CH2
         7oFZ7iYo2epWq8jGayuq5hc9JaJat/0Na5/wiws1cIbHXFGmzUwqZjmMReedzkR2Hux0
         6Uew==
X-Forwarded-Encrypted: i=1; AJvYcCWMrpVbOIO2U3tIUbwY0GVdjQ+VqscRPMAgsl5IsjIi3HIOdMldntJHhsSnY2N7AhZwtmz6osrTH5J+v/f4G9jKFg==@lists.infradead.org, AJvYcCWq73SR1SD2DgBCi3a6INQPXJiFClpbphaC8BzBdOAhtpzuOPad8aXKahYYsFoJzuk6OX7NYqpe5rHrIfz8P2mz@lists.infradead.org
X-Gm-Message-State: AOJu0YxgIe3DNjvCdBvCAtfrb2fkv7+gOSOlpxT834mW+mq98YEKQSRb
	B2LgBopDWejG60ShAsvq7MFmn0DRkzcIpn4aDzUhKvU5qgMEooLE
X-Gm-Gg: ASbGncsRU4fEPtCsHyEM4m1F/9YbQYNfM7/xiaUCjeilBHaBP5kfQKCTrX8CFYUW66b
	Zt75YeUOhvOBzfdzwCBwtM7edVQT6hfpm0ZzeGzjqx3zA36q8EmAxx71GRkTrwVC8sz3QLP6PmB
	RjHgJ/Wy3hO+skrYG4I+6iaFb0wb6mUzwYtribNNB+XCkK8saLs73Td+JXlH2xOT+DGqPlejeWD
	i4HS0uHEdhTB3dM6CfT83pdBp1uzm46fgoBBPZfYsWqt9EBpVJZ5GzKo8CzG9XbbT1frCq1IqsS
	vC2/9+FtQbbXiHmnb8QSHy1iUiAO+ssEiG+4XyJg3buKheGL5aPVWvrD9irVDOEm4ViZ1Rgdc2X
	99GA=
X-Google-Smtp-Source: AGHT+IEdCgobHmMRJKN0C7hzvDFvHPwBM5qCFaLu9E/6AX2zBtm2N5q46Y1Zm54WVl2Vdqx2ZXH2sQ==
X-Received: by 2002:a05:6a00:a1e:b0:730:8ed8:6cd0 with SMTP id d2e1a72fcca58-734ac42ed49mr28645877b3a.16.1741110899547;
        Tue, 04 Mar 2025 09:54:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73659b81cb1sm3982091b3a.169.2025.03.04.09.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:54:58 -0800 (PST)
Date: Wed, 5 Mar 2025 02:54:56 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250304175456.GE2310180@rocinante>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-5-james.quinlan@broadcom.com>
 <20250304150313.ey4fky35bu6dbtxd@thinkpad>
 <CA+-6iNyuQskVNjAuX1QcLTPetbfhogGYUTOA01QwNw9YcwAdNQ@mail.gmail.com>
 <20250304170735.x25c65azfpd7xmwv@thinkpad>
 <CA+-6iNzvqnZB=7kRqUm5ie6245AM5ObeVmMNQ_S4AtMLD0jKQw@mail.gmail.com>
 <20250304173209.bq2lpijsea7aufpu@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304173209.bq2lpijsea7aufpu@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_095500_494224_76E05CC6 
X-CRM114-Status: GOOD (  19.69  )
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
> > > > > > -                     dev_info(dev, "No regulators for downstream device\n");
> > > > > > +                     dev_info(dev, "Did not get regulators; err=%d\n", ret);
> > > > >
> > > > > Why is this dev_info() instead of dev_err()?
> > > >
> > > > I will change this.

I can update this directly on the branch if you want.

> > > > >
> > > > > > +                     pcie->sr = NULL;
> > > > >
> > > > > Why can't you set 'pcie->sr' after successfull regulator_bulk_get()?
> > > >
> > > > Not sure I understand -- it is already set before a  successful
> > > > regulator_bulk_get() call.
> > >
> > > Didn't I say 'after'?
> > 
> > Sorry, I misinterpreted your question.  I can change it but it would
> > just be churn because a new commit is going to refactor this function.
> > However,
> > I can set  pcie->num_regulators "after" in the new commit.
> > 
> 
> If a new patch is going to change the beahvior, then I'm fine with it for now.
> After all, this series is already merged.

There is still time if a follow-up patch would be of benefit there.

Same goes for

	Krzysztof

