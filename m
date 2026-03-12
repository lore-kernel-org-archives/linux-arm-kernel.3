Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932741067041
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jWlLUSeN29Pq02QcM+6J989J3yKVwQy0x52kUrHLWk=; b=3t1Ohobp5k24Ue34QG7sF/tbcp
	8TVnG8FQK4KK917w2WK52iEEfe3Z0YJT2E/3FxQWfzgoDAFE7/H/SO/IW6UegQJIDIZ7zSshcxVFl
	u0MFBFxLswpHAG1brXiGgmS+TQ1loyZmoFeq7oce6M3LUQdCLwqiyo2xMaWsUWq0xUHny0HrVDsKP
	AMRUQ8Dfvx6Z+QQ8sCFb4ucNmbco81i04pCR9YbzwYaYUIr2wHwTf8MWAGulZ+aIYoauI/vC/2IeX
	AZ/zPIcv2005JMRH5HtCr2VHsR35js24W8lAa3xx9jxd/EP3KhDHMsJBzmg3JsGK/1jmQ7RB4dnSv
	gH6sn5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hcp-0000000EJZe-3Ck1;
	Thu, 12 Mar 2026 15:06:59 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hcm-0000000EJYE-1tMv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0jWlLUSeN29Pq02QcM+6J989J3yKVwQy0x52kUrHLWk=; b=c/D2t2/VpkFqdXBjHh3Pe4TtEP
	lxbnyWJAJ4/jjMZ6vl2/qlH+G+HkKTgsVbREd8BEzHTPWqEYU2GJ1M8nK2RIhyGXXdQgmE3pmpe9M
	ayL5NlNrX10feY2yxK0ptjPT1yNnzqUNwTPLMn/eL3q91uNWpPLFq9aVEd2iQ4ub6ymTJoTdsNLKF
	/pg5QgHwaLpniRJjcCrW/HDIbxIzz3/dA4EourHP97dOZWEXbng1vKd3ZAalt21rb4gXYrfAkdMqJ
	IP3Ig/SQW2KeK2YHQx1Es5Pj053TC6tSohzFWr5YUmx3WmRdJUGswr62ri3GHcrthfmFzAKoBVXu1
	W4d+K4Eg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1w0hMP-000JL7-2a;
	Thu, 12 Mar 2026 15:50:01 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1w0hMP-000AiT-0Z;
	Thu, 12 Mar 2026 15:50:01 +0100
Message-ID: <e9c0606c-82e7-4979-a6a4-efea6a570009@ew.tq-group.com>
Date: Thu, 12 Mar 2026 15:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] ARM: dts: imx7d: Use undeprecated reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_080656_598264_07A77CB6 
X-CRM114-Status: GOOD (  15.74  )
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


On 3/11/26 17:08, Krzysztof Kozlowski wrote:
> Freescale i.MX6 PCIe host controller bindings through referenced
should be i.MX7
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts | 2 +-
>   arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> index e3ee16f1aaa9..a5fc7f80f651 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> @@ -122,7 +122,7 @@ &pcie {
>   	/* 1.5V logically from 3.3V */
>   	/* probe deferral not supported */
>   	/* pcie-bus-supply = <&reg_mpcie_1v5>; */
> -	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
>   	status = "disabled";
>   };
>   
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> index a370e868cafe..ab7cabe5552d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> @@ -456,7 +456,7 @@ display_out: endpoint {
>   };
>   
>   &pcie {
> -	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
>   	status = "okay";
>   };
>   
>
-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


