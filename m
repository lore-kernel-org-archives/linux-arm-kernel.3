Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30494E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZvKVkZErI5WQej5yg5jmmMF2hraK2A7CaX2pm18nzw=; b=mgANbTHEeOsDPbVqBfdMp2twiX
	Qsy5uVvCZ9tnW3pv+CQXtTKP3a1tErNtXjnrlsBES+OzdP3pf0YjuiFkMX25+b/SLfroe2Css0WU4
	EikEgqtbSAMFPVRtlxoEPaDPf9rY4ha1rvn4qCfyevx2k3BUtJXBObcZ568hL9M2/HWVK62+7/nCO
	tN7j6LvJoBjGR7vjwrINIn0isBQLzXWHY+ckILuGrSQEGJfN54Fq9R2gzM9LXPO9UqoxG5A8Drt5m
	uwgv9m3Y4/R0roq06E5p3oJT8mLP+tKdSvqY9dWEfytJ0wdMW+2XwG+fEHNbBYinjgdcGjMb1rnzx
	85xcgaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUi2j-00000000Rz3-423U;
	Mon, 06 Jan 2025 08:00:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUi0b-00000000Rgb-3BSM;
	Mon, 06 Jan 2025 07:58:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so2755807a12.1;
        Sun, 05 Jan 2025 23:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736150324; x=1736755124; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZvKVkZErI5WQej5yg5jmmMF2hraK2A7CaX2pm18nzw=;
        b=MxE5bKqjrQKkUCpo36qyike1HqAS1j+3oR3NyCjWw1hGA1hKZRz1l9xcn2gelxbSJT
         yoJd8Rgkkpb5SRJK8nAa0nKDPfcQJ4bwPdGWGgCmcNrAUAjbiYemebJCSvI2WjpJ3fsS
         KywrcjsqTpr/2KbrZS4hFsCBGIqQkysJgzKnHFkZNASGMflVgs+ZA3+UiCfg0xR2rV3E
         BOes154rvO6QmUE1Tfjqu/eH4jkGxP0rux3TGUHm1Mr+xw2te4VGjWkdFxImuY7nGg6+
         SNeK6zspdlkwoPBey2bgTVK3idfIYPf0DdWqoG/I1fPSSsfpQ8aLS66AmanrzHQ2E/oT
         MfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736150324; x=1736755124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZvKVkZErI5WQej5yg5jmmMF2hraK2A7CaX2pm18nzw=;
        b=JM4/gePYkqcJELGE3gmgN0zQE7oXXhzT/MgpgnD3dp5++XYJwKiWkNrNbk1A9P7Jy3
         nV9bHCIOOZyfx0IitnIxw20iatXBO1177jUrhpywYETZ0EipI7vpwAdzydBNdadwIc1S
         DdSLSg7LYYZyfdfuUYujfFt8g2OHLeXmij8Fcy+y/vN5pJufKBC5tgNGuaHAtPMdC8vg
         c4qA581h3F/+IIKNad2H3u5fFgqrogzvt8zGD5QwDFBgv2nuXR5f5oH8BTzWDiSKFjGl
         S2GVQnCrSVVT58ioWonLcNhkELAkQIFh5Jk1xm7ydVAIbHCDzrZdEmRe0P9UptpH9tQS
         EDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2JIshZLn1EKhYoTxpJ5L+81f1+cw3mUqcv9MBAwnbverhrMxhPPSY3EGQrzgE/ywmyJEvEoQicaS0f0qMR26o@lists.infradead.org, AJvYcCXsEa/aWiajCVb786CHnFjqU7jSZZgU8N5KfD0nwl7z1F7xN9mVGmP3aYJH8fhG1AICl1SBz//SX10fZg5AsBc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwt7RgaHGu/5M/VKzhIe1lExYWFakS6Wp9CqGI2SLwWeRgRBkv
	r+te1w33YQ/0JoM2DdLdx3tSQfUM/eDNnh1rfxKje4N/aT5aFRgnFplw39zbifR9AKY9jMSbVbJ
	zTMsx7Vg5/zyD4vTMn3ZWMhAUTD8=
X-Gm-Gg: ASbGncurRjUyaB9/GBBoCo25d77Q8pWtd4g9qGEFZtwxhDaIPffGHmmw4HDwY5BVwCq
	39uHH62Rd7lEfFYo0vRPlCcRwKSs3FAR9+JnYEw==
