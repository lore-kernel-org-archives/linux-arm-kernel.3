Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B432CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=; b=TLUvszZedaB5I68539wDaw+qvJ
	ImFPClutHEw7kISbF9mgfDL87kcu7miMgBBUZ6tpO4ExD+69mparY2i055mDphCyQsVTGleTBETPI
	znkcshbq0sBeMqO+s8fv0/QWuIMD60MDwjtVCtna+BXdovMHfGUSExQ9ZKdv5Qe1o9ucJPpqXqCV8
	QpZPAzISKRmur8/mASCtzr3om8Gr8Gd1YYcqN7UsyosmoYDaY+huNACDYiw9w7f6hmH4RGqMVz+0/
	d21YYAfK81raN7yUDove04O3aS0AYegrhmMyAnfB9VGkae2GHwtyOQvJru5+X1JaAgfSRtH96Pe+r
	n7kIJUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7Mt-0000000GKn3-0y8h;
	Thu, 18 Sep 2025 05:39:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7Mq-0000000GKm4-1nEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 05:39:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-32ea10cab8eso435439a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758173979; x=1758778779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=;
        b=nB3aWtI7wSMMjpuY7aF9syDdlImFizKiou9S1/DINNshMTCdcBcUoUMHojutMPuNno
         QUt0OJJuJJeXFV3rPu6kgPwsUArNeXxWQ0Da3jUjVfo8OaIVM66arKbHDqOrINXDbLvg
         GjdgTZL7TYWOWAyDrdPmp0gtaBwaU7PTe/rhSLV+zuotfZDApmYwzAcrJ4OoezDE8CVU
         isA9xS1iWQWn0NzOdOSR0iWec13NYBnftjewmU32KojJQrHvTRh0wZUJg25J1DqnhHud
         LaH2Lhqhf06cpikrD7pUPKDDXjQvQjVXWK+pT3dc4LEUoansEUaaf/CnR4YJNlAzhL84
         q8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173979; x=1758778779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=;
        b=LETD0jM+ogud6JmgfNwzze8MCPEWmk1sEyfITlwsMtdzv9q+DYVQIIBuGcptDqsEyW
         0rOM2KzK4JFtGSV00giklHIxkljYWDcs0NEV/ESPGZkux0qm53bFs1ubEZ/VKLRq/A50
         /1+h1EibN9yYRISrDhdRH/G/UdTLNYq1ecwenbBr6W2Q/Zhu7A08HfH6DAABtUCvnzW0
         PlAt8LXGCaoSVTJHYOkVxMWyG8bFlTI8oYaU6JPCB6Trf7MdunlVVPnFsV0UInZZUHbu
         yQtuoWgzeyS+t388F7LpDJS04r7X5eQoE3XCY6EgUz72hsxtmExXxLIOR/bZOsLXix00
         U+mA==
X-Forwarded-Encrypted: i=1; AJvYcCUzwKkyIXPNuHLJKL65tj3+2oEwNgkxwNsPmQnbehimnIVuakOVuPqWvB5wd05mmUDVqltWcSVahKLWXWWdJQdK@lists.infradead.org
X-Gm-Message-State: AOJu0YwS9uZv8FEleeXcd+BMMIkx5xWh+K/iWX85nJf0gZ1nV2lNqFa0
	k1soLUPBqPKfRla3QJenwzt1Y2Fuw/N6RqSQibWKCiQ6hCVWlz8I4hKz
X-Gm-Gg: ASbGnct5XvFf8/Oa3pDhsOVU8M1pCVctFnonjy6rRtE1Ll+VnrvEWCsuRdEXGyScgJu
	Dk1QcsBjv/IUBBNnEHpRJVAVhzvJoYnbtwX7++3sq3EZT6Q8HUA3XxUcBfcmODwlGOxmCruq5EZ
	eN9+ejAsTslGctU2425H5qHJeEvu0aUI7Qmy/yjDSE0WqOr8jD2nk9DqGEVaTyjyZNqEdViSwsS
	/yF2sMS8chTWjBYpf8AEW4Vrca9tb99JgBBeNgHrqDNHpNF7BQFPAktX+ZuA99aG7VdY0LxVJdt
	uqquGU95NZ0Wz9flt8BMEm2Ofa52Ele0/sfWJZBHCjJ3xb+mdi3VBNTv0ZUObHnf9ns28g94RK/
	/ccqkKELo7WpKDifY6w8g0tHcgSeEj1fBw32wWpWEwA==
X-Google-Smtp-Source: AGHT+IHKTOfJ3BPX9Gvt+4rkN+1gu0cdFOaljvM9zc+7rWxc750973qp3+kLMzRM1HA3dLLSY8sf5Q==
X-Received: by 2002:a17:90b:384f:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-32ee3dbc98cmr6602993a91.0.1758173979532;
        Wed, 17 Sep 2025 22:39:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a592dsm4145943a91.10.2025.09.17.22.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:39:39 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:39:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 2/6] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and
 GENMASK macros
Message-ID: <jfhd77aocqhww5iz5wggmua45nvaf6oyggtkyggltacsjwgknm@juwsglvompqz>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-3-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_223940_467135_16066727 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 17, 2025 at 10:05:07AM +0200, Dario Binacchi wrote:
> Replace opencoded masking and shifting, with BIT(), GENMASK(),
> FIELD_GET() and FIELD_PREP() macros.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Applied, thank you.

-- 
Dmitry

