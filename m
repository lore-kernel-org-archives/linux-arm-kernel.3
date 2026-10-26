Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 05:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rgl+nHvR;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JU4btkN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=; b=rgl+nHvRDtRaW+uQI4Bvuo9VMU
	t+f1VhcdSDWZJiCk27Ljjz90+Ajkxz5s6AW28H79FsbaiwwDSLq06UY3PdyWhbYXqM8cZxvatOr8S
	BRlDrvjf6AqQeeHlD/gi9ee5HqZeBQnnU/yJMZtqusiw597zqywAMBjXYetz/jzGzXwJFviet7jKM
	5FRCie7+KL/iF+LcG0v4+TlMwiNotOXfDVgGquf7YPNKXQtI3v1dtKEYoeBDtCSSUuV8HoqnFCxPI
	6N21HV0RWG5JuJf38Vql8KU+f0PZo2wwHyOEb5isTqQU+CImNxN/TSdpPXBnjBtfTZmhf8IsFVgUo
	yD2m8QXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDHg-00000001jbq-0Kpt;
	Mon, 26 Oct 2026 05:30:12 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDHd-00000001jav-0iuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 05:30:10 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-35943f55c06so3592677eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 22:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792992608; x=1793597408; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=JU4btkN7H5bhgzDWx+eqCg2ROgAbPNu2Kx68XaKP/QWB7YNxprLuo1XPEAIJnogQES
         8EpDPDkKiX2upXSj0FSbeNZx6S6zwvc5V3Ap0XPj2uJG1JTDDhddm1cQPhyIaZ5tzxkl
         0eDDi2bv5b69a7jggobvLeyEolIkRApOGnqgUZ8sTg4vtWZY2JqRhvxPwofMFlyHNx64
         R8w01hFG/di+zqa6z8YysgKL+jLk9JfqDz/sHGTvAUYOsP2NlhmMmt2/NPgXbASexLF1
         0aPNZ4AFDPzXjPvtIMlTIy9qjkzRTAms7BpwP4MiOmCpQ9Q0pBYVU40f5EZ0nr5StcGi
         KQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992608; x=1793597408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=0tVaeXiRpX0LESuS/mSyNmg33iffYUCTzoty59OZl6ATd9Qdhw74AHxOsXX/Fvk3nW
         augkPAIXyKTbfzLd7JNUz+ufYOMHmvt4fvaYWcpVVrg6QA2VieTMHCKwcRVA5u4rNzLl
         6i8Sso6mbFmNxZgVhK8wI2FBY4mSfcPaUP7OOFw6JZdkEe2CZTpitlg1leEzisEruxS4
         odcwTvjLbeab6T94SoIKjQBcwzIMSWZvljJfW/04EgUfYUJy3DP4CFVQhvet6R1L0WfA
         Xi+B1BGQ0X7Hnr1d3RFJd5w66Xn4Cvx0ILGVBkZ2xFGwHa/UIBnGb6Q/UVkqniN5sLei
         fdug==
X-Forwarded-Encrypted: i=1; AKwUvByofALmJTALuTTBszWcrcxXpM4LkuhlTN7qgKT1O0dxlpSS+7EZ36f3EdrBkWbZ2EfB2eJ9P2pRlwAawPjJgJoe@lists.infradead.org
X-Gm-Message-State: AFq9FYKjcKjSFpsjdP9cPRDZrSkWXaInmsqlNlEBmK4nnBedZN69+jV2
	8Eys508M1AO6/dgJJiEiXDXgrh5hg8uSQXS9gyT0yQRSTBRpYf4hy8vzyn5+ZDVm7z0=
X-Gm-Gg: AYBFou0heFnqP3S0KQydZRfEb0BM/G++mpTpybdsMuUlSXBfd4sg0FpiRrX9jj+vWlA
	Q1f0IQ30HclpfQvQYsz8ttF9lv8cTIXXhb9cFRgTEU2xQJg6jp9N2q5nqjbfjd+lXv8oBaDDDvg
	nCX6mlCWo3rsFebEGti3u0OdgFir8VRs1ooXKkoVCm8uNrS0lrOAcRS3hJe3u53PNXL966koMuk
	G5nmGru+Jx1G9X2x4X3V1EDY2pTOb7+sa7UhQPdCIFgIuCWMrzo9VQvnamhsE5dQUTnEPvuGFFV
	0Se4AF9A7OjHfqXP12vEoZaAggCCBmoEdGGmjBapg3hsSWLR3ptmCbcAAhOz6GvVB/X9HpeSRQ2
	QB9Mk+0HRVKij5NYESfqDnOY3rmJ82pk+8+RDLvCiF46st0l+2b7NdyrCo8DUssekjH03vkHeTM
	HIR80P1oPY1oLHq1yPWiGXGjLxDhOmZ40NKIb8X3vPC/6Hpkbvef+X21UnZTbpawg4LhInm1w1x
	qjbzJBBZFew7aJmC/pI/7wo919dH0IsoBxpRAXFRFsBiJFMzs63HDGuxg==
X-Received: by 2002:a05:7300:c8c7:b0:369:f231:b98f with SMTP id 5a478bee46e88-369f231be73mr5481082eec.4.1792992607224;
        Sun, 25 Oct 2026 22:30:07 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm7075259eec.14.2026.10.25.22.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:30:06 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_223009_229637_810DEE35 
X-CRM114-Status: GOOD (  14.70  )
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

On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Every S4 speed bin runs the same CPU frequencies but needs its own
> voltage curve, and the bin can only be read through the secure monitor.
> 
> Read the bin from the firmware, select the matching
> "opp-microvolt-speed<bin>" property for all CPUs, then register
> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> on the SoC compatible and needs no node of its own, and S4 is added to
> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> the bin has been applied.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/cpufreq/Kconfig.arm          |  14 ++
>  drivers/cpufreq/Makefile             |   1 +
>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c

Is it safe to apply just this one ? I can take this via the PM tree then.

-- 
viresh

