Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1ECC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 03:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5Q9fuybEUTDIxLrBP9D0OFcpvP5/dYYz5nqQrm+/wc=; b=oFEBNS3ENKYqn/ubp+mbEmSkYU
	n0zdF0/PlzMLmcoktVMKqo9USAw/Xp0qmvwtAydEknz2E3GAze/aqlmO6EUKbGR52naig0RoTFmWE
	1jBL6BHrzV72izLxpDz2GcYBDQItB7HSDlMRw8+KKcVHhGhZnchW/3CSz7kvBletA7vnKzAsDyy3n
	DCk53cDykLs34PmR7NxLEteHPI9nur2GXx9dCG4oPyz6fu/qjIFadHOjBkYbiYKim7Uz8k+ADJFAX
	fP2bp/Hit7U2Z8/4V7inTsFucsvdaoAf55KR/blZuad4T2GTiQHl5D/DnxjFzsQRh0hsi4JwHUCsF
	gYyjjLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9FCw-00000004QqT-37Gi;
	Mon, 28 Apr 2025 03:31:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9FAW-00000004QU4-26OR;
	Mon, 28 Apr 2025 03:28:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3908340b3a.2;
        Sun, 27 Apr 2025 20:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745810911; x=1746415711; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S5Q9fuybEUTDIxLrBP9D0OFcpvP5/dYYz5nqQrm+/wc=;
        b=LlEpt88dTQhwVWQ/Os66CkuzQ24VVea8275qp375KAjlTR5rdlShlYngafy9hTE5bF
         yBFeqlKhuKAyOhy3K9O8Egd83glK+7yJtBkt/yTLxhaez6YjrhJZPLR+MMi+mOl+1RYW
         7e9b3RCna/iA8Gvb7kdD427WZtSyRPYVnajI7Z+fju4yxhq/4PWhdKrmkG4x6bfA4x7D
         0PivWTsm0D1uowtoxTTJGvoN4aBxwQnn6EP7as2qluAaEjP+09TbFCvs/o/6mOhNaUKc
         Jmz3Lingd6CxAMChNE0TgKl7gU7ws/tCc6U9zlOa/YjMJJFHraxms4RwgC8kEZEcTxMM
         uD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745810911; x=1746415711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5Q9fuybEUTDIxLrBP9D0OFcpvP5/dYYz5nqQrm+/wc=;
        b=CobdUvWCHVLc0+xhuOcqWEb6oohIBQSPteqCODt0rOKo1oULi3tyBGifAQ1gBX99SG
         8F+Ch752KGZJcflhW/FI/sQCe8FwBUNtcbjOFt+3ExFVeyMLF2BYCcSho4FG5rcfnAgj
         MVJB941t7/ASorjD8LHk3f6/vFuIQJHDqcSOfgxi4xIgWQik0GzWr+WTIFfefVDAu7Fa
         J8XKdimJTfmNGS6jbcByxL2fZZp8LwTLfRDZ+DtpphbnZBOHZ+LkFUS3pSbEhwCbL4By
         yNiN4CD7y5VEYuRp0nmPgyp5gshHdokc8KPs20NgyEbfxxv3zeauz9W1u635nTJdXzTH
         6HDA==
X-Forwarded-Encrypted: i=1; AJvYcCUIC/l1gAPxoXpWEEtvcA5UlH8fki9cRyqA19f/Y2WlWUDCdC/S9M2tLl3GhVGDB6ow2yePAS1FdA17qQVH9fE=@lists.infradead.org, AJvYcCX3/DEId6jYbDv2VA5tltbmmxsuLrUPjdUri9W7FqVDNWtNGWoLZ7efOcB82wwNJ4ULd+Rsb5/bI7nzk5mqeOE+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm6FhHiteuxWJrN+1L3onHd24ffbKIfWHqoJqjuYLBFVpO6UMq
	yy1/srjuZjfsYMbPGTBud+GoIYAJuxigQhPcB6ikW/ekNtl9Bzky
X-Gm-Gg: ASbGncuKssshcxrRMmaitBHNLrWjP5nByiz6p5foxcZDqAqwm8UJAtsl5C8gBOLlh9D
	ekYFn01VnCDlJmh1ANx1tfSrTwEfFsXiBkhcFFwnJkCTWPkd/u0M6P8HY/bgpWkY+6tqfg2hpLg
	AzwpKFGNwoWOacS+KoZE5I7vF1l2GoJzGyIps66/42ZF+pgmRAr84vAslQ9jWrj3ZoyMb18d/jY
	KxKv+bzmYluFerQu9elMW5YnIKJp3zk06Tn/9Pt7bTsNfMKYgy6rsugscwcixM2vzAyBJCCuvlK
	ypzs2tKQJ14KJH/+sZLum8maAd3DcMk/JzcssIdSXuy7frSw/Y4Xi6U=
X-Google-Smtp-Source: AGHT+IEbxs/4V9TZnrbGIxSSQDdBr6hgNCgTC0sP8McrXgtriENdhKpXL/j3USePpUKA4WH5weOwTg==
X-Received: by 2002:a05:6a21:9984:b0:1f5:8d3b:e272 with SMTP id adf61e73a8af0-2046a404462mr8961207637.1.1745810911645;
        Sun, 27 Apr 2025 20:28:31 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acc4casm7148852b3a.172.2025.04.27.20.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 20:28:31 -0700 (PDT)
