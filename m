Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF88606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fS1lQ9+o;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hb9N6rZC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=; b=fS1lQ9+oulgahZ9BAnTRBvFM2w
	ejkvAs25mzzXCHyZuhQS5Raax7PVzJSFARVCEo5ZHLJtFmeg4s5lpp/8JDg5ekDVmfdHgmvIU9ABW
	myLjx318r2XjAYJEcFY1SLnANffy9yaQ5yVjG6+TPJbY/PPVEUCk07r6d8c66RMqJ2NGStxwmwnuD
	oquuoQjMr1Ur/3RV0moY1Fea6gu5tt1d8XUieqeyTrNxwYzdX6cYnFfiOVez/wZLFYttcHhFgr8Bl
	8oAsvnyzHY8iKvy+2FfUBu98yA+24HilJd/MQ+lMLD2cZr9Re9QhYW6XE9lcFUiReuUDVLw1J9Z1M
	Y2wQi/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpFZ-0000000DqpJ-3lrU;
	Thu, 22 Oct 2026 09:38:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpFX-0000000DqoY-0DBQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:38:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1279159a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661893; x=1793266693; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
        b=hb9N6rZCCZZESe/FpfiXXEMvVlYCVWuJh/uCKldEZkTX9MrVoTgWjVNIsx8mm4CR9a
         f/nRyAmQnCvtDjbhc7GxOnAr+b6/uIQFx3Gqc966rm9c/03HrF8oyNXP1jFRqcQBgnmL
         iuOCdzBdCKYEoycqNHynG8rtf75yB+48q0/5b/OlY2N/TIkbrGvezdquNlfc0fgCSCup
         UnlJ1jMTz/Z5PFZvM7KrMkDccqty5ECMWqNuq0oWL7+N6Urp0VeDYDreeXxmGmTMSONz
         FjvsZbp9/sWDZLLcRORXdeUmoRh93O8z57NY4Kozb7agR31s0LMHtTkYnoZNUB5ocf6o
         bZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661893; x=1793266693;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
        b=AMizPIJXGXwvS9CyM7xGPoEpAz7TwQdDBxpYK9dmwf3x0YPAUWwhAhIsnwQLEE3aXh
         4qsKzvdr98cTXef/uMNqCun0w8ibWO9Nn1ZOPjOzksnXQRbBfuurXGD9B0hFRCKygYfP
         ujl5O1yXuZZ3q11SpyGGoM4Oz7C4NbVNneqeJH1X5jyVggWEaks33rq7LkMZT/xy/IMj
         QcJ+fkCRB5R7ClyCvU1iOlD1CsgxS7BnE5eSMiTAhDxH86m5BpzKwC7+i1tn0D3FdFkf
         sfkLDJ7GLEsPJZAfXJqLjOPy6+WL0sJLmnobIlmfBA8WDMRMNlmFUxDbK5/NLXae7+aM
         cU9g==
X-Forwarded-Encrypted: i=1; AKwUvBxu55VQ/YXhYlDTULl8z77i3SGsZFM4/EXYk8UqMCNxrqQOyAPiRXTVnvzQLniTrWlSzI3BiQEGQQrQzBUOk/Am@lists.infradead.org
X-Gm-Message-State: AFq9FYIGugTcxt79bk9N9ILTG+ypItcWR+u7nWhj2RDE1hrz97moJGsA
	Odj23JRp8cBXHYdG2IyWt8m7HN8tSQWPX4IIPqz0Kn4SUc0m5V5zXaJg
X-Gm-Gg: AYBFou0OKQGtsaOJA3haHNydcmuLNtzNnpALAEEPEPSF5CdShL1IrU6SyWnG3X/8PtQ
	w7XDFty2kun1PYi64E7H2xllEFuKZTau1XUjFAY/RqyEWsHYfU/wSWM1j9i+B8r+F09r6NDFwO2
	A6bp5n/vFXM1jwpocjlQkCA4FibZRfl224cixZrwR0wa8Ny8tc+v/2uVGZyYEWzMjcdheIeP4t/
	WSbqZ/wBohfQQqi537CJpWlBP8La1sRv0fda++RZyWbzx+1jTMhA/6k4gw8xtOJnHxo0XMINEYn
	kA445gnc7kZe3gJT9zdzDjgJUDow4gJ1GsOcyzKa3AZN5WOeEpwstL35v/kmU0JfKHGbLqoKQuY
	gy6PO627K78kjP70w+Q9Im2qI0TMBFkoHu+w12QWCXvorIwtpoNbSZIxHErr1wHoJRdOc6JsK4R
	JdWfIMXy9lqZMtz+C9nQJ9k6Yexe2AWlDK53kicD3t6hTXUxKLvLME04Q2OTwI8Lc//fnHfAkW1
	EfKVdCleYiF0v7+ZZabHGCbzeZ9nek3Se1PRHOSUgFEy+8tWOd15SWmPJABSEAdNCQ=
X-Received: by 2002:a17:907:d18:b0:c2e:616b:6763 with SMTP id a640c23a62f3a-c468d5d92b9mr198921066b.3.1792661892804;
        Thu, 22 Oct 2026 02:38:12 -0700 (PDT)
Received: from hp-omen-16.localnet ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm87755766b.32.2026.10.22.02.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:38:12 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: net: rfkill-gpio: document reset-gpios
 property
Date: Thu, 22 Oct 2026 14:38:07 +0500
Message-ID: <W90ai6epRoWrikRmhqTrfA@gmail.com>
In-Reply-To: <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
 <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
 <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_023815_118191_3FE91AB1 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Monday, 19 October 2026 11:49:17 +05 Krzysztof Kozlowski wrote:
> That's the same pin. This was sent multiple times, why is this time
> different?

Indeed I overlooked previous discussion on the same change. Thank you.
I did a few more tests with the wwan modem. And since this approach to
handle modem reset more like a workaround, I'll just drop this patch
with rfkill node from V3.

-- 
Dmt-Y




