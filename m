Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCABC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/Hj3c7jY39j+fuwEWeM6PzZhE4vdZHJduAlcVZNHWc=; b=Dksjac5XOpejOBkIVPjLcbhVSM
	y8KWnSOdXQeJh8ooumf543O2DvLI5mZE6yv2GmfjaZtb2bAQStVi/Ndv8/UHrrWTVKL7sHLDWCGq5
	7nCksk1zfjvgpoqeDdFyiBaMOqJ4uK8at3CIGP/p8Gkk6CM2nR/wwBa88ZqH8bWU5uGbY4scKindJ
	OiRTkdsKUbOixtGxYWQXzaEbNmA+YS93Oa4PDEab82pfFZ7i1cz6MACZeBkgrB7BeoigaRzMir/Tj
	y92zyWw5oCGK0KRaO65DcsES+KGmoQvQLXEdqG5MWh5LGd6L/1mfkYYIC37RY2rZyAh2o++LjlE8n
	KENLXfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Kbf-0000000HYZz-0mFv;
	Fri, 25 Apr 2025 15:04:47 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ITU-0000000HAQ7-4BHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:48:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PClq6t2936010
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 07:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745585272;
	bh=j/Hj3c7jY39j+fuwEWeM6PzZhE4vdZHJduAlcVZNHWc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xbgUOApZeNS+Twt91FD+Q0Si9gTyC2kHi3t3nUoIAz3B9AHn6CXcy420dXm3ShO7C
	 7F5l6UkiZg+46msZ4y7J16BuqM1W/iYat2TId52JQ2OL8FsAlIhLa7U3sPLXN/bgSs
	 1WFAse/xkjOgSKjHm+jXtDb1z5u/WpAJ6e+FHIMc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PClqKx069718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 07:47:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 07:47:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 07:47:52 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PClmD4042038;
	Fri, 25 Apr 2025 07:47:49 -0500
Message-ID: <865e0c92-296f-4fe4-971b-38ebfa90b8b5@ti.com>
Date: Fri, 25 Apr 2025 18:17:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board-infotainment:
 Fix nodes for dtbs warnings
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250424080328.57671-1-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250424080328.57671-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054813_127871_FB393C6E 
X-CRM114-Status: GOOD (  17.22  )
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


On 4/24/2025 1:33 PM, Jayesh Choudhary wrote:
> Fix hdmi-connector and tfp bridge node as per the bindings,
> - remove 'digital' property which is required for DVI connector not HDMI
> - Add 'ti,deskew' property which is a required property
> - Fix ports property for tfp410 bridge
> - Change node names appropriately
>
> Redefine the ports for dss and for k3-j721e-common-proc-board.dts,
> add reg property for the port (@0) to get rid of dtbs_warnings in
> infotainment overlay when ports for dss are re-defined.
>
> Fixes: 9c0fa304fa56 ("arm64: dts: ti: k3-j721e: Add overlay for J721E Infotainment Expansion Board")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   ...-j721e-common-proc-board-infotainment.dtso | 57 +++++++++++--------
>   .../dts/ti/k3-j721e-common-proc-board.dts     |  6 +-
>   2 files changed, 38 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
> index 65a7e54f0884..e4e5f941f20b 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
> @@ -15,12 +15,11 @@
>   #include "k3-pinctrl.h"
>   
>   &{/} {
> -	hdmi-connector {
> +	connector-hdmi {
>   		compatible = "hdmi-connector";
>   		label = "hdmi";
>   		type = "a";
>   		ddc-i2c-bus = <&main_i2c1>;
> -		digital;
>   		/* P12 - HDMI_HPD */
>   		hpd-gpios = <&exp6 10 GPIO_ACTIVE_HIGH>;
>   
> @@ -31,28 +30,32 @@ hdmi_connector_in: endpoint {
>   		};
>   	};
>   
> -	dvi-bridge {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> +	bridge-dvi {
>   		compatible = "ti,tfp410";
>   		/* P10 - HDMI_PDn */
>   		powerdown-gpios = <&exp6 8 GPIO_ACTIVE_LOW>;
> +		ti,deskew = <0>;
>   
> -		port@0 {
> -			reg = <0>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   
> -			tfp410_in: endpoint {
> -				remote-endpoint = <&dpi_out0>;
> -				pclk-sample = <1>;
> [..]

