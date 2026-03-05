Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC8EDEC07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdZmXhXnDlZdyTZS1Hc7DYg2ETszFmyndF++qZZtg5Y=; b=WSxWbi4RLBktzwuuDMRMnhIiUX
	CPYbZT6XW0dOqPqQggvOtuxZXtxjonFyj68fRx3+O0IvqNMkuLx8hNQJuNODM/ZgQ94AHhdqtGh4X
	TPAu77EG3zSNzeUf1pQ/eAc9jvsbUWUJ0A0+ZPpKB5wY/62mlnzOuc+aUMz5xfiaQ+DC//cQQfVu4
	X7HQXQrVTidOIEKpQ7VU2S1BjaLw3rkkHOgK9hQFGiieQdXio/Oy93Z5BlNRPpqCVGlcwqCfAdt5K
	sa4KF3x7/ENuuQIrOrZHfhKwjuBcu6O46Uhs8dJjLK5Bz7siRI37kL3MN8TFKnFB7pQy9+QW+/gKf
	c1YtO/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0w8-00000000vhg-0GTX;
	Thu, 05 Mar 2026 05:07:48 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0w4-00000000vgs-2625
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 05:07:45 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso767424137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 21:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772687263; x=1773292063; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdZmXhXnDlZdyTZS1Hc7DYg2ETszFmyndF++qZZtg5Y=;
        b=ViH/pMf+TgIH3nPnNRfciDjYhx4QlKz5i8gbuXUB7yynsQpGorUkHXXr9VDl3ahx2q
         LR83wrS5U2MkD+NWwtik/DOuGdeW3BLEm55P/CwFTclNOuO3GbSzfdraHdx3kiUTA7jF
         CkLVA8l97cCrEOPhLyjjS+w+8urxie58LoKYtVlIBsW+tPtpMFxGINee8icdtvKxU9vL
         8GE5c0TRCdPZbL2cmh7tc7mF3o5T6tNkK8FEHz2HwiI5oB25FXK4VEeYi/wsSmnE/7xP
         ILCcMsixUxDrEBrXIpGQ61BwH2522i1H1osW9EyozcpShjEQr8QakKcy9MtSrIP2R/WD
         C19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772687263; x=1773292063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdZmXhXnDlZdyTZS1Hc7DYg2ETszFmyndF++qZZtg5Y=;
        b=Dc8/dINCxjNEr6bCIigKxfS5L1Uo8N9AwS9yxfxGq+hhTPZXhZEjUhWYvoprA9kpeZ
         tKZuGR1sWtZAPsoYcpTaLIlw1t/0wujQUQOXv2eFnm0roa4xLU8J8LXB3I6r4xrL7qFS
         AaWq0uF0qJl4DXZiK7eicB/Ip1H1rDlvYxM7Sj5EwAgZT731xvHRHlayYOqwlAVscRCn
         lhkROGNiswklsPtHblCcRoIjoqxiWW4UU+ZXHEoH8GrgSdm6BnXHUdrO1xZABxbcSoQH
         6fShJdmYONv/Fpa7vmwUnoZyAwXjd2XOtBh3MSQo/80/6RoUSPt+zApsCAxtJggXu9Xj
         A6bA==
X-Forwarded-Encrypted: i=1; AJvYcCW4cXts/3/Sdp84lWfM3wgF5aeQtF/4O1YaC0Z0+OclLyb4GiAYXOcaH8HdkPMnY4cVOu945B/53nVpfpx7C7ap@lists.infradead.org
X-Gm-Message-State: AOJu0YzWOlvT1Z0RbE2xXM2fjjLrMDFiFUIYz00HmlkSKI4l7U0r2Ly4
	p8fefSmYPtbOSBUlnb90bWEETzKrPJ1Nh/XGfc3m8fk+tEmH2/fmkQ0o
X-Gm-Gg: ATEYQzz+Wta/7clu1O1T+LQKiOl87nZC65GaYe7tHIzkkdn9wyUGCFtPIs99iyzhBaZ
	hwNTlHFiPwaqPy34qxJx95kuwfLclSU2xi+d1Jx/7n7ib3WumrzCP3b2c7NOiVZlAmtQrbSLb4l
	ueFvwiM2DDaPqIgVPJ1BD6rhSX8dXVxe7+1h5J2ZxM692MOBpErjkoRUsbyc4Zcmm8SpAPqRVl6
	+lEYwp7U2+gcfmfy2WlnOJfXkkxAtpy7T1BE9+cyS+4yyibZbMcTCIJ0ZFo3BU7SVev21UXwePL
	Na0Sg3XbA+DkVhImvi5BmIo0lVt3QydCKU4jCneWRGAtVUhKDLlwyOjvBvGggTySDskLKmOwSW6
	tKZVhhMOhyBJeJMHKfl8BMCq29vRRvzQ0cEcgiPoqj42gG5neEBhKARxYyhE+Dp8hYGVpK9cqP5
	E=
X-Received: by 2002:a05:6102:c4b:b0:5f1:70fe:3027 with SMTP id ada2fe7eead31-5ffaae99a69mr1529688137.24.1772687263133;
        Wed, 04 Mar 2026 21:07:43 -0800 (PST)
Received: from geday ([2804:7f2:8080:fd2e::1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffaca9c848sm4177694137.10.2026.03.04.21.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:07:42 -0800 (PST)
Date: Thu, 5 Mar 2026 02:07:36 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] PCI: rockchip: drive at 2.5 GT/s, error other
 speeds
Message-ID: <aakPmB9-A0yS8qKM@geday>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
 <2a0a4aa97bb8b0cb511cb651c5d66c9ec8bab97a.1772239598.git.geraldogabriel@gmail.com>
 <d2b91260-7666-3606-69ec-0e7cb7a48c02@manjaro.org>
 <l3y3isas7rfe47uwk3bcvx4qpkpfen3j32omy6r4rxe6kn4kas@c4z5ydkervkm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <l3y3isas7rfe47uwk3bcvx4qpkpfen3j32omy6r4rxe6kn4kas@c4z5ydkervkm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_210744_574687_D224D2BD 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, Mar 05, 2026 at 10:18:34AM +0530, Manivannan Sadhasivam wrote:
> Patches 3&4 can be squashed together, but the rest should be in separate patches
> as they target different drivers. If we were to revert any of these in the
> future, it becomes easy.

Ah, OK, Mani, thanks for the clarification.

Geraldo Nascimento

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

