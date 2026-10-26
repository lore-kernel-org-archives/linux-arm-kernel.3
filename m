Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tV8ZkWc5;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qIGIuQd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=; b=tV8ZkWc5dWd0+Pd8ttfkbPkjg3
	wEblXHKfx7ThR8asKh+EQPyQU+yOG0oQArMALNvrcrSh7UuENfyg3X142rO/56dVyidbcS7XyYCZI
	E/ZDl6a2FtJ87DM0TjZ9L0eVdj45DIGGoVwVK7tJKPDxZyyQyowGg40c8UpfE+Bwgh7J/HHqUa9xk
	+YwsVf44Jqeh4zZTVckQVOI0PhsV2s2CMNOHYcK1Ftml7IFuUVgMyLdNUoOoFQJ+1dM8E5hF80H10
	hUCRpLG/8VFcJCIa9dyFVG91RCtFZtK27FdhQ/GeE+Y3pF/EgkJgvlzjBEs+VA5GXwfsiwJAdbIb9
	hYxhb4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGYY-000000020An-2Qo1;
	Mon, 26 Oct 2026 08:59:50 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGYV-000000020A1-34ta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:59:48 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-33fb4680717so4956399eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005187; x=1793609987; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=qIGIuQd3J+S0ne3NAd/RPOiym/n1zrup2Lc87fhn7xm0gML6T61C1AmGoPG44a30+R
         rq9UJqRBc6Htz7g4MsMWWArrdGU4Ub189Fc1UH0q9y6zUHPW7Z50n5iIPAijqg+9IaiQ
         AvekuLYbl5dwzMJ2/H74Hv11uDWRUflvoe4+h8dTr+5JPAaPtDnnb+BJiS5Gq/Y797UX
         zrqXYbruScNVb3fpT3vgPCVaFrcqkzORHP8xfw3lEGE6ODTkjVVdapzuWoGa3360i8Lp
         aV1iCuOTYC4imHnbVZXO7NUEUyDI02awKBnWofKBjJ+Q77AikKSfgyRNlrI14u+1b9aU
         zaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005187; x=1793609987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=XamI55EQjzqPr8ohXW67qvEspKvMbyPoKY/EvV0rZot011dHWZ/p4IeWPn96CVjc8I
         o6iUFlswtVq1BknlAuTjby8MV42FBfFeEjPBG6mABlUVL79/dh1tWAlvnurYBHp3hYki
         Qz8X8tTrL66mif6N6Qi7UcqSt8/JwqDqsSym8nGCdO0MKP29TSQRdTk+0n04Ox6R3XG2
         ekHWW5XyA3tbR5Nhh1BDEt8IzbSRSeV7GufpEuGxPupeT9NV5hy7D5RYwbwd2bG/y4ay
         m1vA3VSTxbRIUbOyfKsU+PAk4DO6kcD1BCZYGUTYjXRAE97PopskdSlrPK4DQKpOaTdj
         sRoA==
X-Forwarded-Encrypted: i=1; AKwUvBxWIOHkS19/aTpCL+4z1jwbOavYzlsE8Hcr0kIgXqpYNKPAxMVX8pVhH6ZWLmoGEfc034lCkcDOe9BEIH2nj6ri@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1UKPm9CJ+UHI2mhhveBoLZFLRjR+RFPgEGU6RXpK/lO6ty/gk
	BnZenvP9jGFDKcJ7LhT2Q7p0wFamJCDdotYBlDX85N4Qi7HtfS4I3qKw8T5RJ/zs2ld92CFd76q
	9MQBL
X-Gm-Gg: AYBFou1oRjUXsy7vKZfoCazmeOI0ReKnkx6cNz6AS6T0YvOhxPaqkDUSeSA/Qm3G3/d
	Bnzjl4CTp7RlGTZoOwrEIYXVC/95qpo0aJWuzQL025cIJKoIoY/Mfjn9mPQpIDKzK0EO0E8eJxS
	r1kSBAdanvlGklXkFxkyJ+XBrykTC9naJUIgKv3Fgm0mKuqQkZtK67N+O0JPAkK2M1ctE9ymJLU
	pCdbmvj8t0OkqzyKwmI5QruU2M6LcX27Yt7h3ssJNQObhjwDrPD1+ZxH0NWcavq0RbjvLhT444f
	FIw5pf071y0nZYSmMQTHpGT3Cbm6De3lIPfWiIWlimk7g5fY339uB5k3RRAFYsy2mIlXiXrVyX0
	+E5MIeE7RcO6Fa3IpegolbdGytc355IjF1rQddZjvebpjZ8GfMfQn0LaYuKdnsffyqn30UsaIez
	6pBNPiA1Aqyxpa/zESWiugqSMXnwYuQnQ2+izFlgiWeFAlTRFP2HHUyukudj0kmqJwPaFbF5WuI
	PkNxyW0uJvDfQXv1LzlC0cFNC+2ZJ1v6bGgN/NuQgZhJpem8hD8oO1vsA==
X-Received: by 2002:a05:693c:6017:b0:369:21a:dcca with SMTP id 5a478bee46e88-369e848a2d5mr8835197eec.10.1793005186447;
        Mon, 26 Oct 2026 01:59:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm4608834eec.6.2026.10.26.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:59:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:29:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
	sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_015947_779796_2BBF39AD 
X-CRM114-Status: GOOD (  17.35  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-26, 09:57, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> >> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> 
> >> Every S4 speed bin runs the same CPU frequencies but needs its own
> >> voltage curve, and the bin can only be read through the secure monitor.
> >> 
> >> Read the bin from the firmware, select the matching
> >> "opp-microvolt-speed<bin>" property for all CPUs, then register
> >> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> >> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> >> on the SoC compatible and needs no node of its own, and S4 is added to
> >> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> >> the bin has been applied.
> >> 
> >> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> ---
> >>  MAINTAINERS                          |   1 +
> >>  drivers/cpufreq/Kconfig.arm          |  14 ++
> >>  drivers/cpufreq/Makefile             |   1 +
> >>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
> >>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
> >>  5 files changed, 202 insertions(+)
> >>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
> >
> > Is it safe to apply just this one ? I can take this via the PM tree then.
> 
> I would advise to wait a little for Amlogic to chime in.

Sure, I wasn't going to wait for the maintainers to respond anyway.

-- 
viresh

