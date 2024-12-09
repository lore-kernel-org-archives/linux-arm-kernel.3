Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A803E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8It1LsERjYk3PRVA4rqnSiz+MggzufbNA8DNofp64o=; b=0UyoXMP8+VpiMbMj+U5jKCv7da
	0nWJ8uy8gOPuXvOVzkULChqqtwmpOAHi6ObdrWdEnwDAocUUoozppCOWlNshb6pwsSeCE5e7Wg5UE
	Q8tb48te+mrgPgs9bxGDNvdyuxKpv1akkwJer1btYC6J1w715yXI2Uprgkn8j5jODQzYIB5UxVjRa
	3KzpSfB5bG48I7cJXMgt03kQXmW4n0cdHgOn2f83626kavB/T3/QqKFvaRfYHz3mvXSU7HNoB9I2G
	5gKiPSaOhM8WxwF6VeKXrzhYK5DjLEmiDdA+90CghhI4CFL4R5iM+IxjxizjKnbIZCyC2ziFwQufB
	XDYMPoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbN1-00000007Nsd-3APe;
	Mon, 09 Dec 2024 10:52:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbKy-00000007NRn-2NNO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:50:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434e8ed6389so936655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741399; x=1734346199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8It1LsERjYk3PRVA4rqnSiz+MggzufbNA8DNofp64o=;
        b=NcxJIt11CKO/Pao9LBpV7uAB8/HsMbl6FSJRZgN3XuVlUQ0Be/txcep/KigvLAacEW
         EtEQ/IsQYSJucOIQPbOsXrv7NiH7U78Y1qzcuZ0CmBqOYLTvLLMOrKEl+dtp+PQDiwTa
         epwa5F8bX+SumvdDGPkYm37Lw3gALwdUG2cHeeh46to4b9/12Bh2bPMWmO39t1GbUPz9
         2hfvxU9rnehnZpvPeW8CVBj8nrjjoDvpIJyRxMVqnIFu1kjkf5cDMcUMGYZWqalEQrDD
         Lcxc3D944kqDNMxw6/i4sE0BCbLbvDK2zzJLRbLPNeTZi0iM4uEQZG3CdhzsUVtiQdGX
         nCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741399; x=1734346199;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8It1LsERjYk3PRVA4rqnSiz+MggzufbNA8DNofp64o=;
        b=AC5xoTqqBmF42xQWsPSlamtNNU+p7FNjmIhFSeHqS2ID+etqxTGNJegZJe21tmLU7V
         SP0gabWWn9+HAt2ThZsfZzk/aSUW2N5sJFy3iYA4k506yKCQ4h89XNB/ae2C5ufEQhG3
         LA55BHCdqm2rUzVegp8z6/Y7QTLk2EMhkpVc7xg5qJJgFQ0e/mbCqjuH/ll9UGT65SVM
         sOj/PAUTZdv4obXPCtyfV8yRGP874SVHJgo2B4BCXjNzKiwW9Mqs1rQprng06lvD/xPD
         N9JGNIGuBC+GJWPJsSluGfmFJvTTGJC+juYTVSD4PMDdo39jSOj8ETupLa2EDoRB0mhe
         ahdw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+VMro/DglkUrlIhL9lVwSNDxPQaZAPKc+/9xoEugT0oSexwny7MwYWRqoXgtXfACwN9DkW8m0lBb2WQfveN9@lists.infradead.org
X-Gm-Message-State: AOJu0YzDQnrbqlgNPCqw03yrosMYNwd32oVnp6DPK6NgF9i6e87322Zk
	WJp6dfKHrYBCcMmSdXXfREYuXMoJq71bODS7j1ZRxNOCJA+kzAZKmUa3HB1z7ms=
X-Gm-Gg: ASbGncupSqrGH+PzzxdtczRcNkMjM5UZjtE3EF8ouQyqgA22FnMN4qh8tiTv8L+l+Qi
	XIzANrhYO4VXBTJjb7qDYXAQgJJKykYuHMiFF7PBM2djrCTt2sd1d5qZ+3kjch/MKOE2BEODZBQ
	M887vus0ktU2s7+nunFAGyw7r5sQrIUQjKmtupXlAHxsCREVrhgShVb0dNt7VpIiJw4gDeo40Mt
	tzbTw0x/+CbyjEjr5OT/OTgacTaH7EvKure+dr4UZ5qJdhnV2pXC2cp7x8hIG98Zw==
X-Google-Smtp-Source: AGHT+IE7auGUR+zKlMOrNWx9KLSq3GSb9mPOKLQ7Zp/59A+kyUHzh9pBlXR7eVUa7fJxWz/7WUXXlA==
X-Received: by 2002:a5d:6c6f:0:b0:385:fa20:6583 with SMTP id ffacd0b85a97d-3862b34e3famr3627780f8f.2.1733741399032;
        Mon, 09 Dec 2024 02:49:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm80301445e9.33.2024.12.09.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:49:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
 <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v2 2/2] arm64: dts: exynos990: Add pmu and
 syscon-reboot nodes
Message-Id: <173374139792.46435.12839391873743115498.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 11:49:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_025000_618989_F36C9C57 
X-CRM114-Status: UNSURE (   8.34  )
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


On Wed, 04 Dec 2024 15:55:59 +0100, Igor Belwon wrote:
> Add PMU syscon, and syscon-reboot nodes to the Exynos990 dtsi.
> 
> Reboot of the Exynos990 SoC is handled by setting bit(SWRESET_TRIGGER[1])
> of SWRESET register (PMU + 0x3a00).
> 
> Tested using the "reboot" command.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: exynos990: Add pmu and syscon-reboot nodes
      https://git.kernel.org/krzk/linux/c/d5b3944bec944b40e91cae82583ce11740af6f10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


