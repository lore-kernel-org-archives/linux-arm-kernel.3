Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD695C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA/gKQoFR6dHj4YM+SZIs58tGSpb3MhpX5oaTo2PxFg=; b=meIoxyiXiiNPei/TWFns9WW91g
	9+nRhOZy5sSmOR48GDcOxWMQfJnjddDOB7JnCgQgVy5UVBpuxTsPEnLQH3UMZnByZhJF10iwDHVLb
	ZV8QLajzLd6K6ue5ABuCWjVeLales4zvowg1zNndUDlKjdrU8E3IguUrPPY3oR8ad6lPIEeroflGK
	OHe0g+xndZ0juFbiK4pat6FjOqNk9/nZhm74/a/VtDvQ+QIaiGBsSmswUzEu9XyVhAjzNDvZRd1wP
	xBgsK46mAcId3x68xoEQi792lBWcyTihOpfiL6UV+8h8NQVZig2G2v3MSMAzVskjVyHcD1iA+10yl
	JPNoCvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXRJ-00000005vfZ-0nAA;
	Tue, 04 Mar 2025 18:56:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVkB-00000005YY2-2oao
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LA/gKQoFR6dHj4YM+SZIs58tGSpb3MhpX5oaTo2PxFg=; b=Bwq+cBQ+ZIiV8nTDGMMDBnXOTC
	jfEirZUCbdtLhypgWWeaguyNKK1+dPrTrR047pP2RQz5a06vGDHRPVuTrc/9pLQrFrySFgWAAS685
	rafyPWDfBhccSmY2T1Ug71faZxRefzIv5OAnTMbtdoF4nAWC3wSZgWD07Kf9iGDWBxX6xPcFr+A4C
	yYqZpalsHzFYI6oeZG2m4qUgEuR+ax+GMD1jcTLBBqqHVg1uzFjcm+u+v/f4w6Zh5gRQyQ2H9jefS
	U58KJkYiAGsafsnRPXdP9+JF7tv4je1TPkhNJ1+ogSY9ZECI1FnqBZ6PCxt7c/d0MNQRsmBeEtQ87
	NXuY7Tuw==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVk8-0000000079l-1jbj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:07:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223a7065ff8so67817775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741108062; x=1741712862; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LA/gKQoFR6dHj4YM+SZIs58tGSpb3MhpX5oaTo2PxFg=;
        b=W3mVZ6iijJ2aOEnX8F/4cVMLK006l2HlY69kY+yv/CD7Af+n+K6mlpbyV6lO0xO7Dx
         shihZvz4MnyLkF6tCc0gLP3VXvl90wERL+ji++poUCC57vpuzljgW+9ULCKI0/TxX9tA
         xHVg8ruGT1JQBVE2wLDCpJpd6y6JudqUWLQebdec55R2+D+O6aFRRERHhpgncD2JgRl6
         CihEH0fxvRhKlxtWyA9zNamszbNjJviV7cxVtXs8/O6YIWcmGLk5Ie6XGMeklj5iOU61
         XED0tG3Mto2dcFn7Rn4d3aeqhoXtMQI9FC9p5VrwKn72+9xsgSAc1NzJPS3PFDYbpu7y
         UQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741108062; x=1741712862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LA/gKQoFR6dHj4YM+SZIs58tGSpb3MhpX5oaTo2PxFg=;
        b=SBbn9EiAMsOcMv9zup2cvQMfvxr1te4qzRAagXbYv4izVVkK9wKiuQ0sgPMMwciiTY
         hJbHB3qFATbGjiMK7W469JZ22fpW1DMwFgRHzwchIii0yz+ayso/5Y6Y5WrIRSO0NAYC
         DUz624IxXUDPloUYtfwfpcKbOoLwvq2+d7Ry8/lDSXitjdmJu+TspiqISSCZoKBQ8Bt6
         /Hl7mNP0WfBbSIf7d/B07KtFMwVaAI0jij7yCRvkS9lTZlC/cioNxLLvCV4a/cO6Yl8N
         Z+EnkL0fzVDCHaDQnluonHnfhkz2++4X1NuDlORWKJV2wQr8lBntK60UP+HcidCJQ7Br
         FgKg==
