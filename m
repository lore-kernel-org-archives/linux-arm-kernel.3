Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+hDLCMR;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aEuuMum2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=; b=M+hDLCMRfj8m0Jrpf4LZTqoIUk
	j9kgUl3S/n0BMAH4tmr4ENw7JqE11AVst8mlg9ee8ERRv929k3GLsIxZiTrXe1RJDUsubz589vvzN
	VJDcxbF4N94cnoysgeCuoMFtRn5ebregD6N05K3SFME2flpNQpqOnfGX7rPoMAmBvtVdet5TiWvo+
	wddbn9tU9cqYQlmyt15iQRtKkm2bgTabr1Hz9haCrygVodm2jPawYNKLGo8l4jwINXKO2YVJ2KPWB
	JXly+edXQiCjhIMX9Ny/1v/pqhPSGvhEv+1TPHDH53c3PriLO2NVxsHLC2Pwd2ocQGxBeD9vNpJDK
	pLG3irCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4Ns-00000000sxF-2HmJ;
	Tue, 03 Nov 2026 02:36:24 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4Nq-00000000swu-2Qh7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:36:24 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-35b2c599f43so6393593eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793673381; x=1794278181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=aEuuMum22Q7chmgYsHEqzQh/vvZpXNexfZEG9PjlmI6oKsoA4n2VVjyGDobvhjnHnL
         1NSza39oqzMhBHMUZC8zICEBD01HGKKxRzyA40kuZy5Dip+aFyvjrE2e63mYnz9ZmFlI
         238k+GoeqmG602OkEQ5aGiaK/zaeTmhS0NKag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673381; x=1794278181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=wKXLoGjC21akQhWQV86zRS4DwgkB6/IfCx39tUX4VBQa9cERcSY1lj1GgwfGURfKrS
         zCBmdwj8lrbmTnspApgfZ6hYldfCuDuAf+hvtuM7Mqr03hAEYUqwsRoCDqCCL9k9QUsa
         m0hxbuwgDV+JPU3AazfClYdwkgu+lpFyIgWkWLqUvruTd2y5eGrtesLOiKflncE4C1Yc
         kT1GcvvDlKWZTrQiPrOkTDw/lzJQssqTHLanP0g8kiJJvcQ+pBAu51j0X+gAuNBrbN/Y
         ZALKK0A7VIQC4AbmpcH5arMxt4Rikn2T0E9hf0mXTMddlrWH8wT1CP3AzgFjNVaZg+I3
         ctPQ==
X-Forwarded-Encrypted: i=1; AKwUvByTTY1tI/2CCvrLTwymLcMBZSXhQ1p9AY/ZSMAdLyHgIh9C0O+FazlRUqPQDtJuvMviQgaVEAXYfGiylUTUK9ze@lists.infradead.org
X-Gm-Message-State: AFq9FYKgLyc3X/I3lCRNAwTEqxB+psaovQTtQsPMG3qk8n2MyBpQX6dz
	OprZdQUvDmDo2XlQMvd+pIXnupj2xy+sFtsrCa8cPAPau9wpmEXIuZbqVo8Az8I0gg==
X-Gm-Gg: AYBFou0a7+4+T/VYuDyJTrh6hEhsdvo4GHgTp9ikTU9Qael8ZR0pCKDdwz+ZrqnOQml
	nwxsejBMh/hvn5fWibdiGEEJp4qV2FKqLtpk39wZ+CcHREn34WpMPGWHBa+AM/skE7r/BZArH4/
	R1k7tssQMT+wlTihVzqEExli4rsVCal6CHCQWs+Li0Dv4oABFGBLeRVtpGgDBfcKIUz8EwtIPGI
	Mg5XrcOKBmP6G2bIO4O86r6COXJkGcAcHgHv4Ugv8VzskbRCT8h1DMuTn50RUZEFSYLdd7YMQap
	883F2A1JcAIeT4pB85i+OxhX5qF0eYPEkFWIWnkvZE7Iwvt8QKvjgnMKRt2V9Vo1QGudqhBPvEW
	9+IsfuFJkxFbwvK1IG4cn58NuhlZ8KDo6BtDM9Xz5FpU7IJeVOtIz0jUv+IWpqJFT+st4S49HfN
	Lq0JggKQDaMoeRcWQlVGTu6Qs/L+s5Vn91M8QD+0US+iK/r8MXiA56OzI017fUqZBvy+ru0s4Md
	7DJmlaUHMbhM+riT8elWiFGV5DgGJBzbHMUv/5vHTCWicGdxPYbR2JbeLRNe3vIOIY9yZX8/8by
	wK4CMcPHznHa0eq9czYfZDv7+IfxaKY6xoHGejZ2l5iBjj2cuCY0ke6txxUPi3pFsFQ=
X-Received: by 2002:a05:7022:1110:b0:14d:c9e:a356 with SMTP id a92af1059eb24-1ac59dd07f5mr17524614c88.12.1793673381373;
        Mon, 02 Nov 2026 18:36:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac1abcd6f1sm37000499c88.20.2026.11.02.18.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:36:20 -0800 (PST)
Date: Mon, 2 Nov 2026 18:36:18 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <aulIoq2oVjJ3DVzL@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-rapid-daffodil-rat-0adc6a@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_183622_684802_59CC759C 
X-CRM114-Status: GOOD (  24.47  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:

> > --- /dev/null
> > +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for CPM IRQ.
> > + *
> > + * Copyright 2025-2026 Google LLC
> > + *
> > + */
> > +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +
> > +#define CPM_IRQ_RTC_ALARM_NO			0
> 
> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> prefix.
> 
> 
> > +#define CPM_IRQ_AOC_MIN				7
> 
> Anyway, ABI constants should be indexed from 0 and incremented by 1.

What do you mean by this? Do I need to make up names for the
unused IDs between 0 and 7? On an initial search, I don't believe they
have any meaning at all. Does that mean I should make up some kind of
"RESERVED_<N>" naming here?

Between 7 and 156, these are just ... 150 different "service numbers"
within the AOC (Always On Connectivity) subsystem. I can name them
AOC_0, AOC_1, ... AOC_149 if that helps.

Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
into 0-151? I thought it was valuable to directly use the firmware
indexing where possible; if I change those, then the indexing loses its
inherent meaning, and we also have to add another layer of translation.

> > +#define CPM_IRQ_AOC_MAX				156
> > +#define CPM_IRQ_AP_GDMC_WAKE			157
> > +
> > +#endif  /* _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H */


> > --- /dev/null
> > +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +
> > +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +
> > +/*
> > + * LPCM IDs of each SSWRP.
> > + */
> > +#define LGA_LPCM_CPM			0
> 
> What are all these?

The binding doc says:

      Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
      See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.

and

      Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
      2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/clock/google,lga-cpm.h> for clock IDs.

These are the IDs used in the firmware interface to talk about these
things, as many of the SoC resources involved (clocks, resets, power
domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
with indexing within each subsystem).

In reading again, I see that the definitions and explanation of these
terms and the SoC organization are split a bit between the pmdomain
commit message and the binding doc. Where would you prefer I elaborate
more? In the binding doc, the comments here, or both?

Or are you suggesting these IDs should be allocated/structured
differently?

Brian

> Best regards,
> Krzysztof

