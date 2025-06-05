Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01DDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jr1AjOf8uNWev/Vso1mJTfg4siB3r6WSL8vizNNJAl0=; b=tQ8ORLqUP0uLOzz0zM5sZ3l+fW
	pi7I/sk/Lha/9sTAgkeHHwXtS7ioMblvpORfPN9uHNjbn/buHLSrfARLeGqRO1oSamTjz3zhni9vW
	M2rcxCX7e8w6BE7Fsj1qi1pdiCPwWH6kzBd7XdYAT2C4KF9GerJtUlw6yraB102blQ74GbOzmOkXZ
	7tQDkTTxend8rH9bw15N79nzNJ7ZlB9R9iKffYMDfj5BGMUnN5gPY652fyHF6FMnG8Z/W+Mc2qrl9
	C3L0wEiJvxS9Oj1NwYb1H/4x7VojE7cLJL/Bx/R5kitIJsUDYX1C2F3a4cHFENQUPHi/4fmGwjg9o
	CXJZng/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDtV-0000000G5TR-24CC;
	Thu, 05 Jun 2025 16:56:45 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDnq-0000000G4hk-3bUe;
	Thu, 05 Jun 2025 16:50:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1288692b3a.2;
        Thu, 05 Jun 2025 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749142254; x=1749747054; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jr1AjOf8uNWev/Vso1mJTfg4siB3r6WSL8vizNNJAl0=;
        b=l32yiho3s7oV6n5lgrfvmz1JBlg7f3LVe07bogXx4egnNsyM1Pdsh8ba1UWrGDAcRm
         +kPt+MMIqZj8gJ7AmyA8YPmuGwokLGbEoGBE+1rQnHwzvamZz83I4e/7v0vgr6DdcJVb
         uYiSo7wJJ1/FHsWAtKUiVl+u8veKmocK6Vfy5c6EZIbLpPgkvQYyg0DdMpQ/+bV/kn4S
         D3YwPwrhikTQEjEMJODBHV+HZEkCOCg99wFRBJ+kKA3rcTVsl+hQhUINPHdN6tWwHIP4
         QFdPy4KzByv2e8UawL8a0LZsPDSjuowe4glVr1XJvsOATZ6OGPqJSdLFzIPvKkbZ+UyD
         /2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142254; x=1749747054;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr1AjOf8uNWev/Vso1mJTfg4siB3r6WSL8vizNNJAl0=;
        b=j9i/TMOvNwvLhtXWll6XJbkdT3pf805pY5uRUQopM1j3rGGN2RXxD+CI5kXld40qik
         YaN7a1qarcBn7fPQLzGS+jEYsvov501KPl9+tunuVuPDOdJJ47/8oMrIBF629gsRHRmj
         LCgQBXBJfEkVo4wCr8olrbgzDLl5kyFEvrT+I3oxXCgXnBzTKqb3uXG/F8TJW3KfSVV8
         Qu97JNrqig/SVQRso8GsgEsdeD2HH5tOcWwDM2dDJ/y/qaGB6keLKGYIehFswLuY49aj
         vwGzQDo9eIq1HmR9H6GI20C6O9T6Rx2pV4ITaW6vly5jEi3bEGPKQuPMA5FSRj2yesJr
         y3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgc72TanXF1IbTNSs5kgALwJNa4fiGqPwYBYwxI5d+1+JS3jBBRg9or0DgnH388goxpvQ23I96u1iI+gpHVvBy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy25b/qMSgFHtBIx7GJVRNmVhN15+fZCZEMOvsr3W/DdX9ytYUF
	+6Cfw5ONbdRHCpFID23nbCOAeVdOu5FMJqQgpKEbt4+S9hsW3GUeTYO8iHE2JjKl
X-Gm-Gg: ASbGnctYepwvNQlKmQwULbl29D1kb99lhlGwQoq70FsbGH0AU6ay1dfZ51y6LCZsZYv
	rDDPU1uCXtK7lwuLRb8GyDG9LUZ2TWQkcpG+jXQ7l+zK3ecb9+TmbV1lbdDdAtigU6UjR6RbNLQ
	N3r9MVHRwMYrvEcU8v/rmH2VdF+3Wd6JEuYXS82vXbdPFKEQxzE2MHjKl8IO6Ww+RQ455GREe3f
	JRkxUsnnZRjUoqETMb5rnx90JxbNwv2RwRQMAZxpckENhe4zskzy5e7CFFx0fFy8nQRnd2GWoZQ
	S3VL4RYUiTcNvqCKzTf8A7FL+U0EEToysPhD6vo=
X-Google-Smtp-Source: AGHT+IF2YLBAw2b9nyArKYI1W0OrOBCWggspyFjLKv1f0P5D1GAck9jyxFdfQ/L9pHNfflmpDzKqAg==
X-Received: by 2002:a05:6a00:1956:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-74827f09cd8mr531718b3a.15.1749142254029;
        Thu, 05 Jun 2025 09:50:54 -0700 (PDT)
Received: from geday ([2804:7f2:800b:110a::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96825sm13061717b3a.36.2025.06.05.09.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:50:53 -0700 (PDT)
Date: Thu, 5 Jun 2025 13:50:47 -0300
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
Subject: [RESEND RFC PATCH 2/2] arm64: dts: rockchip: drop PCIe 3v3 always-on
 and boot-on
Message-ID: <aEHK5zQbjQuCR1ui@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_095054_902342_6226E705 
X-CRM114-Status: UNSURE (   9.82  )
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

Example commit of needed dropping of regulator always-on/boot-on
declarations to make sure quirky devices known to not be working
on RK3399 are able to enumerate on second try without
assertion/deassertion of PERST# in-band PCIe reset signal.

One example only, to avoid patch-bomb.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index 8ce7cee92af0..d31fd3d34cda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -25,8 +25,6 @@ vcc3v3_pcie: regulator-vcc-pcie {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_pwr>;
 		regulator-name = "vcc3v3_pcie";
-		regulator-always-on;
-		regulator-boot-on;
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-- 
2.49.0