Message-ID: <9e9ff312eb019bce9f6c31ebda4e1aa6b1a91f33.camel@gmail.com>
Subject: Re: [PATCH v4 2/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 	shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>
Date: Mon, 28 Apr 2025 13:28:24 +1000
In-Reply-To: <20250427125316.99627-3-18255117159@163.com>
References: <20250427125316.99627-1-18255117159@163.com>
	 <20250427125316.99627-3-18255117159@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_202832_542755_8E2DDF65 
X-CRM114-Status: GOOD (  12.89  )
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

On Sun, 2025-04-27 at 20:53 +0800, Hans Zhang wrote:
> Register definitions were scattered with ambiguous names (e.g.,
> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
> hierarchical grouping. Magic values for bit operations reduced code
> clarity.
>=20
> Group registers and their associated bitfields logically. This
> improves
> maintainability and aligns the code with hardware documentation.
>=20
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> =C2=A0drivers/pci/controller/dwc/pcie-dw-rockchip.c | 49 ++++++++++++----=
-
> --
> =C2=A01 file changed, 31 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index e7d33d545d5b..a778f4f61595 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -33,24 +33,37 @@
> =C2=A0
> =C2=A0#define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
> =C2=A0
> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> -#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> -#define PCIE_CLIENT_INTR_MASK_MISC	0x24
> -#define PCIE_SMLH_LINKUP		BIT(16)
> -#define PCIE_RDLH_LINKUP		BIT(17)
> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP |
> PCIE_RDLH_LINKUP)
> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
> +/* General Control Register */
> +#define PCIE_CLIENT_GENERAL_CON		0x0
> +#define=C2=A0 PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> +#define=C2=A0 PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> +#define=C2=A0 PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> +#define=C2=A0 PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> +
> +/* Interrupt Status Register Related to Legacy Interrupt */
> =C2=A0#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> +
> +/* Interrupt Status Register Related to Miscellaneous Operation */
> +#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> +#define=C2=A0 PCIE_RDLH_LINK_UP_CHGED	BIT(1)
> +#define=C2=A0 PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> +
> +/* Interrupt Mask Register Related to Legacy Interrupt */
> =C2=A0#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
> +
> +/* Interrupt Mask Register Related to Miscellaneous Operation */
> +#define PCIE_CLIENT_INTR_MASK_MISC	0x24
> +
> +/* Hot Reset Control Register */
> =C2=A0#define PCIE_CLIENT_HOT_RESET_CTRL	0x180
> +#define=C2=A0 PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> +
> +/* LTSSM Status Register */
> =C2=A0#define PCIE_CLIENT_LTSSM_STATUS	0x300
> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
> +#define=C2=A0 PCIE_SMLH_LINKUP		BIT(16)
> +#define=C2=A0 PCIE_RDLH_LINKUP		BIT(17)
> +#define=C2=A0 PCIE_LINKUP			(PCIE_SMLH_LINKUP |
> PCIE_RDLH_LINKUP)
> +#define=C2=A0 PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
> =C2=A0
> =C2=A0struct rockchip_pcie {
> =C2=A0	struct dw_pcie pci;
> @@ -161,13 +174,13 @@ static u32 rockchip_pcie_get_ltssm(struct
> rockchip_pcie *rockchip)
> =C2=A0static void rockchip_pcie_enable_ltssm(struct rockchip_pcie
> *rockchip)
> =C2=A0{
> =C2=A0	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
> =C2=A0}
> =C2=A0
> =C2=A0static void rockchip_pcie_disable_ltssm(struct rockchip_pcie
> *rockchip)
> =C2=A0{
> =C2=A0	rockchip_pcie_writel_apb(rockchip,
> PCIE_CLIENT_DISABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
> =C2=A0}
> =C2=A0
> =C2=A0static int rockchip_pcie_link_up(struct dw_pcie *pci)
> @@ -516,7 +529,7 @@ static int rockchip_pcie_configure_rc(struct
> platform_device *pdev,
> =C2=A0	rockchip_pcie_writel_apb(rockchip, val,
> PCIE_CLIENT_HOT_RESET_CTRL);
> =C2=A0
> =C2=A0	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
> =C2=A0
> =C2=A0	pp =3D &rockchip->pci.pp;
> =C2=A0	pp->ops =3D &rockchip_pcie_host_ops;
> @@ -562,7 +575,7 @@ static int rockchip_pcie_configure_ep(struct
> platform_device *pdev,
> =C2=A0	rockchip_pcie_writel_apb(rockchip, val,
> PCIE_CLIENT_HOT_RESET_CTRL);
> =C2=A0
> =C2=A0	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
> =C2=A0
> =C2=A0	rockchip->pci.ep.ops =3D &rockchip_pcie_ep_ops;
> =C2=A0	rockchip->pci.ep.page_size =3D SZ_64K;
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

