Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B843AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VDgfijz38wfqRmFtK4m0Gqr6eDYnbyCuwTRs5UPI5E=; b=0BDNtV817OaGNZN1xYKe12nVuN
	r0sVr970e+gRRZm4RdvbcUR4w8lbRN9vQKMEf8thXHiPnNUj1qY0nufpLiCjlBdZR5UlX27SKkS0h
	bAOOqy4RREFI5Dj+QWrYcLsJdUXZrAB3aVFBfmxzYBaXD3kyCWsiL3rSp2NkyCZsZcD+d91IcjyY0
	trzQYEog18SjE/2HQNG3+iRjGAZgg33smLgu5BhekrzRHNnL+vyspG8kj8pn787J6wZP3eq3BTtP2
	GPCVGoV18GIJg+hyh5ALwP+NB0cScNHaFmfwj95+4fANLoXmu5MHoL7V0ADpHGm6GBJE5t8Sx1Ofe
	fY1FXlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkLy-0000000D1dw-1NUB;
	Wed, 04 Jun 2025 09:24:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkJr-0000000D1MO-1Sk1;
	Wed, 04 Jun 2025 09:22:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so630860b3a.1;
        Wed, 04 Jun 2025 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749028918; x=1749633718; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VDgfijz38wfqRmFtK4m0Gqr6eDYnbyCuwTRs5UPI5E=;
        b=lF8LpklNYw8BdYRFsbC2495u1FHdo7arKrmaeSwvbeTiG2wjB4vAzvMR12R52HzfVE
         MSfknDnGy7CPmS8cI+v0wR+haR7pT9bVqJBOGjv7235YN9O7iFYfwF/xIs6+4nUEhZYn
         KGEfmkB5mNO3zd1X8yIstQOf64RNHfzYj9BHJGbdXBKD6b3e8QLwZuxq4BKtiRREZDo+
         j0jLwoSttqJO052bHJ0v8SNPVy2M/2aqYpXXqk+kmP8e9G5GpGeW7YqhMBUY8b+8Di5Z
         QMJ6u6rRfNhf4JEfqkgHG3fnycQ9WhESKowdIilvL4eXz0S/MwgmuMJ9QSn40jkE5+fy
         TpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028918; x=1749633718;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VDgfijz38wfqRmFtK4m0Gqr6eDYnbyCuwTRs5UPI5E=;
        b=QPc8GTj73W4xuVIZ28HszsqDRU10zbnOcuFAbBMleKj6JeaGrlZ+fQ+zmpCn8TdJLg
         rz8rhZKyKJpmcXXzC6OrNqkKH/gJtH/iDAorAQcRJ4jEZ+FgSN3QQSKbbwXV9P54M4F1
         jXZF2DZ6pGDZjExgDpdDhXw8vN2yPsAyhYipt5Obk/J8eLCQ327FEyIuTQPefD3dfivh
         RayJLQS4EKVC08Sl8gYEfJBrpVwKWaYF2QadJuMBQqSO0b77LLzmFLBE0YcE6nC/pOc9
         tYGeg+i6iGZPVeemAxyPgDO3gYqiiKh8c7REsyH9aowluFqTWMUCr9m3+erDh7c3W/8+
         61rA==
X-Forwarded-Encrypted: i=1; AJvYcCXfqN2SUUxos13p9RUgd8J100qwW2KH0grKuUjtl3DxNmLkAQRiaaSrVilUNzkEr8aTkEdwqB2gAn5AAXBEQmka@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHaBrlsjlk/Gp/ghyyMsCWj24tM/3IEz/0l2EUHmYXtrRnTm8
	UYl2VcNhITweurCQyJqfgDnlxJx7cY5qPkOaAChT2vB21cc1slN672iSTHu8RpPtUo9QM80Jgk8
	=
X-Gm-Gg: ASbGnctUa7YptwxgPMgZo4xQhRW51nfD+jLCi3WTCcZI/EI72W9F7sLwgYQSYliUpI/
	j5uvinxzclKSNBFadR6i5bggOEDa8nidx3m2GUifoh6IoId9IaMpUq0Aa0k+GRS1PS8uOkIDWQz
	Db3yx/G58t/oB95JTkrEHH8/myGEsmsmucwK7pezA6mrlLgZAaz6dZWAll80ra1Mey+44bsfsCF
	2nVPit566Gz/bpM7BLuiBAePFvHcBC84O8BSWCCiR58baE+mjf3mnueJQevCa+hpQjCYzVB+u77
	UW3FpJE3Mb2TFzjo7dppbIdNv/Ke9SowqdCYQg==
X-Google-Smtp-Source: AGHT+IE9lIxZe52g46OWQp8Lw4qB+x9M66i/HCShonwVogndogjTY9y2HrMxF8CUQxE3BdFwz/9X5w==
X-Received: by 2002:a05:6a00:318e:b0:746:1c67:f6cb with SMTP id d2e1a72fcca58-747fdfc9152mr6296211b3a.5.1749028918431;
        Wed, 04 Jun 2025 02:21:58 -0700 (PDT)
Received: from geday ([2804:7f2:800b:6be::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed34fdsm10722510b3a.75.2025.06.04.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:21:57 -0700 (PDT)
Date: Wed, 4 Jun 2025 06:21:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] arm64: dts: rockchip: drop PCIe 3v3 always-on and
 boot-on
Message-ID: <aEAQMHAQU3VgTghK@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_022159_386715_B14FC73F 
X-CRM114-Status: GOOD (  10.36  )
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


