Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulVUgfNYT2lEH0MbdG1dD+8MEdmaDjbz4xf8uzzuOTQ=; b=er6NwVvhEPcYztniApVK1MdCsj
	5mXQ19GvhOtLCIGOAirbRVDw3N1qwfez/sKq99/E5OpJ3TWySBENwBFF+zZjyW8GL3kHcoPO42qrG
	fX9VkVQ+nhWhwsBGzWreEikLaLPtTMI6swv5Fn+JSvx3y+SbTagIzSLUjExHnoxoRMtOGGatXXw3E
	BL+XYtMhcw+qvR+tABh+Jt7NOEZrgqiMv8NX1YIfnXGomv8mzNJIe+j0fqvPwaJGrDyta+Btj09UT
	zI+J+srHoJduaQ2m81lyi7/XrrfkwfRGbEECj/hzyCd/e7DG/2dinPIrEN9sQpuV7nW/3bk4e96BV
	9doDTzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHOU-00000005dmJ-0XxW;
	Fri, 10 Jul 2026 20:00:18 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHOR-00000005dlb-3WIv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 20:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783713614;
 bh=ulVUgfNYT2lEH0MbdG1dD+8MEdmaDjbz4xf8uzzuOTQ=;
 b=FRNIpVX1OfkXzYVIG6mVWbzSB+5Eyz7WVTVN9vKvfOeG3t1PKAPCt/QMEn7pS117XQKBsYqGc
 b8y4A5hg4gjOM8luz3fMIKUQ/FQlqkBhwKnl6ssbsbKUQteAJqU4h4fgkxNsxj3nVT1QSB8xgqa
 nfeAF7U0uJUM1OHvC2mRyxTTWf3rVJVLFbMLevwgzMUTHpeEQOkNXWThtnJ8nfCkQqq7VgIHJ+D
 Z2oYK7RSwfQ/DHu+RjgLBxNJNxOzg8dd2FfzU76PwjHIQwZTCt4R9+rD4TTpZFJQTpfPZARPNxl
 qEFCuSCx7e/NA6aGDpddUxFz3o1Y8rRNe3HidF2Osx8w==
X-Forward-Email-ID: 6a514f4df640ad60663f1f38
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1abc6880-c131-404d-a521-5b5063e408f1@kwiboo.se>
Date: Fri, 10 Jul 2026 22:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dt-bindings: soc: rockchip: grf: Add RV1106
 compatibles
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>, Rob Herring
 <robh@kernel.org>, Yao Zi <ziyao@disroot.org>, huang lin
 <hl@rock-chips.com>, linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-6-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-6-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_130015_978204_EFF172B9 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Simon,

On 7/6/2026 9:58 PM, Simon Glass wrote:
> Add the compatibles for the general register files of the Rockchip
> RV1106: the main GRF with its clock-controller child, which provides
> the MMC drive and sample phase clocks, and the IOC and PMU IOC blocks
> used by the pin controller.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2cc43742b8e3..349fd3393ac4 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -64,6 +64,8 @@ properties:
>                - rockchip,rk3588-vo1-grf
>                - rockchip,rk3588-vop-grf
>                - rockchip,rv1103b-ioc
> +              - rockchip,rv1106-ioc

Do we possible need a different compatible for each GPIO IOC?

GRF address mapping table over all different GRF regs used by this SoC:

  Name		Address Base 
  PERI_GRF	0xFF000000 
  VENC_GRF	0xFF010000 
  NPU_GRF	0xFF018000 
  PMU_GRF	0xFF020000 
  DDR_GRF	0xFF030000 
  CORE_GRF	0xFF040000 
  VI_GRF	0xFF050000 
  VO_GRF	0xFF060000 
  GPIO0_IOC	0xFF388000 
  GPIO1_IOC	0xFF538000 
  GPIO2_IOC	0xFF548000 
  GPIO3_IOC	0xFF558000 
  GPIO4_IOC	0xFF568000 

> +              - rockchip,rv1106-pmuioc
>                - rockchip,rv1108-usbgrf
>            - const: syscon
>        - items:
> @@ -100,6 +102,7 @@ properties:
>                - rockchip,rk3576-usb2phy-grf
>                - rockchip,rk3588-usb2phy-grf
>                - rockchip,rv1103b-pmu-grf
> +              - rockchip,rv1106-grf

What GRF in the table above is this referring to?

Vendor kernel went the easy route and declared a single mega GRF block.
Mainline should probably declare each GRF individually to correctly
describe HW?

>                - rockchip,rv1108-grf
>                - rockchip,rv1108-pmugrf
>                - rockchip,rv1126-grf
> @@ -244,6 +247,33 @@ allOf:
>  
>            unevaluatedProperties: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rv1106-grf
> +
> +    then:
> +      properties:
> +        clock-controller:
> +          type: object
> +          additionalProperties: false
> +
> +          properties:
> +            compatible:
> +              const: rockchip,rv1106-grf-cru
> +
> +            "#clock-cells":
> +              const: 1
> +
> +          required:
> +            - compatible
> +            - "#clock-cells"
> +
> +          description:
> +            Clock provider for the MMC drive and sample phase clocks,
> +            whose control registers live in the GRF region.

As mentioned in CRU patch, please take a look at RK3528, it exposes
similar similar 'GRF' clocks from the CRU. Do not blindly follow what
has been done in the vendor kernel.

Regards,
Jonas

> +
>    - if:
>        properties:
>          compatible:


