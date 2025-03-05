Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E089C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=; b=GlU19YajFdNu6Or+AqndvpuWh8
	Hb+f4dSMZn0V56kWLYxBgafdevDEbteEYKnmDZwcw779uz2CdzIlGzZtlAKN+ak+ZOcdk4zgtEm/r
	JiBRIWEO813VN5mUR5cn1ynMuf6Cmd/hoLuNgyVTf7I1yfMmPHt3wH9GmLuNX56Ei7Ahx6SMMmuM7
	vNwlZBqqMqLu3eqgcxpmUYjXwzxDEM/5BgyVxHt373+5pL7Bu7Ml9YESvuyfIi79uVzZ+sc3fyY5p
	3sIBiSAormhV66N30GtSGkalw6h6H13qVoVYa6SdrPlX7NIs56p4xHseuc+92G5ljIqxyGyl7jrE8
	LOhbtZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjfV-00000007J6s-2l6z;
	Wed, 05 Mar 2025 07:59:53 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiWO-00000007ARZ-3HBC;
	Wed, 05 Mar 2025 06:46:26 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c2303a56d6so702707185a.3;
        Tue, 04 Mar 2025 22:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741157183; x=1741761983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=;
        b=O3EdCwL+waO//0ZyA0I6gwdRLADakUDVxgY151S70LdPaWzMY9CrtfSRZGzPXOKXIK
         eQCdEAJvljIMHkT/0puC4/07WtnKFiI19dwkMJ7277rrsNnyilw1altKQq376vN5FNPp
         mNDMdr5zzxVmoSAkN0xQUfF/ZaE/HRQh4tabl0J3JiRx5H2DSMETPZTn5BOtwVZCLOES
         8qp/s895QBTvbYI5MZuE4KZZW5arc/teG9VmM3GeziDQgPDoE7Gx8CgdyySr3ztRdpHd
         CSBjdbL4KQYUUI6+lVqORHjfechnxNMhVnymGOrYCn+vQeFvYAGVyJhwzP59KOQT8foJ
         lNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741157183; x=1741761983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=;
        b=ROpuYHs1c7utcvVazXuICVvv5rryx+X/13+/u0+ZZ7xXNAXcqyGGqIgOq7xS4qoavR
         fKpYNErd89obohdkMn0s4LCdwt98c/qe2a9F8z+hbNRd0pWnJCaALkiyB3QPUsTm4SND
         HSuOyIZIVJ6Ac1zNQsQvhcwrwrEvEVEt2RzsF5heYAzVIfxVsDJUoDT5eAzQWb/myDUf
         qZJMAHGpbX/jB4yWJ0Eq2ih+1oZeZsyVgcC0WmL6g+Dbn+UPVO8FuxdWxY9/+I2xXOnG
         9ml/JAMuVZfe5CyMm2YmB/mYgX3vUOI9bkqDJezCcpMlP0s6/vUwuPcVCTXi1hq2xHv8
         iJuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcHn8+au/WCC5G5+UVKsoxxVnunh3eoQO+veYn+zh900dqhNavD0hrFHn33ZhYLcdKVuerpye8CwrN8Ak=@lists.infradead.org, AJvYcCXH2j/LrwMOsRR1a9yae0yiXXtKyRLBKmWvhuUMnCold9PlHyx7FHKeorVoNm4Fe0XaWhIufMZMGD5zuIdlN/PE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3dwq0Qs6dFmrIYMp44ImmWzqevoAFlbzevps2Pf/VwUrZMjj3
	kV7rLGDpou2DyxoqBPEdk4NR+eiVHrGNNlhY0xwacqjhkBnS4fQy
X-Gm-Gg: ASbGncvdp8+4SRynuLRlbuao3/JAcEh1OfbQSDEOKLQa9bjdFosIj5KrAU8lshNU4st
	3KDlvjeDo1N9kQaW7Ot2IUuB4y1SMeA68JgxqcMl6Sj6z9ythz0vw6MAIva38Eb0/5BhVBqQ1Lc
	TpCmMHAbzFN4417QqQI482+UdIz/NzCHjUeV2gYiPmM/FbolTUJJx1vBihjFOvxxUPrkT0AeAwL
	QS+Of1ukhUdobAMsyg/0C1RbRbiPUCbUpcryo/7/ET1jOnp8hGRe0EgFUEf2seKH6uuuWyaHM98
	zaJdOklbal5iAEpZ17Sw
X-Google-Smtp-Source: AGHT+IELWtfqwszYoCcC2kmAJwyH6o+bHtBOPZmt0BU2jCIoX9fDIaH8na6Ue5jCSeNPLr38nklDeg==
X-Received: by 2002:a05:620a:63c1:b0:7c3:b7c0:cd79 with SMTP id af79cd13be357-7c3d8ee1cadmr311033785a.38.1741157183364;
        Tue, 04 Mar 2025 22:46:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36feea6fbsm848972785a.22.2025.03.04.22.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:46:22 -0800 (PST)
Date: Wed, 5 Mar 2025 14:45:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Romain Gantois <romain.gantois@bootlin.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v6 1/4] dt-bindings: net: Add support for Sophgo
 SG2044 dwmac
Message-ID: <n7jfcncujogjlysfd6v5bbt7tzun2sicx3r3jq3s5ogm5k4ths@y7wwlyijemgx>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250305063920.803601-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305063920.803601-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_224624_821771_09D4D52F 
X-CRM114-Status: GOOD (  19.73  )
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

On Wed, Mar 05, 2025 at 02:39:13PM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
> MAC (version 5.30a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 91e75eb3f329..02ab6a9aded2 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -32,6 +32,7 @@ select:
>            - snps,dwmac-4.20a
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
> +          - snps,dwmac-5.30a
>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
>  
> @@ -98,8 +99,10 @@ properties:
>          - snps,dwmac-4.20a
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
> +        - snps,dwmac-5.30a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - sophgo,sg2044-dwmac
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
>          - thead,th1520-gmac
> @@ -631,6 +634,7 @@ allOf:
>                  - snps,dwmac-4.20a
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
> +                - snps,dwmac-5.30a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> new file mode 100644
> index 000000000000..4dd2dc9c678b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2044 DWMAC glue layer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sophgo,sg2044-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,sg2044-dwmac
> +      - const: snps,dwmac-5.30a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +      - const: tx
> +
> +  dma-noncoherent: true

Hi, Krzysztof,

I add this property due to the discussion on PCIe binding of SG2044, it
can be found on link [1]. As a similar change (at link [2]) was acked by
Conor. I preserve your tag on this binding. If you have any further
requirement, please let me know. I will appreciate it.

[1] https://lore.kernel.org/all/20250221013758.370936-2-inochiama@gmail.com/
[2] https://lore.kernel.org/all/20250303065649.937233-1-inochiama@gmail.com/

Regards,
Inochi

