Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0900606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cyiSoOH6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPrpmawx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=; b=cyiSoOH6hrWt8f5nDK9kO64t+8
	p6POd2hV5XnjrJq98Z76c1sndCS1ZnxE3XKfOI5iI83Y/1H0K8GZ5MytZGvvtFolQYZ/q0qDHdLfM
	DqDhqSwDIRw7I6uDiyTe3U1cKXWByhewHVTEok2k7LobHhBqNe8zfjA5dU2vz+WxB+Yd6KsUBCMBv
	c6YbMe0mC4bHf1Vd2tyBULbhycUodcFOhXXkA0Q5QkS2eMlwXJNa6RXH+yOY77PkpDndOZOCVRi5o
	AtXzVwk0RkahmhEL2aNqX5rHBXHgZw4Iay/MrXrLkbYFctH027gNZ280G7K6tCIJGzaLi4y9jU4He
	yQipA2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPNl-0000000B7sM-320C;
	Wed, 21 Oct 2026 06:01:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPNj-0000000B7r1-0hUU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:01:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c4d870d54so189338f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562456; x=1793167256; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=TPrpmawxu29exfU9zdxi15EOJYvXqeXdlKC9swf87s1Q65Yk81Sn3aduwmArcuKc5n
         uVOuDtUiLiE7MDS4YDYhSmR0drhpIKnD4FHFbAmgc2U0/NaQ0JzbxBeoE/AH5T06dkXI
         q8afk8BdHU4pmn4FpBwt/QSMoZoRY7fm3rvopQx6OFjfUgS0wVyRU9J7TdGndZxxYmMB
         P8yNUPA3gczSN4eKsovg6wdmwgT/5WZqqjDYeBtN/jDIWATw3b97gBCe4kDV+ljVe7GZ
         8SZqJo+PCTjwXbfIg8SFYZhWKZ/DCWK2Xmhe+DiPyR7pxYqC99ABDNJxXvoe9/NBH/po
         KsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562456; x=1793167256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=LxejVDDO/oT7/hWCFwygX76Xrkh4RwyN9Y+5yl0P1N3wMLr/o/VxXSj8G7jQDLqNQr
         A76+scbKVYSFONhobcnQUjdUHAATa4Jh0otc06YLxHVHfnpFcb2UWgUKITfWyaOSInZO
         MKefaeBavYC0Iv4VCbxPrNNM8yzQ+eJfmWzTAJspSuJdFMaMMqhfzMWA/8GoJjUe+yxv
         6SifSP81y+0Vu3RTxAkt3EEnRJ7WEbb4luzg+9tpPBmaJ1ZhIwgzlxSM2hsUp2AdAv81
         kLsKaLr43K2fvAwKQkqbxO4E83T2JbJxwpCkw57BU/C6jtelfzZ7BP3o8SR2Sv2SMYE1
         b4BQ==
X-Forwarded-Encrypted: i=1; AKwUvBw22Yl+3Z1ygz+wZn6AdU5SC+YYyHZmdgh9JRaVHkI+nHaZ9HnsWwB9WNwxToiAlIs8fWi21PaJAQ9hvDWNEX09@lists.infradead.org
X-Gm-Message-State: AFq9FYLlozbGhgrGjvZL8T6y3ThgQcnpDWYZRlKJTe6hphVfnUgmob4t
	noKvYo65GTVSuQSdyo6sd0eDynis4t1q08JLaJBVJ20+gQS+D/Izn3QH1FmfGTs2cWzMow==
X-Gm-Gg: AYBFou3WjNZDhSA0DzaaXrp/0N8HDlAL467L7pOZRg6lrWcwj8zvxPcYjaCNAS8WPTv
	xwWK/PJikoN24E0fd3yJBZ3Dvwunu1xksZqE4G7xtU5AOhBjpbyThCTerNz5Y1PM8wzfn5gg6qb
	KzkT86XGIGpDmfg3uHv6LVTGWUf7fFxmdy3KPmkMB28eh6yWp5k0artMhZTn684AtaTLROV8TPt
	XiBpOEIvYnAD28LSif38co6gyj/UwFjqgFMALlokUP2b9P2PTXoiso9O856U2gE0xAnNVl85zPK
	IwOdMsVwjq2n3ovxazRpQ7L46lwL1zRBAfHdvOnzSUfZmTQNo0FkPqqZSc8YA4lR+18i2MQwevT
	bCwDGkmYDg5uyxzSHZtiHbNzCoktk38l4tzG0Ti4Ay8o1JvB8fSoPiHJaBgrZQtHZDchWyd6REr
	l5yI81uxDQvUytXH9OTHDMinSxMPVqpUyD2s6Kp9iCl4GKlEybYCsbFSZZ/CFL8a8nffRUMaHdu
	L7Co/SKsTUXsOxTOSLgErgpmkFxdY9mqMl+Coa8ikxmBkP+GndLi3EO1L3yTU5T+Bwxw/jsVKKe
	YIEeDUfpMKYnPTtwAHS1LoiCQdT12ufpCQRUZJGw64O0i8CF
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr10139275e9.21.1792562455713;
        Tue, 20 Oct 2026 23:00:55 -0700 (PDT)
Received: from john-desktop.station ([109.77.5.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm63793845e9.7.2026.10.20.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:00:54 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
Date: Wed, 21 Oct 2026 06:59:25 +0100
Message-ID: <20261021060005.2947837-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_230059_245812_30B043BD 
X-CRM114-Status: UNSURE (   8.95  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chuan,

Jerome asked what was tested; here is a G12A data point.

On a Radxa Zero (S905Y2, G12A) running v7.3, sys_pll_dco occasionally
fails to lock on cpufreq transitions, at room temperature:

  meson_clk_pll_set_rate: pll sys_pll_dco didn't lock, trying to set old rate 6000000000

It happens with all the sys_pll OPPs (old DCO rates 3216, 3408, 3600,
4800, 5592 and 6000 MHz) but, here, only while the video decoder is
busy. Reproducer: the userspace governor, random writes of the
1200-1800 MHz OPPs to scaling_setspeed (~700 transitions/s), with a
GStreamer v4l2 decode loop (meson vdec, H.264 + VP9 1080p) running
alongside. 46 C SoC temperature.

                                       transitions   lock failures
  v7.3                                     500290        33
  v7.3, no decoder running                 250056         0
  v7.3 + this series (1-4)                 500089         0
  v7.3 + patch 2/4 only                    500066         0

So on G12A it is the 20 us delays of this patch that make the
difference.

Tested-by: John O'Callaghan <johnocallaghan@gmail.com> # Radxa Zero (G12A)

The testing was scripted with the help of an LLM coding assistant; I
ran it on my board and checked the results.

Thanks,
John

