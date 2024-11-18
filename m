Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99293D10F5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR8vRiyQWafhkwLMuApVW/fxma/Zo6ed3zIRAdgzhAY=; b=a9HpIAB9BHgh+x3FdetxR2bL+7
	gYWSeBJM3Lrygtv6k17rJsddHuXZjNLYcCeIMeAPNq6Jpkr0kkKD6hBwzi70GuHO7amH/aw4yB1fi
	nr/1zV0rqPvT8ijlP92NAFbfms44+rdb2wPYZgl00/W3TnKCS06kCMQkkDjJz7//LTVM2j6MD6pH1
	wjl4SXnlwgTN9W3+SytM2z+B6iTGKgIrSUjxvMphrXL71I9nwFT0IaWTHnWemulOF/Oedc4lVbaYi
	KPN6IeHLmjf+Inbz5Psk1TzLz2PwTUEIa10rfRoYR4j2FippbuPv25ADsUoubFiCI/bPXO1cQE0tj
	uIZa4uCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCus7-00000008TP8-0VZt;
	Mon, 18 Nov 2024 06:04:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCur9-00000008T8S-3pZW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 06:03:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-432d866f70fso32961695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Nov 2024 22:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731909805; x=1732514605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AR8vRiyQWafhkwLMuApVW/fxma/Zo6ed3zIRAdgzhAY=;
        b=kqvk9c33AaE5wif8vbLQOmbimcvvr23Y3Ce9wRT5qsYC8x+W563ZYLDJCS34sQnoV5
         OdYVojgWJrchyiixpF10OAouzyC2+XxK+teYtH3w9F5Evo9LU9+EXEv9qGa+snQvyyMU
         H/4JewXym6uGSQoovJCnBYJBolRYaDYwqoniqrcu0AFz/I3//tuEopMhiMi+4mGfAHQh
         sd+yCJTHUmDzn/W4xG/ANH+9z1i9dCb1x7mN9dVGXuWctIMIrUAUfhtfhf/RTmttRvKn
         OOyBseDEy6kIWXwGALrIj4gu1mvet6dNgnPmM25gvY7w4zFoa72El9eHlLksstukplMU
         zAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731909805; x=1732514605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR8vRiyQWafhkwLMuApVW/fxma/Zo6ed3zIRAdgzhAY=;
        b=bYiZAVjx0aG7KK1Vi4ZBwSWvDMkK5thZazBtrN+0LMxMhBDY7qyrsF7BYrAKQYU3wl
         UeMYhXBC19SKqcpcDhYWJHgZ5cecLH29xzW75vXxSroNiUY+Soz+lu/KW+8QrVpQL1Dk
         mrVxyrhr+0LbrytJwKVFnHB4lifpg9dSXIoOD+egf9zmG+2jNcHrWAGzkPEBbAr7W/Qj
         l9eFOUO+ENhHOL92paRWeZF2kipTvjfM2I/Te8ikseo4OWXwNvBTkIW13bY+OzqB30S1
         2HbDv136n5HGN6dZg8RyQLXKpqm7m+Bn49phUZImNyuLwQ05C+39WQPnyLyPaeQv2P1W
         cFvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAM04zq1L23Gg8GSo2D86w5UxXNUvlLKfScmVhGTpMZhtW/Z67vvZRmvsHuJ0fuI4RGTTvlXW8i5Bs6adgUf2d@lists.infradead.org
X-Gm-Message-State: AOJu0YxbG8O21iVfa4tWh0pydOilp4G36pue+3t9jIa2JLziIkMclok3
	g2sRPCE5MFG0z8GEBiDifVJikLhMrMPvlyD8xdVO0Vo7ckgw9mSOKPUrx05XmP0=
X-Google-Smtp-Source: AGHT+IGbozm5imyvI1diBD8cPltGKKe70Wh5xUrFEtI3IIMcZHzRvhf6hhocFPZiJAaaikEibw1ZfQ==
X-Received: by 2002:a05:600c:1382:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-432df74f0d4mr84755155e9.18.1731909805553;
        Sun, 17 Nov 2024 22:03:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823ef97042sm4424753f8f.35.2024.11.17.22.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 22:03:25 -0800 (PST)
Date: Mon, 18 Nov 2024 09:03:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7915: Fix an error handling path in
 mt7915_add_interface()
Message-ID: <98b8f06d-e8b7-4a49-8508-ea87c385bd30@stanley.mountain>
References: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_220328_005762_A310113B 
X-CRM114-Status: GOOD (  10.70  )
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

On Sun, Sep 29, 2024 at 09:53:40PM +0200, Christophe JAILLET wrote:
> If mt76_wcid_alloc() fails, the "mt76.mutex" mutex needs to be released as
> done in the other error handling path of mt7915_add_interface().
> 
> Fixes: f3049b88b2b3 ("wifi: mt76: mt7915: allocate vif wcid in the same range as stations")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

This fix is still required.

regards,
dan carpenter


