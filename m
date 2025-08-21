Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E9CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPd7TEjWkozgvC/v5mJtOM5zRUUP6vJZ0SAdjA9o64g=; b=V2dkniF8VAd63R6feI6bVGHMkI
	qB+gtC7uow/qoCtgEetp2lt9DJHSlr/+tBaKJ3pvzFPD9uWxN+cTlGRAi7XDOh0xv3rAAiSRqaIGm
	VdQddAXe1QbGDWbxV+xnUWQCsR8PAI/GbDyRvebX8TODa7P3ROom5odikKeOpneW/sGoDVrtnE6Hv
	SeiSIqF2q9w2l2cEX4jfwPff30XHb0fWIDLLedjkhSm7fOraA8E4JBkLORYPc5TMAejSGLw4eD9M3
	0oVBQ/cWcnaIGhNGAv437T42CvwETk8gVG7D5+1cvfhFLrgxGcLk3ZOd8eGuE37nsHWJgde1E6uuB
	b65287CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8SG-0000000Ha8y-33Me;
	Thu, 21 Aug 2025 16:48:00 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4kA-0000000GxOe-0Fas
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:50:15 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7e87036b8aeso107183685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780612; x=1756385412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPd7TEjWkozgvC/v5mJtOM5zRUUP6vJZ0SAdjA9o64g=;
        b=M2prtWD/pBuhEm+dzcACN2BbnxxigM9UGt0gBt4tM6OJiFUqdgwy2wxNnul2L1iAgf
         9QyGWO2SFrd2dUlD2phKJTDjarDbbcv6mP4nKSUJPBReLKnyPzWEXwbyOLOOh66zfDSB
         hkkcXIZKM/ou1CIMU4+Y7CuUTNxiJzDl6gmFfuwlECnjCBgvkmYAf4HuO60G/a1tx/IC
         U8zFiORsVUcBhN6ZHddOMsNKwr6vIK40fSZLeIfMf94ndTrZXMUfxiMFJxpgfNKYUrjo
         Yr+ccYVh9R5GMUlPx1RunQBwO2mob7n7kw1SQA018C0zpOK2LjEMPj8zgqzXGyyLC2PZ
         edmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780612; x=1756385412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPd7TEjWkozgvC/v5mJtOM5zRUUP6vJZ0SAdjA9o64g=;
        b=YvY4sLyPxlnOdBIkOXV97/26eS7J6a7I80t60nyuTb3SlDwGR2wzMKhCI/3dm0G4Dw
         FBk40SpfLWW6tkXPG/4FxHuhYZlRZoQyBTn3e9pt4wGI/QcxLVty1bV6NvWqrewfys8T
         hl0YZPTObkrAztJfmXTlnGYy2jivr0L9yxHOSCHKfJfF7WtG6ejbaY+sriUA9NDJIwXF
         s05soSvGWbJQcSpDxQ4RC2ccymm94yRVQCMVIYB8sGzkckeQBycECr8csON8CoBmEgsY
         cskOWeHmxxK12CLpzEkGobSjxDdQ9Ft4SzGJrdMBqHS0oxTQnt4Cfk+JwYhHntrs+rC8
         EJmA==
X-Forwarded-Encrypted: i=1; AJvYcCWNIsjNeeP0E102iEEQiS/+l9by8w2VM/NBLhF3FfuEHiwKoXIYW92IhAD+fEUMskT1QgnNA8ivonou/WDDVBB9@lists.infradead.org
X-Gm-Message-State: AOJu0YyKS6B7aIJfX2rDST8o5DFKDp0jUVMbDWej0A6akJPZS3l90H1C
	9+A30vdIB7QKBsEKdJ2WAde2nlWShHx8x5jH/j+ZIQypeLglYikwGaHna0flghPE
X-Gm-Gg: ASbGncv3VxYBUdxggIrN/gchLbNHw2cZulGyXbrtIEuSihkIARZ3vnu+2dReL02hYle
	E8zW5OycCv2U5mah/10SCVJoQnpI9lhQHGOLUjmyfIPZOkqIDdGG1IckSAf0+uapWO31z92SuES
	lI+JgYHJAfKv9OM63tOaRij93xb0m9fCsxklMfFwo4cVuPXqoaOo9DVe1xDBS+El7tdqE8FYvHt
	BOm/JYOvYK3F5niaVY3Ol1aVCZL8Wk32JgQRkba9hJ+4F1+JlPy8LanXlvwVn+YbIYlQ8Zzt5EA
	wCd/+OxCxBmZ2KlZy7DRGcjYWXlej8Lu7Fvuo7onlZj2WI7Hu7hUmYgLg/6oWawToclEmnu+rvl
	Xm5Vi+iEUJGBYAGxCS//vUkmwVMLl0hXHrcDFuTO5J/jCXZDJz4QZM0ufGg==
X-Google-Smtp-Source: AGHT+IHKlAINmciaKPdOD0ea73iO/5ZcLBWhJDwWa0ZbgscyKMHmIXQTkwQ9F922ubbV6Q5wAXzySg==
X-Received: by 2002:a05:620a:17a8:b0:7e8:324e:c7e8 with SMTP id af79cd13be357-7ea08e8086bmr221288085a.44.1755780612282;
        Thu, 21 Aug 2025 05:50:12 -0700 (PDT)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de44f76sm100197321cf.50.2025.08.21.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:50:11 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:50:09 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: net: litex,liteeth: Correct example
 indentation
Message-ID: <aKcWAant1Y4481q9@glsmbp.wifi.local.cmu.edu>
References: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_055014_102025_3F261CA6 
X-CRM114-Status: GOOD (  17.98  )
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

On Thu, Aug 21, 2025 at 10:30:39AM +0200, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Gabriel Somlo <gsomlo@gmail.com>

Thanks,
--Gabriel

> ---
>  .../devicetree/bindings/net/litex,liteeth.yaml         | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/litex,liteeth.yaml b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
> index ebf4e360f8dd..bbb71556ec9e 100644
> --- a/Documentation/devicetree/bindings/net/litex,liteeth.yaml
> +++ b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
> @@ -86,12 +86,12 @@ examples:
>          phy-handle = <&eth_phy>;
>  
>          mdio {
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
>  
> -          eth_phy: ethernet-phy@0 {
> -            reg = <0>;
> -          };
> +            eth_phy: ethernet-phy@0 {
> +                reg = <0>;
> +            };
>          };
>      };
>  ...
> -- 
> 2.48.1
> 

