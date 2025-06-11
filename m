Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC13EC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg2tjw16mCCTcrpO92M+BgLFDyQbF8JC1z2OQxCbfIM=; b=DPwmcwdVDwARNNOl3N2kB9n1Vu
	VYSjXwZE4M1FbBdbYFxXpsSLxqtKe9y9t9vQ7/53j6uZ+Ay6HbBbpFCszoL7Ikp89MLIzrf+8pOjm
	GmfTC8IMeZgXBdI6yKkZFupUxp5etepvgpjmT0581Uxbo9/39cwOnE4sbRo8+IUUxdA7I3bY9Xgfy
	wueshh7wqjUvrSOr2Q4YR7AO6ZlMAeMSMJ7zQsJm0rWb2lJQVlSMD/wMrjVyM8ENiQ8pc4V1ugS8u
	WhXcCFE15xnWldkAU1lPC/DM6m7414eKEbRfCA2i2qcJdzXM6mUbPLFV+OTPAIM1BhaYlzDDz4gCS
	6ngCtKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCZ8-00000008n68-0iDi;
	Wed, 11 Jun 2025 03:55:54 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCPj-00000008lXj-0tT4;
	Wed, 11 Jun 2025 03:46:12 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4e7b397cc2aso398522137.2;
        Tue, 10 Jun 2025 20:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749613570; x=1750218370; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg2tjw16mCCTcrpO92M+BgLFDyQbF8JC1z2OQxCbfIM=;
        b=kgtBx8uz3xi2/p0AlM1vXEWvnRgvSQjKRaionPUEQnM8w7WLuasv+p0IosiZ4eyyRV
         LQKcyfmv02ndcjF5z560HruMqx/DFVZznZVLZOQ5NAm4MFRltNE+06CixwXUk51ISpae
         zeIlUQ7bMDwxCNs8b1qXwLZfgn+Z1Hz5gbxrR5dgEuUKBRQmljI0/NWixrCDjQaf7Jg6
         L2esfMidRzZnYN84Pa6ghnWDKC1qHmz6wSIwC/pOqYe4WbSdLTymtVfZiEZyf0wkMmPm
         c+fypGpCJpk3ZnV8nHWPimT3aqG3FMc4asVYvMqiumW5TPu4A9DbIiqiK3Yqk3/WxXxS
         fXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749613570; x=1750218370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg2tjw16mCCTcrpO92M+BgLFDyQbF8JC1z2OQxCbfIM=;
        b=oJ33KZ4i6B4K0yCkP4FxToqI1Sa2qUkp/wRG00/AxRnrnvifDM03u2IlBmbxs2fAjt
         CEQVTzWmtqWbOcDePh22+QDj0LF7IsdECPVbKKTD+0ozlbSz87XSKFnLZ5iVzqE1K8+1
         2Fm2OsyQR71y3PwCaKQvmB3J+AWEeC9zEY8ZI/914nvtPE/BDHw2r1FXil13pUcr6ULn
         Z5uS3FieDX5ueHF39IG/Pfd99w/AxqVEe42sTGor3d1rZDqUPfvB65s9W+ZW478TSZfX
         pgmUKvmEndzSOV2pDZayxJRk1KC0mejRF+skzz70CXXPtDyw/83LKRcd+x1zFONcW9qL
         JI0A==
X-Forwarded-Encrypted: i=1; AJvYcCVFI67jRp6WpRQmNKIR4u04xLyzsAV5MCXBmlnSt6iPNYoRUwaOwX14Zgfog2qlckCLGWANnj2+xJZj@lists.infradead.org, AJvYcCWvRyH8wXEAWLtRj/x2PMMCBBmJKTWf4CkVcmXLqf525pnnh+U3ji5kDQjW7dZ2bvLLZGPkIsG5r+oIWaoNzdwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyrH4s1kRY2IXpO5QLeU5mLFOBbhYtpJ87e44d83NXOnYBpR9YC
	xRhKmvFQd49HfjdRsTZiymKRqgfEG1rQaQbdWU/4+F5mo7pDxIsHWpeJ
X-Gm-Gg: ASbGnct/Ol+bVyxLzmzsVhEsxSbP9Fr89VcXO+6VsSXUu6VowRx4rWasPElkLZo2FSj
	6JYXKX60/duzSF5q+sRvyRuq78mVQcCx+Lgmhw9BYdS52y92hZ2qGpH6Lp5px+2Mf3XNbFIQyJM
	cWWDWipXEF4q6aryD+Up3EUDmNM42MzlIk8Qe05F3SUTvVvEkru/D0E1sfVttWNE6nUrw51kMaU
	pZL9IZKzRaGso5gcqRSiSttfDD7ibIIEcWbpGYFjiNuoopBh8V0eaxndmoE4x1A9pDJGlxx3MSa
	/oXxsUS6EjXZwgcca+SKQfEVIUNQbK/B75kjVoa0Nj02T0ZEmg==
X-Google-Smtp-Source: AGHT+IEjJ0BsROh1VIAfqNoWerdFkJh/8W2zLPk0S0XAU/Gcu0vW6QlsW9Odcrm98+pKp5HWoPp/zw==
X-Received: by 2002:a05:6102:f95:b0:4e7:3efd:ac76 with SMTP id ada2fe7eead31-4e7bba13384mr1443026137.8.1749613570087;
        Tue, 10 Jun 2025 20:46:10 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5ecc::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeae8551dsm2251922241.14.2025.06.10.20.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:46:09 -0700 (PDT)
Date: Wed, 11 Jun 2025 00:46:03 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] PCI: pcie-rockchip: add bits for Target Link
 Speed in LCS_2
Message-ID: <aEj7-6fMGKSXQb3J@geday>
References: <aEQb5kEOCJNQJMin@geday>
 <20250610200744.GA820589@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610200744.GA820589@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_204611_251985_A0073E4B 
X-CRM114-Status: GOOD (  11.91  )
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

On Tue, Jun 10, 2025 at 03:07:44PM -0500, Bjorn Helgaas wrote:
> On Sat, Jun 07, 2025 at 08:00:54AM -0300, Geraldo Nascimento wrote:
> This stuff:
> 
>   #define PCIE_RC_CONFIG_DCR              (PCIE_RC_CONFIG_BASE + 0xc4)
>   #define PCIE_RC_CONFIG_DCSR             (PCIE_RC_CONFIG_BASE + 0xc8)
>   #define PCIE_RC_CONFIG_LINK_CAP         (PCIE_RC_CONFIG_BASE + 0xcc)
>   #define PCIE_RC_CONFIG_LCS              (PCIE_RC_CONFIG_BASE + 0xd0)
>   #define PCIE_RC_CONFIG_LCS_2            (PCIE_RC_CONFIG_BASE + 0xf0)
> 
> *Looks* like it might be duplicates of:
> 
>   #define PCI_EXP_DEVCAP          0x04    /* Device capabilities */
>   #define PCI_EXP_DEVCTL          0x08    /* Device Control */
>   #define PCI_EXP_LNKCAP          0x0c    /* Link Capabilities */

Hi again Bjorn,

Your message reminded me of something that may be important.

During my debugging I had the mild impression L0s capability is not
being cleared from Link Capabilities Register in the presence of
"aspm-no-l0s" DT property.

I can't confirm it right now but I might revisit this later on. From
what I've seen it can only be cleared from inside the port init
in pcie-rockchip.c and does nothing in present form.

Not a clear, confirmable report but something to watch out for...

Regards,
Geraldo Nascimento

