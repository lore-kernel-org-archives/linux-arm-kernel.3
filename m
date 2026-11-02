Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21DA606EEB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W1DsFLYj;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHYzZl0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=; b=W1DsFLYjFjkE0p
	sSZL9bIaQi24RbcMdS6CgXBXSm/j4KDZNQAyFTIiS7TE5JSM8etP1+u5R5uDP9IzMNSTqdk2rkbHX
	LGddbfhqdQhgfHKRXy2YDEcO6SnYk0SfIfB9NPCtLW6ZjgnSm4tcFxqTOhabF0oBC9YKIDkJL9Qa2
	LPszwW9fx5PA3xphTpYpqOSiozTW1opzcfvvGtJWzLZn+VPZbx0FmhDo2RIyM12TWgMsuG++JP1fF
	y9ShJ1pPrjcHCAnl5EGEH95aqBsTgvgwZvw/YHDkiND6FvjrFwnmGHT9QZ9coVmtVgSQiI2Fjn8qE
	PZsOU+0ESJifQ9mY6gRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtm0-0000000H25H-2MDX;
	Mon, 02 Nov 2026 15:16:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtlx-0000000H23m-2nBW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:16:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so27382985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632592; x=1794237392; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=jHYzZl0zL8feWT8MztsCKTpvVK+jguvlN5SPRHZI3YYHqKer1cdeNpO7/obA+lIaJE
         pw5zlvB0dPljSwMkGU+hCInkBeJPCk+39Ac6ZTBpFn8PfBIIzXlgNl2UmemIyMoYbwPG
         w8tUmoYU5h5b+nymrtEcSX4W5iDfyR+stIHxBJAX5+v6kVPp8HeX1dBuLZ/IVAYdNuTj
         dgJ72qTgtq/RLv8xcTgaUMIyo2094/Lk3kVURhCyld5vPHD4htEtcQ1q5HK64sDpyWRQ
         6mqvlUnbcy7AVWCf/R6DWRniT6tD0fVW0c2IEnRL2fs5L4n05OrCxcgRbzH1lWr1VMd9
         GEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632592; x=1794237392;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=wGQUFjAOpVfxQyZiXIs1PmDM9WEf/PiEqQkvv8RzbAOZDP77yB2CpJk8KdAWdd2jD8
         IGzEI8UrX1VXYyO6pKgHcXgqfzavgGyHGTnOkJc0V8fJqnCmERk1zKxDVN2zZymCGRd5
         U7Q1kkZhV2NDTQBmdCscsPFCmkcBPBHGzlO3q5k1wP7+DOukMcaOy6aIwaodSEp4j/x5
         pUAS/5yNIT7kOG5Eyjvvxiq25seSTS5dWqKUy3pzcAeEePtOmkvhFR0V9giAfstSMQCi
         CC43C1eIVufUzEy1FU6rkrXbPtIW63ugzZIMfF8ploQAHlKWpVS4Hy+rSMMf1ra8WCy8
         dbAg==
X-Forwarded-Encrypted: i=1; AKwUvByxZjiuaou6oL+0wuPtTkVjDEtH8DnYtNRU9V/CQJdWuBvor7jWRbVAr3CMzzUy3wCxXQbUTKe7ZdglQkC1eHfU@lists.infradead.org
X-Gm-Message-State: AFq9FYLT4MSS5s08Sbv7grP+g5KCX54yQ3jcUGEcrrLzNJoehfNUO+Xh
	WXhAKGxdK+LhgCLy8Fx9C4IiW/3cHOqnoAjNpi//hVggHkdD4t4AXRjZWx7y78niMFU=
X-Gm-Gg: AYBFou0C/fPS/wm2dFn+6KVDR6EgsErhC1VVadPK9fNrxCetQiWZErkEdUU9/hWXuC1
	RDYlxAZ6wjZ0oqvTjvYF8RjehxHYE+U+xTdtwAGj3+VdtgvxdnPq3aES2Bb5YhdZdwkO5+Nsfb0
	BTgWXxN0BXT2wLwlnJ1hJy6rPWx4OAhwv6tnNIHYETss9IIq/Tv9yd0R7UlvwpG/K7iDGpiGTtN
	q5K6qyxOBmpqCctttcB++LqzWBE4V+JdEf8zQWCA7gJPWC5gXBnY1HfcUYhElqkSQJ/AyerpSPc
	hg9OQX74AFVf20bOJQmAOrN5fCXXRqN222FIzy+/k9413o6qIg5N4W4JWV6ivz8rMTmpxr/AqhL
	ID/HxaLFpi5iQDa7Qa72pt3FCcK1VvvEStp3MnLS7LLn0vuORyjfPDLcgFWOFKTQu2m6P5xqNnE
	HhHIkZ3Zfe96CMPc0OIzG6EWB/MAUlUbgFORZz7hlInxbfWj2N1nhlXIuUXvkjHJRu9ArY8Vbki
	/ZC1GPtdNQrUDwRcmf3t88BgeJ5iTGLIHNZtnHoDxXM1jCL1zh4WYltJIbQ1VNHy2brBPpUGrvC
	9VPIFrI+C+LVp0t5eZPcv9DDKUUI2Lf4LVvd8N8Ne8GORPL+Uh/s51b2uJI1NfTayFn6Qw==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr78414005e9.29.1793632591746;
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm523955975e9.15.2026.11.02.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
Message-Id: <179363258546.2870673.13247205665671196595.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:16:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QkKO+7KRF9p6IxoBwO0rqMIDnmIJ+8dF2oqr4paee6Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvptqUrhvGV14pzz059soU2xjl9zPhutmLT11fbZy
 Rdu3fvJ2lHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJBKQw/JXjWX1Y2/5yktTy
 RsZfjaFa/tMeetoHxe05W5qwJelVlyXDP6VY+cVbpzBzXLlkmeSpanBhNmtS3yrpktO/+A6Vftf
 /ygkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_071633_723652_48C4153E 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: gxbb: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/17b53ee5a743
[2/3] clk: meson: g12a: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/8fb4c1084cb9
[3/3] clk: meson: s4: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/7c328cc402a8

Best regards,
--
Jerome


