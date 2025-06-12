Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3736CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqINRbhBXUv8DDvAKfwGN3D5A5fdVAfIH4y8gA4/FgQ=; b=LXn+AM0/qzjpW5sChLnzPpFPlb
	EYj+03Vme+zCKs7AN/dUtK8UbPO7NIyoEAUgCXnBuya86ricYsu0oSiCgYpNxxoK1m+kP9trNogv8
	x0FPTnLGDQMdT8Ow0rKwAZu2n8DzqpwwGfXGny6RUXSJPwc2KkD6ciklgw3mvh0pV1Z0JWU9txhPr
	Wzoy78L55s+Ahu2VSEm0UIVTQyD0fdyox/jpOXxvF4Gx1rb3PfeprwHwnGYQt3RgjA4rUO6HQ/Z4L
	adp5KyEBCnu/FCEg/u8tpAm1eKrMQnMadJpsLZOxYx4cLDwGAqSVTw7PHZOePC5dZ5f8/NFFFMB5D
	NCSX718Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXyJ-0000000C0j0-3vob;
	Thu, 12 Jun 2025 02:47:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPW7X-0000000BpUZ-0K0F;
	Thu, 12 Jun 2025 00:48:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73c17c770a7so589291b3a.2;
        Wed, 11 Jun 2025 17:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749689322; x=1750294122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqINRbhBXUv8DDvAKfwGN3D5A5fdVAfIH4y8gA4/FgQ=;
        b=e1e8egzpG3QRm3UyEwrKe6nc4py2GsQsOWjkvzsA2huhyZAMwLd7MMnxbOHwvOS7aY
         cXxF9dG45jULXPX8Eb9/TJlAOzX0gyf2YR6Ktbx+2+yG4hVa+CqmciSUdcnmGBsiGk9N
         bUWnUPiRvwuIGSpwjAGpBnAXas2t05raXlz9mpeiH7mp00R939UjGMM81YBUhKCU075F
         wQMdvqwxaAINo7spIOFz4DrAfvdrJ44+rd6X461a62zBUE650hC8/1txMxaCIE57qev1
         EHtvChWMj8ylK5q35cxsFZ6kWsX0DQYqycTwiaI3hzRwEoUCjCNlIlsgcpVSYWZV+YhM
         5OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749689322; x=1750294122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqINRbhBXUv8DDvAKfwGN3D5A5fdVAfIH4y8gA4/FgQ=;
        b=RDTCKzayY/nD/lXkYJSKP658Im5j9qH4ZHoa8sc9k7R+scWuccISWKBnNKqJRMc5av
         kQXp1Ay4YffIWOegMURQMtIWuGXW1ZiuAl2M2ijoFibgUjK5ABMuosn4nZi0CF2g0cxh
         1+arr83+xSsJn8f+lPjnNpSJrFS1APjwi11fg+IJliqf18VIgkQDQU3o2excbnS5FEag
         j0hQulWc0vZR/CCg40PU4O1g1bXR1nvt1GRfdkNVo4VzyAIbFAx1SzJ1gNhVGQFiGziB
         /jJ6ylAOIsO/u78u4fI7x7xkpmZwfhjdvwj47xqSd1LWqgFohna0yuL+wNYWE/x8AnYH
         Qk3A==
X-Forwarded-Encrypted: i=1; AJvYcCXDBTffVkAlngLEpZmXwCvjz7wndjlG9IvHqZzr5lKBW9KcbzBZvSD1CXc4x91jA+/4ffckoikBfC9JuSYsSc8L@lists.infradead.org, AJvYcCXx27EhSC3dTIo+oPKetbS5xfI/ES6UiT9HUV6yZ5APSYTNqPkSc2pzf1m39nYb0e7SxQvmlMjiB6cl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywonjz8XkpO5n/Tdrs5Hjy7mGflOGmswOSWg6i4CQa4NGZ5fBRe
	Y1S09H22/NvZPdtnhD197yAefQbElQIheBb2vGZDsI5j4c1kn62ieS0d
X-Gm-Gg: ASbGncvXttfiBpxaZ6CM6dVcymI8JI8ncp5GFj8ClIlcqAWny8/lmnrwUkad3aFP60Y
	iefmf9rqA3PONEkHcIW4PWfvs66HYgq43RoVcOlgCcx70YuL40Z7KT+udoFhVAJ3Ug4RBuLL1Ka
	/4nriXhJHGeFovK0Xjr9mSHvRngXznvWXj2f0qroa8ccOfAPGUN/R81cn2/K2woOARln1g1LOzV
	cGoRGPNOWbYDisiQzpdFHF5gLJgvPBzDdJuQDBnL7fmrXyl3xnx6QMQX/Bi5hvo71SMi/4B4mde
	Wk01Y5QxZntZzUzq4pbhNFMQDYuqafve98JDKeVuRVry3Ik1Ww==
X-Google-Smtp-Source: AGHT+IH/jwJJdwYkzPE0y591nja7/GMlqARzj1ko2DlwznP5A+rVIrdUR5MsMWEBoz/8q6p4qz3Sng==
X-Received: by 2002:a05:6a21:6d88:b0:215:dee4:4808 with SMTP id adf61e73a8af0-21f9b720273mr1173711637.18.1749689321805;
        Wed, 11 Jun 2025 17:48:41 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5f6a::dead:c001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611e32dsm221034a12.9.2025.06.11.17.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:48:41 -0700 (PDT)
Date: Wed, 11 Jun 2025 21:48:31 -0300
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
Subject: Re: [RFC PATCH v2 1/4] PCI: pcie-rockchip: add Link Control and
 Status Register 2
Message-ID: <aEoj385BMtLvNuKL@geday>
References: <28ae3286f3217881ae6ea3aecad47ae4567d6ec7.1749588810.git.geraldogabriel@gmail.com>
 <20250611194259.GA825364@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611194259.GA825364@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_174843_111465_1D4BE9BD 
X-CRM114-Status: GOOD (  16.84  )
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

On Wed, Jun 11, 2025 at 02:42:59PM -0500, Bjorn Helgaas wrote:
> On Tue, Jun 10, 2025 at 06:19:49PM -0300, Geraldo Nascimento wrote:
> > +#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP)
> 
> I would really like to see PCI_EXP_DEVCAP referenced in the source
> where we currently use PCIE_RC_CONFIG_DCR.  That way, cscope/tags/grep
> will find the actual uses of PCI_EXP_DEVCAP, not just this #define of
> PCIE_RC_CONFIG_DCR.
> 
> Something like this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pci-mvebu.c?id=v6.15#n265
>

Hi Bjorn,

Yes, thank you for the code snippet, it makes things more clear.

> >  #define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
> >  #define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
> >  #define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
> 
> Also use PCI_EXP_DEVCAP_PWR_VAL and PCI_EXP_DEVCAP_PWR_SCL here if
> possible.  And FIELD_GET()/FIELD_PREP(), which avoid the need to
> define _SHIFT values.
> 
> I would do a pure conversion patch of the existing #defines.  Then I
> suspect you wouldn't need a patch to add the Link 2 registers at all
> because you could just use the #defines from pci_regs.h.
>

Got it!

Thanks!
Geraldo Nascimento

