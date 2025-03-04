Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FEAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13UO/bBBmk74lWYurj0NLoL8MAPIZRHSkEPYSBsPdwc=; b=da0w/WRTNkmux3hjGB+x/8IwY3
	4YbE0ATzJWtldx2zZX8Uqea61ivYWlQ/ph6hfiVx2+che3z6vS0o3Wf3R7oYn+D4xGz63A5M+gsCU
	ZG9PjC5hRdf2ut6A3AaCUTpMmkSscUldsuDj7xRMYJSmDJ3Er9gCcZ/NrkJSm/bsjs+d/bf6LMOrC
	mdUboYa2AWFN/rO7BF4vzwBkBAeMQHYZEeiWQRh39mbTypSNEYjAe1RK7TRjwlqi7dmS1mib8tcHb
	qymJ1Z2bakYivan+KXsNbgPQHCDD66cf1be3RbG5dIJqu8HKNRr/BlkT5GboGCJCTNPZNfp89SdJ9
	FsZyH1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXe0-00000005xv5-2Z0c;
	Tue, 04 Mar 2025 19:09:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW7x-00000005e83-1Ji1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=13UO/bBBmk74lWYurj0NLoL8MAPIZRHSkEPYSBsPdwc=; b=M1UDNxd1koUvsiV0ClkRebuH4J
	KIRhVR7TEn0Yvoae23A4P4KeFm3gYcZn8wEZosLPbM6OPsHayToyz8ZI/HbLtXm4Aec/pqtPC1P8M
	j7CaaeAi3g/PZ4Y0pClZCEVinCCeAC3Qo2I5U4jAy9AN5cCrUmIArNwLGRMV+5QPC4bCq713tfMMw
	+xqyLO9MD8OEkxtNWzeE86zBMGHGOetOTaWsJ8l+U+whwwOKkccjZdoP7Qb3vxCuQvByi0A150RXG
	fgTMWYXF/DMhB7pI1YvvaqABypUWGeUguLIxDuBAkSl/t297hdHiHs7yauvoNxfWL03Iar/ecqew1
	AS3zYY6A==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW7u-000000007xr-1tya
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:32:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223785beedfso73447265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741109536; x=1741714336; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=13UO/bBBmk74lWYurj0NLoL8MAPIZRHSkEPYSBsPdwc=;
        b=HoYr5t+d/HSKM5SOHusst47KwZdnsFcAVLsssE8WA0s2Nf7VmzgVF7AzUzX8AuFOkG
         ogHhK/f9hbeautpfJsE0pCLySUEJrH0wD354+aogknaXzFPWd1gED35+48O6HQpGWLz7
         BLEmq/tmTQPkv6Zqm6pWYW7zpMagfRX1yTf7GB8GduutWgrb/4A7PykQ82qgJIAhukvY
         c8J/5Wyaf+yFjHo5K+Si8D1MJYpD56CsqPv+FR1V0FUcIrdXHPwIwivmviKohsuuX7Lx
         T0ZLZQlmHuhyqSojOnp79kX9AfjYWKZXIsTnYsfmkHQIFuI6h4trG9xdm8MNGTnuSreg
         53eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109536; x=1741714336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13UO/bBBmk74lWYurj0NLoL8MAPIZRHSkEPYSBsPdwc=;
        b=PjMmjjPto1uelIO6D7g6yhg8MXMryaoO2YKinrHpFpPfOULUHuZgvJTZkBTGBIc6yy
         Jw7QDoSsrxTuBl5VhDf1G3/i/VwEBPygwK74PZP2fHDmfTdrO+rChX49mheCfblYofEz
         BXesoqnVgu9NGKYHpj0kN+4B0WaPGNXpLWksNQR6ro7CGq12f09RKOCHlNkEqcu/DKxd
         51e6LevtvYKuTfvl4wta5/VUU4/cJsjIzHr4ThXv9YxSN00meEVgkCToBd9Bmo1a64Qc
         8tNNRxDKg8IuNzhBov+8jZKsW4aAFcIfRYYBWcsLvPLfM18yXUIGtp7FrPN9qJF9B+YB
         1gpw==
