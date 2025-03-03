Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8040CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k28ohh0BPSZHJHOBtNIM4qll2UGyVczMLoUtKSqo1k=; b=S6TQc17n2GE0aU97ddaNnBHJms
	+KIOMGBoGguBHfg1taOM/ZIPDFBVMFUqp02OC2xwQTwC6EYpc/SBC+iw2qZDYe+VFrwESaCS1IcGS
	xVGRMUI6N1u1V4T0dSLL4FoUN33losQfeGrwgXXDOn5x2X1itknF2LZxWbz2TExY9oBxd2wALnqJD
	KcahD2PfNhmmcoUOKUrDaDNZqZJkboKUyBEEMimffmHqKvzdM/Q/Ggcb9RMz+WBP/iNbX577Crife
	A2B41IlLJFlgRTFXzhfCNwR5lWfuNGHIi3JrbPVy+fOMT3ixrGkz8sHhBMBpCbMuSp79yV6vMC2QM
	4MbouVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6id-000000015qv-3UwN;
	Mon, 03 Mar 2025 14:24:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6P0-000000011AT-2fzW;
	Mon, 03 Mar 2025 14:04:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so42607795e9.3;
        Mon, 03 Mar 2025 06:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741010652; x=1741615452; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8k28ohh0BPSZHJHOBtNIM4qll2UGyVczMLoUtKSqo1k=;
        b=ceFU5/tdG7M4EAh7yV7Q5i9jLF6x2WThoyKhUvTb8R+p5BcFn1usIYYEBRh87WC7/j
         3fkColp8wWZg11wOjX9GjVqHumdbegJr94vbJpZmRbNJtDT46GPIxXubFG+qIaQCt3qH
         627XUd8Xhyazq4VvJbOCJYOvGXPui/hzIHFRTNN91nKmLIfS/xFLpEwXrhZng6FZS6WR
         oQoEZ6fnBOrDfhllbD+7JAx3L2/8LOPGL7qF13cC3K+qblgJzy6tRA6iOfloZh9Edpks
         Q8XJqUgzDvSPAi+BASbLCOwbhssTFEeSl4TN4LNx6etS2l5X1das0+d3WmqgGZDhXdSz
         8B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741010652; x=1741615452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8k28ohh0BPSZHJHOBtNIM4qll2UGyVczMLoUtKSqo1k=;
        b=iPk0t3/xeC02pq8NeuhrpDw3xUB9BkbcIMb5fzoI7n8hFeL5QEtamTboMOAQdJFjuk
         K6EJKPi+XKFSFT+MjlFKLDQWjf6+wf8noAt8k5YZ2zm5zYjcOjd8RsQaSdt+ZL4TTPy6
         vdiHbvbbNFr60uKKYR0/th37gabwSJydCkF3W096WSSmxqhKOghNn9jBAIeBf/KwTplg
         HjCknckNX6jWL2HzqqYk2YNlvTmH9Ade9pzP1Pib6FBhyNK0G6s0Tq05w4+VI+qEJPR8
         oZQ6Ue+1Nc5QKiDVGbU1f31LEuxginvT+pTGWSzzMrrYf0swDzwzQ7iCMe0N/mUua1i9
         TfeA==
X-Forwarded-Encrypted: i=1; AJvYcCXOn5Xqzie4YyNx1NkC069fldFhb2Pdct9csH/Qff2lhU1FZ8Qnre/R2f75aDl1j5o4G/FOrTagCQca9F/3zK7sQg==@lists.infradead.org, AJvYcCXmnD4p3e80b+tBxmmoIuiSLp9/tWwc4EgT+dhjWET3uRMJMUR9bD2eurm+HKJzy+JyxxW+0rXiPCnw0bRP@lists.infradead.org
X-Gm-Message-State: AOJu0YyQageBjZZy1Rr8JIDrWjbjHOY6AQ0m6QCrkG0KcVT1RBR/QbgF
	+L5QuelATN/g7ShONsuHGq5CTVv9owv5vJ6ZmJAGv0Olu5kHksR1
X-Gm-Gg: ASbGncuNjyWNhvpcPo412KWWRhzhA+InjMGvRn2s9LnrU/2j7Zn+mApT+QymIinSkjl
	kaiH/W/0W2c2wRoQ+T3f8/PpORP9IVPm1GQzKFajeTwsrcRpj/MWyOETFGghbrhkS1p101AmMaH
	V6c8HkFKM6PpOGQtnXk7UCmWBXBE1whXrdiAgTqsQinOdcvazc5GJya+JnLt7hHaavolTUW8dOm
	/doPaujsoGKWNqqC0TwrxbIqRvV8L657wlJhs/aoKgsnUDQEs74hZcT7apiu6au6o3vI35mcfT3
	Xo6y92WSKXk37EdEWjLWFn9zQUbWA9Y4KfSpG+cZDxAfAovoPHMnhERA3RLxlxitxFDeVVHjFbP
	F8Bs=
X-Google-Smtp-Source: AGHT+IHvcHXOSeKhHWMUt2xXWhTV53mo6yshUFDelmHEDhBHpCQfhR1rFavwoCbMnPzni4lL0cMigA==
X-Received: by 2002:a05:6000:1f8c:b0:38d:e48b:1783 with SMTP id ffacd0b85a97d-390eca27761mr8649282f8f.42.1741010652096;
        Mon, 03 Mar 2025 06:04:12 -0800 (PST)
Received: from ubuntu2204 (207-pool1.nat.godollo.uni-mate.hu. [192.188.242.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47960b6sm14936073f8f.17.2025.03.03.06.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 06:04:11 -0800 (PST)
Date: Mon, 3 Mar 2025 15:04:09 +0100
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 13/18] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
Message-ID: <2gfjdazu2ohv4evd7iuk2dzexlydnd6yu3xmjk2lgsx3iws5sa@xdwf4df4ojck>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
 <20250228-rtc-cleanups-v1-13-b44cec078481@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-rtc-cleanups-v1-13-b44cec078481@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_060414_673473_E6AB5B4B 
X-CRM114-Status: UNSURE (   6.70  )
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

Hi!

> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.

It works on real hardware.

Tested-by: Tóth János <gomba007@gmail.com>

Regards,
TJ