X-Google-Smtp-Source: AGHT+IE5v5b24wHn+0AkgjrpnUGIFScwTNQZ1ekJTkcZg8nPK6eicHO3oCMGwPCrZi0JaC/+N7r52oVIeZuqe2Uy3yE=
X-Received: by 2002:a05:6402:524b:b0:5d0:bf27:ef8a with SMTP id
 4fb4d7f45d1cf-5d81de48bd1mr48949004a12.26.1736150323689; Sun, 05 Jan 2025
 23:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch> <CANAwSgSUuEvJb2Vn58o0i7Soo3jGzM8EYHvDtUTPxRHekCpruA@mail.gmail.com>
 <c94570db-c0af-4d92-935c-5cc242356818@lunn.ch>
In-Reply-To: <c94570db-c0af-4d92-935c-5cc242356818@lunn.ch>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 6 Jan 2025 13:28:27 +0530
Message-ID: <CANAwSgQ_gojVxvi_OyHTyTSdzRrno=Yymn0AdEXyTHTgDTyFcA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250105_235845_794634_DB0A2F6F 
X-CRM114-Status: GOOD (  27.89  )
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

On Sun, 5 Jan 2025 at 23:27, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Jan 05, 2025 at 11:16:21PM +0530, Anand Moon wrote:
> > Hi Andrew,
> >
> > On Fri, 3 Jan 2025 at 21:34, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > +&gmac1 {
> > > > +       clock_in_out = "output";
> > > > +       phy-handle = <&rgmii_phy1>;
> > > > +       phy-mode = "rgmii";
> > >
> > > rgmii is wrong. Please search the archives about this topic, it comes
> > > up every month. You need to remove the tx_delay and rx_delay
> > > properties, and use rgmii-id.
> > >
> > According to the RKRK3588 TRM-Part1 (section 25.6.11 Clock
> > Architecture), in RGMII mode,
> > the TX clock source is exclusively derived from the CRU (Clock Request Unit).
> > To dynamically adjust the timing alignment between TX/RX clocks and
> > data, delay lines are
> > integrated into both the TX and RX clock paths.
> >
> > Register SYS_GRF_SOC_CON7[5:2] enables these delay lines,
> > while registers SYS_GRF_SOC_CON8[15:0] and SYS_GRF_SOC_CON9[15:0]
> > are used to configure the delay length for each path respectively.
> > Each delay line comprises 200 individual delay elements.
> >
> > Therefore, it is necessary to configure both TX and RX delay values
> > appropriately
> > with phy-mode set as rgmii.
> >
> > [1[ https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c#L1889-L1914
> >
> > I have gone through a few of the archives about this topic
> >
> > [2] https://lore.kernel.org/linux-rockchip/4fdcb631-16cd-d5f1-e2be-19ecedb436eb@linaro.org/T/
>
> O.K, let me repeat what i have said a number of times over the last
> couple of years.
>
> phy-mode = "rgmii" means the PCB has extra long clock lines on the
> PCB, so the 2ns delay is provided by them.
>
> phy-mode = "rgmii-id" means the MAC/PHY pair need to arrange to add
> the 2ns delay. As far as the DT binding is concerned, it does not
> matter which of the two does the delay. However, there is a convention
> that the PHY adds the delay, if possible.
>
> So, does your PCB have extra long clock lines?
>
> Vendors often just hack until it works. But works does not mean
> correct. I try to review as many .dts files as i can, but some do get
> passed me, so there are plenty of bad examples in mainline.
>
>         Andrew

Thanks for this tip, I am no expert in hardware design.

Here is the schematic design of the board, it looks like RTL8125B page 24
is controlled by a PCIe 2.0 bus

[0] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_sch.pdf

PERSTB              ---<< PCIE_PERST_L (GPIO3_B0_u)
LANWAKER        --->> PCIE20_1_2_WAKEn_M1_L (GPIO3_D0_u)
LAN_CLKREQB  --->> PCIE20_1_2_CLKREQn_M1_L( GPIO3_C7_u)
IOLATEB             --->> +V3P3A

PCIE2.0 DATA Impedance 85 R

PCIE_WLAN_TX_C_DP  ----->PCIE20_0_TXP
PCIE_WLAN_TX_C_DN  ----->PCIE20_0_TXN

PCIE2.0 CLK Impedance 100 R

PCIE3_WLAN_REFCLK0_DP --> PCIE20_0_REFCLKP
PCIE3_WLAN_REFCLK0_DN--->PCIE20_0_REFCLKN

I have no idea about the grf clk and data path delay over here.

Thanks
-Anand

