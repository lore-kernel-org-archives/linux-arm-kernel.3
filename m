Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E028C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxRccK9TPNkSjUlVA9FxqDEHBsSIzMxTRGu02KOjBxE=; b=Mtc8EsZJDrcThnaNt2A2ysU5hW
	G03JECJgf1xo6KzzyqMA0aSEqZaFbd6LR73cgeo5415AbL6RPvGu+I4LjgEGi5Ml7jHka8NWmT5xS
	1JoN6QEdzd3sp8hOuGLCiyyy5atj+gxU/C3mhfbezSnIe7KMIp30aQuaYxkGR0XpTqXdQlYGu9SLB
	qdR8vowGSdElHF1otAF5ztrvrENnxQA7yG7zdELJj1f+J1hRFDcAR6MBZ6L6H5qmOSB8IvmynN3/L
	qBm8NbswZmnTgjStNhaBrHjqPNqmAg1C2ZApuXr4Q3/Dgyc0Yvjwlrm4mBzlGe5nqOsgzSw7Zr6r5
	2GibzoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx9u-0000000FOvo-1pV7;
	Fri, 13 Jun 2025 05:40:58 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx0T-0000000FNnI-1pfs;
	Fri, 13 Jun 2025 05:31:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74849e33349so1660773b3a.3;
        Thu, 12 Jun 2025 22:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792672; x=1750397472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxRccK9TPNkSjUlVA9FxqDEHBsSIzMxTRGu02KOjBxE=;
        b=KADC+c1MLuksktrquASKUFeKZ1C7uHvF6oI5xlpX/XiqZAA22j92+WoFyE/H2M/+bO
         Np8uMKm0n4eOtdAQW/nc0D4t2hCDigrUZJVlutQZGxnOayyZE4N5H03Pv6zXKIwvTSZz
         rSMHYFJZdpOWjzMwRbvInRtjknthMgWbeKgsed2YWvLffC9cZ0lkexYcl+fIMdKseNgf
         oI4D3NPYxAQH83UAM932P6XqYbv/+BlAtfhJmYUQIUlGec/Chiyxu43pn6ufLITvHVBa
         TOyQMX0s2x177VpoSZQryF03ryf7pM3fvE/blfr8CxhbbYKB1CC11yfpkhT3gc5KipO+
         vVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792672; x=1750397472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxRccK9TPNkSjUlVA9FxqDEHBsSIzMxTRGu02KOjBxE=;
        b=kTcudBwArP4jz3+so6b5JnC2ePxstbnVDmoAG2VNzIU11wT3EwEE/MuE1RyJGP1mH0
         9iZhrSXLe/MxMnlgaUK2+VxxbHO6yUMom+WGH1HGFAEn+jJq3PB+zljOIA8qsKETt1C8
         Fq0okRXDEFIQP1E58a4tCKMOm3OW3M+ChO6H+gYHyKEcxbOuYhnWHbYG1Ya96ElZ2Hj/
         TZB0qaJrKqzs+kOk3MyJrtoemKgMRa5UOUAQdAcoaZ5UTF9bXPowOZAxlNMo5S9CoE5o
         jnnzCBwhElJJ4eoe0G5H107pxyGZnGmKJ3KMCxxZpLilJK4P574XOqIU5GA3w3O0Um4J
         X4KA==
X-Forwarded-Encrypted: i=1; AJvYcCUTmalICe3J6KEuuohTAN12CbDhrQIdrY8f2i7Drn/1//rUe5ox8/FBPERV6AnbtVfc5ukeD9d2/9GG@lists.infradead.org, AJvYcCVGjNksSv54m7VD2M6ScT+8yFcXGgawqhxi70BHQI5GUVqZ9EDcvGRStYN0qiqe7X2hbEPaB8FOg13t3DR06zKV@lists.infradead.org
X-Gm-Message-State: AOJu0YyUqIGLLTNvU7PdmFlFBuCh9Wt9t70ho09iRo3SnjPC+JhB2XPX
	DPO77dUfZQxCfaRklzwX5SU3rs7ZG0itNDWJvVT1mcs7AOR3gsCw1nyB3WQFDwo8
X-Gm-Gg: ASbGnct8uQVrkRYB0doKWCK7thQwW6fTe6bORAB6CRAP6D+HS9UeJ85pl5c9TTI+js0
	bXt4S9PPJawwPw0JkKFZcvNqTz8XF4qErp+OfeSgqrJggCTP4rG3KcJRETUSR87AntHOc2cVSva
	+m1n0Rs5nKUiUp2KOFrtuukYCNuX+IU/3BG+WpTMI4aRIpY1CsLKSJQVHUWHAdUVJbIU6x76VPu
	4H7XNuyDYhJrytDTSMpHj3tyXqInvff/rxypbMP0y4qY5aHN1M7Y4ngYDx/qjHvaJlpyKZwN6QD
	doaDkMD2xhBtdjMqVYqPylys/QtwqyMW4VzsdxlXlGBAc0dSBlFE1lBWhzI0
X-Google-Smtp-Source: AGHT+IFW3YLUNguMP7Jju7pJGbAloDxqM68G7zonX52FPkJnUD/CTS3dbXq3+Dz07CjcjRnXcH9SdA==
X-Received: by 2002:aa7:88ca:0:b0:746:25d1:b711 with SMTP id d2e1a72fcca58-7488f71e65dmr2200476b3a.17.1749792672571;
        Thu, 12 Jun 2025 22:31:12 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeca16sm717943b3a.35.2025.06.12.22.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:31:11 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:31:06 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 3/5] PCI: rockchip-host: Set Target Link Speed
 before retraining
Message-ID: <aEu3mqIp-QjgYTWT@geday>
References: <cover.1749791474.git.geraldogabriel@gmail.com>
 <ad9dc26689ae2c9e811d093ba18c9e579b6747ea.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9dc26689ae2c9e811d093ba18c9e579b6747ea.1749791474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_223113_482856_FF5EE44E 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Jun 13, 2025 at 02:21:59AM -0300, Geraldo Nascimento wrote:
> Current code may fail Gen2 retraining if Target Link Speed
> is set to 2.5 GT/s in Link Control and Status Register 2.
> Set it to 5.0 GT/s accordingly.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 65653218b9ab..68634ae8caaf 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  		 * Enable retrain for gen2. This should be configured only after
>  		 * gen1 finished.
>  		 */
> +		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
> +		status |= FIELD_PREP(PCI_EXP_LNKCTL2_TLS, PCI_EXP_LNKCTL2_TLS_5_0GT);

Although this incidentally "works" for facilitating Gen2 training
because mask clears 2.5 GT/s, this will shift the value 0x2
by the mask I think. This is clearly wrong, and instead
we should use AND clearing plus OR'ing the 5.0GT/s value.

But I wait until at least Bjorn's review to send v4 with
correction.

Geraldo Nascimento

