Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55DEE77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 17:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/vG553TVWbrvDJ8ib/SgrZyZa0BMl1m3x5rzTpMHdQ=; b=NGiI4vXDt5JaP67BoVlkarYJso
	u5vkmzAsQKuFsIH+BDFkqcOOYRvbcM1FKhnFD+mPHHQnLETBbvzeDFlT8wnzxuwdw3m2CY7sDkgCy
	7ZyMI5EBAOtHAXUxW/dEnqwN1ytCJZkRdToAbXtS/D91wc72A1EO2rz5HHtg0FDQCnpS/LCG+sJVp
	qxGsOZ1c2VMDVbFuZqoywLx2so9u7CbkTImJWzh8C26Q1WV20tbila4QqtOpnOlZnERJVhHYhVe/U
	8PPdo2+z+/jXPEeo/xEFKZN2OnhlsnHijdb6UaVlwn/cBNDKLGVNP9S1wI9SXSyVN19i2WZDigMxD
	ibflmatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUUk6-0000000HD93-0SqV;
	Sun, 05 Jan 2025 17:48:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUUi0-0000000HCom-3Q7g;
	Sun, 05 Jan 2025 17:46:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so24543092a12.3;
        Sun, 05 Jan 2025 09:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736099199; x=1736703999; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/vG553TVWbrvDJ8ib/SgrZyZa0BMl1m3x5rzTpMHdQ=;
        b=WhfUXdX44rsmf9yL6ZkZ4wkRpaJ7XiZq5hl4AarN4OahZAEZzUZvY5dJwnInv+IevJ
         lxxc5ZuRc20kp+w1xi/aQM5YT6RD5+S+Dc9B8GE6TwDcIP2eDxpN13CtInqnTALmWF3T
         dyvHmm4rTve81BzJ1P+DG7bBr+2vpM7yZdQ406odmQ6ZvaQGKGeK8xk8mEQFFJ6bbwec
         fHm2ael1vpnXwipcMamESiGH7T88cm8QzYGLk9S3SREVc21IBReMm89uiyHvbRR/MaPl
         bDxi+8zkVa4rlV0peUM44LbU4BwmCF3znKkDdOTJIXSJwlQvToPEp98b0btU3bR32ZPc
         fxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736099199; x=1736703999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/vG553TVWbrvDJ8ib/SgrZyZa0BMl1m3x5rzTpMHdQ=;
        b=mo7XiqmLzn5Fa81q0jkmTjzSy3Yd7hoLHiIwxHiUzx22xBYrqagkJyeS5xzM+OTz+G
         U3E4Z34QZq241sgLwaMZld/VZLDCIgCe/R5AJ3FPPH4PC4L1pSCuQ3sPrUb56HklSabB
         aOKiPmpdefxpqPvHZ5VLBgFiS8/gFuXp7/L5u4fSUjbV5hZxC3sueWP1+APGNYFdcTnJ
         dlwIQF2Juce0tv5jG/8zO8jre/2RV3vMl2SMTzrqY22vJs8ggkmMAOBWxqjGdy7Tstl4
         AXiM34mmZzECMWWn9V7VVLFtHdrD7FKtjwjf7ExXMcJZ2r/5lcKdexu0x1zwEsqVCz1N
         NMpw==
X-Forwarded-Encrypted: i=1; AJvYcCUuY+976fXutWVdS+MqXWS9s/MomD1igB0ZdoxzWw4L2R2jDsUMyyzw1Q2PyVZhpEykGoe7MvrZxyDYDOH21C4=@lists.infradead.org, AJvYcCX2Mi8XLjsAl+/yZw4INJt8E5WmQvMVSQviA1Vg6DrdLaEpJ8jPwNSM3JwVC9QhTVJRMRBFruQ7+yfecFG48vLx@lists.infradead.org
X-Gm-Message-State: AOJu0YzPPBPZ2kpXcb8l7YW2iTAUecRqIo+ET0vGu28ctp6o69TYPBFD
	fIF3juYmx7HEOAd/ikEMk1lZd55vtzI0tHCi6YRbkX8va8gB/L67srWkBBMMUBwZn2MtXur6sJq
	+vnpFqepGf1cEnGLVINYJaRZEKDE=
X-Gm-Gg: ASbGncvbukzhBX2XedvWddWKv15xTerftayp6PmVtiOmHlt/eSmQ+AUETAaTdCQ1e/S
	6GXOaWkoDmye0sNqzTtgoCa9ti/3t6a8gIcsaVg==
X-Google-Smtp-Source: AGHT+IEeKTjZBx1EU+2eWZsG1Eb2WFMVN8CzIVSiSTqFzujvDjxi/Q2sGrpxzUgGfRYUHTXNMaNmc2n2wDs4vWtTX9A=
X-Received: by 2002:a05:6402:26d1:b0:5d3:e45d:ba91 with SMTP id
 4fb4d7f45d1cf-5d81de39850mr52109480a12.32.1736099198841; Sun, 05 Jan 2025
 09:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com> <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch>
In-Reply-To: <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 5 Jan 2025 23:16:21 +0530
Message-ID: <CANAwSgSUuEvJb2Vn58o0i7Soo3jGzM8EYHvDtUTPxRHekCpruA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Andrew Lunn <andrew@lunn.ch>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_094640_863640_BA0F7A08 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Andrew,

On Fri, 3 Jan 2025 at 21:34, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&gmac1 {
> > +       clock_in_out = "output";
> > +       phy-handle = <&rgmii_phy1>;
> > +       phy-mode = "rgmii";
>
> rgmii is wrong. Please search the archives about this topic, it comes
> up every month. You need to remove the tx_delay and rx_delay
> properties, and use rgmii-id.
>
According to the RKRK3588 TRM-Part1 (section 25.6.11 Clock
Architecture), in RGMII mode,
the TX clock source is exclusively derived from the CRU (Clock Request Unit).
To dynamically adjust the timing alignment between TX/RX clocks and
data, delay lines are
integrated into both the TX and RX clock paths.

Register SYS_GRF_SOC_CON7[5:2] enables these delay lines,
while registers SYS_GRF_SOC_CON8[15:0] and SYS_GRF_SOC_CON9[15:0]
are used to configure the delay length for each path respectively.
Each delay line comprises 200 individual delay elements.

Therefore, it is necessary to configure both TX and RX delay values
appropriately
with phy-mode set as rgmii.

[1[ https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c#L1889-L1914

I have gone through a few of the archives about this topic

[2] https://lore.kernel.org/linux-rockchip/4fdcb631-16cd-d5f1-e2be-19ecedb436eb@linaro.org/T/

Thanks
-Anand

