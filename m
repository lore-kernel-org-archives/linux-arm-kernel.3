Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE1CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0jY19iaea2nNrTmHpo4mZf39vSCWNkS4XHLE1IKd7s=; b=Hhlw9C54uQQNhk84DZvbvTZ9LR
	075grFl0yiMq3SSz0iAwZyQYCzDTlykdwiHUUqTEyvk/HQHmAYhqoCnpSJklRoJnt+Jev9ovPw2kg
	8cdvz5veXwPGIWmXlHPPF1u1EIWpnUFCTcuwNUZbdskQREUdGDg8PU/WsdGSLQn78tKu5NgExXCrj
	uZRP497pgPujHIbz/g1021ysNZN6nOVGUul9tCr5HX8zyfPP6VF++t9HOQiEqLDSJJzgPlHtNZFwO
	irSRv5FixLDIlBE4FJy46qb8DNuE4B4QDfYXniYB5M5Pu95INeC2UMZoF6+ZCO9y8R1cuIeFECHtE
	hCSKSBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Fo-0000000Fqh0-2yfY;
	Fri, 14 Feb 2025 18:17:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizcY-0000000Fk0m-46WC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x0jY19iaea2nNrTmHpo4mZf39vSCWNkS4XHLE1IKd7s=; b=h3dipBvqp7YdBjewsf/G7KnSQE
	lZFwbNwC4qcFtRBsxZKCvAaMiVga9Ra8RiUEUwVDRrOoUMMPHgTc7/qbQaqQyFP6L0X42UzUMMVo1
	8FdtUaTAA49xbQHd6e7sEsNNpAsArTvxVXsSV729N5DbxN+WStPBClHc9GOOBjhR0WUMq936f640n
	7LeXl3W1uo58Tu+1Rd3JoWJe7m0YXU3lppBrkFxnIK+6c28HLUyqSOQvrzCnQgCZ9XvY+qhtR2yk2
	DkkG+JrCzxgd/MsdZDSeMtg++j6NTVBijUcpZD5Yw8sgutAlrDW60Nx+B28yN4JX71PhgrnoDJj5q
	elMhEHzA==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizcV-00000001I0r-3dds
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:36:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fc3db58932so539656a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739554612; x=1740159412; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x0jY19iaea2nNrTmHpo4mZf39vSCWNkS4XHLE1IKd7s=;
        b=kR8rMQXEQXcnOcA32ZfMbQ+l/upeTiLnmPggRcpNmHltoB4cHUR0KCk6RF6I0MlRGh
         r2m8ANiqbEHPHOWehd9RkDITSAIIsEib69+ege1msIAFO+QSquKsmxummOTlFgg39YhK
         +WWIAM+lLXL8+DC9ByBnVyY9SpF7qC1in1efKJP7AuILb6K71qHI1Na/YuASlrYU6XDD
         4p4kevdA+9Blzdrq7J1t9z7psuv4rHwR9gPZ15M1yuzCu38uvx1U+n2QSx8OdZ/iUZrq
         In8sRYWnANsShUpr2m1gA7tEtOORo7HI7cjEGtS1CD05LnRCNKc6A7LGlagsNmp9P5ex
         qToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554612; x=1740159412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0jY19iaea2nNrTmHpo4mZf39vSCWNkS4XHLE1IKd7s=;
        b=UFzfxXgJed2y5wslduFEvI0hIniM3LBqholKUf7K56ik9+e/UQOfFG1IyOz2xcXSxA
         wn4+AdHQMEzWalMos15Ew51JWjRwtfn9NgznOAC7IF5R8uuqEcKD2O2N9pPOz8vLFivU
         67QapYZjrTfaGok7g7EqdnFTqHTM3T09tMnDRNPViytRTkJGubCrjNoRXhTolhZFjKkE
         zXLHFTS+VhPVK5okrguQmx0wzWWH0dXh3n2Jq/nK9UoNa7sIUghC/7T+INfJ0TZErhdT
         ULDmkM8q7FhPr16N7/FGgxbyGff5c8ire3cqcso+xxiIEbTU2jkCiUBtk0TTMn9zQQio
         cC4w==
