Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74371C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u96x1JfBwvgLGiFlKKRmBEu1YqkfwBmaBuctHI0YH60=; b=HdDn7PSiBphb5FTejR9np1rg8R
	EP22gl4nGElNRDNWf6+b9MsA//n/BgpGe4TnBWtcas4cH3Rl3XWAtt/BndSJ5WqfAZtY7FaBnsKlj
	uZ9xgNlowN8hgEFzLBu4MFyLC6nQ1z77i8tA3zxAzjdu8k4SY6+zf/QqGTtp4yIKCu0xmq8phngrq
	OguIlfpbgLjVQuFRosPKfJe/SVdyGvaxYvXL+55KZCM89uUkJwChA7FndUG5JBUTWXZ14tfldIEA/
	vOXULJWvhOV2wnOS2MEY8PIwwlhIq83ab/+ziadPTomUJuTVQ1YVcEACI8OSMSOPGpmAPu8ylcwEn
	9bt/zaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbFT-00000005YYc-3SNE;
	Tue, 01 Jul 2025 13:42:11 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZi7-00000004zNY-3Kk8;
	Tue, 01 Jul 2025 12:03:40 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7d412988b14so568946585a.3;
        Tue, 01 Jul 2025 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751371418; x=1751976218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u96x1JfBwvgLGiFlKKRmBEu1YqkfwBmaBuctHI0YH60=;
        b=bhvxa79wdgciYS3k21GpQB1+uns7T0YdaeFXo8GOblVfSDqFwj+x1T5WTG5lqrY2kS
         oLYL1DyiOKrnG+GM8+PWJ/8eTwvA1JsspbHeeMbnHDv3FIeoMpsCc3ciMD4d+Hz7VpLL
         SwvWNmDKL/vAgSt5BNJgSVzsOusPfjdsu3p0QU3F7HdqCfqYrRdAv4FfKRv7WLCqbB6J
         N7TgZvOajcd9tme3vpbfXPuBitKjkNrSLbHDqnX2NMV/s1xs6eeBupx1Yw+ktF5ky0Lu
         x5gLx8z2vqV3LK2tH3OB6w0a6A3PSapaoNdXvIVzo9/15rgnbFA1K4KmMJjd4PYIIr46
         bteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371418; x=1751976218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u96x1JfBwvgLGiFlKKRmBEu1YqkfwBmaBuctHI0YH60=;
        b=HRWy6e3QCyOkrrd81HuguWFRyJ/GpWBhR0582m3epS7aME6pQC+rNEvBOQ4I30gbgT
         KXOAvnG0n4jsQvIERdU3faPB/s24ZVg3SsSUoSJb7BGOuOy405h2QF51rllqISSxTW3t
         c3H/72D8JOiiaMGe0YcnZzEmNSEnM1+9A84QeqKLAGTtzlL0EzXta8snFaWpS24nJlM1
         n2tMHYOBBDjWlFLKm50Wrhfie7SEJbEDKbijoX0nwYydYUFVgpz/TpPDhyK5ATI/aBc1
         MwJRx9/B4WCgScBd5pfDB4oWCUdAoHFvzYKIjdegMGdWdDxY2HOhPsH5QrLFtOxEvM1a
         Y0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWhUjTXD5j9VYwJamaL8MI+KS4CMcrjI522La2BhasZgieibgTJmAslspG1uwWTrn/TPKHhegbdDvcjYhbLPHt4@lists.infradead.org, AJvYcCXvLAYGUj7XLNbSLG0lDarbLLbtBZeQr4nKZ0pZAQ3uZq72DpqtWaLoGpsSjj5LWTx11XpSXvnOiXpp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5pKHlM5qM2jbZ6d0/aJ3X1QBPPZMbkx4sXSeQgJvDL5+McjOT
	uMx61nxIIExLApv9FXqlducXsCctApR/yRUPG9vyN5RZHhwUtO+IQr1c
X-Gm-Gg: ASbGncsFDYJgHd376/17tX05y0RZgdAjrcEp5sqUmnF5QPgbQrdssT3WQENkdVwe/hV
	49hq7FcNxaReMFLoKzEdc0E6HcdMElE85mhhCx1231ZGyfLFbYCGuNmdYNF4NG25sC3DjCseREd
	YvtX965n/VIEF5SVhhVOQgpcUYJ1qUQsdxhu8QE8FS0vFWNw5HkIlQz8j+1V2l8HluKtG8LU1ib
	PUlAytlopa5Gel4uhTwVhCTnEqNqU6/nawGse++ce3MwwwxyPKRxGN7Pfx8izTzhqECqY1+WbZv
	6iZsZOFrocNNbUDrrvA9W4WQodYr8iq2xbj2co5t8y0Wf7zFCA==
X-Google-Smtp-Source: AGHT+IEqGZkaKeymTeUbc3R0Jer5+f67MSqiVnEtF+k9RaGWT4yLl2LhTIn7tVAVFgdHVrYUcmDoQw==
X-Received: by 2002:a05:620a:4623:b0:7d1:fc53:c6b2 with SMTP id af79cd13be357-7d443974577mr2475688285a.41.1751371418232;
        Tue, 01 Jul 2025 05:03:38 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4f51::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44321a706sm753060185a.81.2025.07.01.05.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:03:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:03:31 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v9 1/4] PCI: rockchip: Use standard PCIe defines
Message-ID: <aGPOkw2G2IeNhDRy@geday>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
 <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1751322015.git.geraldogabriel@gmail.com>
 <ce0fdbf2753075056c227ce7567a69386a5aa0a3.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce0fdbf2753075056c227ce7567a69386a5aa0a3.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_050339_836086_50EE2A63 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, Jul 01, 2025 at 09:54:51AM +0200, Philipp Stanner wrote:
> On Mon, 2025-06-30 at 19:24 -0300, Geraldo Nascimento wrote:
> > Current code uses custom-defined register offsets and bitfields for
> > standard PCIe registers. Change to using standard PCIe defines. Since
> > we are now using standard PCIe defines, drop unused custom-defined
> > ones,
> > which are now referenced from offset at added Capabilities Register.
> 
> This could be phrased a bit more cleanly. At least I don't get exactly
> what "from offset" means. You mean you replace the unused custom ones?
> But if they're unused, why are they even being replaced?

Hi Philipp!

"from offset" means we use standard PCIe defines for registers that are
adjacent to Capabilities Register, and we reference them from the offset
at Capabilities Register.

No, all registers replaced are in use, unused in that context means they
(the custom-defined registers which can be referenced starting from
Capabilities Register address) become unused after the change, only.

> 
> 
> > 
> > Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
> 
> s/By/by

Thanks for the capitalization catch. Unfortunately there's little I can do
now that Mani went ahead and applied the first two patches (directly
related to PCI subsystem).

Thanks,
Geraldo Nascimento

> 
> 
> P.

