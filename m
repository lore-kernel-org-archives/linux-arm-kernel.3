Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5393109E55B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuO89bXipoojZ5oWacJBzynhJDJvNYok686rks33Smk=; b=aITzWFtcEoE52oxq+SLJVumhU3
	cloq/tC4HfhGSfR96JEvouHqVKRuy3WoCYjOCnxPMIGMVwTedmL2FHZUbyLfGcSfeMBuPLiJ1/box
	zlyzBWa+PkMtHrMcT+kY7A63z2bTShUmFCfnW3TRitg24El4g3upPIQ53tG5rX3+zLW6I267osD4P
	Y4XBaXHL1xzchqAx1l+aNR6Hx230TLLGj4T0ZPd8mTtGIYXbd0xj5qJ2CGV8kBScvsX2GO7T8EIEo
	A6CTzmiQGSOjJLppxRrpFj5Cg7l/2vFEIN7cKCsU4+wn5p+X4+UP2LXXAfmPqItX8+kM7fRwfqfkQ
	aTLq00fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eVL-00000004rww-0UU5;
	Thu, 26 Mar 2026 06:47:43 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eVI-00000004rwN-3rgq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774507658;
	bh=uuO89bXipoojZ5oWacJBzynhJDJvNYok686rks33Smk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fffD0qEuIDRqpi3IHyTr1aG2sgjzLTaVV/UVnCDIyZWhOuB7eKGFM/IbMty8f1BcA
	 WxjANSn/Wubl97tUOZ7iF4u2fp2jci6qESwk21xqNHtXV1jjTcb5GjE+0+HNzYo5re
	 WcYlzN0gK08wg0l/1hZpaX4AxJIMgvqDl0xYLYDbL/0ueBuR9ykaosOS/whUWyqCuC
	 gG8bX0VYwm6mmMfgH32Rl9UEGH0oBK2jDbAj5UE5RTJxeXyQnmxumvh6jIyRdeJNJ9
	 mbKrv0yvPsxztFkwOmHiMoplqOtepCX4m5HVeMflE+4JtJMqcIVYFzmjf558OvQp7w
	 77ZMuKGa+oyrQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 21ABA6597C;
	Thu, 26 Mar 2026 14:47:38 +0800 (AWST)
Message-ID: <8e93868a7f15596f1ee2b758d1743b51d6491486.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>, Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 26 Mar 2026 17:17:37 +1030
In-Reply-To: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
References: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_234741_159871_17EFD384 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Potin,

On Wed, 2026-03-11 at 14:19 +0800, Potin Lai wrote:
> Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> devices connected to the AST2620 BMC SoC.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Changes in v3:
> - Update the model name to "Facebook SanMiguel BMC".
> - Remove CP2112 and downstream IOEXP nodes as the upstream driver
> =C2=A0 is not yet available.
> - Remove the following EEPROM nodes until the bus numbers and
> =C2=A0 addresses are confirmed:
> =C2=A0 - 3-0051: HMC FRU EEPROM
> =C2=A0 - 3-0052: HPM0 FRU EEPROM
> =C2=A0 - 3-0053: HPM1 FRU EEPROM
> - Change the compatible property of the following EEPROM nodes
> =C2=A0 from 24c02 to 24c128:
> =C2=A0 - 5-0050: SMM FRU EEPROM
> =C2=A0 - 9-0050: PDB FRU EEPROM
> =C2=A0 - 13-0055: SMM EXT FRU EEPROM
> - Fix the smm_temp node address typo (0x4e -> 0x48).
> - Remove nodes that no longer exist in the latest board design:
> =C2=A0 - 19-006f: RTC (nct3018y)
> =C2=A0 - 9-0075: IO expander (pca9555)
> - Update linenames to match the reference design:
> =C2=A0 - B0_M0_AIC_USB_EN-O -> B0_M0_CPU_L0_RST_IND_L-O
> =C2=A0 - B0_M0_BRD_ID_2-I -> B0_M0_BMC_TO_GPU_MCU_I2C_EN-O
> =C2=A0 - B1_M0_AIC_USB_EN-O -> B1_M0_CPU_L0_RST_IND_L-O
> =C2=A0 - B1_M0_BRD_ID_2-I -> B1_M0_BMC_TO_GPU_MCU_I2C_EN-O
> =C2=A0 - IOX_GPIO_P16_TP -> USB2_BMC_HUB2_RST_L-O
> =C2=A0 - I2C_PDB_ALERT_L-I -> X86_TPM_RST_SEL_L-O
> - Remove unexpected or unsupported properties from SSIF and IOEXP
> =C2=A0 nodes.
> - Change all status values from "ok" to "okay" for consistency.
> - Link to v2: https://lore.kernel.org/r/20260203-sanmiguel_init_dts-v2-0-=
6a5682c32b38@gmail.com

Can you please discuss these proposed changes in the context of my
reply to Kevin below?

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

Thanks,

Andrew