X-Forwarded-Encrypted: i=1; AJvYcCVIv5rRI6hphEd2KY7sB4ZeK4Re2E2V12tKHpOo6rAgO5//2N+GbEt5fF1yHZX2pXSS8AH7k22RVFMl+aGpbmms@lists.infradead.org
X-Gm-Message-State: AOJu0YyXjlkdMnLBnmE19a6aAF5FVmgj1pOjnjCeb5Jmt2d2MhXemmyU
	aRehqAZF3nKf/OB3KLdEkcONpieKNIfqXZDKSi0UyPWuGhdxwRMa6NxxwH4I0w==
X-Gm-Gg: ASbGncv1f/L6mpD8cGCB/7RlkXXTQyeLIQ/Dtm/PvH7HWrkh4DavaofNx7NW1Pl7ZRQ
	KF4Bs4iQFiAKzMeDLC0iqampGtCDlUkBF93MLJOBchm0leGlzmlZ7NGeI9iIujtgRAf+GbjmX+Y
	LN0YMY8wyY8tlMhDWD9rnQ8MCXfWQbTKHOatKvQEaSgeK+lyLCxLo0+f520gv3Sd/rvb9rkUNpH
	eCMLFlDVwUEqy4vjL5ZHhHtXGevRwgUfLO4INSLOR8LLa97uY5cTbOTnnDq6IZWekFLwfF0Pn9A
	A0LXdFYULq8g7LWfX6ESm2/p4lQ=
X-Google-Smtp-Source: AGHT+IHKfrs4FETuoSjUaKGkOVOod6jMEGCivG1TYtrtM3L4Cegl83GReBakCUd0Jg/vqR4qQAqZ5w==
X-Received: by 2002:a17:90b:54d0:b0:2f4:47fc:7f18 with SMTP id 98e67ed59e1d1-2fbf8f32cddmr17994333a91.10.1739554612431;
        Fri, 14 Feb 2025 09:36:52 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f0facsm5470601a91.23.2025.02.14.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:36:52 -0800 (PST)
Date: Fri, 14 Feb 2025 23:06:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH] PCI: brcmstb: Adjust message if L23 cannot be entered
Message-ID: <20250214173646.gnq2xz3zwxgguqqw@thinkpad>
References: <20250201121420.32316-1-wahrenst@gmx.net>
 <20250208102748.2aytlzgzbvm6u4vi@thinkpad>
 <32e74c11-d6cb-4c42-b9e0-a52bab608c16@gmx.net>
 <9d7ddfdd-4355-4566-a160-770c661281a0@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d7ddfdd-4355-4566-a160-770c661281a0@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_173656_041413_CDD11517 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, Feb 13, 2025 at 07:59:38PM +0100, Stefan Wahren wrote:
> Hi Mani,
> 
> Am 08.02.25 um 14:22 schrieb Stefan Wahren:
> > Hi Mani,
> > 
> > Am 08.02.25 um 11:27 schrieb Manivannan Sadhasivam:
> > > On Sat, Feb 01, 2025 at 01:14:20PM +0100, Stefan Wahren wrote:
> > > > The entering of L23 lower-power state is optional, because the
> > > > connected endpoint might doesn't support it. So pcie-brcmstb shouldn't
> > > > print an error if it fails.
> > > > 
> > > Which part of the PCIe spec states that the L23 Ready state is optional?
> > tbh i don't have access to the PCIe spec, so my statement based on
> > this comment [1].
> Please tell, how can we proceed here? In case L23 is required by the
> specs the driver also need adjustment.
> 

I don't think the spec mentions that the L23 Ready state is optional. Atleast, I
cannot find the reference. In that case, I do not see a reason to drop the
error.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