X-Forwarded-Encrypted: i=1; AJvYcCVQzPtPrdGv7F6NVumhi3zHga6Q9s/st2D0XrUddxvuP4pv56X88XboEnDu3u1D0qpApbF11bP8dzJN9UmpnLDk@lists.infradead.org
X-Gm-Message-State: AOJu0YzE/q5r1Mx0Mw7QiEE3BbR/z64SVPDp0OSNPYzYANLb2trW8Z0U
	QVR90wQROuOT6RUdUc5Dtm8IuCvyP4jnIVM9SdRwav4RKnAA6valdkm++Tvicw==
X-Gm-Gg: ASbGncs6Fz3YiuajmMOSXzfIwOOVL1lCPA252hXKk5Jhx1JpYNO8kFFcLc1Z12W2ZEv
	IuD7QFgFlr2yAYN2Evxs3HA6Ukg533TCvZENN8YjbYR6SzcEZS3Ryxen1cgb09i1fibuxg+/b7K
	brDTn1wNRNPo0LM03u7IJA+xJ/XrWRaXzaddtvWGqybWC+Lta6jjcj3R9lQAuSKqXJ5PMrnmV2R
	dxFIOlBv4GYXXhNGw1gPk7SaR0Wtp41QW1aR73Usq/gWv6/48AZwUEWIlqCfpMsZeDfA7SBJrZ2
	GObFMBjLtGgwF4CZ/eGNIa0Qb1yRO12YIDt3q8OHF1pNSKzpB9SUkPg=
X-Google-Smtp-Source: AGHT+IENsKkUhuv8gc8RI2eXokbdYucKOSdaT4IfgbHgCVm5rtH9K7HDvp2i58wnfep6Wo8pLoIlBg==
X-Received: by 2002:a05:6a00:ad0:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-734ac372044mr29269358b3a.11.1741109536419;
        Tue, 04 Mar 2025 09:32:16 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736387b2c1dsm7106697b3a.64.2025.03.04.09.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:32:15 -0800 (PST)
Date: Tue, 4 Mar 2025 23:02:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250304173209.bq2lpijsea7aufpu@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-5-james.quinlan@broadcom.com>
 <20250304150313.ey4fky35bu6dbtxd@thinkpad>
 <CA+-6iNyuQskVNjAuX1QcLTPetbfhogGYUTOA01QwNw9YcwAdNQ@mail.gmail.com>
 <20250304170735.x25c65azfpd7xmwv@thinkpad>
 <CA+-6iNzvqnZB=7kRqUm5ie6245AM5ObeVmMNQ_S4AtMLD0jKQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNzvqnZB=7kRqUm5ie6245AM5ObeVmMNQ_S4AtMLD0jKQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_173218_627111_52D159B1 
X-CRM114-Status: GOOD (  31.91  )
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

On Tue, Mar 04, 2025 at 12:24:56PM -0500, Jim Quinlan wrote:
> On Tue, Mar 4, 2025 at 12:07 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:55:05AM -0500, Jim Quinlan wrote:
> > > On Tue, Mar 4, 2025 at 10:03 AM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> > > > > If regulator_bulk_get() returns an error, no regulators are created and we
> > > > > need to set their number to zero.  If we do not do this and the PCIe
> > > > > link-up fails, regulator_bulk_free() will be invoked and effect a panic.
> > > > >
> > > > > Also print out the error value, as we cannot return an error upwards as
> > > > > Linux will WARN on an error from add_bus().
> > > > >
> > > > > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> > > > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > > > ---
> > > > >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> > > > > index e0b20f58c604..56b49d3cae19 100644
> > > > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > > > @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> > > > >
> > > > >               ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
> > > > >               if (ret) {
> > > > > -                     dev_info(dev, "No regulators for downstream device\n");
> > > > > +                     dev_info(dev, "Did not get regulators; err=%d\n", ret);
> > > >
> > > > Why is this dev_info() instead of dev_err()?
> > >
> > > I will change this.
> > > >
> > > > > +                     pcie->sr = NULL;
> > > >
> > > > Why can't you set 'pcie->sr' after successfull regulator_bulk_get()?
> > >
> > > Not sure I understand -- it is already set before a  successful
> > > regulator_bulk_get() call.
> >
> > Didn't I say 'after'?
> 
> Sorry, I misinterpreted your question.  I can change it but it would
> just be churn because a new commit is going to refactor this function.
> However,
> I can set  pcie->num_regulators "after" in the new commit.
> 

If a new patch is going to change the beahvior, then I'm fine with it for now.
After all, this series is already merged.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