X-Forwarded-Encrypted: i=1; AJvYcCWgMnDvXxFmWJinFLh2lywKCCL0pvInrUKMu9hUlT2x2rqew7SUEMkfOTh81GVHBZ8rq2awklK5Ygr7CdhSp01i@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOzpMiH5zKNd9lodIPRMaG0eH+LLk//DDIWiWhOCswyoYtYmp
	bG5g8XdDQ2q855erpihG2IgKqhJuW0jCQrd3yAfmn1laISxR36LkUcq1t5OefQ==
X-Gm-Gg: ASbGncvTlYTb5v64CALfZCcHuKLEceeIjkoemKw2bvaUyc8Y+b6fmw5046kntfLGDDT
	g3y2ipR2QQxX23jaOb/hM7jmQhLT/G5R7VGoNMQg+8b+m2zcPq71jw1oU1EGVvq3KKEARNetaNo
	GrR8whrYGXQK9nw7lLWVA6FabgsuzOYV5uK4RKVITv6Q9mVmPzeu29RpGWSrooAJmuk5ecL5MjS
	Su7/xfgoNkdfjtY32b/h6kCDkQUXVeUrrauqUo9xSF79nS84KJ07DUDF2vQiPf5y/vRgP1jRjIY
	BYWWnaR2f2bd8lEmM70J5V6gHa6nsjIOMCpbAjazLQ2gNs7nKfRLkks=
X-Google-Smtp-Source: AGHT+IG9lPytOJ+a9BnKqGkMxxZf/h6DwbYyJiWJ/Q5mVWVtyO5FnvNkcSD22Lz3G7gAfZDKnHhRPQ==
X-Received: by 2002:a05:6a00:1250:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-73656645c9cmr11645970b3a.15.1741108062382;
        Tue, 04 Mar 2025 09:07:42 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003fa5csm11529695b3a.145.2025.03.04.09.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:07:41 -0800 (PST)
Date: Tue, 4 Mar 2025 22:37:35 +0530
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
Message-ID: <20250304170735.x25c65azfpd7xmwv@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-5-james.quinlan@broadcom.com>
 <20250304150313.ey4fky35bu6dbtxd@thinkpad>
 <CA+-6iNyuQskVNjAuX1QcLTPetbfhogGYUTOA01QwNw9YcwAdNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNyuQskVNjAuX1QcLTPetbfhogGYUTOA01QwNw9YcwAdNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170744_913808_65F363DF 
X-CRM114-Status: GOOD (  28.04  )
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

On Tue, Mar 04, 2025 at 11:55:05AM -0500, Jim Quinlan wrote:
> On Tue, Mar 4, 2025 at 10:03 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> > > If regulator_bulk_get() returns an error, no regulators are created and we
> > > need to set their number to zero.  If we do not do this and the PCIe
> > > link-up fails, regulator_bulk_free() will be invoked and effect a panic.
> > >
> > > Also print out the error value, as we cannot return an error upwards as
> > > Linux will WARN on an error from add_bus().
> > >
> > > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > ---
> > >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> > > index e0b20f58c604..56b49d3cae19 100644
> > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> > >
> > >               ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
> > >               if (ret) {
> > > -                     dev_info(dev, "No regulators for downstream device\n");
> > > +                     dev_info(dev, "Did not get regulators; err=%d\n", ret);
> >
> > Why is this dev_info() instead of dev_err()?
> 
> I will change this.
> >
> > > +                     pcie->sr = NULL;
> >
> > Why can't you set 'pcie->sr' after successfull regulator_bulk_get()?
> 
> Not sure I understand -- it is already set before a  successful
> regulator_bulk_get() call.

Didn't I say 'after'?

> I set it to NULL after an unsuccessful result so the structure will
> not be passed to subsequent calls.
> 

If you set the pointer after a successful regulator_bulk_get(), you do not need
to set it to NULL for a failure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

