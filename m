Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312BBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huSEKVbzBTMcqWXnTQrTDEYxm+6yBPzd064JJPMGrmA=; b=dPkgz+8YGZ7Wz/aVJ4NW7l2HqK
	11SGCs+705mzvvHJqFADSyFL/KTS14KF8vkktbJB959/48zeom60V1yUZXx7QoBhLZCgqBlnCedDI
	JjJ9X3z0tQRSFdTwZ/zjuqVxA3WQgS69eKUSF4XfJ50UO8gP55NQITWCC+ENeAgUDJLj6e/9oeFOm
	fpLmRuitSJRYGNGNYnwLB9TtJ3uDNdnZyhFfVmR/MztNAPe+5INHLi3eqACV3tMjQxVfMgeTr0PR2
	Bm/AOCekMUUJvvhf/KxlR9w/DGKXWF9UgELUuystO3QA0vGpEwWxwKtcgm83fDXGdE1BUrIb4w7W4
	Mt/7Nzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVQE-0000000BkPT-448S;
	Fri, 03 Jan 2025 00:20:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVP4-0000000BkGv-1xVR;
	Fri, 03 Jan 2025 00:19:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso124756555e9.2;
        Thu, 02 Jan 2025 16:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735863540; x=1736468340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huSEKVbzBTMcqWXnTQrTDEYxm+6yBPzd064JJPMGrmA=;
        b=MbcQKnG3gHDaLqCZzpdIcRW3eAiHN/6HZpy0rUUpfuMQxxLi/v56UOZGhupebasbFt
         MJ5we+uNCClyMLLQCIzHN4DxaWYfVODS800lTIy+MjenWJUL3/RbGR7DlgbshFmGa6lO
         dD7DJhRl7kh0/jrHFuhEiWHybOk6aUhPwUGad0MMXM0H3fpS8MB+PMEpuBK3CUlHyHA/
         T3WAuWSxt6tp47Q2s0s9TLRf3OTypgrd3sakhuHxBNYwcJiHVOanQ3XagYLb1/yNbNUw
         DDYQJ1EeYHVySOzbPXxdbebEU3faORN1jQsxRD4PRcjt9pjhSm7+NJqFJC2RKqTx3zu+
         tyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735863540; x=1736468340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huSEKVbzBTMcqWXnTQrTDEYxm+6yBPzd064JJPMGrmA=;
        b=wlikGq6VlEjFand5l/c+BexBYozINgE0N8dutGBulmGJDvu7Th9UxCG0JDwZ2Srkwj
         1atq2h2uOyGR+b/T95TEqgiFhBKZn3CzQoBsYwe/B08rtOfxQqOpiZESzjXWYNcFG2W+
         051KpD/uiZskECPKw9GSqW9bnYCOeyNcBsX1oT9rRHm0V78WDVlf89TgTAqamtMqUKzE
         +VrIt1X7zL+zvI+0g15812m1m/jfN+StRvWrLsWZKhzchADwaFYShUIghTcCSyH+nrhn
         ftf4nFIYEV8+p9dg3en70/1rKFAReA6TLjOKNO9nakdSxn0ju0EeoNKrQMNKkqBEjZ4e
         98uA==
X-Forwarded-Encrypted: i=1; AJvYcCW/KkxDABzSEtHQ7guboh3S69W9sXl8XM87ZoWYuDG/e7WlmxUT19q1z9jVbvd7O5cpR9mz4NvFPJmizseR4UQ=@lists.infradead.org, AJvYcCXIeZ0THxHDL6jnjxh9YIlXHCW3FFH5MLhHXQ0lvb8HVFHlpMYbgz/NilEvYO8QL+AWmxTxAnaN0P6cAyMf0hRC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1m7PsL9omSS+zN/Bd8BzUeWqZe2v0An8XbufpIcJYcDgB+c7k
	2A1HsK5PkyVzM/zACes6V12lVJVn0vGOdlNdB06uCbpy5pfE3B1yNaa1AjgbBWftfnafwrJ48Ix
	kIjtI7S0RDNPM4HBCbBFRsdz9aYg=
X-Gm-Gg: ASbGncvJM4znAHnS/VJm3yw3zsYkz5Ogd/jDe+1e/nRf6UY9REizFiWFJPCDBtC1O45
	8J67l5+qAibg7qp+FjCZiOutWe2P7CY/MKM/hU96nHhtg1XVRWNHW0xNv1PrPBUqkqE3e1g==
X-Google-Smtp-Source: AGHT+IFAauF3ujNhgDjOT4xeOGtCr/wxIkY8hqpVIBW0I65Elwxcj3g4j+FKksFlophDch/7GEvnM0WPPbbN955zfiQ=
X-Received: by 2002:a5d:47c5:0:b0:38a:4184:1216 with SMTP id
 ffacd0b85a97d-38a4b9a98d4mr17319346f8f.46.1735863539752; Thu, 02 Jan 2025
 16:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20241229184256.1870-2-honyuenkwun@gmail.com> <20241229184256.1870-8-honyuenkwun@gmail.com>
 <20250102215308.GA636148-robh@kernel.org>
In-Reply-To: <20250102215308.GA636148-robh@kernel.org>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 2 Jan 2025 18:18:48 -0600
Message-ID: <CALWfF7+B1nkKsA9RvCVhAytotgRM16-6Q1z+V5YyQCDSh4cc9w@mail.gmail.com>
Subject: Re: [RFC 4/7] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_161902_505280_3DB0D89F 
X-CRM114-Status: GOOD (  19.07  )
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

On Thu, Jan 2, 2025 at 3:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Dec 29, 2024 at 12:41:31PM -0600, Jimmy Hon wrote:
> > Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.
>
> Why RFC? Looks fine to me.
The DTS is only a RFC because the board schematic for the Ultra has
not been released yet. So I haven't been able to confirm the pinouts.

The 5 Ultra DTS is mainly a preview to show the similarities between
the 5 Max and the 5 Ultra.

>
> However, you should have 'v4' on every patch in the series if this is
> v4.
Will do.

>
> >
> > The Orange Pi 5 Ultra is a single board computer powered by the Rockchi=
p
> > RK3588 with similar board layout as the 5 Max but with the HDMI0 swappe=
d
> > for HDMI IN.
> >
> > Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docu=
mentation/devicetree/bindings/arm/rockchip.yaml
> > index 2a141d99c533..9dd424265826 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -1075,11 +1075,12 @@ properties:
> >            - const: xunlong,orangepi-3b
> >            - const: rockchip,rk3566
> >
> > -      - description: Xunlong Orange Pi 5 Max/Plus
> > +      - description: Xunlong Orange Pi 5 Max/Plus/Ultra
> >          items:
> >            - enum:
> >                - xunlong,orangepi-5-max
> >                - xunlong,orangepi-5-plus
> > +              - xunlong,orangepi-5-ultra
> >            - const: rockchip,rk3588
> >
> >        - description: Xunlong Orange Pi R1 Plus / LTS
> > --
> > 2.47.1
> >

