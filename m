Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70BDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lhR8lS4XUOYrg/cKJvznCqYvDCeN5D6JpGXwFX6eyoI=; b=UES8OhHFmy2S5ot+dsg0QSuLVj
	gZMr1NiMVbDNhluFw6hRw+1yPVeVU3UBpi7sRUvEmOl/fXv/y/5nDUg4zGPiaBPJqlR6bfl0YJ916
	vhdNoETEXfaWunG+sVxSGFCcPXVLe1gUbo0tGYq8aw563X+0YPhOuDIGPlBfT+iYq911cy9bR3H2O
	rX/kUq30LksExGXVpZYMzAvQM199Zdu5E2zDF2J/eGpz8heNwbZKEapjTc4xCJ2MuX1SkM2TrEk/p
	oneWCodgmC/MRCcE1mNOqczgBofifwkEcJkoMNGxgOV6l+I0QmHPqu/9k9ccgi0sv5EkttOIHl3No
	+oDs6o5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDpB-0000000G4wD-0iV2;
	Thu, 05 Jun 2025 16:52:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDmx-0000000G4UU-35c3;
	Thu, 05 Jun 2025 16:50:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23035b3edf1so12034285ad.3;
        Thu, 05 Jun 2025 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749142198; x=1749746998; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhR8lS4XUOYrg/cKJvznCqYvDCeN5D6JpGXwFX6eyoI=;
        b=e3afw6Jwh1C6vCjHu87sRc0wk9wNnmuzU0vDZ/gprYbi99KIuU5k3TkKRF9nv4e6t3
         tj+n9LeSSuiGgPdMMgBg9V50uCq4kdYL+C2UFgjvUfBA6DvxN53b5wthPGKI+Rql+jng
         GxrCP2tahgPIpwTUjulShViIYYzT7DqPETl64J3ZurfQJrT2M41OhWoutxkcwt1a0PYh
         MUi3XOPsMuBOgQVoPP4dsM2JPRcpyq3EFV5g+x4XAId2SBhESGGqGQRE22bQrqSZ5jZK
         rp32AXXOwVavnbY77uKqy0t3LYY9L2JkRlVjXGS5kq9cIRVswzZ4A13/m2vviENFEwMS
         hMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142198; x=1749746998;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhR8lS4XUOYrg/cKJvznCqYvDCeN5D6JpGXwFX6eyoI=;
        b=wcxDtKYRAm40ZKqLdPMr8chhptA3Rz/EzyCGutsxQcTiv5YFWCqoVXmOb1O8PWkJdS
         RDZthBlBJ3+k0fn4FOtdo/hwc3kURkn8hj/y2U7kynzbU+buj0RWw9TRZJ6oLFBKYHB/
         2sUzYFVamrfba5Di9NgXfDk/56mduqddmgLmaPpzUxafUiT0jahPQtvpRXw08hJ7p9lf
         gB/jkhJURZpJLiYOMyzrM4Ti5nKdd6Ang2J0q1tgpPx7XYcqXg6tY+w0pRycv4Z1wdQk
         nwS6t/MNSBg7aJkYb7DaxctcvewVVBOTnWewsOjJ58IhcWVRIr7zL8fB2dL0Au3pmOkk
         rNWg==
X-Forwarded-Encrypted: i=1; AJvYcCVcUiHvnPe1t3TgNapiVzsqxyXd7842wTxFi1U6KJsZ6QGFEwVH7TxRBzZ4SO8nKQuPVnTnMhzkBjKbWqbZT7CK@lists.infradead.org
X-Gm-Message-State: AOJu0YzPPc6jZwC0NeXERKha1pUZNvXds0U19Tqcoqt6wvFfzMBJuSup
	O4G8x5x6XOEysvQ0lKZKpObg+LBNB57HlM5E+bzytkNITry65DWN2Exh18UeCAev
X-Gm-Gg: ASbGncsH0sTRl95ECwk+gw9DklY9+2lo8mqET812x/hBTzZzA1+ayTc3mMIlbS51nq3
	1/bVQ9KTwFlhJmSvSfnjLtj29u5lnjs0ZJ/3sXzVgfcmDtx0pFMpjKn9Ive3p9Vp9JtecJu9/Ty
	H9jzztMypHx1rLyf9SQ5wCnykbvY2xg4aiOGWnSFhOq8qT6lLwdikY+X1heTSAxiC4nomIw4cKo
	BvkA8Y72twxYVc1HbZ+ugIFchitCBuEyTnpMymB4fFVjZuvYI1Zfmum5D6cdd6LQC3LwItVSaRW
	+eBBnv4oIVagh0lUh/w9svStiYAPHtvs/sKa1p0UhUr73wxxfQ==
X-Google-Smtp-Source: AGHT+IGGx0oc6sieE/ILJBMaYCi/QgYY3JcxoraylNTYLqGC8v6LFdTtmeLkbdNepAaATIhTIk1m8A==
X-Received: by 2002:a17:902:c94d:b0:233:fbb3:c5bc with SMTP id d9443c01a7336-23601cfe606mr1324625ad.19.1749142198352;
        Thu, 05 Jun 2025 09:49:58 -0700 (PDT)
Received: from geday ([2804:7f2:800b:110a::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd8c4bsm121358705ad.110.2025.06.05.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:49:57 -0700 (PDT)
Date: Thu, 5 Jun 2025 13:49:43 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 0/2] PCI: rockchip-host: Support quirky devices
Message-ID: <aEHKp1JCiez9J4bp@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_094959_777849_2FA815F3 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

Hi all,

I understand there are lots of already-working devices with RK3399
PCIe but there are also many quirky devices which just refuse to
work with RK3399. This RFC series is meant to alleviate this problem
and has been tested on my Rock Pi N10.

Resend because I forgot Signed-off-by :)

---

Geraldo Nascimento (2):
  PCI: rockchip-host: Retry link training on failure without PERST#
  arm64: dts: rockchip: drop PCIe 3v3 always-on and boot-on

 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     |   2 -
 drivers/pci/controller/pcie-rockchip-host.c   | 141 +++++++++++-------
 2 files changed, 87 insertions(+), 56 deletions(-)

-- 
2.49.0


