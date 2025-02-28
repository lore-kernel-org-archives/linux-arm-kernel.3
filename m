Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007F6C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fi80ttWsp61rFaPMRzcRoSBsD+icdSl9C9Rjx5VP+3M=; b=UG9vc8DWmhXNuNtsaShq43g+jl
	QNiE5abTJ6RJAhFMv2KjCut8trmb1xH+SJ2IDSxglEnGXXStkd7XZQi508b9igjoVAfQjMU6Pfe06
	LVkQS/b5oYjKMD3PohtXD861BMHY5DfIRKBit9vjZXv6NPes/hrKqczH2fHrzj8dy4SKWIBM5N92T
	pDWAnTxenAF1dBVRlIjK6HKAaNtVyGW2O0WCp1Uvl/CNtEiCNKAbHJJiKp+ZWqguXvFC+gdu27T6d
	0emgomaoWm35CRwGEcF79v9meyX24XSu1j6K5M+2FVoAzVIRs7DMuhZ9ShZF8/wj3xgHZsCsmxJlk
	r2TGfx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyHy-0000000Ai6D-0sii;
	Fri, 28 Feb 2025 11:12:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxmk-0000000AdEs-3yYy;
	Fri, 28 Feb 2025 10:40:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso20060225e9.2;
        Fri, 28 Feb 2025 02:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740739201; x=1741344001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi80ttWsp61rFaPMRzcRoSBsD+icdSl9C9Rjx5VP+3M=;
        b=e/94MfUobLMist0dmvwGu9hSgqeIHdNrePuXqAwNjH29grbI9qVEqMAM8vWIumurGF
         wfjA1RrGvw+aCGELuP6iWf2PD6wR65fd4Y4LEY3i6J7NwntMZveQ9qu9ffAC1vmO3NIu
         k7pPNeS8OiaOv8QnMNHHrc5zQrLb6Vp87AOlTERmHHcqid8D2eWwwEIgbhygUFRMoMKa
         gmh1JCrHfNDuQi5fZJuTyFSGoXQEgzTmdngk9LiKzHOXpoHMR8azDtFWMUzbFUS/WjEQ
         r5fkqlxvIGAi5PQulijWZT2Lxy3U/vciX3EImH9aFC2GaXoNMIRTydxr/lL3kCD7m0R4
         RWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739201; x=1741344001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fi80ttWsp61rFaPMRzcRoSBsD+icdSl9C9Rjx5VP+3M=;
        b=KGCmfDAAqszlJI5e/e2mE3cb8jbIrOfP7jDL8QK1aV2aQ7U+yYaQ4Yc79sFM+KBsUV
         t8Tw2zMQ6Em6QUbDH7aojAX5fY00JZl0Q/HbnoFy7o5P8WfW5qLoApdu2OJ+99SR7+K7
         io4prAoMOlY8hxb7IcZA0L96dEXHJ2EUC9XDnZ746y2EPYFcn6Z6YUrpBS3JsCdliOUM
         B0xyXP0da5Vnz4D3kUj2JmGTyWuu/lOGWNGLCOTe/BWI3EsLThwDasjPAPFw4Q580VH6
         ppGfwqeMgyfqYF3rS69hRipol2/GRSnvi04kfi9+CWpe4NcJ8WWW5udmzxnSWGHIhcFS
         y6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCURXisciKTwGHpMDYNErEEnk1UeNcZgHaDJqzDHpNl2WNG9rKU3mwR7ryO8bCrlbhn5Z3TxvmmLiRJd9/RaMB2X@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf12P1dIG2JqqrpdemXNEZMYLpztNn2Ai2XpPVuvz7o4nQXRNT
	OaXKR1LSchKo9Tuh59c/nhRzTGI9Lxe2L4s2uBkdcAP80+SRHElF
X-Gm-Gg: ASbGnctyNj/Vyx6MbZxOkh2gz/16cof34XUMpEQKKZmmPQvC1iI3k8kYtQ9Z1H7ppFq
	ApTEYTaT6bHEpIW3K7y+66Y4nsyGIpYxaXCa+7VrP0lJcu0a2K4GlOZCN0FvR2q+vCqqEcPaWJ+
	rnh7Q2IjyPKYIN4ZYBa6Bvm0eAnvXrBMtagOGY90fwjGWtq/Pr2lv0J5LJX16fzv7xQEW/gJWD4
	NlOcz1BxY6ur4yHYQ7TkUNlhNxOB6NKJnRMQ5k+y2NhuU7Y2Ut5PF0/KQmvgqyxa+UGsxhAtp/m
	jRbjJp/BzAO55H13iERNsc+eDHFblK+TamRJKSliPA==
X-Google-Smtp-Source: AGHT+IFZ+9Q0/YRqcF3z6Eyi5tLIR/2s8CMepw/0ILneK1BAb1xfCwMbUhjYYRJlgvj6BOKAvv7DEg==
X-Received: by 2002:a05:600c:154f:b0:439:86c4:a8ec with SMTP id 5b1f17b1804b1-43ba6704456mr27891215e9.15.1740739200632;
        Fri, 28 Feb 2025 02:40:00 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:31d5:4145:8035:cb68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm52078855e9.12.2025.02.28.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:40:00 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	tharvey@gateworks.com,
	hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Date: Fri, 28 Feb 2025 11:38:32 +0100
Message-ID: <20250228103959.47419-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_024002_986581_C0975C91 
X-CRM114-Status: UNSURE (   6.96  )
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

The imx8m-pcie PHY PLL fails to lock under certain conditions when
returning from suspend. This is resolved by asserting the PHY reset when
powering off the PHY during suspend. This ensures that the PHY is
properly reset when powering on again in resume.

Stefan Eichenberger (2):
  phy: freescale: imx8m-pcie: cleanup reset logic
  phy: freescale: imx8m-pcie: assert phy reset and perst in power off

 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.45.2


