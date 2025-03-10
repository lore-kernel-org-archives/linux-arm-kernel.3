Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD99C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNhM/0IjcjblchV98Qq8e/1t6zgAbQVQNq8rXKMpriY=; b=azneXx+pKL6p3tbOAAWp0VFokV
	lNbEzXpsgBNQ+qEQrnOCPs5IXkHD+psVToD4xYgrjzgP2eojfPATCM+oDuSQZWWMVWkVdiH7RwAcY
	KW0h0mUK1QlY8rppywKxgTFQBZDOadAF8cTxtxjIqlHXDoXqEjgqsEBbP4GGm8ZVUJflo2TMAabil
	UiahJ1qvwIOagEkEy5pVXYc2uS436NpDCQsejpok8d1K5X+Trxdf8SlmyDVrkg0WGxjHXNjXwj+u3
	2325+Ns8VYgwLiU3alVPCYzfDuaFA0POBNhY4PlJrvcpb2jA8n3417Z+vyulmP+f09W4owsdria8C
	CuLmfPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traUU-00000002Gte-1hU9;
	Mon, 10 Mar 2025 10:36:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traPP-00000002GHZ-43Kj;
	Mon, 10 Mar 2025 10:30:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e64700a38cso2342585a12.1;
        Mon, 10 Mar 2025 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741602654; x=1742207454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kNhM/0IjcjblchV98Qq8e/1t6zgAbQVQNq8rXKMpriY=;
        b=NobVWoEQFtaH7euzHJERsGdoASUG8e9CsWTzepk7g2SuYqocjiFwT1A9TvPhUet9hP
         srvh4utlRJ6jYz0EYsmN9k5l7shq0yye2KQCsEEWAEs9jf7zLlD6DzcYYsLigJJMIsg7
         rUnIqjDPci11hbaI1XdTmXVBgESr2wovXzXXI9rwL0zz8EvQGL6eOhO9a8pSEuohCA1C
         lqR1tlRQ2RgQW7OpE9ahySHSXTg7zvw3bpyzn2BR8G260kam7QitST6xd8NLW7ycFARs
         4nThpTVDAGKY/7AQ+VElpTHv5kKcmYLwljQlJaW2mRpkOXqqwmXDxtkeN9+emyIozf0w
         dTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741602654; x=1742207454;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNhM/0IjcjblchV98Qq8e/1t6zgAbQVQNq8rXKMpriY=;
        b=AP4pJTaDA9LvdKIjZji5mgd1Y9uC0Omn6ofpQDJAElzNrTcn//rV7zxaRSplQB8laZ
         5g5p4rS8EX+X5XxgLH/jmomvkUKhMzAAfj/Z/JWYbvzbKp5g84URfJqe7sdu2BHmt1wl
         K+LHq8fklzdjce1sV+TC9/nkq7YexBLWRXWndn4bTU39+NUxhXtV6ZxZ0/v3NaJsECSd
         xsLqqyOYdzslAyUDTHx2Ely6Mi8CkNecgIeqk1MJUny4aziKQnF/t3jtBYQ7XPcW9ywA
         OMVB+XqTy6NBlBdMHN3sdS5nAbN7WlZVRFyInR+TiUD+W9wYePdRtqX5mwnJs0TiJ+PU
         3wow==
X-Forwarded-Encrypted: i=1; AJvYcCUz/kP2ykPzc+QsyaOEAyUVDhw4ouQLiEaPTNAeme1RAJdGVJKpAa5I8yNILB+vn+FnAE8eiXO7FrdGtpzN+zc=@lists.infradead.org, AJvYcCVz4cZsuyTiTR3S/vCuSAormbMqm1bD6dCDgHgQi8/p7nuOxp/Sx9g7bhyvouTeXv8oBPZUoAC/y0X5@lists.infradead.org, AJvYcCX4KsfErzI7QEVNt6UwwYYiHV4CKDUYnSy5AWzEjxXUy00ViCPYG1UgWSOUA9nGHi5TT2dMoBSuMhy1znKbveQK@lists.infradead.org
X-Gm-Message-State: AOJu0YxdyH8cxwfP0VIUL7Bh3+KwUKjPZRYhDfMYoMkteC8qEuGK57I7
	8mm502o48gjJU/XkJPmwUYcHPDFFd5w1XvWFXw3uJmULPX54XNkW
X-Gm-Gg: ASbGnct46DLZc7IOh5PCLxqY2Pb0H7gMhSpwKtvHCM3jO8zBJoFYLkP9pKS+SJouuQL
	+B7RItAzKmXEj9V0/Zp0wXLg7ZTaXFGxo4voTRrkuho1bl1bATQAZ2D4YRTEpqy+EUuLEzqGKW6
	KZz6cJ53SCmiU5QzH74nYazHn8tvFpOpDoko4YvTcw+hInULBQfNqvugJtINo+B0C9ICrA4JWR0
	Nj3J7Z7tkEXuoDPJoGNALZLYCtZZAG40ZtGtFHo8ivLNUXAg+WC81aV/sKE+L6tVEr1/VSdqZrM
	Ep8luzW4niXrCs7RMt6b8VdJ5ZQI70RjoUr3eNgnKA==
X-Google-Smtp-Source: AGHT+IHOgY/2k2K6r8nbyooLCIqhLZNyi8g28UASQ2a6eAtRtlwzSxaLJolXF0bJ1EZNYwNFw8sjfA==
X-Received: by 2002:a05:6402:518a:b0:5d9:82bc:ad06 with SMTP id 4fb4d7f45d1cf-5e5e22bf16amr15660909a12.3.1741602653855;
        Mon, 10 Mar 2025 03:30:53 -0700 (PDT)
Received: from Ansuel-XPS. ([85.119.46.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733f9d4sm6630840a12.10.2025.03.10.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:30:53 -0700 (PDT)
Message-ID: <67cebf5d.a70a0220.fe6c9.6ad3@mx.google.com>
X-Google-Original-Message-ID: <Z86_WkfgZk_HLWuy@Ansuel-XPS.>
Date: Mon, 10 Mar 2025 11:30:50 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 03/13] dt-bindings: soc: airoha: add SCU SSR Serdes port
 binding
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-4-ansuelsmth@gmail.com>
 <20250310-ultraviolet-earthworm-of-honor-df114b@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-ultraviolet-earthworm-of-honor-df114b@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_033056_002080_9CDE17D9 
X-CRM114-Status: GOOD (  17.06  )
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

On Mon, Mar 10, 2025 at 08:54:14AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Mar 09, 2025 at 02:29:34PM +0100, Christian Marangi wrote:
> > Add Airoha AN7581 SCU SSR Serdes port binding to define what mode is
> > supported by each Serdes port. These special binding are needed to
> > identify and provide the port mode from any user driver.
> > 
> > These modes are mutually exclusive and driver needs to correctly
> > validate the current mode for the Serdes port in use.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  MAINTAINERS                              |  6 ++++++
> >  include/dt-bindings/soc/airoha,scu-ssr.h | 24 ++++++++++++++++++++++++
> 
> This should be squashed with the binding for the device.
>

I split them to mute checkpatch warning

"DT binding docs and includes should be a separate patch. See:
Documentation/devicetree/bindings/submitting-patches.rst"

But I think I always took it wrong and with "docs and includes" it's
intended in a single patch.

Ok will squash!

-- 
	Ansuel

