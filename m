Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92354D58D75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCm9UlTWdb2qxa5v8L9Bnq+ht/sjL8QD4mAYIorGyD8=; b=UEQehBn2Rk5gr+7ibH00ouhiy/
	ILDatPTfCYb9yMguoi3hCqpOSJBGTx4onc858JNC8j4v1r+s0+ER/+FId+prGhI2UsO3l03Kc+63W
	QEabhwPQqf04zgVapLY4POp2u9G6bmNO51rD5jc8sYyswfA7K3hfZWUQs0z/nfKCb6OkVXP3W+BsL
	KjGROUzRwEDIdwnPKzWUSYjGibTkY6sk6r541uVDgq6+TKQTsNWeekPcp5uw65Y4wqzfilRqsqW6Z
	5KYTekQA3mk2bsuZUS/3AqrwcoHcU5eY6SYD1PyqDpXQNHhB6ICdzEZ4UElHn8vE/bGOZ/beboGjc
	bEsAVcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdRh-00000008pKU-3544;
	Mon, 25 Nov 2024 18:04:25 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdQj-00000008pAw-1GCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 18:03:27 +0000
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id FRCdtOZJLumtXFdQQtTcFI; Mon, 25 Nov 2024 18:03:06 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id FdQNtRALhWvXpFdQOtTIAl; Mon, 25 Nov 2024 18:03:05 +0000
X-Authority-Analysis: v=2.4 cv=LtdZyWdc c=1 sm=1 tr=0 ts=6744bbd9
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=nPvSCjySrd4d4ErWsagA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bCm9UlTWdb2qxa5v8L9Bnq+ht/sjL8QD4mAYIorGyD8=; b=CGh1kUmZpUQbUji4nDSybieovg
	o4XMODgtlsf2z8f8vlURoA5TVD4//npaijouwsq5Jjnj1VX8S1fyttt0d1filEqhpaLM/YevPUV4Z
	PGKFgWlDBlU0PfaXLmHAcS/bw7P4KBF4uj/NHggAmR8fHddHqMHFwlAPyXxLpjog/8tM3ykHJ6peV
	t526+K77tY9SEiPoPIsORnDN89pKx6hBJtLZEIBKuhrZmNLrh1W+kuwxRbSD84KWc85kfqm/VpVhy
	ykfUG1DIy3Gk3aNRk66c8Dep/M9ru0cIA2nqlgS2NDsxLCKfVXEiWpttjaSKcbnzxSUfk86q17Grv
	rAL0s7SA==;
Received: from [122.165.245.213] (port=55390 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tFdQG-002YwW-2Y;
	Mon, 25 Nov 2024 23:32:56 +0530
Message-ID: <e9cbcc6f-67f5-43ac-a1ab-4222305087c3@linumiz.com>
Date: Mon, 25 Nov 2024 23:32:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] dt-bindings: gpu: img: Further constrain clocks
To: Matt Coster <matt.coster@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
 parthiban@linumiz.com
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-2-3fd45d9fb0cf@imgtec.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-2-3fd45d9fb0cf@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tFdQG-002YwW-2Y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:55390
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGU5IH6V7+7A4NBNHcmZyTQFTfudSfGPNwAJhYvgskuDMHthPOVGS8pzGs3iIZidMQi+S/K4s4MzyXBsqjdLGxFkX5JNKJx5yMSjCiBJXhvxhyhzEccZ
 7dcYr9ixkix24uliiocDGtXC0cD4AbHbRGBGWZ7ajmuCgRtmsSo6yE1ZLT8b1nGhqL4To+qn9YBqIcAkfCf2FQTI3giG3MtmfmrjuqTm1ajbTTG3Tyaz2Qx1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_100325_362907_13A6C4FA 
X-CRM114-Status: GOOD (  12.85  )
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

On 11/18/24 6:31 PM, Matt Coster wrote:
> All Imagination GPUs use three clocks: core, mem and sys. All reasonably
> modern Imagination GPUs also support a single-clock mode where the SoC
> only hooks up core and the other two are derived internally. On GPUs which
> support this mode, it is the default and most commonly used integration.
> 
> Codify this "1 or 3" constraint in our bindings and hang the specifics off
> the vendor compatible string to mirror the integration-time choice.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - Simplified clocks constraints (P2)
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml   | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index ef7070daf213277d0190fe319e202fdc597337d4..3b5a5b966585ac29ad104c7aef19881eca73ce80 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -29,16 +29,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    minItems: 1
> -    maxItems: 3
> +  clocks: true
>  
>    clock-names:
> -    items:
> -      - const: core
> -      - const: mem
> -      - const: sys
> -    minItems: 1
> +    oneOf:
> +      - items:
> +          - const: core
> +      - items:
> +          - const: core
> +          - const: mem
> +          - const: sys
Clock for GE8300 in Allwinner A133 is organized with core, bus and additional pll as
input. Where "bus" controlled as gate clock and optionally using pll.

If am not wrong, GE8300 also comes under rogue architecture without mem and sys clocks.
Does this needs to be considered into separate bindings?

Thanks,
Parthiban

>  
>    interrupts:
>      maxItems: 1
> @@ -56,11 +56,13 @@ required:
>  additionalProperties: false
>  
>  allOf:
> +  # Vendor integrations using a single clock domain
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: ti,am62-gpu
> +            anyOf:
> +              - const: ti,am62-gpu
>      then:
>        properties:
>          clocks:
> 


