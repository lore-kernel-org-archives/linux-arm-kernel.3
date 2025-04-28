Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F12FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 03:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ6vyOIM9wkdrOEiU106peP/FFpNedc2E4v+uxxalSo=; b=nDWFivNyTGiYVlfRNdhOBzDtuD
	+g/aHm9C7Nk/Ai/NULbxdVAJIF92A9OrQ0b4xVbcf18TG7KkE5+YnntCAnvBQoj4tHTD/5iHSwvRW
	326PmIDsLXlNSXkCcrueYUMLS2/w2HcLHYgpiipZAq3wB6CZfkS9NkpeQT5xR/c2xCFqhKd2cf3UO
	XBMslqyxZuqAouqbVvrAezbSm3AJPFF5ti4wllTV4UomOVFPw8+aCTP91p1Ja4t6gPF8bjBYM5StH
	Al0xSIiTAyPb9uMZeqi8wzjFRnoG/abmLV8oI1k3XJkITR9KD3TDTdrFasIxa0cBKG+NIScdJNFg7
	30Gk3ZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9FB2-00000004Qa6-1ERq;
	Mon, 28 Apr 2025 03:29:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9F94-00000004QMo-2TEP;
	Mon, 28 Apr 2025 03:27:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736c3e7b390so4334514b3a.2;
        Sun, 27 Apr 2025 20:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745810821; x=1746415621; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dJ6vyOIM9wkdrOEiU106peP/FFpNedc2E4v+uxxalSo=;
        b=anke6WbdmJ6ssNjv13veo17tpAsP3uWW/JJzZSFocBrBIjQhnBVg0+332z3zjBM55s
         ZxLh0YwsqNQdVxrRo3s4Q6H0gjcyBZkD7lzh0QpMAuP9NVpnfxiaJ3ypBoOy/bE3UV0Q
         /j9tgNiTlIz3n4lQUgmLgH6yXdzBQ1V27tbACdLzEkCNQU2GNBfu8vAwXw/knl6aYNT8
         NCwLn0f+4brulNpdL9K7eiyPWJW57QfE80K+b6acH7WBEUiTYtoqjiuYxmSDif+nLUZq
         T+X+fM8DDm8PUtOSbzoRko7PTavU3T4iEQo+2NhLNlUZ27nUpyJsqPfjpF2kdvph1egu
         8ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745810821; x=1746415621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJ6vyOIM9wkdrOEiU106peP/FFpNedc2E4v+uxxalSo=;
        b=NXr3Z9At1tI4jkJgi7q6hX90igvc0MKy6Zh4thbPTYAvkah79NthzsTK+qQqp4P21P
         N31QpZoQYeycOaiuCPlctr4Ol+MtcMO3s0O9EPc5+v/6zYjAb+Yuf3oIYxTZacdpx2UJ
         xo3pfmsrQ6Fyvzq0R0Q89qgMk7hIIksuMaeoeVZVyaIl0qXBy9Mmf8qAjp4dvCDEcEv7
         XG2iBIX1Ch7+QgPa/rbFprCJQGGWpeuUeOiCPjHx+HTEGXNSEyytY0f99HX+1XUDgYKR
         TpfPO3sPyoHs8SMInVTPdpNopbkVNiuyCGoHbIxUk6TcqUF7QKEh1wrzNyX7Vw7fu2BP
         INig==
X-Forwarded-Encrypted: i=1; AJvYcCUlWTRnTQQbWk1OxmRJLSru/57U7MOm5dHV2kmKEbsL+24kkZrNAX5dvylvJJWalO8QmIt7URtPA1FtwTUufi2p@lists.infradead.org, AJvYcCXYK7uhtiVBHsT4QWMyujfaM+EFSbmN7QdYsqHMJ5vvPF70DLQVIjZSu7sd7iTvX9kkabQ9uNW+voGCSUlY1Bg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzHl9z7aYnM/LueMamYdLQHlbN7BQDTV54LHZ0DjS1O3JFiyg4
	fEPUWGGxmkxrk8wAD9LWKPHWzMEoo3wPXChfioE/C4atxGt1rSKX
X-Gm-Gg: ASbGncupQA1y3l/Kwyz2qNOo5nNVEy+8u/l7Fza+LVHtf0aCs68fXugHcETA29J5RhE
	VksB/JUlbJ3pzczs0/0LKa98ohehXTNlvmafJ8Hb7o6t6l7coz1siAQL5tSYB98nkrKJrpprfbr
	bgB0SZlT64LfZsigh3lMxicLPd3B/E3gFK4XwFYDfz0kjiHG8x1NKg+OmoG7dJlxxhVnKaBn29C
	oCa8wMx5C0jm9YHxDUfGVs0SivokHr7hkRCZ/TxoDrZj7jzJpsl1DcUdZ8lVzssXYEZrx1PEiSV
	fUZ1UF+CHJS2+CExqvOD26gYaM/atxswtntXhsoUrjdzk8ADMUhX42zyeGEXxDIGJg==
X-Google-Smtp-Source: AGHT+IGSn8lCAerx7DuOG1U5CfTH5vI5HpaLXLhOBS6XWfNOWxIMc0ZRLqV/T3WZk/YLDAM61fYHPg==
X-Received: by 2002:a05:6a00:2e83:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-73fd8f4e0d2mr13242252b3a.23.1745810821519;
        Sun, 27 Apr 2025 20:27:01 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912ed6sm6961386b3a.31.2025.04.27.20.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 20:27:01 -0700 (PDT)
Message-ID: <40232d5ef59383dc44fd8b91dbc2b0ba71f1d84f.camel@gmail.com>
Subject: Re: [PATCH v4 3/3] PCI: dw-rockchip: Unify link status checks with
 FIELD_GET
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 	shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>
Date: Mon, 28 Apr 2025 13:26:54 +1000
In-Reply-To: <20250427125316.99627-4-18255117159@163.com>
References: <20250427125316.99627-1-18255117159@163.com>
	 <20250427125316.99627-4-18255117159@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_202702_649011_9A7DADE8 
X-CRM114-Status: GOOD (  14.58  )
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
> Link-up detection manually checked PCIE_LINKUP bits across RC/EP
> modes,
> leading to code duplication. Centralize the logic using FIELD_GET.
> This
> removes redundancy and abstracts hardware-specific bit masking,
> ensuring
> consistent link state handling.
>=20
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> =C2=A0drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++---------=
-
> --
> =C2=A01 file changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index a778f4f61595..bfc47dab32e5 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -8,6 +8,7 @@
> =C2=A0 * Author: Simon Xue <xxm@rock-chips.com>
> =C2=A0 */
> =C2=A0
> +#include <linux/bitfield.h>
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/gpio/consumer.h>
> =C2=A0#include <linux/irqchip/chained_irq.h>
> @@ -60,9 +61,8 @@
> =C2=A0
> =C2=A0/* LTSSM Status Register */
> =C2=A0#define PCIE_CLIENT_LTSSM_STATUS	0x300
> -#define=C2=A0 PCIE_SMLH_LINKUP		BIT(16)
> -#define=C2=A0 PCIE_RDLH_LINKUP		BIT(17)
> -#define=C2=A0 PCIE_LINKUP			(PCIE_SMLH_LINKUP |
> PCIE_RDLH_LINKUP)
> +#define=C2=A0 PCIE_LINKUP			0x3
> +#define=C2=A0 PCIE_LINKUP_MASK		GENMASK(17, 16)
> =C2=A0#define=C2=A0 PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
> =C2=A0
> =C2=A0struct rockchip_pcie {
> @@ -188,10 +188,7 @@ static int rockchip_pcie_link_up(struct dw_pcie
> *pci)
> =C2=A0	struct rockchip_pcie *rockchip =3D to_rockchip_pcie(pci);
> =C2=A0	u32 val =3D rockchip_pcie_get_ltssm(rockchip);
> =C2=A0
> -	if ((val & PCIE_LINKUP) =3D=3D PCIE_LINKUP)
> -		return 1;
> -
> -	return 0;
> +	return FIELD_GET(PCIE_LINKUP_MASK, val) =3D=3D PCIE_LINKUP;
> =C2=A0}
> =C2=A0
> =C2=A0static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
> @@ -450,7 +447,7 @@ static irqreturn_t
> rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
> =C2=A0	struct dw_pcie *pci =3D &rockchip->pci;
> =C2=A0	struct dw_pcie_rp *pp =3D &pci->pp;
> =C2=A0	struct device *dev =3D pci->dev;
> -	u32 reg, val;
> +	u32 reg;
> =C2=A0
> =C2=A0	reg =3D rockchip_pcie_readl_apb(rockchip,
> PCIE_CLIENT_INTR_STATUS_MISC);
> =C2=A0	rockchip_pcie_writel_apb(rockchip, reg,
> PCIE_CLIENT_INTR_STATUS_MISC);
> @@ -459,8 +456,7 @@ static irqreturn_t
> rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
> =C2=A0	dev_dbg(dev, "LTSSM_STATUS: %#x\n",
> rockchip_pcie_get_ltssm(rockchip));
> =C2=A0
> =C2=A0	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
> -		val =3D rockchip_pcie_get_ltssm(rockchip);
> -		if ((val & PCIE_LINKUP) =3D=3D PCIE_LINKUP) {
> +		if (rockchip_pcie_link_up(pci)) {
> =C2=A0			dev_dbg(dev, "Received Link up event.
> Starting enumeration!\n");
> =C2=A0			/* Rescan the bus to enumerate endpoint
> devices */
> =C2=A0			pci_lock_rescan_remove();
> @@ -477,7 +473,7 @@ static irqreturn_t
> rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
> =C2=A0	struct rockchip_pcie *rockchip =3D arg;
> =C2=A0	struct dw_pcie *pci =3D &rockchip->pci;
> =C2=A0	struct device *dev =3D pci->dev;
> -	u32 reg, val;
> +	u32 reg;
> =C2=A0
> =C2=A0	reg =3D rockchip_pcie_readl_apb(rockchip,
> PCIE_CLIENT_INTR_STATUS_MISC);
> =C2=A0	rockchip_pcie_writel_apb(rockchip, reg,
> PCIE_CLIENT_INTR_STATUS_MISC);
> @@ -491,8 +487,7 @@ static irqreturn_t
> rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
> -		val =3D rockchip_pcie_get_ltssm(rockchip);
> -		if ((val & PCIE_LINKUP) =3D=3D PCIE_LINKUP) {
> +		if (rockchip_pcie_link_up(pci)) {
> =C2=A0			dev_dbg(dev, "link up\n");
> =C2=A0			dw_pcie_ep_linkup(&pci->ep);
> =C2=A0		}

Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

